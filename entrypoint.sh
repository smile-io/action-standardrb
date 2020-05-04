#!/bin/sh
version() {
  if [ -n "$1" ]; then
    echo "-v $1"
  fi
}

cd "$GITHUB_WORKSPACE"

export REVIEWDOG_GITHUB_API_TOKEN="${INPUT_GITHUB_TOKEN}"

gem install -N standard $(version $INPUT_RUBOCOP_VERSION)

standardrb ${INPUT_RUBOCOP_FLAGS} \
  | reviewdog -f=rubocop -name="${INPUT_TOOL_NAME}" -reporter="${INPUT_REPORTER}" -level="${INPUT_LEVEL}"
