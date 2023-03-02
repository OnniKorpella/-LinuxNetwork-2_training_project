#!/bin/bash
function valid {
one=$1          # буквы для названия папок !>7 
two=$2          # буквы для названия файлов и расширении  !> 7 для имени и !>3 для расширения  
three=$3        # размер в Mb


num_regex='^[0-9]*$'
regex_folder_name='^[A-Za-z]*$'
regex_for_file_name='^[A-Za-z]{1,7}[.][A-Za-z]{1,3}$'
regex_for_file_size='^[0-9]{1,3}[M][b]$'

# arg >3 --------------------------------------
if  [[ $# != 3 ]]; then
    echo -e "${COLOR[3]}Error 10: параметров не три!${RES}";
    exit 10;
# 1 --------------------------------------
elif [[ ! $one =~ $regex_folder_name ]]; then
    echo -e "${COLOR[3]}Допускаются только буквы [a-z]${RES}"; 
    echo -e "${COLOR[3]}Исправить первый аргумент: ${COLOR[2]}$1${RES}"
        exit 1;
elif [[ ${#one} -gt 7  ]]; then
    echo -e "${COLOR[3]}Букв должно быть не > 7${RES}"; 
    echo -e "${COLOR[3]}Исправить первый аргумент: ${COLOR[2]}$1${RES}"
        exit 2;
# 2 --------------------------------------
elif [[ ! $two =~ $regex_for_file_name ]]; then
    echo -e "${COLOR[3]}Исправить второй аргумент: ${COLOR[2]}$2${RES}"
    echo -e "${COLOR[3]}пример ввода: az.az${RES}"; 
        exit 3;
# 3 --------------------------------------
elif [[ ! $three =~ $regex_for_file_size ]] || [[ ${three%Mb} -gt 100 || ${three%Mb} -le 0 ]]; then
    echo -e "${COLOR[3]}Исправить третий аргумент: ${COLOR[2]}$3${RES}"
    echo -e "${COLOR[3]}Пример ввода: ${COLOR[5]}3Mb${RES}"; 
    echo -e "${COLOR[3]}А так же ${COLOR[5]}от 0 до 100${RES}"; 
        exit 4;
  fi
}