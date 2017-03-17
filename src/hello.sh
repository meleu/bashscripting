#!/bin/bash
# hello.sh
# "Hello World" usado para ilustrar o uso de funções.

function quit {
    echo -e "\e[1;32mTCHAU!\e[m"
    exit
}

function e {
    echo -e "\e[1;35m$1\e[m"
}

e Hello
e World
quit
echo "Isso aqui não será impresso"
