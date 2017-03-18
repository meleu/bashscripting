## echo

Nos já usamos o echo para escrever na tela, mas aqui vamos tratar de
alguns "segredinhos" (que não são tão secretos assim).

Existem alguns momentos que você não quer que a saída do echo pule de
linha automaticamente. Para isso use o parâmetro "-n". Este parâmetro é
útil quando você vai entrar com algo após o echo. Veja este script:

{% codesnippet "./src/filetype.sh" %}{% endcodesnippet %}

Execute e veja o resultado.


Muita atenção deve ser tomada ao usar o echo, pois as aspas que você
pode vir a deixar de usar podem fazer uma diferença danada (em alguns
casos isso pode ser muito útil).

```
$ echo uma    boa   rede de irc     que conheco eh     irc.linux.org
uma boa rede de irc que conheco eh irc.linux.org
$ echo "uma    boa   rede de irc     que conheco eh     irc.linux.org"
uma    boa   rede de irc     que conheco eh     irc.linux.org
$
$ # agora um exemplo com variavel
$
$ TESTE="primeira linha da variavel
> segunda linha
> terceira...
> chega! :)
> "
$ echo $TESTE
primeira linha da variavel segunda linha terceira... chega! :)
$ echo "$TESTE"
primeira linha da variavel
segunda linha
terceira...
chega! :)

```


   A esta altura você já deve ter se perguntado "Como faço para imprimir
caracteres nova linha ou beep?!". Os mais malandrinhos devem ter tentado um
contra-barra (backslash) '\', mas você não pode simplesmente fazer isso.
É necessário usar o parâmetro "-e" com o echo. Este parâmetro permite que
usemos sequências de escape contra-barra.
   As sequências são iguais a da linguagem C, exemplo: \n para nova
linha, \a para beep, \b para backspace, etc...
   Veja este exemplo:

```
$ echo -e "module caiu de cara tentando \"top soul\".\nQue paia\a"!
module caiu de cara tentando "top soul".
Que paia!
```

   O -e é também usado para escrever coloridinho (ai que fofo!), e outras
coisas interessantes. Veremos isso no tópico seguinte.



### Sequências de Escape ANSI

Para usar cores a sequência de escape é "\e[<NUM>m" (os sinais '<' e '>'
não entram!). Veja um exemplo (mais a frente você verá tabelas com os
significados destas sequências):

{% codesnippet "./src/amarelinho.sh" %}{% endcodesnippet %}

   Agora uma explicação ligeira: o \e diz ao echo que o que vem depois é
uma sequência de escape.

   Se você der a sequência '[<num>C', onde num é um número qualquer, o
cursor vai andar "num" caraceteres para a direita. Acima eu uso a variável
POSICAO para mover o cursor para o centro da linha (veja o cálculo no
código).

   O comando '[<num>m' muda para a cor "num". Cada cor tem um código
próprio. No exemplo acima o 33 faz ficar marrom, porém combinando com o 1
fica amarelo (isso no modo texto, pois no xterm, por exemplo, o 1 faz o
marrom ficar em negrito. veja OBSERVAÇÕES mais adiante).

   Veja uma tabela com os códigos de movimentação de cursor que eu conheço
(os caracteres '<' e '>' devem ser ignorados):

     ,-------------,------------------------------------------------,
     |   Código    |         O que faz                              |
     |-------------|------------------------------------------------|
     | \e[<N>A     | Move o cursor N linhas acima.                  |
     |-------------|------------------------------------------------|
     | \e[<N>B     | Move o cursor N linhas abaixo.                 |
     |-------------|------------------------------------------------|
     | \e[<N>C     | Move o cursor N colunas à direita.             |
     |-------------|------------------------------------------------|
     | \e[<N>D     | Move o cursor N colunas à esquerda.            |
     |-------------|------------------------------------------------|
     | \e[<N>E     | Move o cursor N linhas para baixo na coluna 1. |
     |-------------|------------------------------------------------|
     | \e[<N>F     | Move o cursor N linhas para cima na coluna 1.  |
     |-------------|------------------------------------------------|
     | \e[<N>G     | Coloca o cursor na linha N.                    |
     |-------------|------------------------------------------------|
     | \e[<L>;<C>H | Coloca o cursor na linha L e na coluna C.      |
     |-------------|------------------------------------------------|
     | \e[<N>I     | Move o cursor N tabulações à direita.          |
     |-------------|------------------------------------------------|
     |             | N=0  Apaga do cursor até o fim da tela;        |
     | \e[<N>J     | N=1  Apaga do cursor até o início da tela;     |
     |             | N=2  Apaga a tela toda.                        |
     |-------------|------------------------------------------------|
     |             | N=0  Apaga do cursor até fim da linha;         |
     | \e[<N>K     | N=1  Apaga do cursor até o início da linha;    |
     |             | N=2  Apaga a linha toda.                       |
     |-------------|------------------------------------------------|
     | \e[<N>L     | Adiciona N linhas em branco abaixo da atual.   |
     |-------------|------------------------------------------------|
     | \e[<N>M     | Apaga N linhas abaixo da atual.                |
     |-------------|------------------------------------------------|
     | \e[<N>P     | Apaga N caracteres a direita.                  |
     |-------------|------------------------------------------------|
     | \e[<N>S     | Move a tela N linhas para cima.                |
     |-------------|------------------------------------------------|
     | \e[<N>T     | Move a tela N linhas para baixo.               |
     |-------------|------------------------------------------------|
     | \e[<N>X     | Limpa N caracteres à direita (com espaços).    |
     |-------------|------------------------------------------------|
     | \e[<N>@     | Adiciona N espaços em branco.                  |
     |-------------|------------------------------------------------|
     | \e[s        | Salva a posição do cursor.                     |
     |-------------|------------------------------------------------|
     | \e[u        | Restaura a posição do cursor que foi salva.    |
     '-------------'------------------------------------------------'



   Sim, a lista é grande... Faça uns testes para praticar um pouquinho.

   Agora uma tabelinha dos atributos e seus números (N deve estar no
formato "\e[<N>m"):

     ,-----------------------------,----,-------------,---,
     | Atributo                    | N  | Cor         | X |
     |-----------------------------|----|-------------|---|
     | Desligar todos atributos    | 0  | Preto       | 0 |
     | Negrito                     | 1  | Vermelho    | 1 |
     | Cor X para o primeiro plano | 3X | Verde       | 2 |
     | Cor X para o segundo plano  | 4X | Marrom      | 3 |
     | Sublinhado                  | 4  | Azul        | 4 |
     | Piscando (blink)            | 5  | Roxo        | 5 |
     | Vídeo reverso               | 7  | Ciano       | 6 |
     |             -x-             | -- | Branco      | 7 |
     '-----------------------------'----'-------------'---'

**OBSERVAÇÕES:**
- Negrito, Sublinhado e Piscando possuem comportamentos diferentes no
console e nos emuladores de terminal. Principalmente quando temos negrito
sendo usado com cores.

 Por exemplo, o código "\e[33m" irá ativar o marrom
mas se for usado com o atributo de negrito ficará amarelo, e
o código será assim: "\e[1;33m". Por isso faça os testes que você descobrirá
as cores

- Estas tabelas eu fiz graças a uma matéria que o aurélio escreveu
sobre isso. Veja em http://verde666.org/coluna/

No tópico "6.1 Funções como comandos" você verá o Mfunctions, ele
contém uma função que mostra todas as combinações de cores possíveis.


