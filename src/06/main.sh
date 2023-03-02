#!/bin/bash
# установка nginx -веб-сервер
# установка goaccess - утилита для работы с логами 
# генерируется html файл и транслируется на localhost:1082
# если меняется машина  - поменять локацию файла в конфиге nginx и настоить порты

. ../../code-samples/colors.sh

if ! [[ -n $(dpkg -l | grep goaccess) ]];then
    sudo apt install goaccess -y
fi
if ! [[ -n $(dpkg -l | grep nginx) ]];then
    sudo apt install nginx -y
fi

  sudo cp ../../data-samples/nginx_part_6.conf /etc/nginx/nginx.conf 
  sudo cp ../../data-samples/goaccess.conf /etc/goaccess/goaccess.conf
  sudo goaccess -f ../04/*.log --log-format=COMBINED -o ../../data-samples/index.html 
  sudo service nginx restart 
  sudo nginx -t
  # http://localhost:1082/