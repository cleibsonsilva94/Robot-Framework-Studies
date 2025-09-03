*** Settings ***
Documentation   Vamos aprender a fazer LOOPS usando o Robot Framework!!

*** Variables ***
### Indíce da lista          0      1        2       3       4       5
@{MINHA_LISTA_DE_FRUTAS}   maça  abacaxi  banana  morango  laranja  uva
@{MINHA_LISTA_DE_NUMEROS}  1    2    3    4    5    6    7    8    9    10
*** Test Case ***
Teste de REPEAT KEYWORD
    [Documentation]  Chama uma mesma keyword várias vezes
    Usando Repeat keyword

Teste de FOR do tipo IN RANGE
    [Documentation]  Faz um loop dentro de um intervalo que você passar
    Usando FOR IN RANGE

Teste de FOR do tipo IN
    [Documentation]  Faz um loop percorrendo a lista que você passar
    Usando FOR IN

Teste de FOR do tipo IN ENUMERATE
    [Documentation]  Faz um loop percorrendo a lista que você passar e percorre o indíce da lista
    Usando FOR IN ENUMERATE

Teste de Sair do FOR
    [Documentation]  Você controla quando o FOR deve se encerrar antes de terminar todos os LOOPS
    Usando FOR IN com EXIT FOR LOOP IF

Teste percorrer lista
    Percorrendo lista
*** Keywords ***

Percorrendo lista
    FOR  ${LISTANUMERICA}  IN  ${MINHA_LISTA_DE_NUMEROS}
        Log To Console    ${LISTANUMERICA}  
        IF  ${LISTANUMERICA} == 5 $ 10
         Log To Console  Minha posição agora é ${LISTANUMERICA}
        END
    END
Usando Repeat keyword
##Comando para pular linha ${\n}. 
    Log To Console  ${\n}
    Repeat Keyword    8x    Log To Console    Minha repetição da keyword!!!
Usando FOR IN RANGE
    Log To Console  ${\n}
    FOR  ${CONTADOR}   IN RANGE  0  1000000  5000
        Log To Console    Minha posição agora é: ${CONTADOR}
        Log   Minha posição agora é: ${CONTADOR}
    END
# Basicamente ym loop com um numero definido de interações. ele começa no indice "0" e vai até o "4" não contabilizando o 5. 
# Caso eu deseje, posso colocar no frente do 5, como um terceiro argumento, a quantidade de vezes que quero que ele conte de uma vez. 
# De 2 em 2 ou 4 em 4. Lembrando que ele não contabiliza o ultimo. 
Usando FOR IN
    Log To Console    ${\n}
    FOR  ${FRUTA}   IN  @{MINHA_LISTA_DE_FRUTAS} 
        Log To Console    Minha fruta é: ${FRUTA}!
        No Operation
    END
# Usado para percorrer listas. Todos os elementos da lista passarão pelo bloco de codigo abaixo dele. 
Usando FOR IN ENUMERATE
    Log To Console    ${\n}
    FOR   ${INDICE}   ${FRUTA}   IN ENUMERATE   @{MINHA_LISTA_DE_FRUTAS}
        Log To Console    Minha fruta é: ${INDICE} --> ${FRUTA}!
        No Operation
    END
## Usado caso você queira saber ou precise usar o indice da lista. Ele mostrará não só os elementos da lista mas também o nomero de itens. 
Usando FOR IN com EXIT FOR LOOP IF
    Log To Console    ${\n}
    FOR   ${INDICE}   ${FRUTA}   IN ENUMERATE   @{MINHA_LISTA_DE_FRUTAS}
        Log To Console    Minha fruta é: ${INDICE} --> ${FRUTA}!
        Exit For Loop If    '${FRUTA}'=='banana'
    END
