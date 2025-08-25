*** Settings ***
Library        SeleniumLibrary
Documentation   Exemplo de uso de variáveis como argumentos em Keywords
*** Variable ***
&{PESSOA}       nome=May  email=mayfernandes@exemplo.com.br   idade=11   sexo=feminino
*** Test Cases ***
Caso de teste 01 - Criando email corporativo
    Gerando Email  ${PESSOA.nome}    ${PESSOA.email}

*** Keywords ***
Gerando Email
    [Arguments]  ${PRIMEIRONOME}    ${SEGUNDONOME}
    Log     O email incial é: ${PRIMEIRONOME} e  ${SEGUNDONOME}