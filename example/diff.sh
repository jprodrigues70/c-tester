#!/bin/bash
i=0;
for foldername in ./output/*; do
    printf "$foldername...";
    echo "Starting...";
    for filename in $foldername/*; do
        echo -en "\e[1A"; echo -e "\e[0K\r$filename";
        num=`diff -U 0 $filename "${filename/output/correct-output}"  | grep -v ^@ | wc -l`;
        if [[ ! -f "${filename/output/correct-output}" ]]; then
            echo -en "\e[1A";
            echo -en "\e[1A";
            echo -e "\e[0K\r$filename -- correct-output not found for this file\n";
            i=$[$i +1]
        elif (($num > 0))
        then
            printf "$filename ----- $num\n";
            git diff --no-index $filename "${filename/output/correct-output}";
            i=$[$i +1];
        fi
    done;
    echo -en "\e[1A"; echo -e "\e[0K\r$foldername -- OK";
done;

printf "\n$i Incorrect Outputs\n";