# setup our builder
FROM ruby:2.3-alpine AS middleman-builder
WORKDIR /app
ENV RAILS_ENV production

RUN apk update && apk --update add ruby ruby-irb nodejs ruby-json ruby-rake \
   ruby-bigdecimal ruby-io-console libstdc++ tzdata  \
   libffi-dev libxml2-dev libxslt-dev imagemagick

# Necessary for some gems which are compiled on bundle install
RUN apk add --virtual build-deps git build-base ruby-dev \
   libc-dev linux-headers && \
   gem install bundler -v 2.3.26 --no-document && \
   bundle config build.nokogiri --use-system-libraries

# Only do a bundle install if the gemfile changes
COPY Gemfile* /app/
RUN bundle install --clean --without development test
COPY . /app
RUN bundle exec middleman build --verbose

# Copy the resulting code to the nginx container
FROM nginx:alpine
COPY --from=middleman-builder /app/build /usr/share/nginx/html