*** Settings **
Documentation  Essa suite testa o site da Amazon.com.br

Resource       amazon_resources.robot
Test Setup     Abrir o navegador
Test Teardown  Fechar o navegador 

*** Test Cases ***

# Acesso ao menu "Livros"
#     Dado que estou na home page da Amazon.com.br
#     Quando acessar o menu "Livros"
#     Então o título da página deve ficar "Livros | Amazon.com.br"
#     E o texto "Loja de Livros" deve ser exibido na página
#     E a categoria "Lançamentos" deve ser exibida na página
        
#     ## 📌 Comandos úteis para rodar testes com Robot Framework

# Caso de Teste 03 - Adicionar Produto no Carrinho
#     [Documentation]    Esse teste verifica a adição de um produto no carrinho de compras
#     [Tags]             adicionar_carrinho
#     Dado que estou na home page da Amazon.com.br
#     Quando adicionar o produto "Console Xbox Series S" no carrinho
#     Então o produto "Console Xbox Series S" deve ser mostrado no carrinho
 
# Caso de Teste 04 - Remover Produto do Carrinho
#     [Documentation]    Esse teste verifica a remoção de um produto no carrinho de compras
#     [Tags]             remover_carrinho
#     Dado que estou na home page da Amazon.com.br
#     E existe o produto "Console Xbox Series S" no carrinho
#     Quando remover o produto "Console Xbox Series S" do carrinho
#     Então o carrinho deve ficar vazio

# # ✅ Rodar testes por TAG
# python -m robot -i menus amazonTest\webTest\Tests\amazon_test.robot         # Executa apenas os testes com a tag "menus"
# python -m robot -e menus amazonTest\webTest\Tests\amazon_test.robot         # Executa todos os testes, exceto os que tiverem a tag "menus"

# # ✅ Rodar teste por NOME
# python -m robot --test "nome_do_teste" amazonTest\webTest\Tests\amazon_test.robot

# # ✅ Trocar o browser (por variável)
# python -m robot -v BROWSER:chrome amazonTest\webTest\Tests\amazon_test.robot
# python -m robot -v BROWSER:firefox amazonTest\webTest\Tests\amazon_test.robot

# # ✅ Definir variáveis diretamente na execução
# python -m robot -v URL:https://www.amazon.com.br -v BROWSER:chrome amazonTest\webTest\Tests\amazon_test.robot

# # ✅ Executar todos os testes dentro de uma pasta
# python -m robot amazonTest\webTest\Tests\

# # ✅ Gerar relatórios em diretórios específicos
# python -m robot -d results/ amazonTest\webTest\Tests\