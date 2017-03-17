#!/bin/bash
# path.sh

IFS=':'

for item in $PATH ; do
	echo $item
done

