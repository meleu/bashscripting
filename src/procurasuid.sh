#!/bin/bash
# procurasuid.sh
# script para procurar arquivos suid que pertençam a determinado usuário
find / -user $1 -perm -4000 2> /dev/null
