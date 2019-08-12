#!/usr/bin/env bash

SCRIPT_DIR=$(dirname $0)
ROOT=$(cd $SCRIPT_DIR/..; pwd)

pushd $ROOT > /dev/null
  bundle install
  bundle exec rspec -t '~acceptance'
popd > /dev/null
