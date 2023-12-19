#!/bin/bash
set -eo pipefail

OUT_FILE="out/FusionCalculator.c"
BIN_FILE="bin/FusionCalculator.exe"
WARNINGS="-Wall -Wno-unused-value -Wno-unused-function -Wno-unused-variable -Wno-discarded-qualifiers"
INCLUDES="$(pkg-config --cflags glib-2.0)"
COMPILER_ARGS="-O0 -g"
LINKER_ARGS="$(pkg-config --libs glib-2.0)"

rm -rf out bin
mkdir out bin

fut -l c -o "$OUT_FILE" src/*.fu

gcc $WARNINGS $COMPILER_ARGS "$OUT_FILE" -o "$BIN_FILE" $INCLUDES $LINKER_ARGS
