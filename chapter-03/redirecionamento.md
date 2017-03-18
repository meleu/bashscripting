## Redirecionamento

   Quem já sabe programar deve saber que existem três "file descriptors"
abertos por padrão (pelo menos nos sistemas operacionais que conheço):
stdin (standard input), stdout (standard output) e stderr (standard error).
Para fins práticos, estes são considerados arquivos e você pode direcionar
destes "arquivos" para outros e vice-versa.

Veja como direcionar de:

+ arquivo para stdin:
`programa < arquivo`

+ stdout para arquivo:
`programa > arquivo`

+ stderr para arquivo:
`programa 2> arquivo`
 
+ stdout para stderr:
`programa 1>&2`

+ stderr para stdout:
`programa 2>&1`

+ stdout e stderr para arquivo:
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
