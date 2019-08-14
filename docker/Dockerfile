FROM ruby:2.6.3

ENV APP_DIR /hello-world

# RUN mkdir $APP_DIR

COPY Gemfile .

RUN apt-get update && \
    apt-get install -y \
    ruby-chromedriver-helper \
    xvfb \
    libxi6 \
    libgconf-2-4 \
    chromium \
    chromium-driver

RUN gem install bundler && bundle install

WORKDIR $APP_DIR
