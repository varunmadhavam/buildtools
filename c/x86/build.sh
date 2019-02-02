#!/bin/bash
compileserver=acer
compileroot=/home/varun/coding/c
project=$(basename "`pwd`")

function fmake {
echo Project is $project
echo Syncing files with complie server : $compileserver
rsync -aP --delete --exclude=".*" --exclude="tmp" --exclude="bin"  ../$project varun@$compileserver:$compileroot
echo Running make on target
ssh acer "cd $compileroot/$project;mkdir -p tmp bin;make"
echo Copy binary back to us
rsync -a  acer:$compileroot/$project/bin/$project bin/
}

function fall {
	fmake
}

if [ $# -eq 0 ]; then
	fall
else
	case "$1" in
		make)
			fmake
			;;
		*)
			echo Invalid Option
			;;
	esac
fi
