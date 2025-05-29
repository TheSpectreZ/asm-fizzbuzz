#!/bin/bash

if [ -z "$1" ]; then
    echo "Usage: $0 path/to/file.asm"
fi

# Check if file ends with .asm
if [[ "$1" != *.asm ]]; then
  echo "Error: File must have a .asm extension"
  exit 1
fi

INPUT=$1
BASENAME=$(basename "$INPUT" .asm)

mkdir -p build

nasm -felf -o "build/$BASENAME.o" "$INPUT"
ld -m elf_i386 -o "build/$BASENAME.out" "build/$BASENAME.o"

echo "$BASENAME"