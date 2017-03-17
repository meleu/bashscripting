#!/bin/bash
# backup.sh
#
# OBS.: Por favor melhore este script! :-)

# Se o número de parâmetros for menor que 2...
[ $# -lt 2 ] && {
  echo "Uso: `basename $0` destino origem [origem2 origem3...]"
  exit 1        # ... sai do script
}

echo "--> Fazendo backup"
FILE="${1}_$(/bin/date +%d-%m-%Y).tgz"
shift
# Aqui está o "segredo": o shift acima é executado para que eu possa
# usar "$*" no if abaixo.

if tar czf $FILE $* ; then
  echo "--> Backup feito com sucesso"
else
  echo "--> OCORREU UM ERRO <--" 1>&2
  exit 1
fi
