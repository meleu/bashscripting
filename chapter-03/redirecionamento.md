## Redirecionamento

   Quem já sabe programar deve saber que existem três "file descriptors"
abertos por padrão (pelo menos nos sistemas operacionais que conheço):
stdin (standard input), stdout (standard output) e stderr (standard error).
Para fins práticos, estes são considerados arquivos e você pode direcionar
destes "arquivos" para outros e vice-versa.

Veja como direcionar de:

+ arquivo para stdin:
`programa < arquivo`

+ stdout para arquivo
`programa > arquivo`

+ stderr para arquivo
`programa 2> arquivo`
 
+ stdout para stderr
`programa 1>&2`

+ stderr para stdout
`programa 2>&1`

+ stdout e stderr para arquivo
`programa &> arquivo`

Se você usar por exemplo "find / -perm -2 > worldwritable.txt" e no
diretório não tiver um arquivo chamado "worldwritable.txt" este será
criado, a saída do comando será gravada nele e a saída de erro padrão
será impressa na tela (ou écran, se preferirem :P ). Para não ver as
mensagens de "Permission Denied" faça isso:

    $ find / -perm -2 > worldwritable.txt 2> /dev/null

Ainda temos um probleminha: este comando irá mostrar também todos os
links simbólicos e vários arquivos de dispositivo. Para eliminar os links
simbólicos faça o seguinte:

     $ find / -perm -2 ! -type l > worldwritable.txt 2> /dev/null

   Você ainda pode eliminar da saída os arquivos com stick bit e os
arquivos de dispositivo usando parênt... EI!! Isto aqui é sobre
redirecionamento, e não sobre o find! Vá ler a man page do find! =P

   Se o arquivo já existir seu conteúdo será sobregravado. Mas você pode
apenas concatenar o conteúdo no final do arquivo usando ">>". Exemplo:

     $ echo " F I M  D O  A R Q U I V O " >> worldwritable.txt

Faça os testes e tire suas conclusões! ;)

   Veja este script a seguir a execute ele usando redirecionamento na linha
de comando pra ver os resultados

{% codesnippet "./src/redirecionamento.sh" %}{% endcodesnippet %}

Tem um outro tipo de redirecionamento que é bastante útil. É assim:

    $ programa << delimitador

Isto quer dizer que o programa vai ler o arquivo stdin até encontrar o
delimitador.

Isso é muito útil para usar programas externos através de shell
scripts.

Você pode, por exemplo, usar este tipo de redirecionamento para fazer um
shell script escrever um outro arquivo usando o comando "cat". Vamos a um
exemplo em que eu crio um código de programa escrito em C através do
script (note que as variáveis do script SÃO interpretadas):

{% codesnippet "./src/catredir.sh" %}{% endcodesnippet %}


### Pipe

   Agora vejamos o pipe. Sua sintaxe é:

     $ programa1 | programa2

   O pipe é usado para você fazer da saída de um programa a entrada de
outro (como usado no exemplo amarelinho.sh já mostrado anteriormente).

   Apesar de simples o pipe é muito útil e poderoso. Veja este exemplo
muito simples:

```
$ who
meleu    tty1     Nov 20 01:40
hack     tty2     Nov 20 01:45
root     tty3     Nov 20 02:44
$ who | cut -c-9
meleu
hack
root
```

   Mais exemplos serão dados ao longo do texto.

#### Comandos Úteis com o Pipe

##### xargs

   O xargs transforma stdin em argumentos da linha de comando. Vamos usar
o exemplo anterior de novo:

```
$ who | cut -c-9	# lembrando: pipe transforma stdout em stdin
meleu
hack
root
$ # "echo" nao le arquivo, ele usa argumentos.
$ # A linha abaixo nao tem utilidade.
$ who | cut -c0-9 | echo

$ # "xargs" transforma o conteudo de stdin em argumentos
$ who | cut -c0-9 | xargs echo
meleu hack root
```

   Como eu gosto do find não resisti e colocarei um comando interessante
que usa pipe e xargs:

```
$ find / -perm -2 ! -type l ! -type c | xargs ls -ld > wordwritable.txt
```

   Se não entendeu algo do comando acima e quer entender, olhe as
manpages.


##### tee

   Outro comando bom de se usar com pipe é o "tee". Ele faz com que a
saída do programa vá para a saída padrão, normalmente a tela (écran) *E*
para um arquivo ao mesmo tempo.

   É como se você fizesse "programa > arquivo" só que o saída do programa
também seria escrita na saída padrão. Experimente:

```
$ ls -la |tee conteudo.txt
```
