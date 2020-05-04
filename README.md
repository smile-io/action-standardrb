# GitHub Action: Run standardrb with reviewdog 🐶

This action runs [standardrb](https://github.com/standardrb-hq/standardrb) with
[reviewdog](https://github.com/reviewdog/reviewdog) on pull requests to improve
code review experience.

## Examples

### With `github-pr-check`

By default, with `reporter: github-pr-check` an annotation is added to the line:

![Example comment made by the action, with github-pr-check](./examples/example-github-pr-check.png)

### With `github-pr-review`

With `reporter: github-pr-review` a comment is added to the Pull Request Conversation:

![Example comment made by the action, with github-pr-review](./examples/example-github-pr-review.png)

## Inputs

### `github_token`

**Required**. Must be in form of `github_token: ${{ secrets.github_token }}`'.

### `standardrb_flags`

Optional. standardrb flags. (standardrb `<standardrb_flags>`)

### `standardrb_version`

Optional. Set standardrb version. 
By default install latest version.

### `tool_name`

Optional. Tool name to use for reviewdog reporter. Useful when running multiple
actions with different config.

### `level`

Optional. Report level for reviewdog [`info`, `warning`, `error`].
It's same as `-level` flag of reviewdog.

### `reporter`

Optional. Reporter of reviewdog command [`github-pr-check`, `github-pr-review`].
The default is `github-pr-check`.

### `standardrb_extensions`

Optional. Set list of standardrb extensions with versions. 

By default install `standardrb-rails`, `standardrb-performance`, `standardrb-rspec`, `standardrb-i18n`, `standardrb-rake` with latest versions.

## Example usage

```yml
name: reviewdog
on: [pull_request]
jobs:
  standardrb:
    name: runner / standardrb
    runs-on: ubuntu-latest
    steps:
      - name: Check out code
        uses: actions/checkout@v1
      - name: standardrb
        uses: SennaLabs/action-standardrb@v0.0.3
        with:
          github_token: ${{ secrets.github_token }}
          reporter: github-pr-review # Default is github-pr-check
          rubocop_version: 0.1.6
          rubocop_flags: --format progress
```

## License

[MIT](https://choosealicense.com/licenses/mit)
