FROM ruby:4.0.7-slim

WORKDIR /srv/slate

VOLUME /srv/slate/build
VOLUME /srv/slate/source

EXPOSE 4567

COPY Gemfile .
COPY Gemfile.lock .

# build-essential: native extensions (sassc, redcarpet, ffi, fast_blank); nodejs: autoprefixer runtime.
# Bundler comes with Ruby and switches to the version recorded in Gemfile.lock.
RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        build-essential \
        git \
        nodejs \
    && bundle install \
    && apt-get remove -y build-essential git \
    && apt-get autoremove -y \
    && rm -rf /var/lib/apt/lists/*

COPY . /srv/slate

RUN chmod +x /srv/slate/slate.sh

ENTRYPOINT ["/srv/slate/slate.sh"]
CMD ["build"]
