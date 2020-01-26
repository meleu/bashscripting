# Introdução

A versão web de leitura amigável deste texto está disponível aqui: https://meleu.gitbooks.io/bashscripting/content/

Este texto foi originalmente escrito em 2002 ([link do original](http://meleu.github.io/txts/bashscripting.txt)),
Esta versão aqui é uma tentativa de atualizar o texto, baseado em práticas
mais modernas de programação shell, e também tentando aproveitar
dos recursos colaborativos presentes no github.


## Contribuições

Existem duas maneiras de contribuir: enviando melhorias via Pull Requests para o
[repositório do livro](https://github.com/meleu/bashscripting) ou doações.

Para contribuir com melhorias para o livro, veja as instruções em {{ book.como_contribuir }}.

Para contribuir com doações (ficarei muito grato e usarei isso como um estímulo para continuar
atualizando este livro):

### PicPay

- [🍬 R$ 1](https://picpay.me/meleuzord/1.00)
- [☕ R$ 5](https://picpay.me/meleuzord/5.00)
- [🍺 R$ 10](https://picpay.me/meleuzord/10.00)
- [🎁 Definir valor](https://picpay.me/meleuzord/)

Se você não tem conta no PicPay, pode criar a sua [através deste link](https://www.picpay.com/convite?UMYSKN) que você ganha R$ 10 de cashback no seu primeiro pagamento.

### PayPal

<a href="https://www.paypal.com/cgi-bin/webscr?cmd=_s-xclick&hosted_button_id=ZZ3ZN4T7D65EY">
  <img src="https://www.paypalobjects.com/en_US/i/btn/btn_donate_SM.gif" alt="Donate with PayPal" align="center"/>
</a>


## Apresentação

Estou partindo do princípio de que se você está aqui lendo isso significa
que não tem dúvidas quanto a utilidade de um shell script. Então podemos
pular esta parte.

Este livro é mantido por [meleu](https://github.com/meleu/).
Sou usuário do Linux desde 1999, e desde então fascinado pelo Linux, linha
de comando, shell script, linguagem C, redes e nerdezas afins.
Sou formado em Ciência da Computação mas o acaso me fez partir
para outra área. Em meados de 2016 recomecei a praticar bastante bash scripting
quando comecei a me envolver com o projeto [RetroPie](https://retropie.org.uk/)
e a partir daí me animei em revisitar este texto aqui.

## Pré-requisitos

- Vontade de aprender.
- Alguma mínima familiaridade com os comandos básicos do UNIX.
- Acesso a um terminal.
- (Uma noçãozinha de algoritmos ajudaria, mas não é obrigatório.)

Se você não tem noção alguma de linha de comando, recomendo a leitura do [Guia Foca Linux](http://www.guiafoca.org/)
ou algum outro desses tutoriais que existem pela web.

Se por algum motivo você só tem acesso a uma máquina Windows e não pode instalar o Linux
(computador não é seu, é do trabalho, da escola/faculdade), recomendo fortemente que você
conheça o projeto [Cygwin](https://www.cygwin.com/).
Trata-se de uma forma de obter um ambiente bastante similar à uma distribuição
Linux rodando direto do Windows. Sem necessidade de máquina virtual alguma.

Se você não tem acesso a computador algum e for fanático o suficiente para praticar no
smartphone Android, procure um app chamado [termux](https://termux.com/).

É de extrema importância que você vá praticando assim que aprender algo novo,
isso ajuda a se familiarizar e memorizar as coisas. Só ficar lendo não vai ajudar muito.

Todos os códigos presentes nesse texto podem ser encontrados em https://github.com/meleu/bashscripting/tree/master/src.


## Versão do bash

**Atenção nas versões do bash em que eu fiz os meus testes**, pois em versões antigas
recursos podem não funcionar. Resumidamente: se você tem da versão 4 em diante, está em boas
condições.

Esta é a versão que usei para testar no Cygwin:

```txt
$ bash --version
GNU bash, versão 4.4.12(3)-release (x86_64-unknown-cygwin)
```

E esta é a versão que usei para testar no meu Linux Mint 18.1:

```txt
$ bash --version
GNU bash, versão 4.3.46(1)-release (x86_64-pc-linux-gnu)
```

## Agradecimentos

Quando comecei a contribuir com o projeto [RetroPie](https://retropie.org.uk/),
minha habilidade com bash avançou exponencialmente. O principal agradecimento
vai para eles.

A medida que este texto for recebendo contribuições, o nome dos contribuintes vai aparecendo aqui:

- [Matheus Alves](https://github.com/theuves)
- [Luan C. Redmann](https://github.com/redmanndotsh)


## Licença

Este texto está sendo publicado sob a licença Creative Commons
[CC BY-NC-SA 4.0](https://creativecommons.org/licenses/by-nc-sa/4.0/deed.pt_BR).
Resumidamente a licença é o seguinte:

**Você tem o direito de...**

- **Compartilhar**: copiar e redistribuir o material em qualquer suporte ou formato.
- **Adaptar**: remixar, transformar, e criar a partir do material

**Você tem os direitos acima desde que obedecidos os termos abaixo:**

- **Atribuição**: Você deve dar o crédito apropriado, prover um link para
a licença e indicar se mudanças foram feitas. Você deve fazê-lo em
qualquer circunstância razoável, mas de maneira alguma que sugira ao
licenciante a apoiar você ou o seu uso.
- **Não Comercial**: Você não pode usar o material para fins comerciais.
- **CompartilhaIgual**: Se você remixar, transformar, ou criar a partir
do material, tem de distribuir as suas contribuições sob a mesma
licença que o original. 

<a rel="license" href="http://creativecommons.org/licenses/by-nc-sa/4.0/"><img alt="Licença Creative Commons" style="border-width:0" src="https://i.creativecommons.org/l/by-nc-sa/4.0/88x31.png" /></a><br />Este obra está licenciada com uma Licença <a rel="license" href="http://creativecommons.org/licenses/by-nc-sa/4.0/">Creative Commons Atribuição-NãoComercial-CompartilhaIgual 4.0 Internacional</a>.
