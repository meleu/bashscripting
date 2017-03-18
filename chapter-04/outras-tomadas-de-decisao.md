## Tomadas de decisão com && e ||

Esta maneira de tomar decisões é bem compacta, mas não aceita "else".
Eu, particularmente, prefiro usar esta estrutura quando vou fazer uma
tomada de decisão e não preciso de "else".

   A maneira de usar é:

    comando1 && comando2
    comando1 || comando2

O `&&` executa o primeiro comando e somente se este retornar 0 (não
ocorrer problemas) o segundo será executado.

O `||` executa o primeiro comando e somente se este retornar não-zero
(ocorrer problemas) o segundo será executado.

Veja um exemplo bem simples:

```
$ [ -d ~/tempdir ] || mkdir ~/tempdir
```

Como você deve estar lembrado, "[ -d ~/tempdir ]" é o mesmo que
"test -d ~/tempdir" e retornará 0 se existir o diretório ~/tempdir. Caso
não exista ele retornará 1, e neste caso o "mkdir ~/tempdir" será
executado.

Vejamos um parecido usando o &&:

```
$ [ -d ~/tempdir ] && ls -ld ~/tempdir
```

Não preciso explicar né?

Se você está se perguntando "Mas eu só vou poder usar um único
comando?!", a próxima seção lhe trará respostas...

### Listas

As listas de comandos servem para agrupar comandos (meio lógico, não?).
Podem ser representadas por (parenteses) ou {chaves}. A diferença é que
os (parenteses) executam os comandos numa shell a parte e as {chaves}
executam no shell atual.

Execute comando a seguir e tente entendê-lo (está certo... são vários
comandos, mas inicialmente é encarado com um comando só).

```
[ -d /usr/doc ] && {
echo "O diretorio existe"
echo "veja o seu conteudo"
cd /usr/doc
ls
}
```

   E observe que ao final da execução você estará no diretório /usr/doc,
o que comprova que com as {chaves} os comandos são executados no shell
atual, se você trocar as {chaves} por (parênteses) observará que o seu
diretório não se alterará.

FYI: para saber o diretório atual o comando a ser usado é o "pwd".

