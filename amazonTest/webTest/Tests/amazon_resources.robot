*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${BROWSER}   chrome
${URL}  https://www.amazon.com.br/
${LOGO_AMAZON}  //a[@id="nav-logo-sprites"]
${LIVROS_BUTTON}  //a[contains(text(),'Livros')]
${HEADER_LIVROS}  Loja de Livros
${HEADING_SENTENCE}  //*[contains(text(),'Loja de Livros')]

*** Keywords ***
Abrir o navegador    
    Open Browser  browser=${BROWSER}
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
    Element Should Be Visible  locator=//span[contains(text(), '${PRODUTO}')]

## GHERKIN BDD"
Dado que estou na home page da Amazon.com.br
    Acessar a home page do site Amazon.com.br
Quando acessar o menu "Livros"
    Entrar no menu "Livros"
Então o título da página deve ficar "${TITLE}"
    Verifique que o título da página fica "${TITLE}"
E o texto "Loja de Livros" deve ser exibido na página
    Verificar se aparece a frase "Loja de Livros"
E a categoria "${CATEGORY}" deve ser exibida na página
    Verificar se aparece a categoria "${CATEGORY}"
Verificar o resultado da pesquisa se está listando o produto "${PRODUTO}"
    O sistema deve exibir a tela com o resultado da pesquisa ${PRODUTO} listando o produto
Adicionar o produto "Console Xbox Series S" no carrinho
    Click Element  locator=(//span[contains(text(),'Console Xbox Series S')])[1]
    Click Element  locator=//input[@id="add-to-cart-button"]
    Wait Until Element Is Visible  locator=//div[@id="attach-warranty-display"]
    Wait Until Element Is Visible  locator=(//div[@class="a-button-stack"]//span[contains(text(),' Não, obrigado(a)')])[1]
    Click Element  locator=//span[@id="attachSiNoCoverage"]
Direciono-me ao carrinho
    Wait Until Element Is Visible  locator=//span[@id="attach-sidesheet-view-cart-button-announce"] 
    Click Element  locator=//*[@id="attach-view-cart-button-form"]
Verificar que o produto ${PRODUTOCARRINHO} com o valor ${VALOR} esta no carrinho
    [Arguments]    ${PRODUTOCARRINHO}    ${VALOR}
    ${produto_carrinho}=    Get Text    //span[@class="a-truncate-cut"]
    ${valor_bruto}=         Get Text    (//span[contains(@class,'nowrap')])[1]
    ${valor_limpo}=     Evaluate    re.search(r'\d{1,3}(?:\.\d{3})*,\d{2}', valor_bruto).group(0)    re    valor_bruto=${valor_bruto}

    # Verificação condicional
    IF    '${produto_carrinho}' != '${PRODUTOCARRINHO}' OR '${valor_limpo}' != '${VALOR}'
        Log To Console    \n⚠️ ALERTA: Produto ou valor divergente!
        Log               Produto esperado: ${PRODUTOCARRINHO} | Encontrado: ${produto_carrinho}
        Log               Valor esperado: ${VALOR} | Encontrado: ${valor_limpo}
    ELSE
        Log To Console    \n✅ Produto e valor corretos!
    END
