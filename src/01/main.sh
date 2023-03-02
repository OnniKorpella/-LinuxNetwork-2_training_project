#!/bin/bash
# bash main.sh /home/x/D04/sandbox 4 qwerty 10 qwerty.iop 5kb

. ../../code-samples/colors.sh
. ./valids.sh
. ./generator.sh

valid "$@"
gen_folder "$@"
