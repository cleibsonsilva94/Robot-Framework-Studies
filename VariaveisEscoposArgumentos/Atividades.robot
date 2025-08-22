*** Settings ***
Library        SeleniumLibrary
Library        BuiltIn
*** Variable ***

@{PLANETAS_SISTEMA_SOLAR}  Mercúrio  Vênus  Terra  Marte  Júpiter  Saturno  Urano  Netuno
&{DIAS_NO_MES_BANCO}    
...    Janeiro=31
...    Fevereiro=28    
...    Março=31    
...    Abril=30    
...    Maio=31    
...    Junho=30   
...    Julho=31   
...    Agosto=31    
...    Setembro=30    
...    Outubro=31    
...    Novembro=30    
...    Dezembro=31

*** Test Cases ***
Caso de Teste 01 - Aplicando conhecimento de variáveis na forma de lista 
    Planetas   


Caso de Teste 02 - Aplicando conhecimento de variáveis na forma de Dicionário
    Dias_no_mês


*** Keywords ***
Planetas
    FOR  ${planeta}  IN  @{PLANETAS_SISTEMA_SOLAR}
        Log To Console    ${planeta}
    END

Dias_no_mês
    Log To Console    Janeiro tem:  ${DIAS_NO_MES_BANCO.Janeiro}   dias
    Log To Console    Fevereiro tem:   ${DIAS_NO_MES_BANCO.Fevereiro}   dias
    Log To Console    Março tem:  ${DIAS_NO_MES_BANCO.Março}  dias
    Log To Console    Abril tem: ${DIAS_NO_MES_BANCO.Abril}  dias
    Log To Console    Maio tem:  ${DIAS_NO_MES_BANCO.Maio}  dias
    Log To Console    Junho tem:  ${DIAS_NO_MES_BANCO.Junho}  dias
    Log To Console    Julho tem:  ${DIAS_NO_MES_BANCO.Julho}  dias
    Log To Console    Agosto tem:  ${DIAS_NO_MES_BANCO.Agosto}  dias
    Log To Console    Setembro tem:  ${DIAS_NO_MES_BANCO.Setembro}  dias
    Log To Console    Outubro tem:  ${DIAS_NO_MES_BANCO.Outubro}  dias
    Log To Console    Novembro tem:  ${DIAS_NO_MES_BANCO.Novembro}  dias
    Log To Console    Dezembro tem:  ${DIAS_NO_MES_BANCO.Dezembro}  dias