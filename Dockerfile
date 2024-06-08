FROM ruby:3.2.1-alpine3.17

ENV REVIEWDOG_VERSION v0.17.5

SHELL ["/bin/ash", "-eo", "pipefail", "-c"]
RUN apk add --update --no-cache build-base git
RUN wget -O - -q https://raw.githubusercontent.com/reviewdog/reviewdog/master/install.sh | sh -s $REVIEWDOG_VERSION

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
