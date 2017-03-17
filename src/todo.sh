#!/bin/bash
# todo.sh

PROG=`basename $0`
EDITOR=`which vi`
FILE="$HOME/.ToDo"
USAGE="Uso: $PROG [-h|-e]"

case $1 in
        -h) echo "
$USAGE

-e	edita a lista de \"Para Fazer\" (To Do)
-h	imprime esta mensagem e sai

Sem parâmetros $PROG irá mostrar a lista de \"To-Do\".
"
	    exit ;;

	-e) $EDITOR $FILE
	    exit ;;

	'') cat $FILE 2> /dev/null || {
		echo "Você precisa criar o arquivo $HOME/.ToDo !"
		echo "Entre \"$PROG -e\" para editar seu ~/.ToDo"
		echo "Para ajuda tente \"$PROG -h\""
		exit 1
	    } ;;

	*) echo "Parâmetro \"$1\" desconhecido!"
	   echo "$USAGE"
	   echo "Entre com \"$PROG -h\" para ajuda."
	   exit ;;

esac
