*** Settings ***
Documentation  Essa suite testa o site da Amazon.com.br
Library        SeleniumLibrary
Library        BuiltIn
*** Variables ***
${BROWSER}          chrome
${URL}              https://www.amazon.com.br/
${LOGO_AMAZON}      //a[@id="nav-logo-sprites"]
${LIVROS_BUTTON}    //a[contains(text(),'Livros')]
${HEADER_LIVROS}    Loja de Livros
${HEADING_SENTENCE}  //*[contains(text(),'Loja de Livros')]
${PRODUTO_TESTE}    Console Xbox Series S
${VALOR_TESTE}      2.662,99
@{PLANETAS_SISTEMA_SOLAR}  Mercúrio  Vênus  Março  Terra  Marte  Júpiter  Saturno  Urano  Netuno

*** Keywords ***
Abrir o navegador
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
Fechar o navegador
    Capture Page Screenshot
    Close Browser
Acessar a home page do site Amazon.com.br
    Go To    url=${URL}
    Wait Until Element Is Visible  locator=${LOGO_AMAZON}
Entrar no menu "Livros"
    Click Element    ${LIVROS_BUTTON}

Verificar se aparece a frase "Loja de Livros"
    Wait Until Page Contains    ${HEADER_LIVROS}
    Wait Until Element Is Visible    ${HEADING_SENTENCE}

Verifique que o título da página fica "${TITLE}"
    Title Should Be    ${TITLE}

Verificar se aparece a categoria "${CATEGORY}"
    Element Should Be Visible    locator=//div[contains(@class,'container')]/*[@alt="${CATEGORY}"]

Digitar o nome de produto "${PRODUTO}" no campo de pesquisa
    Input Text    //div[contains(@class,'field')]/*[@type="text"]    ${PRODUTO}

Clicar no botão de pesquisa
    Click Button    //input[contains(@id,'search-submit')]

O sistema deve exibir a tela com o resultado da pesquisa ${PRODUTO} listando o produto
    Element Should Be Visible    locator=//span[contains(text(), '${PRODUTO}')]

Adicionar o produto "${PRODUTO}" no carrinho
    Click Element    locator=(//span[contains(text(),'${PRODUTO}')])[1]
    Click Element    //input[@id="add-to-cart-button"]
    Wait Until Element Is Visible    //div[@id="attach-warranty-display"]
    Wait Until Element Is Visible  (//input[@class="a-button-input"])[16]
    Click Button  (//input[@class="a-button-input"])[16]

Direciono-me ao carrinho
    Sleep    1m
    Wait Until Element Is Visible    //span[@id="attach-sidesheet-view-cart-button-announce"]    10s
    Click Element    //*[@id="attach-view-cart-button-form"]

Verificar produto no carrinho
   Wait Until Element Is Visible   //div[contains(text(),'Console Xbox Series S')]    15s
Remover o produto "${PRODUTO}" do carrinho                         # Função (keyword) para remover o produto informado do carrinho
    Wait Until Element Is Visible    //input[@data-feature-id="item-delete-button"]    # Aguarda até que o botão de remover esteja visível na página
    Click Button    //input[@data-feature-id="item-delete-button"]                    # Clica no botão para remover o produto

Verificar se o carrinho fica vazio                                # Função (keyword) para validar que o carrinho está vazio após remoção
    Element Should Not Be Visible    //div[contains(text(),'Console Xbox Series S')]    10s
Dado que estou na home page da Amazon.com.br
    Acessar a home page do site Amazon.com.br
Quando adicionar o produto "${PRODUTO}" no carrinho
    Digitar o nome de produto "${PRODUTO}" no campo de pesquisa
    Clicar no botão de pesquisa
    O sistema deve exibir a tela com o resultado da pesquisa ${PRODUTO} listando o produto
    Adicionar o produto "${PRODUTO}" no carrinho
    Direciono-me ao carrinho
Então o produto "${PRODUTO}" deve ser mostrado no carrinho
    Verificar produto no carrinho

Planetas 
    Log  Os Planetas depois do Astro Rei são ${PLANETAS_SISTEMA_SOLAR}