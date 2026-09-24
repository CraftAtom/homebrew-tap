#!/bin/sh
# Updates Casks/meridian.rb to the version the API says is current.
#
# Reads https://api.gitmeridian.com/latest.json, downloads that version's DMG,
# computes its sha256, and rewrites the version and sha256 lines. Run it after
# a release has been published, then review the diff and commit.
#
#   scripts/bump.sh            # bump to the latest published version
#   scripts/bump.sh 1.6.0      # bump to a specific version
set -eu

cd "$(dirname "$0")/.."
cask=Casks/meridian.rb

version="${1:-$(curl -sSf https://api.gitmeridian.com/latest.json | sed -n 's/.*"version":"\([^"]*\)".*/\1/p')}"
[ -n "$version" ] || { echo "could not read the current version" >&2; exit 1; }

url="https://dl.gitmeridian.com/v${version}/Meridian_${version}_universal.dmg"
tmp="$(mktemp)"
trap 'rm -f "$tmp"' EXIT
curl -sSfL "$url" -o "$tmp"
sha="$(shasum -a 256 "$tmp" | cut -d' ' -f1)"

sed -i '' \
  -e "s/^  version \".*\"/  version \"${version}\"/" \
  -e "s/^  sha256 \".*\"/  sha256 \"${sha}\"/" \
  "$cask"

echo "meridian ${version} ${sha}"
git --no-pager diff --stat -- "$cask"
