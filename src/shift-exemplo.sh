#!/bin/bash
# shift-example.sh

echo "$#: $*"
echo -e "executando \"shift\""
shift
echo "$#: $*"
echo -e "executando \"shift 5\""
shift 5
echo "$#: $*"
echo -e "executando \"shift 7\""
shift 7
echo "$#: $*"
