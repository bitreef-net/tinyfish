FROM ruby:2.4.2-jessie

RUN mkdir /app

# Don't bog the container down with extra files
COPY .git/ Gem* /app/

WORKDIR /app/docs/

# Install all the GitHub Pages dependencies
RUN bundle install

ENTRYPOINT ["jekyll"]

EXPOSE 4000
