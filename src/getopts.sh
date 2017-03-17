#!/bin/bash
# getopts.sh

USAGE="Uso: `basename $0` [-h] [-n nome] [-e email]"

[ $1 ] || { echo $USAGE ; exit 1 ; }

# observe que 'n' e 'e' precisam de argumentos
while getopts 'hn:e:' PARAMETRO; do

# atente para a utilidade do "case"! ;-)
    case $PARAMETRO in

	h) echo -n "
Script de exemplo de uso do \"getopts\".

Uso: `basename $0` [opções]

Onde as opções podem ser:

-n nome         imprime nome
-e email        imprime email
-h              exibe esta mensagem" ;;

	n) NOME=$OPTARG ;;

	e) EMAIL=$OPTARG ;;

	*) echo -n "Entre \"`basename $0` -h\" para ajuda." ;;
    esac
done

[ $NOME ] && echo $NOME
[ $EMAIL ] && echo $EMAIL
