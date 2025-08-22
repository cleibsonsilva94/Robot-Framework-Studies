*** Settings ***
Documentation  Essa suite testa o site da Amazon.com.br
Library        SeleniumLibrary
Library        BuiltIn

*** Variables ***

@{PLANETAS_SISTEMA_SOLAR}  Mercúrio  Vênus  Terra  Marte  Júpiter  Saturno  Urano  Netuno
&{DIAS_NO_MES_BANCO}    Janeiro=31    Fevereiro=28    Março=31    Abril=30    Maio=31    Junho=30    Julho=31    Agosto=31    Setembro=30    Outubro=31    Novembro=30    Dezembro=31

*** Test Cases ***
Caso de Teste 01 - Aplicando conhecimento de variáveis na forma de lista 
    Planetas   


Caso de Teste 02 - Aplicando conhecimento de variáveis na forma de Dicionário
    Dias do mês


*** Keywords ***
Planetas
    FOR  ${planeta}  IN  @{PLANETAS_SISTEMA_SOLAR}
        Log To Console    ${planeta}
    END

Dias do mês
    FOR  ${DIAS_NO_MES}  IN  &{DIAS_NO_MES_BANCO}
        Log To Console    ${DIAS_NO_MES}  dias
    END