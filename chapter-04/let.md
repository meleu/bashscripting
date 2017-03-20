### let

   O let é um comando embutido no bash (e isto quer dizer que se você
quiser info sobre ele tem que ver na manpage do bash, mais
especificamente no tópico ARITHMETIC EVALUATION). Ele é bastante útil para
quem está acostumado com programação C, pois sua sintaxe é parecidíssima,
mas só é usado para expressões aritméticas.

   Com este comando você pode comparar valores numéricos com os sinais `<`, `>`, `<=`, `>=`, `==`, e `!=`. E mais bastante coisa comum em linguagem C (como por
exemplo o `++` e o `--`). Alguns exemplos do que você pode fazer:

```
let var++         # equivalente a "var=$[ $var + 1 ]"
let var--         # equivalente a "var=$[ $var - 1 ]"
let "$num > 2"    # equivalente a "[ $num -gt 2 ]"
```

   Outra coisa interessante é que você pode substituir

```
let "expressao"
```

por

```
(( expressao ))
```

Portanto os exemplos acima poderiam ser feitos assim:

```
(( var++ ))
(( var-- ))
(( $num > 2 ))
```

   Veja este script abaixo apenas para entender a utilidade do `let`:

{% codesnippet "./src/lettest.sh" %}{% endcodesnippet %}

