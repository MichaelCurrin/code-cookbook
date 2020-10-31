#!/bin/bash -e
# Convert README.md files to index.md files with layout metadata.
# Run as: ./bin/convert.sh

# Args: Path to a README.md file.
process() {
    echo $0
    CONTENT=$(<$0)
    OUT="---
layout: listing
---
$CONTENT"
    echo "$OUT" >"$(dirname $0)/index.md"
    rm $0
}

export -f process

find recipes -name README.md -exec bash -c 'process $0' '{}' \;
