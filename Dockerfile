FROM ruby:2.5.3

WORKDIR /docs

RUN gem install bundler -v 1.1 && gem install -N rake sqlite3

COPY . .
RUN bundle install

ENTRYPOINT [ "/docs/build.sh" ]
