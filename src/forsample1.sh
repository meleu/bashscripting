#!/bin/bash
# forsample1.sh
# Exemplo (sem muita utilidade) do uso do comando "for"

echo "Mostra o caminho inteiro de alguns comandos"
for VAR in ls bc grep sed awk; do
        which $VAR
done
