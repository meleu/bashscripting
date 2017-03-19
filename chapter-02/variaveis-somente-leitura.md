## Variáveis Somente-Leitura

Como sabemos as variáveis podem ter seu valor modificado pelo usuário,
mas se nós quisermos variáveis que NÃO possam ter seus valores alterados
basta declararmos tal variável como somente-leitura. Para tornar uma
variável read-only podemos usar o comando `readonly` ou então
`declare -r`.

Veja os exemplos a seguir, ambos possuem o mesmo resultado:

```
$ readonly NOME="Meleu Zord"
$ echo $NOME
Meleu Zord
```

é equivlente à

```
$ declare -r NOME="Meleu Zord"
$ echo $NOME
Meleu Zord
```

   Agora só pra ter certeza:

```
$ NOME=Fulano
bash: NOME: readonly variable
$ echo $NOME
Meleu Zord
```

   Um bom uso deste tipo de variável é para garantir que variáveis
importantes de um determinado script não possam ser sobregravadas,
evitando assim algum resultado crítico.

   O comando `readonly` quando usado sem parâmetros (ou o comando `declare`
apenas com o parâmetro `-r`) nos mostra todas as variáveis declaradas como
somente-leitura. No exemplo a seguir se for usado `declare -r` no lugar de
`readonly` teríamos a mesma saída.

```
$ readonly
declare -ar BASH_VERSINFO='([0]="2" [1]="05" [2]="0" [3]="1" [4]="release"
[5]="i386-slackware-linux-gnu")'
declare -ir EUID="1005"
declare -ir PPID="1"
declare -r
SHELLOPTS="braceexpand:hashall:histexpand:monitor:ignoreeof:interactive-comments:emacs"
declare -ir UID="1005"
```

Existem várias variáveis somente-leitura que são inicializadas pelo
shell, como `USER`, `UID`.

   TODAS as variáveis readonly uma vez declaradas não podem ser "unsetadas"
ou ter seus valores modificado. O único meio de apagar as variáveis
readonly declaradas pelo usuário é saindo do shell (logout).
