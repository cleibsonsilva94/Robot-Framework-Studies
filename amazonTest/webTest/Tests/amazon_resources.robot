*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${URL}  https://www.amazon.com.br/
${LOGO_AMAZON}  //a[@id="nav-logo-sprites"]
${LIVROS_BUTTON}  //a[contains(text(),'Livros')]
${HEADER_LIVROS}  Loja de Livros
${HEADING_SENTENCE}  //*[contains(text(),'Loja de Livros')]

*** Keywords ***
Abrir o navegador    
    Open Browser  browser=chrome
    Maximize Browser Window
Acessar a home page do site Amazon.com.br
    Go To    url=${URL}
    Wait Until Element Is Visible  locator=${LOGO_AMAZON}
Entrar no menu "Livros"
    Click Element  locator=${LIVROS_BUTTON}
Verificar se aparece a frase "Loja de Livros"
    Wait Until page Contains    text=${HEADER_LIVROS} 
    Wait Until Element Is Visible    locator=${HEADING_SENTENCE}