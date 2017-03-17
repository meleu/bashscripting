#!/bin/bash

PARAM_ERR=-198 # Se for passado mais do que dois parâmetros.
EQUAL=-199     # Retorno se os parâmetros forem iguais.

function maior # Retorna o maior de dois números
{              # OBS: os números comparados precisam ser menores que 257
[ -z "$2" ] && return $PARAM_ERR

if [ "$1" -eq "$2" ]; then
    return $EQUAL
elif [ "$1" -gt "$2" ]; then
    return $1
else
    return $2
fi
}

read -p "Numero-1: " N1
read -p "Numero-2: " N2
maior $N1 $N2
RET_VAL=$?

if [ $RET_VAL -eq $PARAM_ERR ]; then
    echo "É necessário passar dois parâmetros para a função."
elif [ $RET_VAL -eq $EQUAL ]; then
    echo "Os dois números são iguais."
else
    echo "O maior número é $RET_VAL."
fi


exit 0
