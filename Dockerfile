# FROM ruby:2.5.1p57
# RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs
# WORKDIR /ShopForStuff
# COPY Gemfile /ShopForStuff/Gemfile
# COPY Gemfile.lock /ShopForStuff/Gemfile.lock
# RUN bundle install
# COPY . /ShopForStuff
# CMD ["rails","s"] 

FROM ruby:2.5.1
RUN curl -sL https://deb.nodesource.com/setup_10.x | bash -
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs imagemagick
RUN mkdir /sfs
WORKDIR /sfs
COPY Gemfile /sfs/Gemfile
COPY Gemfile.lock /sfs/Gemfile.lock
RUN bundle install
COPY . /sfs
# CMD bundle exec puma -C config/puma.rb