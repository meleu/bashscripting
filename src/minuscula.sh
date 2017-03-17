#!/bin/bash
# minuscula.sh
# renomeia arquivos que tenham nome em maiusculas para
# o equivalente em minusculas

[ $# -lt 1 ] && {
    echo "*** Erro: você precisa passar os arquivos que quer renomear"
    echo "Uso: Mminusculas arquivo1 [arquivoN]"
    exit
}

# repare que o for a seguir nao tem o "in lista-de-argumentos"!
for maiuscula
do
    [ -e "$maiuscula" ] || {
	echo "$maiuscula não existe, continuando com o próximo arquivo"
	continue
    }
    minuscula=$( echo $maiuscula | tr A-Z a-z )
    mv $maiuscula $minuscula
done
