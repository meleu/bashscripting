# Introdução

---

Este texto foi originalmente escrito em 2002, época que eu tinha muito tempo
livre. Esta versão aqui é uma tentativa de atualizar o texto, baseado em práticas
mais modernas de programação shell, e também tentando me aproveitar
dos recursos colaborativos presentes no github.

A versão original do texto pode ser encontrada: http://meleu.github.io/txts/bashscripting.txt.

---


Estou partindo do princípio de que ninguém aqui tem dúvidas quanto a
utilidade de um shell script.

Na época que eu escrevi este texto o material sobre bash em português era
bem escasso. Agora o cenário já é outro, temos alguns bons livros sobre o
assunto. Mesmo assim decidi dar uma atualizada nesse texto introduzindo
os meus conhecimentos atuais.

Por falar em meus conhecimentos, não pense que sou um expert ou um guru em 
shell scripting, eu sequer trabalho com Linux! :-) Sou apenas um
hobbista fanático. Sempre curti programação, sou usuário do Linux desde 1999,
sou formado em Ciência da Computação mas o ~~dinheiro~~ destino me fez partir
para outra área. Em meados de 2016 recomecei a praticar bastante bash scripting
quando comecei a me envolver com o projeto [RetroPie](https://retropie.org.uk/)
e a partir daí me animei em revisitar este texto aqui.

Minhas fontes de pesquisa serão muito úteis para o leitor. Portanto consulte a
seção de referências que você vai achar muita coisa boa.

O único pré-requisito para o entendimento deste texto é que o leitor
tenha uma mínima familiaridade com os comandos UNIX. Se você não tem (ou acha
que não tem) este pré-requisito, você pode adquirí-lo lendo o [Guia Foca Linux](http://www.guiafoca.org/)
ou algum outro desses tutoriais que existem pela web. Uma noçãozinha de
programação (algoritmos) cairia bem.

Se você quer muito praticar bash scripting mas por algum motivo não tem acesso
a um computador com Linux (computador não é seu, é do trabalho, da
escola/faculdade), recomendo fortemente que você conheça o projeto [Cygwin](https://www.cygwin.com/).
Trata-se de uma forma de obter um ambiente bastante similar à uma distribuição
Linux rodando direto do Windows. Sem necessidade de máquina virtual alguma.

É de extrema importância que você vá praticando assim que aprender algo novo, isso ajuda a se familiarizar e memorizar as coisas.

A maioria dos scripts chamam programas existentes no sistema, não
ficarei explicando em detalhes o que faz cada comando. Se você quer
saber o que ele
faz, sua sintaxe e etc. procure na página man. Se você tiver alguma
dúvida sobre o bash use: "help" ou "man bash". A manpage é bastante
completa (e grande também)! Use-a como referência.

Para sua comodidade eu coloquei os códigos desse texto disponíveis em https://github.com/meleu/bashscripting

**Atenção nas versões em que eu fiz os meus testes**, pois em versões antigas
algumas coisas podem não funcionar. 

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

Vou manter os agradecimentos do texto original, mas também gostaria de agradecer
ao pessoal do projeto [RetroPie](https://retropie.org.uk/), com quem eu aprendi
vários macetinhos mais modernos sobre bash scripting.

**Agradecimentos do texto original:**

A todos que fazem um esforcinho para publicar informações
de qualidade em português. Especialmente para meus amiguinhos(as): lucipher, klogd, module, eSc2,
xf, Emmanuele, Mana_Laura, NashLeon, Hekodangews, Blind_Bard, clausen,
Renato <www.linuxsecurity.com.br>, hts, EvilLord, aurélio (assim como eu
também é um dinossauro-amante-do-modo-texto), às pessoas que levam a
Unsekurity Scene <http://unsekurity.virtualave.net> a sério, aos camaradas
da EoH Team <http://eoh-team.tk>, e outros pessoas que eu posso não me
lembrar agora mas que também são meus camaradas. É lógico que também devo
agradecimentos a toda a comunidade Open Source, sem a qual tudo isso aqui
não existiria! Amo vocês! =D

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

<a rel="license" href="http://creativecommons.org/licenses/by-nc-sa/4.0/"><img alt="Licença Creative Commons" style="border-width:0" src="https://i.creativecommons.org/l/by-nc-sa/4.0/88x31.png" /></a><br />Este obra está licenciado com uma Licença <a rel="license" href="http://creativecommons.org/licenses/by-nc-sa/4.0/">Creative Commons Atribuição-NãoComercial-CompartilhaIgual 4.0 Internacional</a>.