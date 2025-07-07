# Use Alpine-based Ruby image to ensure /bin/ash and apk are available
# Use the latest Ruby 3.3 Alpine image. If pinning is required, replace the tag with a digest.
FROM ruby@sha256:73ee3f4ab883b972df42ff9e393627bd4c09befd3a4ee7ce08ca9bfd62791b0c

ENV REVIEWDOG_VERSION v0.20.3

SHELL ["/bin/ash", "-eo", "pipefail", "-c"]
RUN apk add --update --no-cache build-base git
RUN wget -O - -q https://raw.githubusercontent.com/reviewdog/reviewdog/fd59714416d6d9a1c0692d872e38e7f8448df4fc/install.sh | sh -s $REVIEWDOG_VERSION

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
