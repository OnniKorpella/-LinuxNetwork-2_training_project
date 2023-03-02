#! /bin/bash

        case $param in

        1) # сортировка по коду ответа
                for (( i=1; i<6; i++ ))
                do
                        sort -k 9 ../04/$i.log -o logs/1_status_code_$i.log
                done
        ;;

        2) #только уникальные айпи
                for (( i=1; i<6; i++ ))
                do
                        awk '{print $1}' ../04/$i.log  | uniq  | sort -n > logs/2_ip_uniq_$i.log
                done
        ;;

        3) # только код ответа > 400
                for (( i=1; i<6; i++ ))
                do
                        awk '$9 ~ /[45][0-9][0-9]/' ../04/$i.log  > logs/3_sort_cod_4-5_$i.log
                done
        ;;

        4) # уникальных айпи c кодом ответа > 400 
                for (( i=1; i<6; i++ ))
                do
                        awk '$9 ~ /[45][0-9][0-9]/' ../04/$i.log | awk '{print $1}' | sort -n | uniq > logs/4_sort_cod_4-5_ip_$i.log
                done
        ;;
        esac

