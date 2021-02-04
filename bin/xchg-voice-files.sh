#!/usr/bin/env bash

set -e
IFS=$'\n'

if [ -e "/Volumes/IC RECORDER" ]; then 
    if [ -e "/Volumes/IC RECORDER 1" ]; then
        echo "Found both recorders.  Exchanging files now ..."
    else
        echo "Missing second recorder"
        exit
    fi
else
    echo "Missing first recorder"
    exit
fi

source1="/Volumes/IC RECORDER/REC_FILE/FOLDER01/"
target1="/Volumes/IC RECORDER/REC_FILE/FOLDER02/"
source2="/Volumes/IC RECORDER 1/REC_FILE/FOLDER01/"
target2="/Volumes/IC RECORDER 1/REC_FILE/FOLDER02/"
counter=0

mkdir -p $target1
mkdir -p $target2

for file in `find "$source1" -type f -name "*.mp3"`
do
    counter=$(( $counter + 1 ))
    cp -v "$file" "$target2"
done

for file in `find "$source2" -type f -name "*.mp3"`
do
    counter=$(( $counter + 1 ))
    cp -v  "$file" "$target1"
done
