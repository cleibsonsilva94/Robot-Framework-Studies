*** Settings ***
Library    String
Documentation   Exemplo de keyword que gera um e-mail customizado sem FakerLibrary 

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
