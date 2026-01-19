# Contributing guides

## Benchmarking

### Zsh

```shell
mise exec hyperfine -- hyperfine --warmup 3 "zsh -ic exit"
```

Our current configuration result:

> hyperfine --warmup 3 "zsh -ic exit" --export-markdown /tmp/hyperfine.md --time-unit millisecond --shell none --min-runs 20
| Command        |   Mean [ms] | Min [ms] | Max [ms] | Relative |
| :------------- | ----------: | -------: | -------: | -------: |
| `zsh -ic exit` | 441.8 ± 9.6 |    433.4 |    478.5 |     1.00 |
