# Começando

Como você já deve saber, um shell script é um arquivo em formato texto
puro que contém comandos/instruções para serem executados em uma
determinada shell. O que vou tentar passar neste texto é como fazer shell
script para o Bourne-Again Shell, ou bash. Grande parte do conteúdo desse texto
pode ser usado em outros shells disponíveis no mundo UNIX/Linux, mas o foco
do texto é o bash. Esta é uma linguagem
interpretada (você não precisa compilar para ter o executável) e o bash é
o interpretador.

Veja um exemplo de script:

{% codesnippet "./src/primeiroexemplo.sh" %}{% endcodesnippet %}

Para que se possa executar um shell script é necessário permissão de
execução (mais sobre permissões em http://meleu.github.io/txts/permissoes.txt).
Para que somente você (dono do arquivo) tenha permissão de execução
para o primeiroexemplo.sh você faz:

    chmod u+x primeiroexemplo.sh

Agora você pode executar o script da seguinte forma:

    ./primeiroexemplo.sh

Veja outro exemplo de apenas um comando (se não entender não tem problema,
em breve tudo ficará mais claro):

{% codesnippet "./src/procurasuid.sh" %}{% endcodesnippet %}

Agora vamos a uma rápida explicação sobre o código...
- Na primeira linha nós dizemos qual será o nosso intrepretador de
comandos (o shell). Você deve começar a linha com um `#!` (conhecido como
sha-bang) e depois o caminho inteiro para o bash.
- Nas segunda e terceira linhas são usados comentários, todo
comentário começa com uma cerquilha `#` e vai até o final da linha;
- A última linha que é realmente o comando, o `$1` significa o primeiro
parâmetro dado na linha de comando (será falado mais sobre isso daqui
a pouco), por exemplo:

```
./procurasuid.sh level5
```

irá procurar por todos os arquivos suid que pertençam ao usuário `level5`.
Esse shell script é útil nos wargames (veja sobre isso em {{ book.referencias }}).

De vez em quando é bom observar o que o script está fazendo. Para isso
você pode usar alguns parâmetros junto com o shell para executar seu
script. Veja:

```
$ bash -x src/primeiroexemplo.sh
+ echo 'Alo mamãe!'
Alo mamãe!
+ echo

+ echo 'Agora executarei um simples "ls -l", veja: '
Agora executarei um simples "ls -l", veja:
+ echo

+ ls -l
total 12
drwxr-xr-x 5 meleu users 4096 Aug 18 15:28 GNUstep
drwxr-xr-x 2 meleu users 4096 Aug 19 23:11 progs
drwxr-xr-x 2 meleu users 4096 Aug 19 22:57 txts
```

O parâmetro `-x` faz com que seja exibido o comando e depois a saída do
comando.

Outros parâmetros interessantes para "debugar" o script são:

- `-n`: não executa os comandos, apenas verifica erros de sintaxe (noexec);
- `-v`: mostra o script e depois executa-o (verbose);

Outra coisa que devemos saber é que **quando um shell script é executado
ele usa outra instância do shell**, e não a instância atual. É importante termos
isso em mente quando formos usar variáveis.

Por falar em variáveis, o próximo capítulo trata exatamente disso...
**Capítulo 02: [Variáveis e Parâmetros →](https://github.com/redmanndotsh/bashscripting/tree/master/chapter-02)**
