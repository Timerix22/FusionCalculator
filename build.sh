#!/bin/bash
set -eo pipefail
rm -rf out bin
mkdir out bin
fut -l c -o out/FusionCalculator.c src/*.fu
gcc -Wall -Wno-unused-value -Wno-unused-function -O0 -g out/FusionCalculator.c -o bin/FusionCalculator.exe $(pkg-config --cflags glib-2.0) $(pkg-config --libs glib-2.0)
