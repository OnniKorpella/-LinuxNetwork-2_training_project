#!/bin/bash

count=1
day=$(date +%d)

for ((; count < 6; count++ )); do
    countOfStr=$(shuf -i 100-1000 -n1)
    for (( i = 0; i < countOfStr; i++ )); do
        echo -n "$(shuf -i 1-255 -n1).$(shuf -i 1-255 -n1).$(shuf -i 1-255 -n1).$(shuf -i 1-255 -n1)" >> $count.log
        echo -n " - - " >> $count.log
        echo -n "[$day$(date +/%b/%Y:$(shuf -n1 -i 1-23):$(shuf -n1 -i 1-59):$(shuf -n1 -i 1-59)) +0000] " >> $count.log
        echo -n "\"$(shuf -n1 ../../code-samples/methods) " >> $count.log
        echo -n "$(shuf -n1 ../../code-samples/dir) " >> $count.log
        echo -n "$(shuf -n1 ../../code-samples/protocol)\" " >> $count.log
        echo -n "$(shuf -n1 ../../code-samples/codes) " >> $count.log
        echo -n $RANDOM >> $count.log
        echo -n " \"-\" " >> $count.log
        echo "\"$(shuf -n1 ../../code-samples/agent)\"" >> $count.log
    done
    let day--
done

for (( i=1; i<6; i++ ))
do
        awk '{print $3}' ../04/$i.log  | uniq  | sort -n > logs/2_ip_uniq_$i.log &>/dev/null
done

# 200 - Успешно
# 201 - Создано
# 400 - Плохой запрос
# 401 - Неавторизировано
# 403 - Запрещено
# 404 - Не найден
# 500 - Внутренняя ошибка сервера
# 501 - Не выполнено
# 502 - Плохой шлюз
# 503 - Сервис недоступен

