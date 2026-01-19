{{- if not (get . "disabled") }}
{{- template "zshrc/helpers/h3" "Docker CLI" }}

## Setup docker cli (on user mode)
docker_bin="$HOME/.docker/bin"
if [ -d "$docker_bin" ]; then
  PATH="$PATH:$docker_bin"
fi
unset docker_bin

{{ end -}}
