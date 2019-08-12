#!/usr/bin/env bash

SCRIPT_DIR=$(dirname $0)
ROOT=$(cd $SCRIPT_DIR/..; pwd)

cd $ROOT

gem install bundler
bundle install
bundle exec rspec -t '~integration'
