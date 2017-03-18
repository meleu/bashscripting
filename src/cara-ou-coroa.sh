#!/bin/bash
# cara-ou-coroa.sh
# crédito do código: Matheus Alves - https://github.com/theuves

# se o número aleatório é par, temos "Cara", se for ímpar temos Coroa
[ $[ $RANDOM % 2 ] = 0 ] && echo "Cara" || echo "Coroa"
