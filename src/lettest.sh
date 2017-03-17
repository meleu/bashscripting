#!/bin/bash

if (( $# != 2 )) ; then    # poderia ser: if let "$# != 2"
        echo "Uso: `basename $0` N1 N2" 1>&2
        exit 1
fi

if (( $1 > $2 )) ; then    # poderia ser: if let "$1 > $2"
        echo "$1 é maior que $2"
elif (( $1 == $2 )) ; then    # poderia ser: elif let "$1 == $2"
        echo "$1 é igual a $2"
else
        echo "$1 é menor que $2"
fi
