FROM ruby:2.3.8-alpine
ENV BUNDLER_VERSION=1.17.3
RUN apk add --update --no-cache \
    redis \
	nodejs \
	libpqxx-devel \
	rubygems \
	mariadb-devel \
	sqlite-devel \
	sqlite \
	vim-enhanced
RUN gem install bundler -v 1.17.3
WORKDIR /app
COPY Gemfile Gemfile.lock ./
RUN bundle config build.nokogiri --use-system-libraries
RUN bundle check || bundle install
COPY . ./
ENTRYPOINT entrypoints/docker-entrypoint.sh

