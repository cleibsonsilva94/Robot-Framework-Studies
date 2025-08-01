*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${URL}  https://www.amazon.com.br/
${TEXT_ELETRONICOS}  //a[@id="nav-logo-sprites"]

*** Keywords ***
Abrir o navegador    
    Open Browser   browser=chrome
    Maximize Browser Window
# Fechar o navegador
#     Close Browser 
Acessar a home page do site Amazon.com.br
    Go To    url=${URL}
    Wait Until Element Is Visible  locator=${TEXT_ELETRONICOS}