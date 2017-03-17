#!/bin/bash
# redirecionamento.sh
echo "Isto vai para a saída padrão."
echo "Isto vai para a saída de erro padrão." 1>&2
echo "Isto vai criar um arquivo e colocar esta linha nele." > ARQUIVO
echo "Esta linha vai para o final do arquivo." >> ARQUIVO
