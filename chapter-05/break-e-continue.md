## break e continue

Estes comandos são úteis quando usamos loops.


### break

Quebra a execução do loop. Para entender nada melhor que um exemplo:

{% codesnippet "./src/breaksample.sh" %}{% endcodesnippet %}

O que o break faz é pular a sequência de execução do script para o
que vier depois do "done". Ele também aceita argumento, da seguinte
forma: "break n", onde 'n' é um número inteiro que indica quantos
"done's" pular.


### continue

O continue interrompe o loop e faz novamente o teste do comando que
está controlando o loop (for, while, etc.). Veja este exemplo:

{% codesnippet "./src/concatenar.sh" %}{% endcodesnippet %}

O que o continue faz é voltar lá para antes do "do" pra fazer o teste
novamente. Ele também aceita argumento no estilo "continue n" para
indicar quantos "do's" voltar.

