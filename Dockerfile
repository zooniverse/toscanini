FROM zooniverse/ruby:2.3

MAINTAINER Amy Boyer <amy@zooniverse.org>

ENV LANG en_US.UTF-8

RUN apt-get update && apt-get install -qq -y build-essential git nodejs libsqlite3-dev --fix-missing --no-install-recommends

RUN bundle config --global silence_root_warning 1

WORKDIR /tosca

COPY Gemfile Gemfile

RUN bundle install

COPY . .

EXPOSE 3000

RUN (cd /tosca && git log --format="%H" -n 1 > commit_id.txt && rm -rf .git)

#ENTRYPOINT ["/tosca/bin/sidekiq","/tosca/server.rb"]
