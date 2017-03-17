#!/bin/bash

NAME=`whoami`

echo -e "\n\tCRIANDO O ARQUIVO arquivo.c\n"

# O arquivo.c terminará quando encontrar a string _EOF_
cat << _EOF_ > arquivo.c
#include <stdio.h>

int main (void) {
        printf ("\n\tPrograma que não faz nada além disso.\n");
        printf ("\tFeito por $NAME\n\n");
        return 0;
}
_EOF_
# O arquivo.c acabou na linha ACIMA do _EOF_
# Observe no arquivo.c o $NAME será "traduzido" para o username adequado

echo -e "\n\tCOMPILANDO O PROGRAMA\n"
gcc arquivo.c -o arquivo

echo -e "\n\tFEITO!\n"
