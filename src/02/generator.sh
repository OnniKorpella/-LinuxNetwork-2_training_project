#!/bin/bash

#  sudo find . -type f -newermt 2022-11-01 ! -newermt 2022-11-02 
#  sudo bash main.sh az az.az 1Mb
#  sudo find / -path "*231122" -> найти
#  sudo find / -path '*231122' -exec rm -rf {} \; &>/dev/null -> найти им удалить

function gen_folder {
    
    FileName=$(echo $one | awk -F. '{print $1}')
    FileExtension=$(echo $two | awk -F. '{print $2}')
    FileSize=$(echo $three | awk -F"Mb" '{print $1}')
    date="$(date +"%d%m%y")"
    date_log="$(date +"%d.%m.%y")"
    Foldername=$one;
    lastletterFolder=${Foldername: -1} 
    lastletterFile=${FileName: -1}
    FreePlace=$(df | grep -e ubuntu | awk {'{print $4}'})
    FolderCounter="$(shuf -i 1-100 -n1)"

    if [[ ${#one}<5 ]] ; then
            for (( i=${#one}; i<5; i++ )) do
            Foldername+="$(echo $lastletterFolder)"
        done
    fi
    
    if [[ ${#FileName}<5 ]] ; then
            for (( i=${#FileName}; i<5; i++ )) do
            FileName+="$(echo $lastletterFile)"
        done
    fi


    for (( i=1; i<=FolderCounter; i++ )); do
            FolderNameRand="$(compgen -d / | shuf -n1)"
            FileCounter="$(shuf -i 1-100 -n1)"
        if [[ $FolderNameRand == "/bin" || $FolderNameRand == "/sbin" ||\
        	$FolderNameRand == "/proc" || $FolderNameRand == "/sys" || \
            $FolderNameRand == "/lost+found" ]]; then
            
            FolderCounter="$(($FolderCounter+1))"
            else
            sudo mkdir "$FolderNameRand/"$Foldername"_"$date"" 2>/dev/null
            echo "Dir - "$FolderNameRand/"$Foldername"_"$date"" "$date_log"">>log
            fileName1=$FileName

            for (( j=1; j<=$FileCounter; j++ )); do
                FreePlace="$(df -h / | awk '{print $4}' | tail -n1)"
                if [[ ${FreePlace: -1} == "M" ]]; then
                    echo "Нет места"
                    exit 1
                fi
                sudo dd if=/dev/zero of=""$FolderNameRand"/"$Foldername"_"$date"/"$fileName1"_"$date"."$FileExtension"" bs=$FileSize"M" count=1  status=none 2>/dev/null
                echo "File - ""$FolderNameRand"/"$Foldername"_"$date"/"$fileName1"_"$date"."$FileExtension"" "$date_log" $FileSize"Mb"">>log
                fileName1+="$(echo $lastletterFile)"
            done
            Foldername+="$(echo $lastletterFolder)"
        fi
    done
    }
    