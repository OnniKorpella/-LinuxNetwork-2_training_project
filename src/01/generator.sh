#!/bin/bash
# bash main.sh /home/student/project/D04_nellyole/src 4 qwerty 10 qwerty.iop 5kb
function gen_folder {

    > log
    FileExtension=$(echo $five | awk -F. '{print $2}')
    FileName=$(echo $five | awk -F. '{print $1}')
    launch_date="$(date +"%d%m%y")"
    launch_date_log="$(date +"%d.%m.%y")"
    Foldername=$three;
    lastletterFolder=${Foldername: -1}
    lastletterFile=${FileName: -1}
    filesize=$(echo $six | awk -F"kb" '{print $1}')

    if [[ ${#three}<4 ]] ; then
        for (( i=${#three}; i<4; i++ )) do
        Foldername+="$(echo $lastletterFolder)"
        done
    fi
    if [[ ${#FileName}<4 ]] ; then
        for (( i=${#FileName}; i<4; i++ )) do
        FileName+="$(echo $lastletterFile)"
        done
    fi
    for (( i=1; i<=$two; i++ )); do
        mkdir "$one/"$Foldername"_"$launch_date"" 2>/dev/null
        echo "Path - "$one/"$Foldername"_"$launch_date"", Date - "$launch_date_log"">>log
        fileName1=$FileName
        for (( j=1; j<=$four; j++)); do
            FreePlace=$(df --output=avail -m / | tail -n 1)
            if [[ $FreePlace -le 1024 ]] ; then
            echo "Нет места! Необходимо 1Gb, доступно:$FreePlace Mb"
            exit 10
            fi
        dd if=/dev/zero of=""$one"/"$Foldername"_"$launch_date"/"$fileName1"_"$launch_date"."$FileExtension"" bs=$filesize"K" count=1 status=none 2>/dev/null
        echo "Path - ""$one"/"$Foldername"_"$launch_date"/"$fileName1"_"$launch_date"."$FileExtension"", Date - "$launch_date_log", Size = $filesize"kb"">>log
        fileName1+="$(echo $lastletterFile)"
        done
    Foldername+="$(echo $lastletterFolder)"
    done

}