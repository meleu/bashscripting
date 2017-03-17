#!/bin/bash
# string_number.sh
NUM1=1
NUM2=00001

if [ "$NUM1" = "$NUM2" ];
then
  echo "O valor string de $NUM1 e $NUM2 são iguais."
else
  echo "O valor string de $NUM1 e $NUM2 são diferentes."
fi

if [ $NUM1 -eq $NUM2 ];
then
  echo "O valor numérico de $NUM1 e $NUM2 são iguais."
else
  echo "O valor numérico de $NUM1 e $NUM2 são diferentes."
fi
