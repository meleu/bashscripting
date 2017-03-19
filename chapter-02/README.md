# Variáveis e Parâmetros

   Ao contrário das outras linguagens, o bash não possui "tipos de dados",
todas as variáveis são strings. O bash usa strings para representar todos
os dados que serão usados pelas variáveis. A seguir falaremos sobre os
**tipos de variáveis** (e não "tipos de dados").

   Se você conhece alguma outra linguagem de programação sabe que os
identificadores possuem algumas regras quanto a sua nomeclatura. Pois no
bash as regras são parecidíssimas:

- Só se pode usar caracteres alfanuméricos e underline;
- Só se pode começar com letra ou underline (não pode começar com número);
- Não pode conter espaços em branco;

   E uma coisa que nós, falantes da língua portuguesa temos que saber é:
   
- Os identificadores **NÃO** podem conter acentos!

Enfim, todas aquelas regrinhas para identificadores de linguagens de
programação também se aplica aqui, exceto aquela famosa sobre palavras
reservadas. Você pode por exemplo fazer "if=lalala" que funcionará
perfeitamente. A única coisa que não pode é usar um nome que já tenha sido
definido para uma outra variável e que esta seja "readonly" (mais sobre
isso adiante). Também deve-se tomar cuidado para não fazer bobagens com
as variáveis do shell (explicados no tópico {{ book.variaveis_do_shell }}).
