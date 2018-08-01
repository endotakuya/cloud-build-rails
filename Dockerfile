FROM ruby:2.5.1-alpine3.7

# consoleで日本語入力を許可
ENV LANG C.UTF-8

RUN apk update && \
    apk upgrade && \
    apk add --no-cache \
        build-base \
        libxml2-dev \
        libxslt-dev \
        mysql-dev \
        bash \
        curl \
        git \
        nodejs \
        tzdata

RUN gem install bundler

WORKDIR /app

COPY Gemfile Gemfile
COPY Gemfile.lock Gemfile.lock
RUN bundle install

ADD . .

EXPOSE 3000