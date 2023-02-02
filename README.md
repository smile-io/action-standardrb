# GitHub Action: Run standardrb with reviewdog 🐶

This action runs [standardrb](https://github.com/testdouble/standard) with
[reviewdog](https://github.com/reviewdog/reviewdog) on pull requests to improve
code review experience.

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
        uses: actions/checkout@v3
      - name: standardrb
        uses: PrintReleaf/action-standardrb@v0.0.7
        with:
          github_token: ${{ secrets.github_token }}
          reporter: github-pr-review # Default is github-pr-check
          rubocop_flags: --format progress
          standard_version: 1.12.1
```

## Note

For now *reviewdog* is not supporting standardrb formatter but I've already opened a PR and waiting to be merged so instead the workaround is to use `--format progress` to make it work with rubocop formatter.

## License

[MIT](https://choosealicense.com/licenses/mit)
