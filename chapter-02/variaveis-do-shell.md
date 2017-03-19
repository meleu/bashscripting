## Variáveis do Shell {#variaveis-do-shell}

   Existem variáveis que o shell usa constantemente para um melhor
funcionamento. O próprio shell inicializa algumas destas variáveis, que
podem ser lidas e alteradas pelo usuário, estas são conhecidas como
variáveis do shell. Servem para determinar qual é o seu diretório home, em
qual diretório o shell vai procurar por comandos que você digitar, seu
prompt...  enfim... um bocado de coisas. Você pode atribuir novos valores
para estas variáveis (uma boa é fazer isso no seu `~/.bashrc` ou
`~/.bash_profile`).

   Vamos ver algumas destas variáveis mais importantes e suas respectivas
funções.


### `HOME`

   Esta variável tem um nome bem descritivo não acham? Bem... como nós já
sabemos, o nosso diretório home é o diretório em que "caímos" assim que
nos logamos (sabemos também que esta informação se encontra em
`/etc/passwd`). Quando você se loga no sistema o bash pega o nome do
diretório que você está e o atribui à variável `HOME`.

   Você já deve ter percebido que quando você dá um `cd` sem nenhum
argumento você vai para o seu diretório home. Pois o que o cd faz é o
mesmo que `cd $HOME`. Se você alterar o valor de `HOME`, quando você
digitar `cd` sem nenhum argumento o bash vai tentar te levar para o `$HOME`.
Veja:

```
meleu:/usr/doc$ echo $HOME
/home/meleu
meleu:/usr/doc$ cd
meleu:~$ pwd
/home/meleu
meleu:~$ HOME=/tmp
meleu:/home/meleu$ cd
meleu:~$ pwd
/tmp
meleu:~$ HOME=lalala
meleu:/tmp$ cd
bash: cd: lalala: No such file or directory
```

   Você também já deve ter reparado que quando estamos no nosso home
aparece um til `~` logo antes do prompt. Observe este detalhe no exemplo
acima. ;) 


### `PATH`

Esta variável armazena o caminho (path) que o shell irá percorrer para
procurar um comando digitado pelo usuário. Exemplo:

```
meleu@meleu:/tmp$ echo $PATH
/usr/local/bin:/usr/bin:/bin:/usr/X11R6/bin:/usr/games:/usr/share/texmf/bin
```

Portanto se eu digitar um `ls` o shell irá procurar por esse comando em
`/usr/local/bin` depois em `/usr/bin` e vai seguindo a lista até encontrar o comando ou chegar ao final da lista. Se o comando não estiver em nenhum dos diretórios do `PATH`, obtemos a famos mensagem *command not found*.

Esta variável algumas vezes pode ser usada no hacking! Imagine que
um programador inexperiente tenha feito um programa suid que usa a função
system() (ou qualquer outra função que sirva para executar um comando
externo), e nesta função ele não usa o caminho completo do programa, e
sim apenas o nome do 
programa, supondo que o programa está no seu PATH
normal. Você pode alterar o PATH e executar um outro programa de sua
preferência.

Vamos supor que o cara use:

    system ("date");

no lugar de:

    system("/bin/date");

   Aí você faz um programa ou um shell script e nomeia ele como `date`.
Agora é só alterar o `PATH` para que procure primeiro no diretório onde
você salvou o SEU date, e então executar o programa suid feito pelo
incompetente programador. Faça uns testes aí que você vai me
entender melhor.

Esta situação é bem difícil de se encontrar hoje em dia, resolvi
colocar aqui por questões históricas.


### `PS1`

   Esta é a "Prompt String 1" ou "Primary Prompt String". Nada mais é do
que o prompt que nos mostra que o shell está esperando um comando. Quando
você muda `PS1` você muda a aparencia do prompt. Na minha máquina o padrão é
`'\u@\h:\w\$ '` onde `\u` significa o nome do usuario, `\h` significa o nome do
host e `\w` é o diretório atual, o que dá a seguinte aparência:

```
meleu@meleu:/usr/doc/Linux-HOWTOs$
```

Veja algumas possibilidades (na man page do bash tem mais):


caracter | o que faz:
-------- | ----------
\d | mostra a data atual
\h | mostra o hostname
\s | o nome do shell
\t | a hora atual (no estilo 24 horas)
\T | a hora atual (no estilo 12 horas)
\u | nome do usuário que está usando o shell
\w | nome do diretório atual (caminho todo)
\W ! nome do diretório atual (somente o nome do diretório)


   Para aprender a fazer um monte de gracinhas com o `PS1` dê uma lida no
Bash-Prompt-HOWTO (ver {{ book.referencias }}).


### `PS2`

   Esta é a "Secondary Prompt String". É usada quando um comando usa mais
de uma linha. Por exemplo:

```
$ echo m\
> e\
> l\
> e\
> u
meleu
$ echo 'm
> e
> l
> e
> u'
m
e
l
e
u
```

   Este sinal `> ` (maior-espaço) é o `PS2`. Você pode usar os mesmos
caracteres especiais que o `PS1` usa.


### `MAIL`

   Nada mais é do que o arquivo onde são guardados seus emails. Aqui na
minha máquina eu uso o sendmail como servidor de email, portanto:

```
meleu@meleu:~$ echo $MAIL
/var/spool/mail/meleu
```

porém se estivesse usando qmail seria:

```
meleu@meleu:~$ echo $MAIL
/home/meleu/Mailbox
```


### `SHLVL`

   Esta variável armazena quantos shells você executou a partir da
primeira shell.  

Confuso? Vamos a um exemplo. Imagine que você está usando o bash e executou o bash de novo, nesta
situação o seu `SHLVL` vale 2. Veja isto:

```
$ echo $SHLVL
1
$ bash		# estou executando o bash a partir do bash
$ echo $SHLVL
2
$ exit		# saí do segundo bash
exit
$ echo $SHLVL
1
```

Quando você inicializa scripts a partir do comando `source` o script é
executado no shell pai, portanto se tiver um `exit` no script você vai
executar um logoff. É aí que está a utilidade da variável `SHLVL`. Quando
você está no shell primário o valor de `SHLVL` é 1. Então você pode, através
de um `if` por exemplo, executar o `exit` só se `SHLVL` for diferente de 1
(mais informações sobre o `source` em {{ book.funcoes_como_comandos }}).



### `PROMPT_COMMAND`

   Esta é bem interessante. Ela armazena um comando que será executado
toda hora que o prompt é exibido. Veja:

```
$ PROMPT_COMMAND="date +%T"
19:24:13
$ cd
19:24:17
$ ls
GNUstep/  bons.txt  pratica/  teste  worldwritable.txt
Mail/     hacking/  progs/    txts/
19:24:19
$
19:24:32
$  # isso eh uma linha sem nenhum comando
19:24:49
$
```

   Esta variável é útil quando queremos brincar com o prompt, para
aprender mais sobre isso leia o Bash-Prompt-HOWTO (v. {{ book.referencias }}).


### `IFS`

   O shell usa esta variável para dividir uma string em palavras
separadas. Normalmente o `IFS` é um espaço, uma tabulação (tab) e um
caractere nova linha `\n`. Desta maneira:

    isto eh uma string

são quatro palavras, pois `IFS` é um espaço e as palavras estão separadas
por espaço. Agora se eu mudar `IFS` para um `:` desta maneira:

    IFS=':'

então a string:

    isto:eh:uma:string

conterá quatro palavras. Isto é útil para casos como neste exemplo:

{% codesnippet "./src/path.sh" %}{% endcodesnippet %}

   Se `IFS` for uma variável nula (vazia), tudo será considerado uma única
string. Por exemplo:

    se o IFS for nulo, toda essa linha será considerada uma única string



### `RANDOM`

   Quando você exibe esta variável (`echo $RANDOM`) é exibido um número
aleatório entre 0 e 32767.

Pra que serve isso? Várias coisas. Quem é criativo sempre precisa de um número
aleatório... No exemplo a seguir temos um simulador de cara ou coroa para ilustrar
a utilidade do `RANDOM`:

{% codesnippet "./src/cara-ou-coroa.sh" %}{% endcodesnippet %}


### Outras

Outras variáveis que são muito usadas: `MAILCHECK`; `HISTFILE`; `HOSTNAME`;
`LS_OPTIONS`; `LS_COLOR`; `MANPATH`; `SHELL`; `TERM`; `USER`; `PS3`.

Estas são as mais utilizadas, porém existem muitas outras. Para ver
quais são as variáveis definidas no momento basta entrar com o comando
`set`. E para ver apenas as variáveis de ambiente use `env`.

Olhe a man page do bash na seção "Shell Variables" para mais detalhes.
