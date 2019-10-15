#!/bin/bash
#curl https://www.7-zip.org/a/7z1900.exe -o 7zwin.exe
curl https://www.7-zip.org/a/7z1900-x64.exe -o 7zwin.exe
mkdir unpack
cd unpack
7z e ../7zwin.exe
cp 7zCon.sfx /usr/lib/p7zip/7zConWin64.sfx
cd ..
rm -fr unpack 7zwin.exe
