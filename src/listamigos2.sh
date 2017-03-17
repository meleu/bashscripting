#!/bin/bash
# listamigos2.sh

egrep -v "^#|^ *$" amigos.regiao |
while read REGIAO NOMES ; do
	echo -e "\n\e[32;1m--> Amigos do $REGIAO:\e[m"
	for amigo in $NOMES ; do
		echo -e "\e[1m$amigo\e[m"
	done
	echo -ne "\nEntre <ENTER> para continuar ou 'sair' para sair: "
	read QUIT < /dev/tty
	[ "$QUIT" = "sair" ] && exit
done
