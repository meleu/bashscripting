#!/bin/bash
# mp3select.sh
#
#   "Escolhedor" de mp3z feito para ilustrar o uso do 'dialog'
# no texto "Programação em Bourne-Again Shell".
#
#   Para utilizar este script é necessário ter instalado o mpg123.
#
# + OBS.: Se o nome de alguma mp3 for muito grande podem acontecer
# resultados bizarros... :-/
# + OBS.II: Este script não "detecta" nome de mp3z que contenham
# espaços. Pois se detectasse também ocorreriam resultados bizarros.
#
# Feito por: meleu <meleu@meleu.cjb.net>


# mude a variável MP3DIR e descomente-a para não
# precisar passar o diretório toda hora na linha
# de comando.
#MP3DIR="$HOME/mp3z/"
FILE="/tmp/mp3.$$"
NCOR="\e[m"
WHITE="\e[1m"


function AjudarSair {
	echo "Tente \"`basename $0` -h\" para ajuda."
	exit $1
}


function ApagarSair {
	rm $FILE
	exit $1
}


# óia o getopts aê gente! =)
while getopts 'd:n:h' OPCAO; do
    case $OPCAO in
    d) MP3DIR="$OPTARG" ;;
    n) NOME="*$OPTARG" ;;
    h) echo -e "
${WHITE}* Meleu's mp3 escolheitor (Tabajara, Inc.)$NCOR

Uso: `basename $0` [-d diretorio] [-n nome] [-h]

-d diretorio	diretório onde serão procuradas as mp3z
-n nome		nome que será procurado no diretório
-h		imprime esta mensagem
"
       exit ;;
    *) exit 1 ;;
    esac
done


if [ -z "$MP3DIR" ]; then
  echo -e "${WHITE}Você precisa indicar em qual diretório estão as mp3z.$NCOR"
  AjudarSair 1
elif [ ! -d "$MP3DIR" ]; then
  echo -e "$WHITE\"$MP3DIR\" não é um diretório.$NCOR"
  AjudarSair 1
fi

cd "$MP3DIR"

LISTA=`/bin/ls -1 $NOME*.mp3 2>/dev/null | grep -v ' '`
[ -z "$LISTA" ] && {
	echo -e "${WHITE}Nenhuma mp3 foi encontrada em \"$MP3DIR\".$NCOR"
	AjudarSair 1
}

CONT=1

dialog --backtitle "Selecionador de mp3z" \
 --title "$MP3DIR" \
 --checklist "Escolha a música" 0 0 0 \
$(for ITEM in $LISTA ; do
	echo "$ITEM" "$CONT" off
	(( CONT++ ))
done) 2>> $FILE

RET_VAL=$?
[ $RET_VAL -ne 0 ] && { echo "Tchau!"; ApagarSair; }


# verificando se já existe um processo com o mpg123
MPGPID=`ps ax --format pid,comm | grep mpg123 | cut -c-6`
[ $MPGPID ] && {
	dialog --backtitle "Selecionador de mp3z" \
	--title "O mpg123 JÁ ESTÁ SENDO USADO!" \
	--yesno "Deseja finalizá-lo para ouvir a sua lista?" 0 0
	RET_VAL=$?
	if [ $RET_VAL -eq 0 ]; then
	    kill $MPGPID 2>/dev/null || {
		echo -e "${WHITE}Não foi possível finalizar o mpg123.$NCOR"
		echo "Pode ser que outro usuário esteja utilizando-o."
		ApagarSair 1
	    }
	else
	    echo "Saindo..."
	    ApagarSair
	fi
}

# o sleep é pra garantir que o /dev/dsp estará desocupado
sleep 1s

cat $FILE | xargs mpg123 2> /dev/null &

ApagarSair

# EoF #
