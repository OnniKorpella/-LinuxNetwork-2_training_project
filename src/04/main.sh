#! /bin/bash
# тут мы генерируем лог nginx 

if [ $# != 0 ]; then
   	 echo "Parameter bad"
else
	chmod +x go.sh
   	 ./go.sh
fi


