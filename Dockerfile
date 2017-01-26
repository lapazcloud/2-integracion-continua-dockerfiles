FROM ruby:2.3
COPY . /app
WORKDIR /app
RUN bundle install --without test
ONBUILD RUN bundle install
EXPOSE 4567
CMD ["ruby", "votacion.rb", "-o", "0.0.0.0", "-e", "production"]
