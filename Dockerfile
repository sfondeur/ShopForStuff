# FROM ruby:2.5.1p57
# RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs
# WORKDIR /ShopForStuff
# COPY Gemfile /ShopForStuff/Gemfile
# COPY Gemfile.lock /ShopForStuff/Gemfile.lock
# RUN bundle install
# COPY . /ShopForStuff
# CMD ["rails","s"] 
