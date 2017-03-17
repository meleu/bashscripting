#!/bin/bash
#
# *********************************************
# * Script para visualizar HOWTOs rapidamente *
# *********************************************
#               http://meleu.da.ru
#          meleu <meleu@meleu.cjb.net>
#
#    Inspirado em um outro script que vi no Tips-HOWTO.
#    O script do Tips-HOWTO era muito simples, fiz algumas
# modificações que são interessantes para nós que falamos
# português e de vez em quando temos uns HOWTOs traduzidos,
# e ainda fiz um "suporte" aos mini-HOWTOs. ;-)
#    E mais: se você não lembra direito do nome do HOWTO, pode
# passar apenas a(s) primeira(s) letra(s) e/ou usar os curingas
# ('*', '?' e '[]'), mas aconselha-se, neste último caso, o uso de
# aspas ("quoting") para evitar que seja passado como parâmetro(s)
# o conteúdo do diretório atual. Caso ele encontre mais de um
# arquivo para a expressão você poderá escolher através da tela que
# aparecerá.
# Exemplos:
# [prompt]$ howto Net
# [prompt]$ howto "*[Bb]ash"
# [prompt]$ howto "*Prog"
#
#    Se você ainda não tem e não sabe onde pegar HOWTOs traduzidos
# procure em http://ldp-br.conectiva.com.br
#
# Pré-requisitos para o script funcionar direitinho (ou seja, sem
# precisar de alterações):
#    + os HOWTOs devem estar em "/usr/doc/Linux-HOWTOs";
#    + os HOWTOs em português devem estar em "/usr/doc/Linux-HOWTOs.pt";
#    + os mini-HOWTOs devem estar em "/usr/doc/Linux-mini-HOWTOs";
#    + todos os [mini-]HOWTOs[.pt] devem estar gzipados, se os seus não
#      estão assim basta entrar no diretório dos HOWTOs e digitar
#      "gzip *".
#
#
#    Se você testou o script, ele funcionou direitinho e você gostou,
# então digite "cp howto.sh /usr/local/bin/howto" para que todos do
# seu sistema possam utilizá-lo. ;-)
#
# Aproveite!


# Estes são os diretórios onde são instalados os [mini-]HOWTOs no
# Slackware. Se a sua distribuição usa um diretório diferente
# mude a(s) variável(is) a seguir.
HTDIR=/usr/doc/Linux-HOWTOs
miniHTDIR=/usr/doc/Linux-mini-HOWTOs
PTHTDIR=/usr/doc/Linux-HOWTOs.pt     # este é onde eu coloco os traduzidos


# Variáveis que indicam as cores (pra não precisar ficar
# digitando os códigos ANSI toda hora)
BLUE="\e[1;34m"
RED="\e[1;31m"
NCOLOR="\e[m"


function Ler {
zless $1
echo -e "${RED}\nTchau!\n$NCOLOR"
exit
}

# Função que mostra a lista dos HOWTOs e sai do script.
function Lista {
        ls -C $HTDIR | less
        echo -e "
${BLUE}Uso:$NCOLOR `basename $0` [-p | -m] nome-do-HOWTO
Faça '`basename $0` -h' para ver a descrição das opções."
	exit 1
}


# se não for passado nenhum parâmetro ele mostra a lista
[ -z "$1" ] && Lista


# --------------------
# - TESTA PARÂMETROS -
# --------------------
case $1 in

#  - mensagem de ajuda -
#  ---------------------
-h) echo -e "
${RED}--[ Lista de opções ]--$NCOLOR
-p \t HOWTOs em português
-m \t mini-HOWTOs
-h \t imprime esta mensagem
"
    exit	# depois da mensagem de ajuda, sair
;;

# - HOWTOs em português -
# -----------------------
-p) HTDIR=$PTHTDIR
    [ -z "$2" ] && Lista
    shift	# Lembra do 'shift'? Aqui ele faz com que o primeiro
		# parâmetro deixe de ser '-p' para ser o nome-do-HOWTO
;;

# - mini-HOWTOs -
# ---------------
-m) HTDIR=$miniHTDIR
    [ -z "$2" ] && Lista
    shift	# mesma função do shift no '-p'
;;

esac	# Ao fim deste case $1 tem necessariamente o nome ou a(s)
	# primeira(s) letra(s) do nome do HOWTO a ser procurado.

cd $HTDIR

FILE=`ls $1*.gz 2>/dev/null`

[ `echo $FILE | wc -w` -gt 1 ] && {
   PS3="Entre com o número: "
   select opc in $FILE Sair ; do

	[ "$opc" = "Sair" ] && exit

	for HOWTO in $FILE ; do
	    [ "$opc" = "$HOWTO" ] && Ler $HOWTO
	done
    done
}

[ -e "$FILE" ] && Ler $FILE


# Isto só será executado se não for encontrado o HOWTO
echo -e "${RED}* * * HOWTO não encontrado * * *$NCOLOR"
echo "Tente '`basename $0` [-p | -m]' para ver a lista"
exit 1

# - = < E O F > = -
