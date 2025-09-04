## EXPLICAÇÃO DAS FUNÇÕES USADAS NA PARTE INFERIOR (linha 100)
*** Settings ***
Library  RequestsLibrary
Library  String
Library  Collections

*** Keywords ***
Criar um usuário novo
    ${palavra_aleatoria}  Generate Random String  length=4  chars=[LETTERS] 
    ${palavra_aleatoria}  Convert To Lower Case   ${palavra_aleatoria}
    Set Test Variable     ${EMAIL_TESTE}  ${palavra_aleatoria}@emailteste.com
    Log  ${EMAIL_TESTE}
    Log To Console  ${EMAIL_TESTE} 

Cadastrar o usuário criado na ServeRest
    [Arguments]  ${email}  ${status_code_desejado}
    ${body}  Create Dictionary
    ...      nome=Fulano da Silva
    ...      email=${email}
    ...      password=1234
    ...      administrador=true   
    Log   ${body}
    
    Criar Sessão na ServeRest

    ${resposta}  POST On Session
    ...          alias=ServeRest
    ...          url=/usuarios
    ...          json=${body}
    ...          expected_status=${status_code_desejado}

    Log  ${resposta.json()}
    
    IF  ${resposta.status_code} == 201
        Set Test Variable    ${ID_USUARIO}  ${resposta.json()["_id"]}
    END

    Set Test Variable    ${RESPOSTA}    ${resposta.json()}

Criar Sessão na ServeRest
    ${headers}  Create Dictionary  accept=application/json  Content-Type=application/json
    Create Session    alias=ServeRest    url=https://serverest.dev   headers=${headers}

Conferir se o usuário foi cadastrado corretamente
    Log  ${RESPOSTA}
    Dictionary Should Contain Item  ${RESPOSTA}  message  Cadastro realizado com sucesso
    Dictionary Should Contain Key   ${RESPOSTA}  _id

Vou repetir o cadastro do usuário
    Cadastrar o usuário criado na ServeRest  email=${EMAIL_TESTE}  status_code_desejado=400

Verificar se a API não permitiu o cadastro repetido
    Dictionary Should Contain Item    ${RESPOSTA}    message    Este email já está sendo usado

Consultar os dados do novo usuário
    ${resposta_consulta}  GET On Session  alias=ServeRest  url=/usuarios/${ID_USUARIO}  expected_status=200
   
    # Obtendo as propriedades do objeto response
    Log   ${resposta_consulta.status_code}
    Log   ${resposta_consulta.reason}
    Log   ${resposta_consulta.headers}
    Log   ${resposta_consulta.elapsed}
    Log   ${resposta_consulta.text}
    Log   ${resposta_consulta.json()}
    
    Set Test Variable     ${RESP_CONSULTA}  ${resposta_consulta.json()}

Conferir os dados retornados
    Log   ${RESP_CONSULTA}
    Dictionary Should Contain Item    ${RESP_CONSULTA}    nome            Fulano da Silva
    Dictionary Should Contain Item    ${RESP_CONSULTA}    email           ${EMAIL_TESTE}
    Dictionary Should Contain Item    ${RESP_CONSULTA}    password        1234
    Dictionary Should Contain Item    ${RESP_CONSULTA}    administrador   true
    Dictionary Should Contain Item    ${RESP_CONSULTA}    _id             ${ID_USUARIO}


























# *** Explicação da Primeira Keyword (linhas 08 a 14)***

# ## Keyword: Geração de string aleatória e criação de e-mail
# 1. `${palavra_aleatoria}  Generate Random String  length=4  chars=[LETTERS]`
#    - **Função:** `Generate Random String`
#    - **Origem:** Biblioteca `String`
#    - **O que faz:** Gera uma string aleatória com tamanho definido.  
#    - **Parâmetros usados:**
#      - `length=4` → o tamanho da string será de 4 caracteres.  
#      - `chars=[LETTERS]` → define que só serão usadas letras (A-Z).  
#    - **Exemplo de saída:** `"ABCD"`, `"WXYZ"`.

# 2. `${palavra_aleatoria}  Convert To Lower Case   ${palavra_aleatoria}`
#    - **Função:** `Convert To Lower Case`
#    - **Origem:** Biblioteca `String`
#    - **O que faz:** Converte o conteúdo de uma string para letras minúsculas.  
#    - **Exemplo de entrada:** `"ABCD"` → **saída:** `"abcd"`.

# 3. `Set Test Variable     ${EMAIL_TESTE}  ${palavra_aleatoria}@emailteste.com`
#    - **Função:** `Set Test Variable`
#    - **Origem:** BuiltIn (função interna do Robot Framework)
#    - **O que faz:** Cria uma variável no nível de teste que pode ser usada em qualquer parte do caso de teste.  
#    - **Exemplo:** Se `${palavra_aleatoria}` = `"abcd"`, então `${EMAIL_TESTE}` será `"abcd@emailteste.com"`.

# *** Explicação da Keyword: Cadastrar o usuário criado na ServeRest (linhas 26 a 39) ***

# - `Criar Sessão na ServeRest`
#   ➝ Chama a keyword responsável por configurar a sessão de comunicação com a API.

# - `## Abaixo ele está criando uma nova sessão, só que para enviar dados via POST.`
#   ➝ Comentário que explica que a ação seguinte é uma requisição POST.

# - `${resposta}  POST On Session`
#   ➝ Executa uma requisição POST na sessão `ServeRest` e guarda o retorno na variável `${resposta}`.

# - `... alias=ServeRest`
#   ➝ Informa que a sessão usada será a que tem o alias `ServeRest`.

# - `... url=/usuarios`
#   ➝ Endpoint da API utilizado para cadastrar novos usuários.

# - `... json=${body}`
#   ➝ Define o corpo da requisição em formato JSON, contendo nome, email, senha e administrador.

# - `... expected_status=${status_code_desejado}`
#   ➝ Define qual status HTTP a resposta deve ter (por exemplo: 201 para sucesso).

# - `Log  ${resposta.json()}`
#   ➝ Exibe no log o conteúdo JSON retornado pela API.

# - `IF  ${resposta.status_code} == 201`
#     `Set Test Variable    ${ID_USUARIO}  ${resposta.json()["_id"]}`
#   ➝ Se o status for 201 (criado com sucesso), guarda o ID do usuário criado na variável `${ID_USUARIO}`.

# - `Set Test Variable    ${RESPOSTA}    ${resposta.json()}`
#   ➝ Salva toda a resposta JSON da API na variável `${RESPOSTA}` para ser reutilizada depois.


# ======================================================================
# 📌 O QUE É UMA API E SEUS PRINCIPAIS ELEMENTOS
# ======================================================================

# 🔹 O que é uma API?
# - API significa **Application Programming Interface** (Interface de Programação de Aplicações).
# - É como um "garçom de restaurante": você faz um pedido (requisição) e a API leva até a cozinha (servidor),
#   depois retorna com a comida pronta (resposta).
# - Em resumo, é um conjunto de regras que permite a comunicação entre sistemas diferentes.

# 🔹 Principais Elementos de uma API:

# 1. **Endpoint**
#    - É o endereço (URL) que indica o recurso que você quer acessar.
#    - Exemplo: `https://serverest.dev/usuarios`
#    - Analogia: é como o número da mesa no restaurante para o garçom saber onde entregar o pedido.

# 2. **Métodos HTTP**
#    - Definem a ação que você deseja realizar no recurso.
#    - Principais:
#        - `GET` → Consultar dados.
#        - `POST` → Criar um novo recurso.
#        - `PUT` → Atualizar um recurso existente.
#        - `DELETE` → Excluir um recurso.
#    - Analogia: é como dizer ao garçom se você quer **pedir algo novo**, **alterar um prato** ou **cancelar**.

# 3. **Headers (cabeçalhos)**
#    - São informações adicionais que vão junto com a requisição.
#    - Exemplos:
#        - `Content-Type: application/json` → informa que o corpo está em JSON.
#        - `Authorization: Bearer <token>` → usado para autenticação.
#    - Analogia: é como dar instruções ao garçom, por exemplo "sem cebola", "trazer rápido".

# 4. **Body (corpo da requisição)**
#    - Onde você envia os dados quando cria ou atualiza algo.
#    - Exemplo em JSON:
#        ```json
#        {
#           "nome": "Fulano da Silva",
#           "email": "fulano@email.com",
#           "password": "1234",
#           "administrador": true
#        }
#        ```
#    - Analogia: é como a lista dos ingredientes que você deseja no prato.

# 5. **Status Code (código de status HTTP)**
#    - Indica o resultado da requisição.
#    - Exemplos:
#        - `200` → Sucesso (OK).
#        - `201` → Criado com sucesso.
#        - `400` → Erro do cliente (requisição inválida).
#        - `401` → Não autorizado.
#        - `404` → Recurso não encontrado.
#        - `500` → Erro interno no servidor.
#    - Analogia: é como o garçom voltar dizendo "pedido pronto", "não temos esse prato", ou "cozinha com problema".

# 6. **Response (resposta)**
#    - É o retorno enviado pela API após processar a requisição.
#    - Geralmente contém:
#        - **Status code**
#        - **Headers**
#        - **Body** com os dados solicitados ou mensagem.
#    - Analogia: é o prato que chega na mesa depois do pedido.

# ======================================================================
# ✅ Resumindo:
# Uma API é o meio de comunicação entre sistemas.  
# Você manda uma **requisição** (pedido) para um **endpoint** com **headers** e possivelmente um **body**.  
# O servidor processa e responde com um **status code** e uma **resposta (response)**.  