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
    FOR    ${LISTANUMERICA}    IN    @{MINHA_LISTA_DE_NUMEROS}
    Log To Console    ${LISTANUMERICA}
    IF    ${LISTANUMERICA} == 5 or ${LISTANUMERICA} == 10
        Log To Console    Minha posição agora é ${LISTANUMERICA}
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


# Solução e sugestão da professora. 

# *** Settings ***
# Documentation    Exercício IF e FOR

# *** Variables ***
# @{NUMEROS}       0  3  5  7  9  10  12

# *** Test Cases ***
# Teste de imprimir apenas alguns números
#   Imprimir somente se for 5 e 10

# *** Keywords ***
# Imprimir somente se for 5 e 10
#   Log To Console  ${\n}

#   FOR    ${numero}    IN   @{NUMEROS}
#       IF  ${numero} == 5
#           Log To Console    Eu sou o número 5!
#       ELSE IF  ${numero} == 10
#           Log To Console    Eu sou o número 10!
#       ELSE
#           Log To Console    Eu não sou o número 5 e nem o 10!
#       END
#   END

#   Log To Console  ${\n}
#   #FICA A DICA
#   # Existem outros modos de fazer, veja abaixo:
#   FOR    ${numero}    IN   @{NUMEROS}
#       IF  ${numero} == 5 or ${numero} == 10
#           Log To Console    Eu sou o número ${numero}!
#       ELSE
#           Log To Console    Eu não sou o número 5 e nem o 10!
#       END
#   END

#   Log To Console  ${\n}
#   FOR    ${numero}    IN   @{NUMEROS}
#       IF  ${numero} in (5, 10)
#           Log To Console    Eu sou o número ${numero}!
#       ELSE
#           Log To Console    Eu não sou o número 5 e nem o 10!
#       END              
#   END

## EXPLICAÇÕES

# Usamos "or" para verificar se o número atual é 5 OU 10
    # O "==" é a comparação de igualdade
    # Se a condição for verdadeira, imprime a posição atual

    # Observações:
# - A lista deve ser chamada com @{ } e não ${ }, porque estamos percorrendo uma lista.
# - O operador lógico "or" permite checar múltiplas condições ao mesmo tempo.

*** Variables ***
@{LISTA5E10}    2    5    7    10    12     4

*** Keywords ***
Verificar Números
    FOR    ${numero}    IN    @{LISTA5E10}
        IF    ${numero} == 5
            Log To Console    Eu sou o número 5!
        ELSE IF    ${numero} == 10
            Log To Console    Eu sou o número 10!
        ELSE
            Log To Console    não sou o número 5 e nem o 10!
        END
    END

*** Test Cases ***
Teste Verificar Números
    Verificar Números