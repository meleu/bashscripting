##  Variáveis do Usuário

As variáveis do usuário são as variáveis que você pode declarar, ler,
inicializar e modificar. No exemplo abaixo nós criamos uma variável
chamada `nome` e atribuímos a ela o valor `Meleu`. Veja:

    [prompt]$ nome=Meleu

Não pode haver espaços nem antes nem depois do sinal de `=`. Se você
quiser atribuir um valor que contenha espaços é necessário usar as
`'aspas simples'`. Veja:

     [prompt]$ nome='Meleu nao eh meleca!'

Agora para usar a variável é só você colocar um cifrão `$` antes do
nome dela. Olhe um exemplo com e sem o `$`:

```
[prompt]$ echo nome
nome
[prompt]$ echo $nome
Meleu não eh meleca!
```

Existe diferença entre usar `'aspas simples'`, `"aspas duplas"`, <code>&grave;crases&grave;</code> e
não usar nada.  Veja isto:

```
[prompt]$ caminho='O meu path eh: $PATH'
[prompt]$ echo $caminho
O meu path eh: $PATH

[prompt]$ caminho="O meu path eh: $PATH"
[prompt]$ echo $caminho
O meu path eh: /usr/local/bin:/usr/bin:/bin:/usr/X11R6/bin:/usr/openwin/bin

[prompt]$ teste=isso nao eh valido
bash: nao: command not found

[prompt]$ teste=mas_isso_eh_valido
[prompt]$ echo $teste
mas_isso_eh_valido

[prompt]$ teste=`ls $HOME`
[prompt]$ echo $teste
GNUstep/ progs/ textos/

[prompt]$ conteudo_dir="Meu diretorio home contem: `ls $HOME`"
[prompt]$ echo $conteudo_dir
Meu diretorio home contem: GNUstep/ progs/ textos/

```

   Os mais espertos já perceberam as diferenças... mas para os mais
lerdinhos (como eu) aí vai uma explicação.

- `'aspas simples'`: atribuem o conteúdo exato do que está escrito entre as
aspas simples à uma variável.

- `"aspas duplas"`: atribuem a string que está entre as aspas duplas, bem
como valor das variáveis que porventura podem estar entre elas (como no
segundo exemplo acima, onde usamos a variável `$PATH`).

- nada: similar as aspas duplas, porém ignora espaços excedentes.

- <code>&grave;crases&grave;</code>: atribuem a **saída do comando** que está entre elas,
tem a capacidade de ver o conteúdo de uma variável
(no último exemplo acima, onde usamos <code>&grave;ls $HOME&grave;</code>);


Podemos usar `$(cifrão-parênteses)` no lugar das crases, mas por uma questão de
clareza de código, recomenda-se fortemente que se use `$(cifrão-parênteses)`
no lugar de <code>&grave;crases&grave;</code>. Veja alguns exemplos:

```
[prompt]$ dir_atual=$(pwd)
[prompt]$ echo $dir_atual
/home/meleu

[prompt]$ echo $(ls $HOME)
GNUstep/ progs/ textos/

[prompt]$ tar czvf backup_$(date +%d-%m-%Y).tgz arquivo
```

Outra coisa interessante é o uso das `{chaves}`. Você pode usar as chaves
para exibir uma variável (ex.: `echo ${teste}`), isso é útil quando você
precisa separar a variável do que vem depois dela. Veja isto:

```
[prompt]$ name=coracao
[prompt]$ echo ${name}deleao
coracaodeleao
```


Como eu disse anteriormente, quando executamos um shell script ele usa
outra instância do shell, portanto toda variável criada/inicializada antes
de você invocar o script não estará acessível pelo script. No entanto
você pode tornar sua variável acessível usando o comando `export`. Veja
a sequência de comandos a seguir e você entenderá a utilidade do `export`:

```
[prompt]$ cat teste.sh 
#!/bin/bash

echo "$VAR"

[prompt]$ ./teste.sh 

[prompt]$ VAR=testando
[prompt]$ ./teste.sh                                                            


[prompt]$ export VAR='Um abraco para os gajos de Portugal! :)'
[prompt]$ ./teste.sh
Um abraco para os gajos de Portugal! :)
[prompt]$ export VAR='--> mudei a variavel <--'
[prompt]$ ./teste.sh
--> mudei a variavel <--
```



### Variáveis Array

   Também conhecidas como vetores. Este tipo de variável serve para se
armazenar vários valores sob um nome e um índice. A maneira de declarar
variáveis array é a seguinte:

    NomeDaVariavel[Indice]=Valor

sendo que `Indice` deve ser necessariamente um valor inteiro.

Imaginemos que EvilLord queira armazenar uma lista de suas frutas
favoritas em uma variável array. Para isso ele faria o seguinte:

```
[prompt]$ FRUTA[0]=goiaba
[prompt]$ FRUTA[1]=manga
[prompt]$ FRUTA[2]=pera
[prompt]$ FRUTA[3]=laranja
```

   Supondo que ele colocou esta lista em ordem decrescente de gosto, para
sabermos qual é a sua fruta favorita basta digitarmos:

    [prompt]$ echo ${FRUTA[0]}

Bacana não acham?

Agora vejamos uma coisa interessante. Se eu declarar uma variável assim:

    [prompt]$ FRUTA=goiaba

e depois quiser transformar esta variável num array com o nome FRUTA eu posso fazer assim:

    [prompt]$ FRUTA[1]=manga

Desta maneira `goiaba` fica armazenada em `FRUTA[0]` e `manga`, em `FRUTA[1]`.   

Outra coisa interessante é que podemos declarar um array inteiro numa
única linha de comando. Para isto usamos a sintaxe:

    NomeDoArray=(valor1 valor2 ... valorn)

Desta maneira o EvilLord economizaria teclado (?!) digitando isto:

    [prompt]$ FRUTA=(goiaba manga pera laranja)

E para vermos toda a lista de uma vez só, podemos usar o seguinte comando:

    [prompt]$ echo ${FRUTA[*]}

ou então:

    [prompt]$ echo ${FRUTA[@]}

Existem várias outras especificações para arrays mas quero passar aqui
só o básico. E se você precisar usar arrays de maneira mais complexa que
isso, procure a documentação oficial do bash.
