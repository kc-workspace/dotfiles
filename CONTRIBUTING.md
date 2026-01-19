# Contributing guides

## Benchmarking

### Zsh

```shell
mise exec hyperfine -- hyperfine --warmup 3 "zsh -ic exit"
```
