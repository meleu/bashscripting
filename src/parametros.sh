#!/bin/bash
#
# "basename" serve para eliminar o caminho do arquivo e mostrar
# somente o último nome dele. Neste caso: parametros.sh
echo "Nome do script: `basename $0`"
echo "Número total de parâmetros: $#"
echo "Primeiro parâmetro: $1"
echo "Segundo parâmetro: $2"
echo "Décimo quinto parâmetro: ${15}"
echo "Todos os parâmetros: $*"
