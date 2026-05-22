#!/usr/bin/env bash

set -e

#targRoot="/Users/matthew/mah/GoogleDrive"
targRoot="/media/matthew/LaCie/"
date=`date "+%Y%m%d-%H%M"`
targPath="$targRoot/$date-piecemeal"

mkdir -p $targPath

mkdir "$targPath/Downloads"
mv -v /home/matthew/Downloads/* $targPath/Downloads

