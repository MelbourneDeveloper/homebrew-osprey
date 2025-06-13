#!/bin/bash
set -e

if [ $# -ne 2 ]; then
    echo "Usage: $0 <version> <sha256>"
    exit 1
fi

echo "✓ Updating Osprey formula to version $1..."

sed -i.bak \
    -e "s/version \".*\"/version \"$1\"/" \
    -e "s/sha256 \".*\"/sha256 \"$2\"/" \
    -e "s/v[0-9]\+\.[0-9]\+\.[0-9]\+/v$1/g" \
    Formula/osprey.rb

rm Formula/osprey.rb.bak

echo "✓ Committing changes..."
git add Formula/osprey.rb
git commit -m "osprey $1"
git push origin main

echo "✓ Updated successfully!"
