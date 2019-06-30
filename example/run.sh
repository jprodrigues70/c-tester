#!/bin/bash

for foldername in ./input/*; do
    printf "$foldername...";
    echo "Running...";
    for filename in $foldername/*; do
        arquivo=${filename%.*}
        echo -en "\e[1A"; echo -e "\e[0K\r${arquivo}";
        ./a.out < $filename > "${arquivo/input/output}.out"   ;
    done;
    echo -en "\e[1A"; echo -e "\e[0K\r$foldername -- OK";
done;
