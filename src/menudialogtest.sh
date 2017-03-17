#!/bin/bash

FILE=/tmp/script-$$

dialog --title "Teste fuleiro da caixa de diálogo \"menu\"" \
  --menu "Qual comando você deseja executar?" 0 0 0 \
  "pwd" "mostra o diretório atual" \
  "ps aux" "lista os processos que estão sendo executados" \
  "uname -a" "exibe informações sobre o SO e a máquina local" \
  "users" "lista os usuários que estão logados no momento" 2> $FILE

# Lembre-se que o item escolhido será impresso em stderr. E repare
# acima que eu estou redirecionando stderr para um arquivo.

RET_VAL=$?
[ $RET_VAL -eq 0 ] || { echo "Operação cancelada."; exit 1; }

sh $FILE

rm $FILE
