#!/bin/bash

echo "Cleaning Tachiyomi directory..."

rm -r ./dlExt

echo -e "\nGetting new apk versions..."

# Pick your extensions here. Remember to prefix with \. and suffix with -
extensions='\.mangadex-|\.mangasee-|\.mangakakalot-'

apklist=$(lynx -dump -nonumbers -listonly https://github.com/tachiyomiorg/tachiyomi-extensions/tree/repo/apk|
sed 's/github/raw.githubusercontent/g'|
sed 's/blob\///g'|
grep -E $extensions)

wget $apklist -P dlExt

echo -e "Updating Tachiyomi  Extensions...\n"
adb connect arc

for file in ./dlExt/*
do
    echo -e "\nInstalling " $file
    adb -s emulator-5554 install $file
done
