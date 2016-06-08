FROM zooniverse/ruby:2.3

WORKDIR /tosca

MAINTAINER Amy Boyer <amy@zooniverse.org>

RUN apt-get update && apt-get install -qq -y build-essential git nodejs --fix-missing --no-install-recommends

COPY Gemfile Gemfile
RUN bundle config --global silence_root_warning 1
RUN bundle install

COPY . .

#EXPOSE 8080

RUN (cd /tosca && git log --format="%H" -n 1 > commit_id.txt && rm -rf .git)

ENTRYPOINT ["/tosca/bin/sidekiq","/tosca/server.rb"]
