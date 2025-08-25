*** Settings ***
Documentation   Exemplo de uso de variáveis como argumentos em Keywords

*** Variable ***
&{PESSOA}       nome=May Fernandes   email=mayfernandes@exemplo.com.br   idade=11   sexo=feminino

*** Test Cases ***
Caso de teste de exemplo 01
    Uma keyword qualquer 01

*** Keywords ***
Uma keyword qualquer 01
    # Passando argumentos para a Keyword. Ela precisa de pelo menos 2, e eu passo manualmente.
    Uma subkeyword com argumentos   Bruno Silva   bruno_silva@teste.com.br 
    # Aqui eu passo para a Keyword os argumentos da variável global.
    Uma subkeyword com argumentos   ${PESSOA.nome}   ${PESSOA.email} 
    ${MENSAGEM_ALERTA}   Uma subkeyword com retorno   ${PESSOA.nome}   ${PESSOA.idade}
    Log     ${MENSAGEM_ALERTA}

Uma subkeyword com argumentos
    [Arguments]     ${NOME_USUARIO}   ${EMAIL_USUARIO}
    Log             Nome Usuário: ${NOME_USUARIO}
    Log             Email: ${EMAIL_USUARIO}

Uma subkeyword com retorno
    [Arguments]     ${NOME_USUARIO}   ${IDADE_USUARIO}
    # Uso do IF dentro de uma Keyword. Um detalhe é que o "Set Variable If" não tem Else.
    # O segundo texto na sequência (OK! Usuário é maior de idade!) assume o papel de Else.
    ${MENSAGEM}     Set Variable If    ${IDADE_USUARIO}<18    Não autorizado! O usuário ${NOME_USUARIO} é menor de idade!   OK! Usuário é maior de idade!
    [Return]        ${MENSAGEM} 
    # O [Return] serve para devolver um valor de dentro da Keyword.
    # Esse valor retornado pode ser armazenado em uma variável na chamada da Keyword
    # e reutilizado em outras partes do teste. É a forma de "entregar" um resultado
    # para fora da Keyword.