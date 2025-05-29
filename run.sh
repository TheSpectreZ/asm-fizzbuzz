#!/bin/bash
BASENAME=$(./build.sh $1)
shift
./build/"$BASENAME.out" "$@"