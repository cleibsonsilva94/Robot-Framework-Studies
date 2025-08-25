*** Settings ***
Documentation   Exemplo de uso de variáveis como argumentos em Keywords
Library         String
*** Variable ***
&{PESSOA}       nome=May  sobreNome= Lima  email=mayfernandes@exemplo.com.br   idade=11   sexo=feminino
*** Test Cases ***
Caso de teste 01 - Criando email corporativo
    Gerando Email  ${PESSOA.nome}    ${PESSOA.sobreNome}
*** Keywords ***
Gerando Email 
    [Arguments]  ${PRIMEIRONOME}  ${SEGUNDONOME}
    Log   ${PRIMEIRONOME}   ${SEGUNDONOME}