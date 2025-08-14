*** Settings **
Documentation  Essa suite testa o site da Amazon.com.br

Resource       amazon_resources.robot
Test Setup     Abrir o navegador
Test Teardown  Fechar o navegador 

*** Test Cases ***
*** Test Cases ***
Caso de Teste 01 - Acessar o menu "Livros"
    Acessar a home page do site Amazon.com.br

    Entrar no menu "Livros"
    Verificar se aparece a frase "Loja de Livros"
    Verifique que o título da página fica "Livros | Amazon.com.br"
    Verificar se aparece a categoria "Kindle Unlimited"

Caso de Teste 02 - Pesquisa de produto
    Acessar a home page do site Amazon.com.br
    Digitar o nome de produto "Do átomo ao buraco negro" no campo de pesquisa
    Clicar no botão de pesquisa
    O sistema deve exibir a tela com o resultado da pesquisa "Do átomo ao buraco negro" listando o produto

Caso de Teste 03 - Adicionar Produto no Carrinho
    Acessar a home page do site Amazon.com.br
    Digitar o nome de produto "Xbox Series S" no campo de pesquisa
    Clicar no botão de pesquisa
    O sistema deve exibir a tela com o resultado da pesquisa "Console Xbox Series S" listando o produto
    Adicionar o produto "Console Xbox Series S" no carrinho
    Direciono-me ao carrinho
    Verificar produto no carrinho    Console Xbox Series S    2.662,99

Caso de Teste 04 - Remover Produto do Carrinho
    Acessar a home page do site Amazon.com.br
    Digitar o nome de produto "Xbox Series S" no campo de pesquisa
    Clicar no botão de pesquisa
    O sistema deve exibir a tela com o resultado da pesquisa "Console Xbox Series S" listando o produto
    Adicionar o produto "Console Xbox Series S" no carrinho
    Direciono-me ao carrinho
    Verificar se o produto "Console Xbox Series S" foi adicionado com sucesso    Console Xbox Series S    2.662,99
    Remover o produto "Console Xbox Series S" do carrinho    
    Verificar se o carrinho fica vazio

# ## 📌 Comandos úteis para rodar testes com Robot Framework

# # =====================[ Execução por TAG ]=====================
# python -m robot -i menus amazonTest\webTest\Tests\amazon_test.robot           # Executa apenas os testes com a tag "menus"
# python -m robot -e menus amazonTest\webTest\Tests\amazon_test.robot           # Executa todos os testes, exceto os que tiverem a tag "menus"

# # =====================[ Execução por NOME do teste ]=====================
# python -m robot --test "nome_do_teste" amazonTest\webTest\Tests\amazon_test.robot     # Executa teste pelo nome exato
# python -m robot -d results/ -t "Caso de Teste 03 - Adicionar Produto no Carrinho" amazonTest\webTest\Tests\    # Executa teste específico e salva resultados na pasta "results"
# python -m robot -d results/ -t "*Adicionar Produto no Carrinho*" amazonTest\webTest\Tests\                     # Executa teste que contenha parte do nome e salva na pasta "results"

# # =====================[ Definição de variáveis na execução ]=====================
# python -m robot -v BROWSER:chrome amazonTest\webTest\Tests\amazon_test.robot          # Troca o browser para Chrome
# python -m robot -v BROWSER:firefox amazonTest\webTest\Tests\amazon_test.robot         # Troca o browser para Firefox
# python -m robot -v URL:https://www.amazon.com.br -v BROWSER:chrome amazonTest\webTest\Tests\amazon_test.robot  # Define URL e browser

# # =====================[ Execução em massa ]=====================
# python -m robot amazonTest\webTest\Tests\                           # Executa todos os testes dentro da pasta especificada
# python -m robot -d results/ amazonTest\webTest\Tests\               # Executa todos os testes e gera relatórios apenas na pasta "results"