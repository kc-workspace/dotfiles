# Contributing guides

## Chezmoi templates

Supports function in templates:

1. text/template: https://pkg.go.dev/text/template
2. sprig: https://masterminds.github.io/sprig/
3. internal: https://www.chezmoi.io/reference/templates/functions/ (check sidebar)

## Chezmoi data

> https://www.chezmoi.io/reference/special-files/chezmoidata-format/

YAML files are support YAML anchors for reusing configuration

## Dependencies

> Syntax: **dependencies**/`platform`/`os-family`

- platforms: actions, docker, machine
- os-families: darwin, linux/ubuntu, linux/debian

Not all os-families are support on all platforms.

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

<!-- LINKS SECTION -->

