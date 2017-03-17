#!/bin/bash
# testargs.sh
#
# Ao executar este script entre alguns parametros. Ex.:
# [prompt]$ ./testargs.sh um dois tres quatro

if [ -z "$1" ]; then
  echo "Uso: `basename $0` argumento1 argumento2 etc."
  exit 1
fi

echo
echo "Listando argumentos com \"\$*\":"
num=1
for arg in "$*"; do
  echo "Arg #$num = $arg"
  num=$[ $num + 1 ]
done
# Conclusão: $* mostra todos os argumentos como uma única string

echo
echo "Listando argumentos com \"\$@\":"
num=1
for arg in "$@"; do
  echo "Arg #$num = $arg"
  num=$[ $num + 1 ]
done
# Conclusão: $@ mostra cada argumento em strings separadas

echo
