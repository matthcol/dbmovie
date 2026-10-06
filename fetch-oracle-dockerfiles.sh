#!/bin/sh
# Fetch the Oracle DB Dockerfiles for a given version from the official
# oracle/docker-images repo, without cloning the whole (huge) repository.
# Usage: ./fetch-oracle-dockerfiles.sh [version]

set -e

VERSION="${1:-21.3.0}"
REPO="https://github.com/oracle/docker-images.git"
BRANCH="main"
SUBPATH="OracleDatabase/SingleInstance/dockerfiles/$VERSION"
TMPDIR=$(mktemp -d)

git clone --no-checkout --depth 1 --filter=blob:none --branch "$BRANCH" "$REPO" "$TMPDIR"

(
    cd "$TMPDIR"
    git sparse-checkout init --cone
    git sparse-checkout set "$SUBPATH"
    git checkout "$BRANCH"
)

if [ ! -d "$TMPDIR/$SUBPATH" ]; then
    rm -rf "$TMPDIR"
    echo "Path '$SUBPATH' not found in $REPO@$BRANCH" >&2
    exit 1
fi

mkdir -p "$VERSION"
cp -rf "$TMPDIR/$SUBPATH/." "$VERSION/"

rm -rf "$TMPDIR"

echo "Fetched Oracle DB $VERSION Dockerfiles into ./$VERSION"

# Detect which no-login, free-tier Dockerfile variant this version ships
# (naming changed from "Dockerfile.xe" to "Containerfile.free" starting with 23ai)
if [ -f "$VERSION/Dockerfile.xe" ]; then
    echo "Free/XE variant: Dockerfile.xe  ->  build with: -f Dockerfile.xe"
elif [ -f "$VERSION/Containerfile.free" ]; then
    echo "Free/XE variant: Containerfile.free  ->  build with: -f Containerfile.free"
else
    echo "WARNING: no free/XE variant found for $VERSION - only the Enterprise/Standard Dockerfile is available, which requires a manual login-gated download from Oracle." >&2
fi
