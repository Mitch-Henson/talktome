FROM ruby:2.3.3
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs
RUN mkdir /talkToMe
WORKDIR /talkToMe
ADD Gemfile /talkToMe/Gemfile
ADD Gemfile.lock /talkToMe/Gemfile.lock
RUN bundle install
ADD . /talkToMe
