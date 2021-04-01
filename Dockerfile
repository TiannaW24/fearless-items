FROM ruby:3.0.0

RUN apt-get update -qq && apt-get install -y postgresql-client

# Check for Gemfile.lock changes
RUN bundle config --global frozen 1

WORKDIR /app

COPY Gemfile Gemfile.lock ./
RUN bundle install

COPY . .

ENTRYPOINT ["./entrypoint.sh"]
EXPOSE 3000

# Start the rails server
CMD ["rails", "server", "-b", "0.0.0.0"]