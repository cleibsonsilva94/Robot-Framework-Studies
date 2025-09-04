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


























# *** Explicação da Primeira Keyword ***

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