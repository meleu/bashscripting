#!/bin/sh
# Mextract.sh
#
# ****************************
# * Meleu Extraction Utility *
# ****************************
#      http://meleu.da.ru
#
#   Este script é baseado no Phrack Extraction Utility, (mais informações
# <http://www.phrack.org>). Fiz ele, primeiro para praticar, segundo para
# servir como mais um exemplo no texto "Programação em Bourne-Again Shell", 
# e último para extração dos códigos do texto. =P
#
############# Se já existirem arquivos com o nome dos que serão extraídos
# !CUIDADO! # eles serão sobregravados! Portanto, se você extrair uma vez,
############# alterar o(s) código(s) extraído(s) e extrair novamente,
#             perderá as alterações feitas!
#
#
#   A seguir eu vou comentar sobre o código fazendo referência aos tópicos
# do texto "Programação em Bourne-Again Shell".
#
#
#    + A função do IFS é explicada no tópico "2.2. Variáveis do Shell",
# neste script eu usei o IFS com valor nulo (vazio) para que os comandos
# considerem espaços que vêm antes de qualquer caractere como parte do
# dado. Se você fizer por exemplo "read var" e antes de entrar qualquer
# coisa colocar espaços e/ou TAB, você verá que eles serão desconsiderados
# se o IFS tiver seu valor default (espaço, TAB, newline);
#
#    + A opção -r no read (explicada em 3.2. read) serve para ignorar o
# poder que a contra-barra (backslash) tem de "escapar" os caracteres. Em
# outras palavras: a opção -r garante que quando o read receber uma
# contra-barra ela será passada para a variável sem nenhum valor especial;
#
#    + O cat enviando os dados para o read do while é explicado em
# "5.5. Redirecionando loops" sob o título de "pipeando para o while";
#
#    + o set é usado para fazer com que cada palavra (palavra aqui tem um
# sentido de conjunto de caracteres separados por aqueles definidos no
# IFS) vire um parâmetro posicional, conforme explicado em
# "2.4.2. set (para editar parâmetros posicionais)". A opção -- quer dizer
# "acabaram as opções, o que vier a partir daqui são os valores dos
# parâmetros de posição", esta opção serve para prevenir que alguma
# informação que comece com o caractere - seja considerado uma opção
# sendo passada para o set;
#
#    + No tópico "2.5. Substituição de Variáveis" você verá a explicação
# de se usar "FILE=${FILE:-.}/$1";
#
#    + Bom... acho que é isso. Leia o código, execute-o, faça testes,
# mude o código, execute-o novamente, veja o que mudou nos resultados,
# leia as manpages em caso de dúvidas... Enfim, use o método hacker de
# aprender a programar! ;-)
#
#
# Espero que curta!
# meleu <meleu@meleu.cjb.net>
#
# P.S.: Quer um "dever de casa"? Altere o código para que ele verifique
#	se já existe arquivos com o mesmo nome dos que estão prestes a
#	serem extraídos. Se existir, alertar o usuário sobre isso. Tente
#	também fazer meios de detecção dos possíveis erros que possam
#	ocorrer...
#	Ah, sei lá! Brinque com o código um pouco! =)
#

B="\e[1m"
N="\e[m"

[ $# -lt 1 ] && {
    echo -e "${B}Erro: falta parâmetros$N"
    echo "Uso: `basename $0` arquivo1 [arquivoN]"
    exit 1
}

[ -w . ] || {
    echo -e "${B}Erro: você não tem permissão de escrita neste diretório$N"
    exit 1
}


OldIFS="$IFS"
IFS=
cat $@ |
while read -r LINHA ; do
	IFS="$OldIFS"

	set -- $LINHA
	case "$1" in
	'<++>')
		TempIFS="$IFS"
		IFS=/
		set -- $2
		IFS="$TempIFS"
		while [ $# -gt 1 ]; do
		    FILE=${FILE:-.}/$1
		    [ -d $FILE ] || mkdir $FILE
		    shift
		done
		FILE="${FILE:-.}/$1"
		if echo -n 2>/dev/null > $FILE ; then
		    echo "* Extraindo $FILE"
		else
		    echo -e "$B--> houve um erro ao tentar extrair '$FILE'"
		    echo -e "    este arquivo será ignorado.$N"
		    unset FILE
		fi
		
	;;

	'<-->')
		unset FILE
	;;

	*)
		[ "$FILE" ] && {
		    IFS=
		    echo "$LINHA" >> $FILE
		}
	;;

	esac

done

echo "--> Fim <--"
