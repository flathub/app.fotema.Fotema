#!/usr/bin/env bash
#
# Update cargo-sources.json.

if ! command -v uv >/dev/null 2>&1; then
    2>&1 echo "ERROR: uv python package manager is missing."
    exit 1
fi

if ! command -v jq >/dev/null 2>&1; then
    2>&1 echo "ERROR: jq JSON tool is missing."
    exit 1
fi

cleanup() {
        rm -rf ci_sources/upstream_source
}

trap 'cleanup' ERR EXIT

MANIFEST="app.fotema.Fotema.json"

uv tool install flatpak-cargo-generator

UPSTREAM_REPO=$(cat $MANIFEST | jq -r '.modules[-1].sources[0].url')
UPSTREAM_TAG=$(cat $MANIFEST | jq -r '.modules[-1].sources[0].tag')
UPSTREAM_COMMIT=$(cat $MANIFEST | jq -r '.modules[-1].sources[0].commit')

rm -rf ci_sources/upstream_source
git clone -b $UPSTREAM_TAG --depth 1 $UPSTREAM_REPO ci_sources/upstream_source

# Check that the tag commit matches the one in the Flatpak manifest
tag_commit=$(git --git-dir=ci_sources/upstream_source/.git rev-parse HEAD)
if [[ $tag_commit != $UPSTREAM_COMMIT ]]; then
  echo "Commit of tag $UPSTREAM_TAG does not match Flatpak manifest commit: $tag_commit"
  exit 1
else
  echo "Commit of tag $UPSTREAM_TAG matches Flatpak manifest commit: $tag_commit"
fi

uvx flatpak-cargo-generator ci_sources/upstream_source/Cargo.lock -o cargo-sources.json
