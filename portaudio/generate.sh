#!/bin/bash

# OK so ideally I'd like to have something like:
# #cgo SOURCES opus/a.c opus/b.c etc...
# unfortunately, there is no way with #cgo to specify I want to add out-of-tree source files. That could be nice to have.
# so we generate a bunch of files for each opus file to be included. Putting it all in one file fails because of static functions.

# clean
rm inc-*.go

cd portaudio

genfile() {
	local file="$1"
	local COND="$2"
	local FN=`echo "inc-$file" | sed 's#/\{1,\}#-#g;s/_/-/g'`
	FN="../${FN/.c/}.go"

	echo "Processing: $file"

	echo -n >"$FN" # empty file
	if [ x"$COND" != x ]; then
		echo "// +build $COND" >>"$FN"
		echo >>"$FN"
	fi

	# actual file
	cat >>"$FN" <<EOF
package portaudio

/*
#include <portaudio/$file>
*/
import "C"
EOF
}

genfiles() {
	local COND="$1"
	shift

	for foo in "$@"; do
		genfile "$foo" "$COND"
	done
}

genfiles "" src/common/*.c
genfiles "!windows" src/os/unix/*.c
genfiles "windows" src/os/win/*.c
genfiles "windows" src/hostapi/wmme/*.c
genfiles "linux" src/hostapi/alsa/*.c
genfiles "darwin" src/hostapi/coreaudio/*.c

# remove this.
rm -f ../inc-src-hostapi-coreaudio-pa-mac-core-old.go
