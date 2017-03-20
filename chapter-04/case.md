## case

A sintaxe do case é:

    case WORD in
    padrao1)
        <lista de comandos>
        ;; 
    padrao2)
        <lista de comandos>
        ;;
    *)
        <lista de comandos se nenhum padrao for casado>
        ;;
    esac

Como nós sabemos, um `;` serve para dizer ao shell que um comando
acabou, e se quisermos podemos começar outro depois disso. Ex.: 

```
echo ; echo MELEU ; echo
```

E para dizer ao shell que terminamos uma opção do `case` usamos dois `;;`.

Para os padrões você pode usar uns curingas parecidos com os usados
para nomes de arquivos, que são `*`, `?` e a `[lista]`. Os detalhes
destes curingas são explicados na seção "Pathname Expansion" da manpage.

   Veja este script muito besta, sem utilidade prática e meramente
ilustrativo (se quer exemplo prático veja o howto.sh em {{ book.howtosh }}):

{% codesnippet "./src/casetest.sh" %}{% endcodesnippet %}

Agora pratique um pouco!! ;-)

Veja outros exemplos {{ book.exemplos }}.
