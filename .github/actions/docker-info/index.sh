#!/usr/bin/env bash

set -euo pipefail

: "${GITHUB_REPOSITORY:?}"
: "${GITHUB_REF_TYPE:?}"
: "${GITHUB_REF_NAME:?}"
: "${GITHUB_SHA:?}"
: "${INPUT_IMAGES:?}"
: "${INPUT_PLATFORMS:?}"
: "${GITHUB_OUTPUT:?}"

to_array() {
  local in="$1"
  local sep="${2:-,}"
  in="${in// /-}" # remove spaces
  in="${in//\"/}" # remove quotes
  printf '%s' "$in" | tr "$sep" '\n'
}

get_key() {
  local image="$1" distro version
  distro="${image%%:*}"
  version="${image##*:}"

  local platform="$2" os arch
  if test -n "$platform"; then
    os="${platform%%/*}"
    arch="${platform##*/}"
    printf '%s_%s-%s_%s' "$distro" "$version" "$os" "$arch"
  else
    printf '%s_%s' "$distro" "$version"
  fi
}

get_tag_suffix() {
  case "$1" in
  ubuntu:latest) printf '' ;;
  *) printf '%s' "${1%%:*}" ;;
  esac
}

get_dockerfile() {
  printf 'Dockerfile'
}

get_build_args() {
  printf '%s' ''
  printf '%s%s' "IMAGE=$1" '\n'
  printf '%s%s' "KCDF_REPO=$GITHUB_REPOSITORY" '\n'
  printf '%s%s' "KCDF_REF=$GITHUB_REF_TYPE/$GITHUB_REF_NAME" '\n'
  printf '%s%s' "KCDF_SHA=$GITHUB_SHA" '\n'
}

get_runs_on() {
  case "$1" in
  linux/amd64) printf 'ubuntu-24.04' ;;
  linux/arm64) printf 'ubuntu-24.04-arm' ;;
  *) printf 'ubuntu-latest' ;;
  esac
}

build_matrix() {
  local images="$1" platforms="$2" image platform empty=true

  echo '{'
  echo '  "include": ['
  while read -r image; do
    if test -z "$image"; then
      continue
    fi
    while read -r platform; do
      if test -z "$platform"; then
        continue
      fi

      printf '   %s{\n' "$($empty && printf ' ' || printf ',')"
      printf '      "image": "%s"\n' "$image"
      printf '     ,"platform": "%s"\n' "$platform"
      printf '     ,"key": "%s"\n' "$(get_key "$image" "$platform")"
      printf '     ,"tag-suffix": "%s"\n' "$(get_tag_suffix "$image")"
      printf '     ,"dockerfile": "%s"\n' "$(get_dockerfile "$image" "$platform")"
      printf '     ,"build-args": "%s"\n' "$(get_build_args "$image" "$platform")"
      printf '     ,"runs-on": "%s"\n' "$(get_runs_on "$platform")"
      printf '    }\n'

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
    printf '    %s{ "key": "%s" }\n' \
      "$($empty && printf ' ' || printf ',')" \
      "$(get_key "$image" '')"
    empty=false
  done <<<"$(to_array "$images")"
  echo '  ]'
  echo '}'
}

registry_info() {
  local prefix="$1" registry="$2" repo="$3" name="${4:-}"
  echo "${prefix}-registry=${registry}"
  echo "${prefix}-repo=${repo}"
  echo "${prefix}-name=${name:-${registry}/${repo}}"
}

platform_info() {
  local platforms="$1"
  if printf '%s' "$platforms" | grep -q ','; then
    echo 'multiplatform=true'
  else
    echo 'multiplatform=false'
  fi
}

{
  echo 'build-matrix<<EOF'
  build_matrix "$INPUT_IMAGES" "$INPUT_PLATFORMS"
  echo EOF

  echo "merge-matrix<<EOF"
  merge_matrix "$INPUT_IMAGES" "$INPUT_PLATFORMS"
  echo EOF

  registry_info 'dh' 'index.docker.io' 'kamontat/dotfiles'
  registry_info 'gh' 'ghcr.io' "$GITHUB_REPOSITORY"
  platform_info "$INPUT_PLATFORMS"
} >>"$GITHUB_OUTPUT"
