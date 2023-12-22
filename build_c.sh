#!/bin/bash
set -eo pipefail

OUT_FILE="out/FusionCalculator.c"
BIN_FILE="bin/FusionCalculator.exe"
SRC_FILES="$(find src/ -name '*.fu')"
WARNINGS="-Wall -Wno-unused-value -Wno-unused-function -Wno-unused-variable -Wno-discarded-qualifiers"
INCLUDES="$(pkg-config --cflags glib-2.0)"
COMPILER_ARGS="-O0 -g"
LINKER_ARGS="$(pkg-config --libs glib-2.0) -lm"

rm -rf out bin
mkdir out bin

fut -l c -D C -o "$OUT_FILE" $SRC_FILES

gcc $WARNINGS $COMPILER_ARGS "$OUT_FILE" -o "$BIN_FILE" $INCLUDES $LINKER_ARGS
