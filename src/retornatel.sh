#!/bin/bash
# retornatel.sh
# tá bom, tá bom... eu sei que não é um exemplo muito útil...
# é só pra ilustrar a utilidade de redirecionar a saída do loop

FILE=agenda.tel

function gotoxy {
	[ $# -ne 2 ] && {
		echo gotoxy: Erro na passagem de parâmetros
		echo Uso: gotoxy X Y
		exit 1
	}
	echo -ne "\e[$1;$2H"
}

while true; do
	clear
	gotoxy 5 1
	read -p "Nome a ser pesquisado ('sair' para sair): " NOME
	[ "X$NOME" = Xsair ] && exit
	if grep "$NOME" $FILE &>/dev/null ; then
		break
	else
		gotoxy 10 15
		echo Nenhum $NOME foi encontrado em $FILE.
		read -p "Pressione <ENTER> para continuar..."
	fi
done > /dev/tty

grep "^$NOME" $FILE | cut -f3

