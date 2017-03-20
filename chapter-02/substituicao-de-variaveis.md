## Substituição de Variáveis

Isto é muito útil e pode ser muito mais elegante que ficar usando if's
(explicados mais adiante) sem necessidade! Veja que bacana! ;-)


### `${variavel:-string}`

Se "variavel" não tiver sido definida ou for vazia será substituída por
"string". O valor da variável não é alterado. Veja este exemplo:

```
$ echo ${URL:-"http://unsekurity.virtualave.net"}
http://unsekurity.virtualave.net
$ echo $URL # observe que URL nao foi alterado

```


### `${variavel:=string}`

Se "variavel" não estiver sido definida ou for vazia, receberá
"string". Exemplo:

```
$ echo ${WWW:="http://meleu.da.ru"}
http://meleu.da.ru
$ echo $WWW
http://meleu.da.ru
```


### `${variavel:?string}`

Se "variavel" não estiver sido definido ou for vazia, "string" será
escrito em stderr (saída de erro padrão). O valor da variável não é
alterado. Veja um exemplo:

```
$ echo ${EDITOR:?"Nenhum editor de texto"}
bash: EDITOR: Nenhum editor de texto
$ echo $EDITOR

```


### `${variavel:+string}`

Se "variavel" estiver definida, será substituída por "string" mas seu
valor não será alterado. Exemplo:

```
$ echo ${BROWSER:+"BROWSER definido como \"$BROWSER\""}
BROWSER definido como "links"
```
