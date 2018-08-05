FROM ruby:2.5.1-alpine3.7

RUN set -ex \
        && apk update \
        && apk upgrade \
        && apk add --no-cache  \
            build-base \
            bash \
            curl \
            nodejs \
            tzdata \
            mariadb \
            mariadb-client \
            mariadb-dev \
            openrc \
        # Setup mariadb (mysql)
        && mkdir -p /run/openrc \
        && touch /run/openrc/softlevel \
        && rc-status \
        && /etc/init.d/mariadb setup \
        && gem install bundler

WORKDIR /web

COPY Gemfile Gemfile
COPY Gemfile.lock Gemfile.lock
RUN bundle install

ADD . .
RUN chmod +x /web/rspec.sh
