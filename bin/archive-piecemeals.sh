#!/usr/bin/env bash

set -e

targRoot="/Users/matthew/mah/GoogleDrive"
date=`date "+%Y%m%d-%H%M"`
targPath="$targRoot/$date-piecemeal"

mkdir -p $targPath

mkdir "$targPath/Documents"
touch "/Users/matthew/Documents/TIMESTAMP-backup-piecemeals-on-`date`"
mv /Users/matthew/Documents/* $targPath/Documents

mkdir "$targPath/Downloads"
touch "/Users/matthew/Downloads/TIMESTAMP-backup-piecemeals-on-`date`"
mv /Users/matthew/Downloads/* $targPath/Downloads

