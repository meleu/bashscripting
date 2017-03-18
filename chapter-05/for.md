## for

O for funciona da seguinte forma:

    for variavel-indice in lista-de-argumentos; do
        <comandos que serão executados até que variavel-indice assuma
         todos os valores da lista-de-argumentos>
    done

A princípio você pode se sentir um pouco confuso com esse negócio de
"lista-de-argumentos", assim como eu também fiquei, mas até que é fácil
de entender. Funciona da seguinte forma: a variável usada como índice
recebe todos os valores usados na lista de argumentos só que um de cada
vez, quando não tiver mais argumentos o for acaba.

   Vamos a um exemplo pra você entender direito:

{% codesnippet "./src/forsample1.sh" %}{% endcodesnippet %}

   Pois é! É meio esquisito, eu concordo! Mas é o que nós temos. :)
Porém é raro a gente usar esta lista de argumentos deste jeito, passando
todos os parâmetros "na mão". Uma maneira mais prática é assim:

{% codesnippet "./src/forsample2.sh" %}{% endcodesnippet %}

   No exemplo acima, nós usamos no for os parâmetros passados na linha de
comando. Existe uma outra maneira que poderíamos ter usado para o mesmo
objetivo. Para isto basta omitirmos o "in lista-de-argumentos". Veja este
exemplo:

{% codesnippet "./src/minuscula.sh" %}{% endcodesnippet %}

   Agora para usarmos um for um pouco parecido com o das linguagens de
programação convencionais usamos um comandinho chamado "seq". Ele
funciona basicamente da seguinte forma:

```
$ seq 1 10
1
2
3
4
5
6
7
8
9
10

	# pode ser em ordem decrescente também:

$ seq 10 1
10
9
8
7
6
5
4
3
2
1
```

   Fácil não? Agora vejamos um exemplo:

{% codesnippet "./src/tabuada.sh" %}{% endcodesnippet %}

   Moleza! ;)


### "for" como na linguagem C

   Se você já é programador C, pode tirar proveito da sintaxe do let (já
explicado no ponto 4.1.2.). Para conferir isto basta pegar o script acima
(tabuada.sh) e trocar as linhas onde tem

    for OP in `seq 1 10`; do

por esta linha:

    for (( OP=1; OP <= 10; OP++ )); do

Só não pode esquecer dos ((dois parênteses)).

