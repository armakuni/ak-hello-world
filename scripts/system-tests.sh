#!/usr/bin/env bash

SCRIPT_DIR=$(dirname $0)
ROOT=$(cd $SCRIPT_DIR/..; pwd)

cd $ROOT

export APP_ENDPOINT="https://ak-demo-249610.appspot.com/"

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
