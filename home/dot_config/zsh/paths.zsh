## Use fd     instead of find (f)
## Use lsd    instead of ls (l)
## Use zoxide instead of cd (z)

## Setup local bin
export LOCAL_BIN="$HOME/.local/bin"
[ -d "$LOCAL_BIN" ] || mkdir "$LOCAL_BIN"
PATH="$LOCAL_BIN:$PATH"

## Setup local site-functions
export LOCAL_FUN="${ZSH_CACHE_DIR:-$HOME/.local/share}/completions"
[ -d "$LOCAL_FUN" ] || mkdir "$LOCAL_FUN"
fpath+="$LOCAL_FUN"

## Setup mise (cannot use oh-my-zsh plugin)
mise="$HOME/.local/bin/mise"
if [ -f "$mise" ]; then
  eval "$("$mise" activate zsh)"
  if ! [ -f "$LOCAL_FUN/_mise" ]; then
    "$mise" completion zsh >"$LOCAL_FUN/_mise"
  fi
fi
unset mise

## Setup docker cli (on user mode)
docker_bin="$HOME/.docker/bin"
if [ -d "$docker_bin" ]; then
  PATH="$PATH:$docker_bin"
fi
unset docker_bin

if command -v mise >/dev/null && command -v aws_completer >/dev/null; then
  autoload bashcompinit && bashcompinit && zicompinit
  complete -C aws_completer aws
fi

unset LOCAL_BIN LOCAL_FUN

