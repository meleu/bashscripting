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
