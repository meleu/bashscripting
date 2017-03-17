#!/bin/bash
# crescente.sh

read -p "Entre com o primeiro número: " NUM1
read -p "Entre com o segundo número: " NUM2
read -p "Entre com o terceiro número: " NUM3

# Observe o "-a" (AND) na expressão abaixo
if [ $NUM1 -le $NUM2 -a $NUM1 -le $NUM3 ]; then
    MENOR=$NUM1
    if [ $NUM2 -le $NUM3 ]; then
        MEIO=$NUM2
        MAIOR=$NUM3
    else
        MEIO=$NUM3
        MAIOR=$NUM2
    fi
elif [ $NUM2 -le $NUM3 ]; then
    MENOR=$NUM2
    if [ $NUM1 -le $NUM3 ]; then
        MEIO=$NUM1
        MAIOR=$NUM3
    else
        MEIO=$NUM3
        MAIOR=$NUM1
    fi
else
    MENOR=$NUM3
    if [ $NUM1 -le $NUM2 ]; then
       MEIO=$NUM1
       MAIOR=$NUM2
    else
       MEIO=$NUM2
       MAIOR=$NUM1
    fi
fi

echo "$MENOR < $MEIO < $MAIOR"
