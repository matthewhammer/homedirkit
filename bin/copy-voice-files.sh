#!/usr/bin/env bash

set -e

targRoot="/Users/matthew/mah/GoogleDrive"
date=`date "+%Y%m%d-%H%M"`

targets=(
    00
    01
)
sources=(
    /Volumes/IC\ RECORDER/REC_FILE/FOLDER01/
    /Volumes/IC\ RECORDER\ 1/REC_FILE/FOLDER01/
)
toDelete=()
for index in ${!targets[*]}; do 
    target=${targets[$index]}
    source=${sources[$index]}
    echo "copy $target <== $source ..."
    if [ -e "$source/"* ]; then
        path="$targRoot/$date-sony-ic-recorder/$target"
        mkdir -p $path
        cp -v "$source/"* $path
        echo "Done."
        toDelete+=("\"$source\"""*")
    else
        echo "  Warn: Source does not exist; skipping..."
    fi
done

echo "Notice on next steps:"
echo "  The recorder(s) memories retain their copies."
echo "  Clear the recorder(s) via"
echo "    rm -r ${toDelete[*]}"
