#!/bin/bash
# imprime amarelinho no centro da linha

# A variável $COLUMNS contém o número de colunas que o terminal está
# usando, e antes de executar este script você precisa exportá-la:
# [prompt]$ export COLUMNS
[ $COLUMNS ] || {
	echo Você precisa exportar a variável \"COLUMNS\":
	echo "Tente \"export COLUMNS\" e tente executar novamente"
	exit 1
}

POSICAO=$[ ( $COLUMNS - `expr length "$*"` ) / 2 ]
# `expr length "$*"` retorna o número de caracteres digitados
# como parâmetros.

echo -e "\e[${POSICAO}C\e[33;1m$*\e[0m"

