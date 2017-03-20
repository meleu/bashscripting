## if-then-else e afins

A estrutura básica é a seguinte:

    if <expressão>; then
      <instrução(ões) se expressão retornar verdadeiro>
    else
      <instrução(ões) se expressão retornar falso>
    fi

Primeiro devemos saber que todos os comandos do UNIX possuem um código de
retorno. Este código tem valor 0 quando a operação ocorre com sucesso e
valor diferente de zero quando a operação NÃO termina com sucesso. Após
cada comando o valor de retorno é gravado na variável $?, experimente um
"echo $?" depois de algum comando e veja!

   A avaliação de verdadeiro do bash é exatamente o oposto de outras
linguagens de programação (C por exemplo), que avaliam a expressão de
retorno diferente de 0 como verdadeira e 0 como falso. No bash, quando um
comando retorna 0 o if avalia como verdadeiro e quando retorna um
não-zero significa falso. (Para mais detalhes sobre os códigos de
retorno, olhe a página manual do bash na seção "EXIT STATUS").

   Veja um exemplo:

{% codesnippet "./src/return.sh" %}{% endcodesnippet %}

```
meleu:~$ ./return.sh
Entre com o nome do diretório: /usr
'cd /usr' retornou "sucesso" (0)

meleu:~$ ./return.sh
Entre com o nome do diretório: dir_invalido
'cd dir_invalido' retornou "insucesso" (1)
```

O valor de retorno do comando `cd /usr` foi 0 portanto foi executado
com sucesso, já o retorno de `cd /dir_invalido` foi 1 porque ocorreu um
erro. Agora repare no final que mesmo com um `cd /usr` continuo no
diretório `HOME` (`~`). Isto prova que um shell script usa um shell a parte
(shell "filho") e não o shell que chama o script (shell pai).
(Chato ficar lendo isso toda hora né? Esta foi a última vez! :P)
