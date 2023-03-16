#!/bin/bash

echo "Cleaning Tachiyomi directory..."

rm ./dlExt/*

echo -e "\nGetting new apk versions..."

extensions='\.mangadex-|\.mangasee-|\.mangakakalot-'

apklist=$(lynx -dump -nonumbers -listonly https://github.com/tachiyomiorg/tachiyomi-extensions/tree/repo/apk |
grep -E $extensions)

$apklist=$(echo $apklist//github/raw.githubusercontent)
# sed -i 's/blob\///g')

echo $apklist

# while read link; do
#     wget $link -P dlExt
# done <apkext.txt

# echo -e "Updating Tachiyomi  Extensions...\n"
# adb connect arc

# for file in ./Tachiyomi/*
# do
#     echo -e "\nInstalling " $file
#     adb -s emulator-5554 install $file
# done
