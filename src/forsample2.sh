#!/bin/bash
# forsample2.sh

if [ $# -lt 1 ]; then
        echo "Uso: `basename $0` comando1 [comando2 [comandoN...]]" 1>&2
        exit 1
fi

for VAR in $@; do
        which $VAR
done
