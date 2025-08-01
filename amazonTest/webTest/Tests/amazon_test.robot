*** Settings **
Documentation  Essa suite testa o site da Amazon.com.br

Resource       amazon_resources.robot
Test Setup     Abrir o navegador
Test Teardown  Fechar o navegador

*** Test Cases ***
Test Case 1 - Access to the "Electronics" menu
    [Documentation]  Validar resultado da pesquisa por categoria e 
    ...              verificação do retorno de categoria "Computadores e Informática"
    [Tags]           menus  categorias
    Acessar a home page do site Amazon.com.br
    Entrar no menu "Eletrônicos"
    
    Verificar se o título da página fica "Eletrônicos e Tecnologia"
    Verificar se aparece a frase "Eletrônicos e Tecnologia"
    Verificar se aparece a categoria "Computadores e Informática"

Test Case 2 - Product search
    [Documentation]  Validar resultado da pesquisa por produto específico
    [Tags]           busca_produtos lista_busca
    Acessar a home page do site Amazon.com.br
    Digitar o nome de produto "Xbox Series S" no campo de pesquisa
    Clicar no botão de pesquisa

    O site deve ser aberto corretamente
    O sistema deve exibir a tela com o resultado da pesquisa, listando o produto pesquisado (conferir um)
