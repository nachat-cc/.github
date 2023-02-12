#!/usr/bin/env bash

if [ -z "$(command -v pandoc)" ] ; then
    >&2 echo "error: you need pandoc with rst input and gfm output plugins"
    exit 1
fi

find ./ -type f -iname '*rst' | while read -r rst_file ; do
  md_file="${rst_file%.rst}.md"
  pandoc -i "$rst_file" -f rst -t gfm -o "$md_file"
done
