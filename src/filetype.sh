#!/bin/bash
# filetype.sh

echo -n "Entre com o nome do arquivo: "
read FILE
echo "Tipo do arquivo `file $FILE`"
