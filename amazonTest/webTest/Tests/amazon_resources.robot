*** Settings ***
Documentation  Essa suite testa o site da Amazon.com.br
Library        SeleniumLibrary
Library        BuiltIn

Test Setup     Abrir o navegador
Test Teardown  Fechar o navegador

*** Variables ***
${BROWSER}          chrome
${URL}              https://www.amazon.com.br/
${LOGO_AMAZON}      //a[@id="nav-logo-sprites"]
${LIVROS_BUTTON}    //a[contains(text(),'Livros')]
${HEADER_LIVROS}    Loja de Livros
${HEADING_SENTENCE}  //*[contains(text(),'Loja de Livros')]
${PRODUTO_TESTE}    Console Xbox Series S
${VALOR_TESTE}      2.662,99

*** Keywords ***
Abrir o navegador
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Wait Until Element Is Visible    ${LOGO_AMAZON}

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
    Element Should Be Visible    xpath=//div[contains(@class,'container')]/*[@alt="${CATEGORY}"]

Digitar o nome de produto "${PRODUTO}" no campo de pesquisa
    Input Text    //div[contains(@class,'field')]/*[@type="text"]    ${PRODUTO}

Clicar no botão de pesquisa
    Click Button    //input[contains(@id,'search-submit')]

O sistema deve exibir a tela com o resultado da pesquisa ${PRODUTO} listando o produto
    Element Should Be Visible    xpath=//span[contains(text(), '${PRODUTO}')]

Adicionar o produto "${PRODUTO}" no carrinho
    Click Element    xpath=(//span[contains(text(),'${PRODUTO}')])[1]
    Click Element    //input[@id="add-to-cart-button"]
    Wait Until Element Is Visible    //div[@id="attach-warranty-display"]
    Click Element    //span[@id="attachSiNoCoverage"]

Direciono-me ao carrinho
    Wait Until Element Is Visible    //span[@id="attach-sidesheet-view-cart-button-announce"]
    Click Element    //*[@id="attach-view-cart-button-form"]

Verificar produto no carrinho
    [Arguments]    ${PRODUTOCARRINHO}    ${VALOR}
    ${produto_carrinho}=    Get Text    //span[@class="a-truncate-cut"]
    ${valor_bruto}=         Get Text    (//span[contains(@class,'nowrap')])[1]
    ${valor_limpo}=         Evaluate    re.search(r'\d{1,3}(?:\.\d{3})*,\d{2}', '''${valor_bruto}''').group(0)    modules=re

    Run Keyword If    '${produto_carrinho}' != '${PRODUTOCARRINHO}' or '${valor_limpo}' != '${VALOR}'
    ...    Fail    ⚠️ ALERTA: Produto ou valor divergente!\nProduto esperado: ${PRODUTOCARRINHO} | Encontrado: ${produto_carrinho}\nValor esperado: ${VALOR} | Encontrado: ${valor_limpo}
    Log To Console    \n✅ Produto e valor corretos!

Verificar se o produto "${PRODUTO}" foi adicionado com sucesso    # Função (keyword) que recebe o nome e valor do produto e verifica se ele foi adicionado ao carrinho
    [Arguments]    ${PRODUTO}    ${VALOR}                          # Define os argumentos que serão recebidos: nome do produto e valor
    Verificar produto no carrinho    ${PRODUTO}    ${VALOR}        # Chama outra keyword para conferir se o produto e valor estão corretos no carrinho

Remover o produto "${PRODUTO}" do carrinho                         # Função (keyword) para remover o produto informado do carrinho
    Wait Until Element Is Visible    //input[@data-feature-id="item-delete-button"]    # Aguarda até que o botão de remover esteja visível na página
    Click Button    //input[@data-feature-id="item-delete-button"]                    # Clica no botão para remover o produto

Verificar se o carrinho fica vazio                                 # Função (keyword) para validar que o carrinho está vazio após remoção
    ${ItensNoCarrinho}=    Get Text    xpath=//a[@id="nav-cart"]//span[contains(@class,'nav-cart-count')]    # Obtém o número de itens no carrinho
    Should Be Equal As Integers    ${ItensNoCarrinho}    0          # Verifica se a quantidade de itens é igual a zero (carrinho vazio)
    Wait Until Page Does Not Contain Element    xpath=//span[contains(text(),'${PRODUTO_TESTE}')]    timeout=5s    # Aguarda até que o produto não esteja mais listado na página
    Log To Console    \n✅ O carrinho está vazio e o produto não está presente!        # Exibe mensagem de sucesso no console