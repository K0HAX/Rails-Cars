FROM ruby:2.7
LABEL maintainer="Michael Englehorn <michael@englehorn.com>"

ENV INSTALL_PATH /app

ARG RAILS_ENV="production"
ARG NODE_ENV="production"

RUN apt-get update -qq && apt-get install -y mariadb-client curl gnupg2 redis libmariadb-dev libsqlite3-dev git build-essential

RUN bash -c "set -o pipefail \
  && curl -sSL https://deb.nodesource.com/setup_16.x | bash - \
  && curl -sSL https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - \
  && echo 'deb https://dl.yarnpkg.com/debian/ stable main' | tee /etc/apt/sources.list.d/yarn.list \
  && apt-get update && apt-get upgrade -y \
  && apt-get install -y --no-install-recommends nodejs yarn \
  && rm -rf /var/lib/apt/lists/* /usr/share/doc /usr/share/man \
  && apt-get clean \
  && useradd --create-home ruby \
  && mkdir /node_modules && chown ruby:ruby -R /node_modules"

RUN bash -c "set -o pipefail \
  && mkdir /app \
  && chown -R ruby:ruby /app"

USER ruby

WORKDIR /app

ARG BUILD_VER=unknown
#COPY . /app

#USER root
#RUN chown -R ruby:ruby /app
#USER ruby

#RUN rm -rf node_modules vendor

RUN gem install bundler -v '>= 1.3.0'
#RUN bundle install --jobs "$(nproc)"
#RUN yarn install

ENV RAILS_ENV="${RAILS_ENV}" \
    NODE_ENV="${NODE_ENV}" \
    PATH="${PATH}:/home/ruby/.local/bin:/node_modules/.bin" \
    USER="ruby"

#COPY database.yml /app/config/database.yml
#COPY devise.rb /app/config/initializers/devise.rb
#RUN mkdir /app/config
#COPY master.key /app/config/master.key
#USER root
#RUN chown -R ruby:ruby /app/config/master.key
#USER ruby

ENV RAILS_SERVE_STATIC_FILES=1

#RUN bundle exec rake app:update:bin

#RUN if [ "${RAILS_ENV}" != "development" ]; then \
#  rails assets:precompile; fi

#USER root
#COPY entrypoint.sh /usr/bin/
#RUN chmod +x /usr/bin/entrypoint.sh
#USER ruby

#ENTRYPOINT ["entrypoint.sh"]

#CMD ["rails", "server", "-b", "0.0.0.0", "-p", "3001"]

