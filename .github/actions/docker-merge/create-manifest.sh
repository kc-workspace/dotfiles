#!/usr/bin/env bash

set -euo pipefail

create_manifest() {
  local metadata="$1" image_name="$2"
  local args=(
    buildx
    imagetools create
  )

  # shellcheck disable=SC2207
  args+=($(jq -cr '.tags | map("--tag " + .) | join(" ")' "$metadata"))
  # shellcheck disable=SC2207
  args+=($(printf "$image_name@sha256:%s " *))

  printf '$ docker %s\n' "${args[*]}"
  docker "${args[@]}"
}

inspect_manifest() {
  local image_name="$1" image_version="$2"
  local args=(
    buildx
    imagetools inspect
    "$image_name:$image_version"
  )

  printf '$ docker %s\n' "${args[*]}"
  docker "${args[@]}"
}

main() {
  local image_name="$1" image_version="$2"
  local metadata="$RUNNER_TEMP/metadata.json"

  echo "$DOCKER_METADATA_OUTPUT_JSON" >"$metadata"
  create_manifest "$metadata" "$image_name"
  inspect_manifest "$image_name" "$image_version"
}

: "${DIGEST_PREFIX:?}"
: "${IMAGE_NAME:?}"
: "${IMAGE_VERSION:?}"
: "${DOCKER_METADATA_OUTPUT_JSON:?}"
: "${RUNNER_TEMP:?}"

cd "$RUNNER_TEMP/$DIGEST_PREFIX"
main "$IMAGE_NAME" "$IMAGE_VERSION"
