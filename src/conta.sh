#!/bin/bash

function Mecho {
        echo -e "\e[1m$*\e[m"
}

# ATENÇÃO AQUI: o prompt que o select mostra é controlado pela
#               variável PS3. E todas aqueles comentários sobre
#               o PS1 feitas no tópico 2.2. valem aqui também.
PS3="Opção: "

echo -n "Entre com o primeiro número: "
read NUM1
echo -n "Entre com o segundo número: "
read NUM2

OPCOES="adicao subtracao multiplicacao divisao sair"

select opc in $OPCOES; do
    if [ "$opc" = adicao ]; then
	Mecho "$NUM1 + $NUM2 = $[ $NUM1 + $NUM2 ]"
    elif [ "$opc" = subtracao ]; then
	Mecho "$NUM1 - $NUM2 = $[ $NUM1 - $NUM2 ]"
    elif [ "$opc" = multiplicacao ]; then
	Mecho "$NUM1 * $NUM2 = $[ $NUM1 * $NUM2 ]"
    elif [ "$opc" = divisao ]; then
	Mecho "$NUM1 / $NUM2 = `echo "scale=2;$NUM1/$NUM2" | bc -l`"
    elif [ "$opc" = sair ]; then
	Mecho "Tchau! "
	exit
    else
	Mecho "Opção inválida! "
    fi
done

