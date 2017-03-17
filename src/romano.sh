#!/bin/bash
# romano.sh
#
# Código baseado em um do Advanced Bash-Scripting Guide.
# Mais informações sobre este guia em http://www.linuxdoc.org
# Caso não entenda o código, faça um esforcinho! ;-)

LIMITE=400

function romano {
    NUM=$1
    FATOR=$2
    ROMAN=$3

    (( RESTO = $NUM - $FATOR ))

    while [ "$RESTO" -ge 0 ]; do
        echo -n $ROMAN
        (( NUM -= $FATOR ))
        (( RESTO = $NUM - $FATOR ))
    done

    return $NUM
}

[ "$1" ] || {
    echo "Uso: `basename $0` NUMERO"
    exit 1
}

[ "$1" -gt 400 ] && {
    echo "$1 ultrapassa o limite de $LIMITE"
    exit 1
}

NUMERO=$1

romano $NUMERO 100 C
NUMERO=$?

romano $NUMERO 90 XC
NUMERO=$?

romano $NUMERO 50 L
NUMERO=$?

romano $NUMERO 40 XL
NUMERO=$?

romano $NUMERO 10 X
NUMERO=$?

romano $NUMERO 9 IX
NUMERO=$?

romano $NUMERO 5 V
NUMERO=$?

romano $NUMERO 4 IV
NUMERO=$?

romano $NUMERO 1 I
NUMERO=$?

echo

exit
