#!/bin/bash
function valid {
one=$1          # буквы для названия папок !>7 



num_regex='^[1-3]*$'

# arg >3 --------------------------------------
if  [[ $# != 1 ]]; then
    echo -e "${COLOR[3]}Error 10: параметров не один!${RES}";
    exit 1;
# 1 --------------------------------------
elif [[ ! $one =~ $num_regex ]] ; then
    echo -e "${COLOR[3]}Исправить первый аргумент: ${COLOR[2]}$1${RES}"
        exit 2;

  fi
}