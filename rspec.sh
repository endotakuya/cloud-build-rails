#!/bin/bash

rc-service mariadb start
rails db:create db:migrate
bundle exec rspec