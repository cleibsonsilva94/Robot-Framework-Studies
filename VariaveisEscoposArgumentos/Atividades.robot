*** Settings ***
Documentation  Essa suite testa o site da Amazon.com.br
Library        SeleniumLibrary
Library        BuiltIn

*** Variables ***

@{PLANETAS_SISTEMA_SOLAR}  Mercúrio  Vênus  Terra  Marte  Júpiter  Saturno  Urano  Netuno
&{DIAS_NO_MES_BANCO}    Janeiro=31
...                     Fevereiro=28    
...                     Março=31    
...                     Abril=30    
...                     Maio=31    
...                     Junho=30   
...                     Julho=31   
...                     Agosto=31    
...                     Setembro=30    
...                     Outubro=31    
...                     Novembro=30
...                     Dezembro=31

*** Test Cases ***
Caso de Teste 01 - Aplicando conhecimento de variáveis na forma de lista 
    Planetas   


Caso de Teste 02 - Aplicando conhecimento de variáveis na forma de Dicionário
    Dias no mês


*** Keywords ***
Planetas
    FOR  ${planeta}  IN  @{PLANETAS_SISTEMA_SOLAR}
        Log To Console    ${planeta}
    END

Dias no mês
  Log To Console    JANEIRO TEM ${DIAS_NO_MES_BANCO.Janeiro}  dias
   Log To Console    FEVEREIRO TEM ${DIAS_NO_MES_BANCO.Fevereiro}  dias
   Log To Console    MARÇO TEM ${DIAS_NO_MES_BANCO.Março} dias
   Log To Console    ABRIL TEM ${DIAS_NO_MES_BANCO.Abril} dias
   Log To Console    MAIO TEM ${DIAS_NO_MES_BANCO.Maio} dias
   Log To Console    JUNHO TEM ${DIAS_NO_MES_BANCO.Junho} dias
   Log To Console    JULHO TEM ${DIAS_NO_MES_BANCO.Julho} dias
   Log To Console    AGOSTO TEM ${DIAS_NO_MES_BANCO.Agosto} dias
   Log To Console    SETEMBRO TEM ${DIAS_NO_MES_BANCO.Setembro} dias
   Log To Console    OUTUBRO TEM ${DIAS_NO_MES_BANCO.Outubro} dias
   Log To Console    NOVEMBRO TEM ${DIAS_NO_MES_BANCO.Novembro} dias
   Log To Console    DEZEMBRO TEM ${DIAS_NO_MES_BANCO.Dezembro} dias