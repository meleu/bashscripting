## Substituição de Variáveis

Isto é muito útil e pode ser muito mais elegante que ficar usando if's
(explicados mais adiante) sem necessidade! Veja que bacana! ;-)

**Obs**: um guia mais completo deste recurso pode ser encontrado no capítulo de "Parameter Substitution" do [Advanced Bash-Scripting Guide](http://www.tldp.org/LDP/abs/html/index.html).


### `${variavel:-string}`

Imprime o conteúdo de `variavel`, mas se `variavel` não tiver sido definida ou for vazia, a expressão será substituída por
`string`. O valor da variável não é alterado. Veja este exemplo:

```
$ echo $URL

$ echo ${URL:-"http://mywiki.wooledge.org/BashFAQ"}
http://mywiki.wooledge.org/BashFAQ
$ echo $URL       # observe que a variável não foi alterada

$
```


### `${variavel:=string}`

Imprime o conteúdo de `variável`, mas se `variavel` não estiver sido definida ou for vazia, a expressão será substituída por `string` **e também** a variável receberá `string`. Exemplo:

```
$ echo $blog

$ echo ${blog:="http://meleu.github.io/blog/"}
http://meleu.github.io/blog/
$ echo $blog
http://meleu.github.io/blog/
```


### `${variavel:?string}`

Imprime o conteúdo de `variavel`, mas se `variavel` não estiver sido definida ou for vazia, `string` será
escrito em stderr (saída de erro padrão). O valor da variável não é
alterado. Veja um exemplo:

```
$ echo ${EDITOR:?"Nenhum editor de texto"}
bash: EDITOR: Nenhum editor de texto
$ echo $EDITOR

```


### `${variavel:+string}`

Imprime o conteúdo de `variavel`, mas se `variavel` estiver definida, será substituída por `string` mas seu
valor não será alterado. Exemplo:

```
$ echo ${BROWSER:+"BROWSER definido como \"$BROWSER\""}
BROWSER definido como "links"
```
