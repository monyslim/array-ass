#!/bin/bash
File="/etc/ssh/sshd_config"
Temp_file="temp_file"
if [[ -f $Temp_file ]]
then
    rm $Temp_file
fi
touch $Temp_file
while read -r line
do
    current_line=$( echo $line | grep PasswordAuthentication )


    if [[ $current_line ]]
    then
        echo "PasswordAuthentication=yes" >> $Temp_file
    else
        echo $line >> $Temp_file
    fi#

done < $File

rm -f $File
mv $Temp_file $File