#!/bin/bash
# inseretxt.sh
#
# Muitas vezes durante a escrita do texto
# "Programação em Bourne-Again Shell" eu precisava
# inserir um código de um script numa determinada
# posição do arquivo e esta posição ficava entre
# muito texto antes e depois dessa linha.
# Para fazer isso de uma maneira mais cômoda, eu
# escrevi este script.
#
# Para informações sobre o uso tente o parâmetro '-h' ou
# '--help'.
# Se você passar como o parâmetro "linha" um número maior
# que o de linhas total do "ArqOriginal" os "arquivosN"
# serão inseridos no final do "ArqOriginal".
#
# Ah! Lembre-se de uma coisa: "linha" precisa ser um
# inteiro positivo. E lembre-se de mais uma coisa: 0
# não é um número positivo. ;-)
#
# meleu.
#


B="\e[1m"
N="\e[m"
USO="Uso: `basename $0` linha ArqOriginal arquivo1 [arquivoN ...]"
AJUDA="Tente \"`basename $0` --help\" para ajuda"

[ "$1" = '-h' -o "$1" = '--help' ] && {
    echo -e "
${B}Insere o conteúdo de arquivo(s) dentro de um outro.$N

$USO

Onde:
\"linha\"       é a linha onde o texto será inserido
\"ArqOriginal\" é o arquivo que receberá os textos 
\"arquivoN\"    são os arquivos que serão inseridos em ArqOriginal
"
    exit
}

[ $# -lt 3 ] && {
    echo -e ${B}Erro: erro na passagem de parâmetros$N
    echo $USO
    echo $AJUDA
    exit -1
}

Linha=$1
# verificando se $Linha é um número inteiro positivo
[ `expr $Linha - 1 2>/dev/null` -ge 0 ] 2>/dev/null || {
    echo -e ${B}Erro: O primeiro parâmetro precisa ser inteiro positivo$N
    echo $AJUDA
    exit 1
}

ArqOriginal=$2
[ -f $ArqOriginal ] || {
    echo -e ${B}Erro: \"$ArqOriginal\" não existe ou não é um arquivo regular$N
    echo $AJUDA
    exit 2
}


function ApagarSair {
    rm "$1"
    exit $2
}


shift 2
Temp=/tmp/`basename $ArqOriginal`-$$.tmp

# --> início do arquivo original:
head -$[$Linha-1] $ArqOriginal > $Temp

# --> arquivos que serão inseridos:
ContaAcerto=0
for Arq in "$@"; do
    [ -f "$Arq" ] || {
	echo -e ${B}OBS.: \"$Arq\" não existe ou não é um arquivo regular$N
	continue
    }
    cat $Arq >> $Temp
    (( ContaAcerto++ ))
done
[ $ContaAcerto -eq 0 ] && {
    echo -e ${B}Nenhum arquivo foi inserido em \"$ArqOriginal\"$N
    ApagarSair $Temp 3
}
echo

# --> pra terminar, final do arquivo original:
sed -n "$Linha,\$p" $ArqOriginal >> $Temp


ArqFinal="$ArqOriginal.new"
[ -e $ArqFinal ] && {
    echo -e ${B}Já existe um arquivo chamado \"$ArqFinal\".$N
    read -n 1 -p "Deseja sobregravá-lo? (s/N) " SN
    echo
    [ "$SN" != 'S' -a "$SN" != 's' ] && {
	echo -e "$B\nOperação cancelada!$N"
	ApagarSair $Temp 3
    }
}

cat $Temp > $ArqFinal

echo -e "
${B}Operação concluída com sucesso.$N
Confira em \"$ArqFinal\"
"

ApagarSair $Temp

