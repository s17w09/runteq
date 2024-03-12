FROM ruby:3.2.2
ENV LANG C.UTF-8
ENV TZ Asia/Tokyo
RUN curl -sL https://deb.nodesource.com/setup_16.x | bash - \
&& wget --quiet -O - /tmp/pubkey.gpg https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - \
&& echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list \
&& apt-get update -qq \
&& apt-get install -y build-essential libpq-dev nodejs yarn
RUN mkdir /bugifx_app
WORKDIR /bugifx_app
RUN gem install bundler:2.3.17
COPY Gemfile /bugifx_app/Gemfile
COPY Gemfile.lock /bugifx_app/Gemfile.lock
COPY yarn.lock /bugifx_app/yarn.lock
RUN bundle install
RUN yarn install
COPY . /bugifx_app
