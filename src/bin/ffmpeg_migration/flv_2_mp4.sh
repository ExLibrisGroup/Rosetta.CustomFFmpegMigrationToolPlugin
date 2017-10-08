#!/bin/bash

# wrap all but the last two parameters
for (( i=1;$i<$#-1;i=$i+1 ))
do
    ARGS="$ARGS ${!i}"
done

in_filename="${!i}"
i=$((i+1))
output_dir="${!i}"


filename=$(basename "$in_filename")
in_filename_no_ext="${filename%.*}"
 
rm -rf "$out_filename"

mkdir -p "${output_dir}"
out_filename="${output_dir}/${in_filename_no_ext}.mp4"


DIR="`dirname \"$0\"`"

$DIR/ffmpeg-3.3.4-64bit-static/ffmpeg -i $in_filename  $ARGS $out_filename

exit $?
