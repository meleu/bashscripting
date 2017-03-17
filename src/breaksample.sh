#!/bin/bash

# `true` sempre retorna verdadeiro
while true; do
	read -p "Tente adivinhar o número: " NUM
	[ "$NUM" -eq 666 ] && break
done

echo -e "\nVocê acertou! \n"
