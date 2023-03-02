#!/bin/bash

#  sudo bash main.sh az az.az 1Mb
#  sudo find . -type f -newermt 2022-11-01 ! -newermt 2022-11-02 
#  sudo find / -path "*221122"
#  sudo find / -path '*251122' -exec rm -rf {} \;

start=$(date +%s)
> log

. ../../code-samples/colors.sh
. ./valids.sh
. ./generator.sh

valid "$@"
gen_folder "$@"

echo "Start time - $(date +%T)">>log; echo "End time - $(date +%T)">>log
end=$(date +%s)
echo "Runtime = $(($end - $start))">>log
