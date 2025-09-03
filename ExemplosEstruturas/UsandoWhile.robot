*** Settings ***
Documentation   Suíte para exemplificar o uso de LOOPS nos testes
...             Os loops devem ser pouco utilizados, mas, às vezes, são necessários.
...             Vamos ver como eles funcionam na prática!
...             Importante: use loops com moderação.
...             Observação: no Robot Framework, o loop FOR ainda não possui uma estrutura totalmente keyword-driven.
...             O criador do Robot já informou que estão estudando uma solução.
Test Setup      Log To Console    ${\n}
Test Teardown   Log To Console    ${\n}


*** Variables ***
${STATUS}  ${1}


*** Test Case ***
Caso de teste exemplo de WHILE
    Usando WHILE para loop

*** Keywords ***
Usando WHILE para loop
    Log To Console    ${\n}
    WHILE  ${STATUS} <= 5
        Log  Executando o bloco enquanto a variável STATUS [${STATUS}] for menor ou igual a 5.
        Log To Console  Executando o bloco enquanto a variável STATUS [${STATUS}] for menor ou igual a 5.
        ${STATUS}  Set Variable  ${STATUS+1}
    END

## Resumo do WHILE:
## O WHILE executa um bloco de código repetidamente enquanto uma condição for verdadeira.
## No exemplo, usamos um contador (STATUS), mas a condição pode envolver textos, estados ou qualquer outra lógica.
##
## Diferença entre WHILE e FOR:
## - WHILE: é mais flexível. Usado quando não sabemos previamente quantas vezes o bloco será executado,
##          pois a repetição depende de uma condição lógica (ex: aguardar que um botão apareça na tela).
## - FOR: é mais direto. Usado quando já sabemos a quantidade de repetições ou queremos iterar sobre uma lista
##        (ex: percorrer uma lista de usuários para fazer login).
##
## Exemplo de uso:
## - WHILE: esperar até que um campo esteja disponível para digitação em um formulário.
## - FOR: iterar sobre uma lista de produtos e verificar se cada um aparece corretamente na página.