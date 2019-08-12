#!/usr/bin/env bash

apt-get update && \
  apt-get install -y \
  ruby-chromedriver-helper \
  xvfb \
  libxi6 \
  libgconf-2-4 \
  chromium \
  chromium-driver

gem install bundler
bundle install
bundle exec cucumber
