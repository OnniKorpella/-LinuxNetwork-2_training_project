#!/bin/bash
# sudo bash main.sh 1 -> удаление по логу из 2го задания
# sudo bash main.sh 2 -> удаление по дате 
# sudo bash main.sh 3 -> удаление по шаблону - удаляет все

function gen_folder { 
    date="$(date +"%d%m%y")"
    date_f="$(date +"%y-%m-%d")"
    # ret=$(awk '/Dir/ {print $3}' ../02/log) 
    regex_folder_name='[A-Za-z]{5,}_[0-3][0-9][0-1][1-2][2][2-3]'

    #                                1                       2                3  4 
    #                   azz        _ дни                     месяц           год 
    regex_folder_name='[A-Za-z]{5,}_(0?[1-9]|[12][0-9]|3[01])(0?[1-9]|1[012])[2][2-3]'
    
    case $1 in
        1)
            for i in $ret
            do
                sudo rm -rf $i 2>/dev/null
            done
            ;;
            
        2)
            echo -e "${COLOR[3]}Enter start time: ${COLOR[5]}00:00${RES}"
            read start_time
            echo -e "${COLOR[3]}Enter end time: ${COLOR[5]}00:00${RES}"
            read end_time

           sudo rm -rf $(find / -type d -newermt "$date_f $start_time" ! -newermt "$date_f $end_time" 2>/dev/null | grep -E $regex_folder_name) 
        #    find / -type d -newermt "$date_f 22:02" ! -newermt "$date_f 22:03" | grep -E $regex_folder_name
            ;;

        3)
            sudo find / -path "*_[0-3][0-9][0-1][1-2][2][2]" -exec rm -rf {} \; 2>/dev/null
            # sudo find / -path '([A-Za-z]{5,}_(0?[1-9]|[12][0-9]|3[01])(0?[1-9]|1[012])[2][2-3])' -exec rm -rf {} \; 2>/dev/null

            ;;

        esac
            
 }
    