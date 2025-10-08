*** Settings ***
Library    String
Documentation   Exemplo de keyword que gera um e-mail customizado sem FakerLibrary 
Library           FakerLibrary
Library           RequestsLibrary

*** Test Cases ***
Caso de teste 01 - Criando email corporativo
    ${email_gerado}=    Gerando Email    May    Fernandes    # Chama a keyword "Gerando Email", passando os argumentos "May" e "Fernandes", e guarda o resultado na variável ${email_gerado}
    Log To Console    O e-mail gerado foi: ${email_gerado}   # Mostra no console o valor da variável gerada no passo anterior

*** Keywords ***
Gerando Email
    [Arguments]    ${PRIMEIRONOME}    ${SEGUNDONOME}    # Define que a keyword "Gerando Email" precisa receber 2 argumentos: primeiro nome e sobrenome

    # Gerar uma string aleatória com 5 caracteres (podendo ser letras e números)
    ${palavra}=    Generate Random String    5    [LETTERS][NUMBERS]    # Usa a keyword da String Library para gerar 5 caracteres aleatórios (por ex: "A3B7C")

    # Montar o e-mail final
    ${email}=    Set Variable    ${PRIMEIRONOME}${SEGUNDONOME}${palavra}@testerobot.com    # Junta: nome + sobrenome + string aleatória + domínio fixo

    [Return]    ${email}    # Retorna o e-mail montado para quem chamou a keyword


*** Keywords ***
Gerando Email Customizado
    [Arguments]    ${nome}    ${sobrenome}
    ${palavra_aleatoria}=    FakerLibrary.Word
    ${email}=    Set Variable    ${nome}${sobrenome}${palavra_aleatoria}@testerobot.com
    [Return]    ${email}

*** Test Cases ***
Teste Gerar Email Customizado
    ${email_gerado}=   Gerando Email Customizado    Michael    Jackson
    Log To Console    \nE-mail gerado: ${email_gerado}

# *** Settings ***
# Library   String

# *** Variables ***
# &{PESSOA}   nome=May   sobrenome=Fernandes

# *** Test Cases ***
# Imprimindo um e-mail customizado e aleatório
#     ${EMAIL_CRIADO}    Criar e-mail customizado e aleatório    ${PESSOA.nome}    ${PESSOA.sobrenome}
#     Log To Console     ${EMAIL_CRIADO}


# *** Keywords ***
# Criar e-mail customizado e aleatório
#     [Arguments]       ${NOME}  ${SOBRENOME}
#     ${ALEATORIA}      Generate Random String
#     ${EMAIL_FINAL}    Set Variable    ${NOME}${SOBRENOME}${ALEATORIA}@testerobot.com
#     [Return]          ${EMAIL_FINAL}

