#!/bin/bash

set -x

PROGRAM_NAME=99-problems


if [ $# -eq 2 ]; then

    odin build src -out:$PROGRAM_NAME.bin -o:speed -reloc-mode:static && echo "OK"

elif [ $# -eq 1 ]; then

    odin build src -debug -out:$PROGRAM_NAME.bin && echo "OK"
else

    odin build src -out:$PROGRAM_NAME.bin && echo "OK"

fi
