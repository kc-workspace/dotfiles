#!/usr/bin/env bash

set -euo pipefail

main() {
  local images="$1" platforms="$2"

  {
    image_info "$images" "$platforms"
    config_info "$images" "$platforms"
    cache_info "$images" "$platforms"
    digest_info "$images" "$platforms"

    matrix_build_info "$images" "$platforms"
    matrix_merge_info "$images" "$platforms"
  } >>"$GITHUB_OUTPUT"
}

image_info() {
  local dh_registry="index.docker.io" dh_repo="kamontat/dotfiles"
  local gh_registry="ghcr.io" gh_repo="$GITHUB_REPOSITORY"
  local gh_username="$GITHUB_REPOSITORY_OWNER"

  add_item 'dh_registry' "$dh_registry"
  add_item 'dh_repo' "$dh_repo"
  add_item 'gh_registry' "$gh_registry"
  add_item 'gh_repo' "$gh_repo"
  add_item 'gh_username' "$gh_username"

  local image_name_dh="${dh_registry}/${dh_repo}"
  local image_name_gh="${gh_registry}/${gh_repo}"

  add_item 'image_name_dh' "$image_name_dh"
  add_item 'image_name_gh' "$image_name_gh"
  new_item 'image_names' printf '%s\n%s\n' "$image_name_dh" "$image_name_gh"
}

cache_info() {
  add_item 'cache_prefix' 'cache'
}

digest_info() {
  add_item 'digest_prefix' 'digests'
}

config_info() {
  local images="$1" platforms="$2"

  if printf '%s' "$platforms" | grep -q ','; then
    add_item 'conf_multiplatform' 'true'
  else
    add_item 'conf_multiplatform' 'false'
  fi
}

matrix_build_info() {
  new_item 'matrix_build' to_matrix _matrix_build "$@"
}

matrix_merge_info() {
  new_item 'matrix_merge' to_matrix _matrix_merge "$@"
}

## Create include matrix for docker build
_matrix_build() {
  local images="$1" platforms="$2" image platform first=true
  while read -r image; do
    while read -r platform; do
      to_obj_start 4 "$first"
      to_obj_data 4 'key' "$(__get_key '' "$image" "$platform")" true
      to_obj_data 4 'name' "$(__get_key '' "$image")" false
      to_obj_data 4 'image' "$image" false
      to_obj_data 4 'platform' "$platform" false
      to_obj_data 4 'dockerfile' "$(__get_dockerfile "$image" "$platform")" false
      to_obj_data 4 'build_args' "$(__get_build_args "$image" "$platform")" false
      to_obj_data 4 'runs_on' "$(__get_runs_on "$image" "$platform")" false
      to_obj_end 4
      first=false
    done <<<"$(to_array "$platforms")"
  done <<<"$(to_array "$images")"
}

## Create include matrix for docker merge
_matrix_merge() {
  local images="$1" platforms="$2" image first=true
  while read -r image; do
    to_obj_start 4 "$first"
    to_obj_data 4 'key' "$(__get_key '' "$image")" true
    to_obj_data 4 'platforms' "$platforms" false
    to_obj_data 4 'tag_suffix' "$(__get_tag_suffix "$image")" false
    to_obj_end 4
    first=false
  done <<<"$(to_array "$images")"
}

__get_key() {
  local prefix="${1:-}" output=''
  if test -n "$prefix"; then
    output="${prefix}"
  fi

  local image="${2:-}" distro version
  if test -n "$image"; then
    distro="${image%%:*}"
    version="${image##*:}"
    output="${output}$(test -n "$output" && printf '-')${distro}_${version}"
  fi

  local platform="${3:-}" os arch
  if test -n "$platform"; then
    os="${platform%%/*}"
    arch="${platform##*/}"
    output="${output}$(test -n "$output" && printf '-')${os}_${arch}"
  fi

  printf '%s' "$output"
}

__get_dockerfile() {
  local image="$1" platform="$2"
  printf 'Dockerfile'
}

__get_build_args() {
  local image="$1" platform="$2"
  printf '%s' ''
  printf '%s%s' "IMAGE=$image" '\n'
  printf '%s%s' "KCDF_REPO=$GITHUB_REPOSITORY" '\n'
  printf '%s%s' "KCDF_REF=$GITHUB_REF_TYPE/$GITHUB_REF_NAME" '\n'
  printf '%s%s' "KCDF_SHA=$GITHUB_SHA" '\n'
}

__get_runs_on() {
  local image="$1" platform="$2"
  case "$platform" in
  linux/amd64) printf 'ubuntu-24.04' ;;
  linux/arm64) printf 'ubuntu-24.04-arm' ;;
  *) printf 'ubuntu-latest' ;;
  esac
}

__get_tag_suffix() {
  local image="$1"
  case "$image" in
  ubuntu:latest) printf '' ;;
  *) printf '%s%s' '-' "${image%%:*}" ;;
  esac
}

to_obj_start() {
  local indent="$1" first="$2"
  __indent "$((indent - 1))"
  printf '%s{\n' "$($first && printf ' ' || printf ',')"
}
to_obj_data() {
  local indent="$1" key="$2" value="$3" first="$4"
  __indent "$((indent + 2 - 1))"
  printf '%s"%s": "%s"\n' "$($first && printf ' ' || printf ',')" "$key" "$value"
}
to_obj_end() {
  local indent="$1"
  __indent "$indent"
  printf '}\n'
}
to_array() {
  local in="$1"
  local sep="${2:-,}"
  in="${in// /-}" # remove spaces
  in="${in//\"/}" # remove quotes
  printf '%s' "$in" | tr "$sep" '\n'
}
to_matrix() {
  echo '{'
  echo '  "include": ['
  "$@"
  echo '  ]'
  echo '}'
}

add_single() {
  local key="$1"
  shift

  printf "%s=" "$key"
  # shellcheck disable=SC2059
  printf "$@"
}

## Add new multi-line item
new_item() {
  local key="$1"
  shift

  echo "$key<<EOF"
  "$@"
  echo "EOF"

  printf ">> Set '%-20s' to multi-line value\n" "$key" >&2
  echo "\`\`\`" >&2
  "$@" >&2
  echo "\`\`\`" >&2
  echo >&2
}
add_item() {
  local key="$1" value="$2"
  echo "$key=$value"
  printf ">> Set '%-20s' to value: '%s'\n" "$key" "$value" >&2
}

__indent() {
  if [[ $1 -le 0 ]]; then
    return
  fi

  for _ in $(seq "$1"); do
    printf ' '
  done
}

: "${GITHUB_REPOSITORY:?}"
: "${GITHUB_REPOSITORY_OWNER:?}"
: "${GITHUB_REF_TYPE:?}"
: "${GITHUB_REF_NAME:?}"
: "${GITHUB_SHA:?}"
: "${GITHUB_OUTPUT:?}"

main "${IMAGES:?}" "${PLATFORMS:?}"
