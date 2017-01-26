FROM ruby:2.3-alpine
COPY . /app
WORKDIR /app
RUN bundle install --without test
EXPOSE 4567
CMD ["ruby", "votacion.rb", "-o", "0.0.0.0", "-e", "production"]
