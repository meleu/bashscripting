#!/bin/bash

CONT=10
until [ $CONT -eq 0 ]; do
        echo -ne "$CONT\t"
        let CONT--
done
echo
