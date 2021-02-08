#!/bin/bash

#Install required packages.
sudo apt-get install -y curl

#Get OS name.
OS=$(uname)

#Set archive type.
ARCHIVE_TYPE=".tar.bz2"

#Set CEF version.
CEF_VERSION="88.1.6+g4fe33a1+chromium-88.0.4324.96"

#Set CEF architecture and change
if [ "$OS" == "Linux" ]; then
	if [ $(uname -m) == "x86_64" ]; then
		CEF_NAME="cef_binary_""$CEF_VERSION""_linux64"
	else
		CEF_NAME="cef_binary_""$CEF_VERSION""_linux32"
	fi
else
	echo "ERROR:   ""FATAL ERROR! UNSUPPORTED OS!"
	exit
fi

#Regex replace "+" to "%2B", fix the url.
CEF_FIXED=${CEF_VERSION//+/%2B}

#Set the url to archive with CEF.
CEF_ARCHIVE_URL="https://cef-builds.spotifycdn.com/$CEF_NAME""$ARCHIVE_TYPE"

#Set path for download CEF archives.
CEF_DL_PATH="./"

#Set full path to downloading archive.
CEF_ARCHIVE_PATH="$CEF_DL_PATH""/$CEF_NAME""$ARCHIVE_TYPE"

#Set path for CEF binary.
CEF_PATH="./"

#Run from root.
if [[ $EUID -ne 0 ]]; then
	SUDO='sudo'
else
	SUDO=''
fi

#Check exist dirs for CEF. If no - creating it.
if [ -d "$CEF_DL_PATH" ]; then
	echo "INFO:   ""CEF download path exist: $CEF_DL_PATH"
else
	#mkdir with parrents.
	$SUDO mkdir -p "$CEF_DL_PATH"
	echo "INFO:   ""CEF download path created: $CEF_DL_PATH"
fi

if [ -d "$CEF_PATH" ]; then
	echo "INFO:   ""CEF install path exist: $CEF_PATH"
else
	#mkdir with parrents.
	$SUDO mkdir -p "$CEF_PATH"
	echo "INFO:   ""CEF install path created: $CEF_PATH"
fi

#Check exist archive. If no - download.
if [ ! -f "$CEF_ARCHIVE_PATH" ]; then
	echo "INFO:   ""Downloading CEF from: $CEF_ARCHIVE_URL"
	$SUDO curl -L "$CEF_ARCHIVE_URL" --output "$CEF_ARCHIVE_PATH"
else
	echo "INFO:   ""This archive is exist! Skip download."
fi

#Check exist archive. If yes - extract.
if [ -f "$CEF_ARCHIVE_PATH" ]; then
	#Clean CEF binary path.
	echo "INFO:   ""Removing files from: ""$CEF_PATH""/*"
	$SUDO rm -rf "$CEF_PATH""/*"

	#Debug info.
	echo "INFO:   ""Current directory is:"
	pwd

	cd "$CEF_PATH"

	#Debug info.
	echo "INFO:   ""Current directory changed to:"
	pwd

	#Extract CEF archive to CEF binary path.
	echo "INFO:   ""Extracting:"
	$SUDO tar -xvf "$CEF_ARCHIVE_PATH"
else
	echo "INFO:   ""Some troubles...   Exiting."
	exit
fi
