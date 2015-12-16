FROM edevil/phoenix:latest

MAINTAINER André Cruz <andre@cabine.org>

# add PG client to image
RUN apt-get install -y postgresql-client

# add app code to image
ADD . /deploy/app

# phoenix in production mode
ENV MIX_ENV prod

# port where the server will listen
ENV PORT 8080

WORKDIR /deploy/app

# Initial setup
RUN mix deps.get --only prod
RUN mix compile

# Compile assets
RUN npm install
RUN node_modules/brunch/bin/brunch build --production
RUN mix phoenix.digest

CMD ["mix", "phoenix.server", "--no-deps-check", "--no-compile", "--no-halt"]
