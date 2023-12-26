#!/bin/bash
set -eo pipefail

OUT_FILE="out/FusionCalculator.c"
BIN_FILE="bin/FusionCalculator.exe"
SRC_FILES="$(find src/ -name '*.fu')"
WARNINGS="-Wall -Wno-unused-value -Wno-unused-function -Wno-unused-variable -Wno-discarded-qualifiers"
INCLUDES="$(pkg-config --cflags glib-2.0)"

if [[ $1 == '--debug' ]]; then
    COMPILER_ARGS="-O0 -g"
else
    COMPILER_ARGS="-O2"
fi
LINKER_ARGS="$(pkg-config --libs glib-2.0) -lm"

rm -rf out bin
mkdir out bin

echo "------------[fut]------------"

args="-l c -D C -o "$OUT_FILE" $SRC_FILES"
if [[ $1 == '--implement-math-functions' || $2 == '--implement-math-functions' ]]; then
    args="$args -D IMPLEMENT_MATH_FUNCTIONS"
fi

echo fut $args
fut $args

if [[ $1 != '--translate-only' && $2 != '--translate-only' ]]; then
    echo "------------[gcc]------------"
    args="$WARNINGS $COMPILER_ARGS "$OUT_FILE" -o "$BIN_FILE" $INCLUDES $LINKER_ARGS"
    echo gcc $args
    gcc $args
fi