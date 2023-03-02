#!/bin/bash
#bash main.sh /home/x/D04/ 4 qwerty 10 qwerty.iop 5kb

function valid {
one=$1          # абсолютный путь
two=$2          # количество создоваемых вложенных папок
three=$3        # буквы для названия папок   
four=$4         # колличество файлов в каждой папке
five=$5         # буквы для названия файлов и расширении  не более > 7 для имени и не > 3 для для расширения  
six=$6          # размер файла

num_regex='^[0-9]*$'
regex_folder_name='^[A-Za-z]*$'
regex_for_file_name='^[A-Za-z]{1,7}[.][A-Za-z]{1,3}$'
regex_for_file_size='^[0-9]{1,3}[k][b]$'

# arg >6 --------------------------------------
if  [[ $# != 6 ]]; then
    echo -e "${COLOR[3]}: параметров не шесть!${RES}";
    exit 10;

# 1 --------------------------------------
elif [[ ! -d $one ]]; then 
    echo -e "${COLOR[3]} нет пути!${RES}"
    echo -e "${COLOR[3]}Исправить первый аргумент: ${COLOR[2]} $1 ${RES}"
        exit 1;

# elif [[ ! $1 =~ /$ ]]; then
#     echo -e "${COLOR[3]} Исправить первый аргумент:   $1 <= поставь сюда знак \"/\"${RES}" >&2;
#     exit 1;
# 2 --------------------------------------
elif [[ ! $two =~ $num_regex  ]]; then
    echo -e "${COLOR[3]}Допускаются только цифры${RES}"; 
    echo -e "${COLOR[3]}Исправить второй аргумент: $2${RES}"
        exit 2;

elif [[ $two -le 1 ]]; then
    echo -e "${COLOR[3]}Допускаются цифры > 0${RES}"
    echo -e "${COLOR[3]}Исправить второй аргумент: ${COLOR[2]}$2${RES}"
        exit 2;
# 3 --------------------------------------
elif [[ ! $three =~ $regex_folder_name ]]; then
    echo -e "${COLOR[3]}Допускаются только буквы [a-z]${RES}" 
    echo -e "${COLOR[3]}Исправить третий аргумент: ${COLOR[2]}$3${RES}"
        exit 3;
        
elif [[ ${#three} -gt 7  ]]; then
    echo -e "${COLOR[3]}Букв должно быть не более 7${RES}"; 
    echo -e "${COLOR[3]}Исправить третий аргумент: ${COLOR[2]}$3${RES}"
        exit 3;
# 4 --------------------------------------
elif [[ ! $four =~ $num_regex ]]; then
    echo -e "${COLOR[3]} Допускаются только цифры${RES}"; 
    echo -e "${COLOR[3]}Исправить четвертый аргумент: ${COLOR[2]}$4${RES}"
        exit 4;

elif [[ $four -gt 240 ]]; then
    echo -e "${COLOR[3]}Файлов не более 240${RES}"; 
    echo -e "${COLOR[3]}Исправить четвертый аргумент: ${COLOR[2]}$4${RES}"
        exit 4;
# 5 --------------------------------------
elif [[ ! $five =~ $regex_for_file_name ]]; then
    echo -e "${COLOR[3]}Исправить пятый аргумент: ${COLOR[2]}$5${RES}"
    echo -e "${COLOR[3]}пример ввода: az.az${RES}"; 
        exit 5;
# 6 --------------------------------------
elif [[ ! $six =~ $regex_for_file_size ]] || [[ ${six%kb} -gt 100 || ${six%kb} -le 0 ]]; then
    echo -e "${COLOR[3]}Исправить шестой аргумент: ${COLOR[2]}$6${RES}"
    echo -e "${COLOR[3]}Пример ввода: 3kb${RES}"; 
    echo -e "${COLOR[3]}В диапазоне от 1 до 100${RES}"; 
        exit 6;
fi
}

