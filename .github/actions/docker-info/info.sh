#!/usr/bin/env bash

set -euo pipefail

main() {
  local nl=$'\n'
  item_add 'dh_registry' "index.docker.io"
  item_add 'dh_repo' "kamontat/dotfiles"
  item_add 'dh_image_name' "$(item_get 'dh_registry')/$(item_get 'dh_repo')"

  item_add 'gh_registry' "ghcr.io"
  item_add 'gh_repo' "$GITHUB_REPOSITORY"
  item_add 'gh_image_name' "$(item_get 'gh_registry')/$(item_get 'gh_repo')"
  item_add 'gh_username' "$GITHUB_REPOSITORY_OWNER"

  item_add 'image_names' "$(item_get "dh_image_name")$nl$(item_get "gh_image_name")"

  item_add 'cache_prefix' 'cache'

  item_add 'digest_prefix' 'digests'

  item_add_cmd cmd_matrix_build
  item_add_cmd cmd_matrix_merge
  item_add_cmd cmd_conf_multiplatform
}

cmd_matrix_build() {
  local image platform
  matrix_include_start && json_init 4
  while read -r image; do
    while read -r platform; do
      json_start
      json_data 'image' "$image"
      json_data 'image_distro' "$(__get_im_distro "$image")"
      json_data 'image_version' "$(__get_im_version "$image")"
      json_data 'platform' "$platform"
      json_data 'platform_os' "$(__get_pl_os "$platform")"
      json_data 'platform_arch' "$(__get_pl_arch "$platform")"
      json_data 'key' "$(_get_key "$image" "$platform")"
      json_data 'cache_key' "$(_get_key_cache "$image" "$platform")"
      json_data 'digest_key' "$(_get_key_digest "$image" "$platform")"
      json_data 'dockerfile' "$(_get_dockerfile "$image" "$platform")"
      json_data 'build_args' "$(_get_build_args "$image" "$platform")"
      json_data 'runs_on' "$(_get_runs_on "$image" "$platform")"
      json_stop
    done <<<"$(__str_array "$INPUT_PLATFORMS")"
  done <<<"$(__str_array "$INPUT_IMAGES")"
  json_end && matrix_include_stop
}

cmd_matrix_merge() {
  local image platform
  matrix_include_start && json_init 4
  while read -r image; do
    json_start
    json_data 'image' "$image"
    json_data 'image_distro' "$(__get_im_distro "$image")"
    json_data 'image_version' "$(__get_im_version "$image")"
    json_data 'platforms' "$INPUT_PLATFORMS"
    json_data 'key' "$(_get_key "$image")"
    json_data 'key_cache' "$(_get_key_cache "$image")"
    json_data 'key_digest' "$(_get_key_digest "$image")"
    json_data 'tag_suffix' "$(_get_tag_suffix "$image")"
    json_stop
  done <<<"$(__str_array "$INPUT_IMAGES")"
  json_end && matrix_include_stop
}

cmd_conf_multiplatform() {
  if printf '%s' "$INPUT_PLATFORMS" | grep -q ','; then
    printf true
  else
    printf false
  fi
}

_get_key() {
  local image="$1" platform="${2:-}"
  local distro version os arch
  distro="$(__get_im_distro "$image")"
  version="$(__get_im_version "$image")"
  printf '%s_%s' "$distro" "$version"
  if test -n "$platform"; then
    os="$(__get_pl_os "$platform")"
    arch="$(__get_pl_arch "$platform")"
    printf '%s%s_%s' "-" "$os" "$arch"
  fi
}
_get_key_cache() {
  local image="$1" platform="${2:-}"
  local distro os arch
  distro="$(__get_im_distro "$image")"
  printf '%s-%s' "$(item_get 'cache_prefix')" "$distro"
  if test -n "$platform"; then
    os="$(__get_pl_os "$platform")"
    arch="$(__get_pl_arch "$platform")"
    printf '%s%s_%s' "-" "$os" "$arch"
  fi
}
_get_key_digest() {
  local image="$1" platform="${2:-}"
  local distro version
  distro="$(__get_im_distro "$image")"
  version="$(__get_im_version "$image")"
  printf '%s-%s_%s' "$(item_get 'digest_prefix')" "$distro" "$version"
  if test -n "$platform"; then
    os="$(__get_pl_os "$platform")"
    arch="$(__get_pl_arch "$platform")"
    printf '%s%s_%s' "-" "$os" "$arch"
  fi
}
_get_dockerfile() {
  local image="$1" platform="$2"
  case "$image-$platform" in
  *) printf 'Dockerfile' ;;
  esac
}
_get_build_args() {
  local image="$1" platform="$2"

  __str_encode "IMAGE=$image\n"
  __str_encode "KCDF_REPO=$GITHUB_REPOSITORY\n"
  __str_encode "KCDF_REF=$GITHUB_REF_TYPE/$GITHUB_REF_NAME\n"
  __str_encode "KCDF_SHA=$GITHUB_SHA\n"
}
_get_runs_on() {
  local image="$1" platform="$2"
  case "$image-$platform" in
  *-linux/amd64) printf 'ubuntu-24.04' ;;
  *-linux/arm64) printf 'ubuntu-24.04-arm' ;;
  *) printf 'ubuntu-24.04' ;;
  esac
}

_get_tag_suffix() {
  local image="$1"

  case "$image" in
  ubuntu:latest) printf '' ;;
  *:latest)
    printf '%s' '-'
    __get_im_distro "$image"
    ;;
  *)
    local distro version
    distro="$(__get_im_distro "$image")"
    version="$(__get_im_version "$image")"
    printf '%s' '-'
    printf '%s-%s' "$distro" "$version"
    ;;
  esac
}

__get_im_distro() {
  local image="$1"
  [[ $image == *:* ]] &&
    printf '%s' "${image%:*}" ||
    printf '%s' "$image"
}
__get_im_version() {
  local image="$1"
  [[ $image == *:* ]] &&
    printf '%s' "${image##*:}" ||
    printf '%s' "$image"
}
__get_pl_os() {
  local platform="$1"
  [[ $platform == */* ]] &&
    printf '%s' "${platform%/*}" ||
    printf '%s' "$platform"
}
__get_pl_arch() {
  local platform="$1"
  [[ $platform == */* ]] &&
    printf '%s' "${platform##*/}" ||
    printf '%s' "$platform"
}

item_add() {
  local k="$1" key v="$2" value
  key="$(_item_key "$k")"
  value="$(__str_encode "$v")"
  printf '%s=%s\n' "$key" "$value" >>"$__CACHE_FILE"
}
item_add_cmd() {
  local k="$1" key value
  shift

  key="$(_item_key "$k")"
  if [[ $k == cmd_* ]]; then
    key="$(_item_key "${k#cmd_}")"
    value="$(__str_encode "$("$k" "$@" 2>&1)")"
  elif [[ $# -lt 1 ]]; then
    value="$(__str_encode "$("$k" 2>&1)")"
  else
    value="$(__str_encode "$("$@" 2>&1)")"
  fi

  printf '%s=%s\n' "$key" "$value" >>"$__CACHE_FILE"
}
item_get() {
  local k="$1" key
  key="$(_item_key "$k")"
  grep "^${key}=" "$__CACHE_FILE" | cut -d '=' -f 2- || printf ''
}

_item_setup() {
  rm -rf "$__TMPDIR"
  mkdir -p "$__TMPDIR" && mkdir -p "$__CACHEDIR"

  __CACHE_FILE="$__CACHEDIR/items.$$"
  touch "$__CACHE_FILE"
}
_item_save() {
  local k key v value
  while IFS='=' read -r k v; do
    key="$(_item_key "$k")"
    value="$(__str_decode "$v")"
    if __str_multiline "$value"; then
      {
        printf '%s<<EOF\n' "$(_item_key "$key")"
        printf '%s\n' "$value"
        printf 'EOF\n'
      } >>"$GITHUB_OUTPUT"
    else
      printf '%s=%s\n' "$key" "$value" >>"$GITHUB_OUTPUT"
    fi
  done <"$__CACHE_FILE"
  unset __CACHE_FILE
}
_item_key() {
  printf '%s' "${1//=/-}"
}

matrix_include_start() {
  echo '{'
  echo '  "include": ['
}
matrix_include_stop() {
  echo
  echo '  ]'
  echo '}'
}

json_init() {
  __JSON_INDENT="$1"
  __JSON_PREVIOUS=false
}
json_start() {
  __JSON_DATA=false
  if "$__JSON_PREVIOUS"; then
    __JSON_PREVIOUS=false
    printf ',\n'
  fi

  __str_indent "$__JSON_INDENT"
  printf '{'
}
json_data() {
  local key="$1" value="$2"

  "$__JSON_DATA" && printf ',\n' || printf '\n'
  __str_indent "$((__JSON_INDENT + 2))"

  printf '"%s": "%s"' "$key" "$value"
  __JSON_DATA=true
}
json_stop() {
  "$__JSON_DATA" && printf '\n' || printf ''
  __str_indent "$__JSON_INDENT"
  printf '}'

  unset __JSON_DATA
  __JSON_PREVIOUS=true
}
json_end() {
  unset __JSON_INDENT __JSON_PREVIOUS
}

__str_encode() {
  local str="${1//$'\n'/[NEWLINE]}"
  str="${str%[NEWLINE]}"
  printf '%s' "$str"
}
__str_decode() {
  # shellcheck disable=SC2059
  printf "%s" "${1//\[NEWLINE\]/$'\n'}"
}
__str_multiline() {
  local str="$1" ln=$'\n'
  [[ "$str" == *"$ln"* ]] && [[ "$str" != *"$ln" ]]
}
__str_indent() {
  local num="$1"
  if [[ $num -le 0 ]]; then
    return
  fi
  for _ in $(seq "$num"); do
    printf ' '
  done
}
__str_array() {
  local str="$1" sep="${2:-,}"
  str="${str// /-}" # remove spaces
  str="${str//\"/}" # remove quotes
  printf '%s' "$str" | tr "$sep" '\n'
}

: "${GITHUB_REPOSITORY:?}"
: "${GITHUB_REPOSITORY_OWNER:?}"
: "${GITHUB_REF_TYPE:?}"
: "${GITHUB_REF_NAME:?}"
: "${GITHUB_SHA:?}"
: "${GITHUB_OUTPUT:?}"

__TMPDIR="${RUNNER_TEMP:-${TMPDIR:-/tmp}}/docker-info"
__CACHEDIR="${__TMPDIR}/cache"

_item_setup
main "${INPUT_IMAGES:?}" "${INPUT_PLATFORMS:?}"
_item_save
unset __TMPDIR __CACHEDIR
