#!/usr/bin/env bash

ls -al
bundle install
bundle exec rspec -t '~acceptance'
