#!/bin/bash
# listamigos.sh

# o egrep abaixo vai pegar o arquivo "amigos.regiao"
# sem exibir as linhas que comecem com um caractere '#'
# (considerado comentário) e sem mostrar linhas vazias,
# em seguida vai redirecionar a saída para a entrada do
# read que está lá no while (relembre-se do read no
# tópico 3.2.)
egrep -v "^#|^ *$" amigos.regiao |
while read REGIAO NOMES ; do
	echo -e "\e[1m--> Amigos do $REGIAO:\e[m"
	for amigo in $NOMES ; do
		echo "$amigo"
	done
	echo
done
