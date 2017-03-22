## Redirecionando loops

Lendo o livro "Linux: Programação Shell" (ver {{ book.referencias }}) eu aprendi
umas formas de usar redirecionamento para loops. Vou tentar passar os
esquemas aqui através de exemplos meramente ilustrativos. Vamos a eles,
lembrando daqueles conceitos passados capítulo de {{ book.entrada_e_saida }} (principalmente sobre
o `read` e sobre os redirecionamentos).


### "pipeando" para o while

Vamos imaginar um arquivo onde eu tenho os nomes de alguns amigos meus
e a região onde eles moram. Como alguns amigos moram em uma mesma região
eu não vou ficar repetindo a região para cada um. Portanto o arquivo fica
assim:

{% codesnippet "./src/amigos.regiao" %}{% endcodesnippet %}

Agora veja o script que usará as informações contidas no arquivo
"amigos.regiao":

{% codesnippet "./src/listamigos.sh" %}{% endcodesnippet %}

   Deu pra sacar direitinho? Qualquer dúvida é só dar uma olhada nas man
pages dos comandos que estão gerando as dúvidas.

   Mas a coisa não é tão simples assim... Se dentro do loop você quisesse
usar o comando read para ler do teclado, seria necessário pegar a entrada
de "/dev/tty". Sabendo que o /dev/tty é o terminal que você está usando.

   Se você tiver muitos amigos no arquivo "amigos.regiao" não vai
conseguir ver todos, pois a lista não caberá numa tela só. Neste caso, o
script a seguir será melhor que o "listamigos.sh".

{% codesnippet "./src/listamigos2.sh" %}{% endcodesnippet %}

   Se quiser comprovar com seus próprios olhos a necessidade de pegar a
entrada de "/dev/tty" é só retirar o "< /dev/tty" naquele read dentro do
loop.

   OBS.: Curiosamente o exit dentro de um loop que recebe dados de um
pipe funciona como se fosse um break. Pra comprovar isso coloque no final
do script listamigos2.sh um "echo bla bla bla" e quando o script mostrar
"Entre <ENTER> para continuar ou 'sair' para sair: " entre com 'sair'.

   Isso ocorre porque durante o "pipeamento" os comandos são executados
num subshell (um shell a parte ou shell filho, como preferir), e o exit
faz sair deste subshell.

   Vejamos um exemplo onde você verá que o exit funciona como o break:

{% codesnippet "./src/bruteftp.sh" %}{% endcodesnippet %}

   O "pipeamento" para while também é usado no Mextract.sh.


### redirecionando de arquivo para while

   Esse método é bem esquisitinho... Mas vou colocar ele aí para quem
quiser usar.

   Agora veremos um arquivo onde eu tenho os telefones de alguns amigos.
A disposição das informações dentro do arquivo é um pouco parecida com o
"amigos.regiao", veja:

{% codesnippet "./src/agenda.tel" %}{% endcodesnippet %}

   Vamos ao script que se utilizará das informações de "agenda.tel":

{% codesnippet "./src/listartel.sh" %}{% endcodesnippet %}

Agora quando você se sentir solitário e quiser conversar com alguém,
basta fazer o seguinte:

    $ ./listartel.sh | grep emma

Aí é só você ligar pra emmanuele e bater um papo legal com ela. :)

**OBS. I:** Neste esquema também é necessário pegar os dados de /dev/tty
se você quiser usar o read dentro do loop.

**OBS. II:** Se você usar exit dentro do loop usando este esquema, ele
REALMENTE SAIRÁ DO SCRIPT. Não é igual ao esquema anterior onde o while
recebe dados de um pipe e o exit funciona como se fosse um break. Então
repetindo: neste esquema o exit funciona normalmente!



### redirecionando a saída do loop para a tela

Ficou confuso com este título? "Redirecionar a saída do loop para a
tela parece ser uma coisa inútil, pois isso acontece todas as vezes." Aí
que você se engana! Vamos ao exemplo onde eu mostrarei a utilidade de se
redirecionar desta maneira...

Temos um script chamado retornatel.sh que pesquisa o telefone de um
determinado amigo (o nome é passado ao script durante sua execução). Agora
queremos pegar o telefone deste amigo e armazená-lo numa variável da
seguinte maneira:

    FONE=`./retornatel.sh`

Só que, como veremos no script a seguir, a saída do script não é
somente o número do telefone. Existe uma interface com o usuário
perguntando qual o nome a ser pesquisado. Veja o script:

{% codesnippet "./src/retornatel.sh" %}{% endcodesnippet %}

   Olha o /dev/tty aí de novo! :P

Redirecionando a saída de todo o loop para "/dev/tty", fará com que os
dados impressos para fazer a interface com o usuário não sejam enviados
para a saída padrão e por conseguinte não sejam enviados para a variável
que está recebendo o número através do método

    variavel=`programa`

Desta maneira, se você quer armazenar o telefone do xf na variável
XFTEL, faça o seguinte:

    XFTEL=`./retornatel.sh`

E então pesquise por xf. Depois é só usar

    echo $XFTEL

para ver o telefone do cara.

Experimente usar o script sem este redirecionamento e pegar o telefone
do xf desta maneira que expliquei para apreciar os resultados bizarros...

