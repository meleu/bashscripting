#!/bin/bash
# whilesample.sh
# Script que soma os números positivos que são dados e sai do programa
# quando é entrado -1.

RESULT=0
NUM=0
echo -e "\e[1mPara sair entre com '-1'.\e[m"
while [ $NUM -ne -1 ]; do
    echo -n "Número: "
    read NUM
    if [ $NUM -gt 0 ]; then
        let RESULT+=$NUM
        # para quem não conhece C: VAR1+=VAR2 é a mesma coisa que fazer
        #                          VAR1=$[ $VAR1 + $VAR2 ]
    fi
done
echo "Soma dos positivos: $RESULT"
exit 0
