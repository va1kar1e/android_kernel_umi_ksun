#!/bin/bash
# Usage: fetch_pinned.sh <repo-url> <ref> <dir>   (ref = commit SHA, branch or tag)
set -euo pipefail
url=$1 ref=$2 dir=$3

git init -q "$dir"
git -C "$dir" remote add origin "$url"
git -C "$dir" fetch -q --depth 1 origin "$ref"
git -C "$dir" checkout -q FETCH_HEAD

got=$(git -C "$dir" rev-parse HEAD)
if [[ "$ref" =~ ^[0-9a-f]{40}$ && "$got" != "$ref" ]]; then
  echo "::error::$dir resolved to $got, expected pinned $ref"
  exit 1
fi
echo "$dir at $got ($url)"
