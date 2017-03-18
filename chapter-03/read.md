## read

   Como você viu no script anterior para entrar com um dado usa-se "read".
O read tem alguns "macetinhos". Pra começar: você não precisa colocar um
echo toda hora que for usar o read para escrever um prompt. Basta fazer
"read -p prompt variavel"

   Veja esta seção de exemplos:

{% codesnippet "./src/read1.sh" %}{% endcodesnippet %}

```
$ ./read1.sh
Entre com uma string: klogd eh um tremendo cachacero!
klogd eh um tremendo cachacero!
```

{% codesnippet "./src/read2.sh" %}{% endcodesnippet %}

```
$ ./read-2.sh
Entre com 3 strings: j00nix eh cabecudo
s1 = j00nix     s2 = eh     s3 = cabecudo

               # o mesmo script com mais de 3 strings #

$ ./read-2.sh
Entre com 3 strings: eSc2 adora ficar de copy'n'paste no IRC.
s1 = eSc2     s2 = adora     s3 = ficar de copy'n'paste no IRC.
```

   Quando o "read" vai ler apenas uma variável, toda a string vai ser
atribuída a esta variável. Quando vai ler mais de uma variável ele atribui
cada string a sua respectiva variável; e quando o número de strings excede
o número de variáveis a última fica com o excedente.

   O parâmetro "-s" serve para não ecoar o que for digitado. É útil para
digitar uma senha por exemplo. Tente "read -s PASS" e veja.

   Você também pode determinar o número de caracteres que serão lidos com
o parâmetro "-n". Tente fazer "read -n 10 VAR". Mas cuidado: ao usar a
opção -n você não poderá usar o backspace para fazer correções.

   A opção "-r" serve para que a contra-barra (backslash) não aja como um
caracter de escape. E isso me foi bastante útil para fazer o Mextract,
como você verá adiante.

   Mais sobre o read na manpage do bash.

