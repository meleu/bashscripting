#!/bin/bash

if [ $# -ne 1 ]; then
    echo "Uso: `basename $0` n"
    echo "Onde 'n' é um número inteiro qualquer"
    exit 1
fi

for OP in `seq 1 10`; do
  echo -e "$1 + $OP = $[ $1 + $OP ] \t $1 - $OP = $[ $1 - $OP ]"
done

echo

for OP in `seq 1 10`; do
  echo -e "$1 * $OP = $[ $1 * $OP ] \t \
$1 / $OP = `echo "scale=2;$1 / $OP" | bc`"
done
