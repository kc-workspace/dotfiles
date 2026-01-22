#!/usr/bin/env bash

set -e

to_array() {
  local in="$1"
  local sep="${2:-,}"
  in="${in// /-}" # remove spaces
  in="${in//\"/}" # remove quotes
  printf '%s' "$in" | tr "$sep" '\n'
}

get_runs_on() {
  case "$1" in
  linux/amd64) printf 'ubuntu-24.04' ;;
  linux/arm64) printf 'ubuntu-24.04-arm' ;;
  *) printf 'ubuntu-latest' ;;
  esac
}

get_name() {
  local image="$1"
  printf '%s' "${image%%:*}"
}

get_tag_suffix() {
  case "$1" in
  ubuntu:latest) printf '' ;;
  *) get_name "$@" ;;
  esac
}

build_matrix() {
  local images="$1" platforms="$2" image platform empty=true

  echo '{'
  echo '  "include": ['
  while read -r image; do
    while read -r platform; do
      printf '    %s{ "image": "%s", "platform": "%s", "name": "%s", "tag-suffix": "%s", "runs-on": "%s" }\n' \
        "$($empty && printf ' ' || printf ',')" \
        "$image" \
        "$platform" \
        "$(get_name "$image")" \
        "$(get_tag_suffix "$image")" \
        "$(get_runs_on "$platform")"

      empty=false
    done <<<"$(to_array "$platforms")"
  done <<<"$(to_array "$images")"
  echo '  ]'
  echo '}'
}

merge_matrix() {
  local images="$1" image empty=true
  echo '{'
  echo '  "include": ['
  while read -r image; do
    printf '    %s{ "name": "%s" }\n' \
      "$($empty && printf ' ' || printf ',')" \
      "$(get_name "$image")"
    empty=false
  done <<<"$(to_array "$images")"
  echo '  ]'
  echo '}'
}

registry_info() {
  local prefix="$1" registry="$2" repo="$3"
  echo "${prefix}-registry=${registry}"
  echo "${prefix}-repo=${repo}"
  echo "${prefix}-name=${registry}/${repo}"
}

{
  registry_info 'dh' 'index.docker.io' 'kamontat/dotfiles'
  registry_info 'gh' 'ghcr.io' "${GITHUB_REPOSITORY:?}"

  echo 'build-matrix<<EOF'
  build_matrix "${INPUT_IMAGES:?}" "${INPUT_PLATFORMS:?}"
  echo EOF

  echo "merge-matrix<<EOF"
  merge_matrix "${INPUT_IMAGES:?}" "${INPUT_PLATFORMS:?}"
  echo EOF
} >>"${GITHUB_OUTPUT:?}"
