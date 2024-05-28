# GitHub Action: Run standardrb with reviewdog 🐶

This action runs [standardrb](https://github.com/testdouble/standard) with
[reviewdog](https://github.com/reviewdog/reviewdog) on pull requests to improve
code review experience.

## Example usage

```yml
name: Lint
on: pull_request
jobs:
  standardrb:
    name: Standard Ruby
    runs-on: ubuntu-latest
    steps:
      - name: Check out code
        uses: actions/checkout@v3
      - name: standardrb
        uses: smile-io/action-standardrb@master
        with:
          github_token: ${{ secrets.github_token }}
          reporter: github-pr-review # Default is github-pr-check
          rubocop_flags: --format progress
          standard_version: 1.36.0
```

## License

[MIT](https://choosealicense.com/licenses/mit)
