#!/bin/bash

[ $1 ] || { echo "Entre com o(s) nome(s) do arquivo(s)"; exit 1; }

for FILE in $@; do
        [ -f $FILE ] || {
                echo -e "\"$FILE\" não é um arquivo\n"
                continue
        }

        cat $FILE >> AllFiles.txt
        echo -e "\n\n\n-=-=-=-=-=-=-=-=-=-=-=-=-=-\n\n\n" >> AllFiles.txt

done

echo "Feito!"
