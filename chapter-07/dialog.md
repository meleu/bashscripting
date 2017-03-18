## dialog

AVISO: o dialog não um comando específico do bash! Estou escrevendo
sobre ele porque já vi muita gente querendo informações sobre ele e
porque eu particularmente acho ele uma fofura. :-)

O dialog serve para fazer caixas de diálogo, e a sintaxe básica é
assim:

    dialog [ opcoes de título ] opções da caixa

As opções de título são opcionais (por isso que elas estão entre
colchetes. duh!), as de caixa são obrigatórias. Para que você possa fazer
agora uma apreciação visual do dialog tente o seguinte comando:

    dialog --yesno "Caixa onde se se escolhe Yes ou No" 0 0

Existem vários tipos de caixas, a utilizada nesse comando é uma caixa
do tipo "yesno". Bem... isso foi só pra você dar uma admirada rápida no
dialog. Agora vamos organizar as coisas, vou explicar alguns parâmetros.
Vá praticando cada um desses parâmetros e vendo o resultado. Lembre-se que
as opções da caixa são obrigatórias!


- `--backtitle "texto"`

   Este parâmetro é para por um título "lá atrás". Tente 
dialog --backtitle "Micro\$oft Scandisk" --yesno bla 0 0
e veja como o título que aparece lhe trará péssimas lembranças. =)

   
- `--title "texto"`

   Este vai ser o título da caixa de diálogo.


   Agora vamos as opções de caixa, mas antes uma informação:
Em todos os tipos de caixas existem os argumentos "altura" e "largura"
(que para abreviar, eu chamarei de "alt" e "larg"), que (por incrível
que pareça) servem para você determinar a altura e largura da caixa de
diálogo. Se você não tiver saco pra ficar contando quantos caracteres
serão usados na caixa, use 0 para altura e largura, assim a caixa terá um
tamanho de acordo com texto utilizado.


- `--yesno "texto" alt larg`

   Faz uma caixa de diálogo com as opções "Yes" e "No". Se você escolher
"Yes" o dialog retorna 0, caso contrário, retorna 1.


- `--msgbox "texto" alt larg`

   Serve para mostrar uma mensagem e tem um botão de confirmação "OK".
Quando você escolher "OK" o dialog retornará 0, e, assim como em todos os
outros tipos de caixas, você pode cancelar via tecla ESC, quando o dialog
retornará 255.


- `--inputbox "texto" alt larg [string de inicio]`

   Faz uma caixa de entrada de dados, se "string de inicio" for passada o
campo de entrada de dados será inicializado por esta string. Os botões
são "OK" E "Cancel", o primeiro, se selecionado, retorna 0 e o outro
retorna 1. A string que você entrar será direcionada para a saída de erro
padrão, portanto, se você quer que isto seja gravado use redirecionamento
de stderr (ver 3.3 Redirecionamento).


- `--textbox arquivo alt larg`

   É como se fosse um simples visualizador de arquivos texto. Use as
setinhas do teclado para se movimentar. Para pesquisar pra frente use '/'
e para pesquisar pra trás use '?'.


- `--menu "texto" alt larg alt-do-menu item1 "descricao do item1" \
                                    [ itemN "descricao do itemN" ]`

   Note que aquela '\' lá no final da linha significa que o comando
continua na próxima linha. Como o próprio nome diz, esse parâmetro é
usado para fazer menus, como por exemplo aquele do pppsetup (slackware)
onde você escolhe qual o ttyS do seu modem. O item que for escolhido será
impresso em stderr. "OK" retorna 0 e "Cancel" retorna 1.
   Veja um exemplo besta só pra ilustrar:

{% codesnippet "./src/menudialogtest.sh" %}{% endcodesnippet %}


- `--checklist "texto" alt larg alt-da-lista \
   item1 "descricao do item1" status [ item2 "descricao do item2" status ]`

   Note novamente o caractere '\' fazendo o comando continuar na linha
abaixo. Este tipo de caixa é utilizado quando se quer fazer um menu onde
pode-se escolher vários itens, você marca os que deseja e dá "OK". Assim
como o "--menu", o(s) item(ns) que for(em) escolhido(s) serão impressos em
stderr. O parâmetro "status" serve para você deixar um determinado item
selecionado logo de início, seus valores podem ser "on" ou "off".

Veja este exemplo bem interessante (oh! finalmente um exemplo com
alguma utilidade!) que usa muitos dos conceitos já ensinados até aqui, se
não entender releia o código:

{% codesnippet "./src/mp3select.sh" %}{% endcodesnippet %}

- `--radiolist "texto" alt larg alt-da-lista \
    item1 "descricao do item1" status [ item2 "descricao do item2 status ]`

Similar ao `--checklist` porém aqui só se pode fazer uma escolha, quando
você seleciona um item desmarca outro. Faça os testes por sua conta.

Chega de moleza! Se quiser saber mais leia a man page do dialog! ;)

