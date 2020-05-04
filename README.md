# GitHub Action: Run standardrb with reviewdog 🐶

This action runs [standardrb](https://github.com/testdouble/standard) with
[reviewdog](https://github.com/reviewdog/reviewdog) on pull requests to improve
code review experience.

## Examples

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

## Note

For now *reviewdog* is not supporting standardrb formatter but I've already opened a PR and waiting to be merged so instead the workaround is to use `--format progress` to make it work with rubocop formatter.

## License

[MIT](https://choosealicense.com/licenses/mit)
