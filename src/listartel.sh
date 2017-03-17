#!/bin/bash
# listartel.sh

TempFile=/tmp/TEMP-$$

# o egrep abaixo vai mostrar o arquivo agenda.tel
# sem exibir as linhas que comecem com um caractere '#'
# (considerado comentário) e sem mostrar linhas vazias.
# redirecionando a saída para $TempFile
egrep -v "^#|^ *$" agenda.tel > $TempFile

while read NOME PRE TEL ; do
	echo -e "Tel de $NOME: ($PRE)$TEL"
done < $TempFile
# esse redirecionamento faz com o que o "read" lá no while
# leia linha por linha do arquivo $TempFile

rm $TempFile
