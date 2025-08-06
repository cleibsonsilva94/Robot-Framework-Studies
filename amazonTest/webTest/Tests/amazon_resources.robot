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
Fechar o navegador
    Capture Page Screenshot
    Close Browser
Acessar a home page do site Amazon.com.br
    Go To    url=${URL}
    Wait Until Element Is Visible  locator=${LOGO_AMAZON}
Entrar no menu "Livros"
    Click Element  locator=${LIVROS_BUTTON}
Verificar se aparece a frase "Loja de Livros"
    Wait Until page Contains    text=${HEADER_LIVROS} 
    Wait Until Element Is Visible    locator=${HEADING_SENTENCE}
Verifique que o título da página fica "${TITLE}"
    Title Should Be    title=${TITLE}
Verificar se aparece a categoria "${CATEGORY}"
    Element Should Be Visible  locator=//div[contains(@class,'container')]/*[@alt="${CATEGORY}"]
Digitar o nome de produto "${PRODUTO}" no campo de pesquisa
    Input Text  //div[contains(@class,'field')]/*[@type="text"]  ${PRODUTO}
Clicar no botão de pesquisa
    Click Button  locator=//input[contains(@id,'search-submit')]
O sistema deve exibir a tela com o resultado da pesquisa ${PRODUTO} listando o produto
    Element Should Be Visible  locator=//div[@id="search"]/*[contains(text(), '${PRODUTO}')]