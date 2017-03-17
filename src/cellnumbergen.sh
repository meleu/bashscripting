#!/bin/bash

NUM="98$(echo $RANDOM)0"
CONT=$(echo -n $NUM | wc -c)	# quantos digitos tem?

while [ $CONT -lt 8 ]; do	# se nao tiver 8 digitos acrescenta 0's
	NUM=${NUM}0
	CONT=$(echo -n $NUM | wc -c)
done

echo $NUM
