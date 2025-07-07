FROM ruby@sha256:f7ab76e2c36ab406ebc36aeba20624b26a8fae7c2998acabbe9662e2a73f00f3

ENV REVIEWDOG_VERSION v0.20.3

SHELL ["/bin/ash", "-eo", "pipefail", "-c"]
RUN apk add --update --no-cache build-base git
RUN wget -O - -q https://raw.githubusercontent.com/reviewdog/reviewdog/fd59714416d6d9a1c0692d872e38e7f8448df4fc/install.sh | sh -s $REVIEWDOG_VERSION

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
