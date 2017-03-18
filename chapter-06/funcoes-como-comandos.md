## Funções como comandos

Antes de começar vamos relembrar um conceito básico: quando se executa
um shell script você obtém o mesmo resultado que obteria se digitasse o
conteúdo do script no prompt de um shell. Com isso eu quero dizer que você
pode fazer tudo que faz em um shell script na linha de comando, inclusive
criar e utilizar funções (que é o assunto deste tópico).

Bom chega de falar de coisas óbvias... :-)

Na linha de comando você declara uma função da mesma maneira que faz
num script. Por exemplo, digite o seguinte na sua linha de comando:

```
function heko {
echo -e "\e[5;1;32mHekodangews, para de enrolar a mina e casa logo! \e[m"
}
```

Agora quando você entrar com "heko" na linha de comando será impresso
na tela um recadinho para o Hekodangews numa corzinha verde e piscante
super-fashion. =)

Veja este outro exemplo um pouco mais útil:

```bash
function SetPath {
    PATH=${PATH:="/bin:/usr/bin"}
    for DIR in "$@"; do
        if [ -d "$DIR" ]; then
	    PATH="$PATH:$DIR"
        else
	    echo "* * * Erro: $DIR nao eh um diretorio"
        fi
    done
    export PATH
    unset DIR
}
```

Acho que deu pra sacar qual é, né? Quando você quiser acrescentar algum
diretório no seu PATH basta usar "SetPath dir1 dir2 dirn". ;-)

E se você tiver várias idéias de funções legais que queira usar sempre
em suas sessões? Vai ter que digitá-las na linha de comando toda hora?
Não! Para este propósito o comando "source" pode ser muito útil
(informações detalhadas na manpage do bash).

Lembra-se de eu ficar enchendo o saco dizendo "Quando executamos um
shellscript ele é executado num shell a parte (shell filho)"? Pois eu não
fiquei enchendo o saco com isso sem motivo. O comando source faz com que
o script seja executado no shell pai, ou seja, é como você estivesse
digitando todo o conteúdo do arquivo na linha de comando. E isso é
especialmente útil quando temos arquivos com as nossas funções que
queremos usar como comandos.

Uma coisa legal de se fazer é colocar o arquivo com as funções que
você quer usar num arquivo oculto no seu $HOME (ex.: $HOME/.MyFunctions)
e no seu $HOME/.bash_profile você coloca uma linha com o comando
"source $HOME/.MyFunctions".

Veja este arquivo com alguns exemplos de funções:

{% codesnippet "./src/Mfunctions", language="bash" %}{% endcodesnippet %}

   Se você quer ver umas funções porretas que o aurélio fez olhe em
<http://verde666.org/zz>. Vou logo avisando que o ele parece ser daqueles
tipos que não ligam para a "limpeza" do código, mas tudo bem... a gente
faz uma forcinha pra enteder e no final das contas: o que importa é que
funciona! ;-)

