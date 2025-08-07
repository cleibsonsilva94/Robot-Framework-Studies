*** Settings **
Documentation  Essa suite testa o site da Amazon.com.br

Resource       amazon_resources.robot
Test Setup     Abrir o navegador
Test Teardown  Fechar o navegador 

*** Test Cases ***
Test Case 1 - Access to the "Livros" menu
    [Documentation]  Validar resultado da pesquisa por categoria e 
    ...              verificação do retorno de categoria "Kindle Unlimited"
    [Tags]           menus  categorias
    Acessar a home page do site Amazon.com.br    
    Entrar no menu "Livros"
    Verificar se aparece a frase "Loja de Livros"
    Verifique que o título da página fica "Livros | Amazon.com.br"
    Verificar se aparece a categoria "Kindle Unlimited"

Test Case 2 - Product search
    [Documentation]  Validar resultado da pesquisa por produto específico
    [Tags]           busca_produtos lista_busca
    Acessar a home page do site Amazon.com.br
    Digitar o nome de produto "Do átomo ao buraco negro" no campo de pesquisa
    Clicar no botão de pesquisa
    O sistema deve exibir a tela com o resultado da pesquisa "Do átomo ao buraco negro" listando o produto


#     ## 📌 Comandos úteis para rodar testes com Robot Framework

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