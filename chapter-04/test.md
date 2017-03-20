### test

Para fazer testes mais arrojados usamos o comando `test`. A maneira
de usar o test muda de acordo com o que estamos querendo testar. Se estamos
comparando strings ou se estamos comparando números, e por aí vai... Existe
uma sintaxe para cada tipo de interpretação que queremos dar a um dado. Por
exemplo: `0001` é diferente da string `1` mas o valor numérico é igual.
E por isso usamos sintaxes diferentes, para que o comando saiba que tipo de
comparação estamos fazendo.

Continue lendo...


#### expressões com strings:

O sinal de `=` verifica se a primeira string é igual a segunda; o `!=`
verifica se a primeira string é diferente da segunda; o parâmetro `-z`
verifica se a string é vazia; e o parâmetro `-n` verifica se a string NÃO é
vazia.

```
$ test "abcd" = "abcd"; echo $?
0
$ test "abcd" != "abcd"; echo $?
1
$ test "abcd" = "efgh"; echo $?
1
$ test "abcd" != "efgh"; echo $?
0
$ test -z "meleu"; echo $?
1
$ test -n "meleu"; echo $?
0
$ test -n ""; echo $?
1
$ test -z ""; echo $?
0
```

Uma maneira mais prática de usar o `test` e subistituí-lo pelos
`[colchetes]`.  É muito mais prático e bonitinho :P

     $ test "meleu" = "$nome"

é o mesmo que fazer:
   
     $ [ "meleu" = "$nome" ]

Muito melhor, não acham?! Vamos usar esta notação a partir de agora!

Agora vamos a uma dica útil pra hora de fazer comparações entre
strings. Primeiro vamos a um exemplo e depois a uma explicação.

```
$ cat strcmp1.sh
#!/bin/bash

if [ $1 = $2 ]; then
        echo As strings são iguais.
fi

$ ./strcmp1.sh meleu
./strcmp.sh: [: meleu: unary operator expected
```

Note que o test deu um erro, e por isso retornou um não-zero para o `if`. Observe o seguinte:

```
$ cat strcmp2.sh
#!/bin/bash

if [ $1 = $2 ]; then
        echo As strings são iguais.
else
        echo As strings são diferentes.
fi

$ ./strcmp2.sh meleu
./strcmp.sh: [: meleu: unary operator expected
As strings são diferentes.
```

Aconteceu a mesma coisa que no primeiro exemplo, só que agora temos um
else pra ser executado caso a expressao do if retorne falso (ou
não-zero). Uma solução pra que não dê este erro no test é usar aspas
duplas. Veja só:

{% codesnippet "./src/strcmp.sh" %}{% endcodesnippet %}

Com este acontece tudo certo. ;)

Você também NÃO deve escrever tudo junto, assim: `$1=$2` ou `"$1"="$2"`
Desta maneira o test vai retornar sempre verdadeiro, pois seria como se
você estivesse passado somente um parâmetro para ele.


#### expressões com arquivos

O parâmetro `-e` verifica se é um arquivo regular; o `-d` verifica se é
um diretório; e o `-x` verifica se o arquivo é executável. Obviamente se
o arquivo não existir ocorrerá um erro.

```
$ [ -f /bin/ls ]; echo $?
0
$ [ -d /bin/ls ]; echo $?
1
$ [ -x /bin/ls ]; echo $?
0
```

Lógico que não existem só esses três! Consulte a página man do test
que você verá muitos outros parâmetros para expressões com arquivos.


#### expressões aritméticas

Aqui é bem diferente das linguagens de programação comuns... Não
podemos utilizar os operadores que estamos acostumados, como `=` para
igual, `<` para menor e assim por diante... Temos que utilizar outros
operadores (que não são tão difíceis de decorar). São eles:

operador | significado
--- | ---
`-eq` | igual (EQual);
`-ne` | diferente (Not-Equal);
`-lt` | menor que, "<" (Less Than);
`-le` | menor ou igual, "<=" (Less than or Equal);
`-gt` | maior que, ">" (Greater Than);
`-ge` | maior ou igual, ">=" (Greater than or Equal).

```
$ [ 2 -eq 2 ]; echo $?
0
$ [ $? -lt 5 ]; echo $?
0
$ [ 1 -le 1 ]; echo $?
0
$ [ 2 -ne 2 ]; echo $?
1
```

Dê uma olhadinha neste script (meio besta, é verdade) pra ver como é
diferente o valor numérico e o valor string de duas variáveis.

{% codesnippet "./src/string_number.sh" %}{% endcodesnippet %}

Aproveitando o assunto "números" aí vai uma informação útil:
Para fazer cálculos aritméticos podemos fazer o seguinte esquema

```
$ echo $[ 2 * 3 + 4 ]
10
$ echo $[ 2 * ( 3 + 4 ) ]
14
```

Basta colocar a expressão entre `$[cifrão-colchetes]`, sacou? Você
também pode usar `$((cifrão-dois-parênteses))` mas os colchetes são bem
mais práticos.

Se você pretende usar mais coisa relacionada a matemática, então
aprenda a usar o comando `bc` (via man page ou info). Mas se vai ficar só
no "papai-mamãe" das operações básicas pode ficar usando `$(())` ou `$[]`
(OBS.: em operações de divisão os resultados não são muito satisfatórios).


#### operadores lógicos (AND e OR)

Para usar os operadores lógicos basta usar `-a` para **AND** e `-o` para **OR**.
Muito simples. O exemplo a seguir usa o AND e também usa um novo tipo de
comando de controle, o `elif`, que é a mesma coisa que `else if`, só que
se você usar `else if` vai precisar de um `fi` para fechar. O `elif` não
precisa disso.

Preste atenção que é fácil de entender para quem tem noção de algoritmo:

{% codesnippet "./src/crescente.sh" %}{% endcodesnippet %}

O `-o` é no mesmo estilo. Faça uns testes e verá.
