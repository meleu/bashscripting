## getopts

Este comando serve para permitir que você use parâmetros na linha de
comando de maneira mais eficiente que ficar usando as variáveis de posição
de parâmetros ("$1", "$2"...). 

Sua sintaxe é:

    getopts 'CadeiaDeOpcoes' variavel

Onde "CadeiaDeOpcoes" consiste em cada caractere que o getopts
considerará, e "variavel" receberá este caractere. Para passar um
parâmetro para o script você usa '-c' onde 'c' é o parâmetro. Veja este
exemplo hipotético:

    getopts 'ab:c' variavel

Você poderá usar os parâmetros 'a', 'b' ou 'c'. Note que 'b' é seguido
de um ':', isso significa que 'b' é um parâmetro que precisa de
argumento. Este, por sua vez, é armazenado na variável OPTARG.

Mais detalhadamente, o getopts funciona assim (adaptado do "Teach
Yourself Shell Programming in 24 Hours", veja Referências):

1. O getopts examina todos os argumentos da linha de comando
procurando por argumentos que comecem com o caractere '-'.

2. Quando acha um argumento começado com '-' o getopts procura
em "CadeiaDeOpcoes" se tem algum caractere que combine.

3. Se combinar com algum, "variavel" receberá este caractere,
caso contrário "variavel" receberá '?'.

4. Os passos 1-3 são repetidos até que todos os argumentos da
linha de comando tenham sido lidos.

5. Quando acaba de ler todos os argumentos da linha de comando
getops retorna um valor falso (não-zero). Isto é útil para
verificações em loops (como veremos no exemplo abaixo).


Hmmm... Confuso? Numa primeira olhada é confuso mesmo, é muita
informação de uma vez só. Portanto dê uma olhada no exemplo a seguir,
execute-o e depois releia este tópico. Não se esqueça de fazer o mais
importante: praticar!


{% codesnippet "./src/getopts.sh" %}{% endcodesnippet %}

Execute este código e tire suas próprias conclusões.

Você pode ver mais um script que usa getopts no tópico "Exemplos Variados".

