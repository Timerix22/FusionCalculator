#!/bin/bash
set -eo pipefail

rm -rf out bin
mkdir out

SRC_FILES="$(find src/ -name '*.fu')"
INCLUDES=""
for src_file in $SRC_FILES; do
    INCLUDES="$INCLUDES -r $src_file"
done
for src_file in $SRC_FILES; do
    echo "---------[$src_file]---------"
    out_file="out/$(basename $src_file .fu).cs"
    args="-l cs -D CS -n FusionCalculator $INCLUDES -o $out_file $src_file"
    echo "fu $args"
    fut $args
done

echo "---------[FusionCalculator.csproj]---------"
dotnet build FusionCalculator.csproj  -o bin
