#!/bin/bash

if [ -z "$1" ]; then
    echo "Entre com um parâmetro"
    exit 1
fi

case "$1" in

*a)
    echo "você digitou algo que termina com 'a'" ;;

?b)
    echo "você digitou algum caractere seguido de um 'b'" ;;

[A-Za-z]c)
    echo "você digitou um caractere do alfabeto seguido de um 'c'" ;;

m|M)	# esta barra '|' serve como um "ou"
    echo MELEU;;

*)
    echo "nenhum dos parâmetros definidos foi usado" ;;

esac

