## Parâmetros

Podemos passar parâmetros para o shell script assim como na maioria
dos programas. Os parâmetros são variáveis, digamos, especiais. Para
começar elas não obedecem as regras de nomeclatura de variáveis, pois
elas usam números; e também nós não podemos mudar o valor destas
variáveis pelas vias "tradicionais", para mudar o valor destas nós temos
que contar com a ajuda do shift e/ou do set (como veremos adiante).

Veja esta relação:

parametro | significado
--- | ---
`$0`              | é o nome do shell script (a.k.a. parâmetro zero);
`$1 a $9`         | $1 é o primeiro parâmetro, $9 o nono, e assim por diante;
`${10}, ${11}...` | quando o número do parâmetro possui mais de um dígito é necessário o uso das chaves;
`$*`              | todos os parâmetros em uma única string (exceto o $0);
`$@`              | todos os parâmetros, cada um em strings separadas (exceto $0);
`$#`              | número de parâmetros (sem contar com o $0).

                  Outros:

     `$?`                  valor de retorno do último comando
                         (explicado mais adiante);

     `$$`                  PID do script.

Pra ficar mais claro, nada melhor do que um exemplo:

{% codesnippet "./src/parametros.sh" %}{% endcodesnippet %}

```
$ ./parametros.sh a b c d e f g h i j l m n o p q r s t u v x z
Nome do script: parametros.sh
Número total de parâmetros: 23
Primeiro parâmetro: a
Segundo parâmetro: b
Décimo quinto parâmetro: p
Todos os parâmetros: a b c d e f g h i j l m n o p q r s t u v x z
```


Se você não entendeu direito a diferença entre o $* e o $@, então dê
uma olhada no seguinte script (se não entendê-lo tudo bem, siga em frente
e quando aprender sobre o "if" e o "for" leia-o novamente):

{% codesnippet "./src/testargs.sh" %}{% endcodesnippet %}



### shift

O bash possui um comando embutido que lida com parâmetros, o shift.
Quando você usa o shift sai o primeiro parâmetro da lista e o segundo vai
para $1 o terceiro vai para $2, e assim por diante. Você pode ainda
especificar quantas "casas" você quer que os parâmetros "andem" à
esquerda através de "shift n" onde 'n' é o número de casas, mas se o
número de casas que ele deve andar for maior que o número de parâmetros
o shift não é executado.

Veja este exemplo:

{% codesnippet "./src/shift-exemplo.sh" %}{% endcodesnippet %}

```
$ ./shift-exemplo.sh 1 2 3 4 5 6 7 8 9 0
10: 1 2 3 4 5 6 7 8 9 0
executando "shift"
9: 2 3 4 5 6 7 8 9 0
executando "shift 5"
4: 7 8 9 0
executando "shift 7"
4: 7 8 9 0
```

Os valores que saem são perdidos. Use com atenção!


### set (para editar parâmetros)

O que vou passar neste tópico não é sobre como usar "todo o poder do
comando set", e sim como usar set especificamente para editar parâmetros.
Não tem nenhum segredo! Veja este exemplo:

set um dois tres

Isso fará com que $1 seja 'um', $2 seja 'dois', $3 seja 'tres' e só!
Não existirá $4, $5, etc. mesmo que eles tenham sido usados. Veja um
exemplo de script:

{% codesnippet "./src/setparam.sh" %}{% endcodesnippet %}

Não interessa quantos parâmetros você passar para este script, no
final você só terá $1, $2 e $3 valendo 'um', 'dois' e 'tres',
respectivamente.

No meu Mextract.sh (tópico 9.5.) esta característica do set é muito
bem aproveitada! ;-)



