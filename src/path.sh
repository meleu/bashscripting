#!/bin/bash

IFS=':'

for item in $PATH ; do
	echo $item
done

