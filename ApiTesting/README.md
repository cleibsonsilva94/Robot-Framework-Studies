# 📘 Documentação Explicativa das Keywords

---

## 📑 Sumário
- [✨ Explicação da Primeira Keyword (linhas 08 a 14)](#-explicação-da-primeira-keyword-linhas-08-a-14)
- [📝 Explicação da Keyword: Cadastrar o usuário criado na ServeRest (linhas 26 a 39)](#-explicação-da-keyword-cadastrar-o-usuário-criado-na-serverest-linhas-26-a-39)
- [📌 Biblioteca: Collections](#-biblioteca-collections)
- [📌 O que é uma API e seus principais elementos](#-o-que-é-uma-api-e-seus-principais-elementos)
  - [🔑 Principais elementos de uma API](#-principais-elementos-de-uma-api)
- [✅ Resumindo](#-resumindo)

---

## ✨ Explicação da Primeira Keyword (linhas 08 a 14)

### Keyword: Geração de string aleatória e criação de e-mail

1. **`${palavra_aleatoria}  Generate Random String  length=4  chars=[LETTERS]`**
   - **Função:** `Generate Random String`
   - **Origem:** Biblioteca `String`
   - **O que faz:** Gera uma string aleatória com tamanho definido.
   - **Parâmetros usados:**
     - `length=4` → o tamanho da string será de 4 caracteres.  
     - `chars=[LETTERS]` → define que só serão usadas letras (A-Z).  
   - **Exemplo de saída:** `"ABCD"`, `"WXYZ"`

2. **`${palavra_aleatoria}  Convert To Lower Case   ${palavra_aleatoria}`**
   - **Função:** `Convert To Lower Case`
   - **Origem:** Biblioteca `String`
   - **O que faz:** Converte o conteúdo de uma string para letras minúsculas.
   - **Exemplo de entrada:** `"ABCD"` → **saída:** `"abcd"`

3. **`Set Test Variable     ${EMAIL_TESTE}  ${palavra_aleatoria}@emailteste.com`**
   - **Função:** `Set Test Variable`
   - **Origem:** BuiltIn (função interna do Robot Framework)
   - **O que faz:** Cria uma variável no nível de teste que pode ser usada em qualquer parte do caso de teste.  
   - **Exemplo:** Se `${palavra_aleatoria}` = `"abcd"`, então `${EMAIL_TESTE}` será `"abcd@emailteste.com"`.
   - **Observação:** Na linha 36-39, a variável `${resposta}` é local, visível apenas dentro da keyword.  
     Com o `Set Test Variable`, ela se torna **pública/global**.

---

## 📝 Explicação da Keyword: Cadastrar o usuário criado na ServeRest (linhas 26 a 39)

- **`Criar Sessão na ServeRest`**  
  ➝ Chama a keyword responsável por configurar a sessão de comunicação com a API.

- **Comentário:**  
  "Abaixo ele está criando uma nova sessão, só que para enviar dados via POST."

- **`${resposta}  POST On Session`**  
  ➝ Executa uma requisição POST na sessão `ServeRest` e guarda o retorno na variável `${resposta}`.

- **`... alias=ServeRest`**  
  ➝ Informa que a sessão usada será a que tem o alias `ServeRest`.

- **`... url=/usuarios`**  
  ➝ Endpoint da API utilizado para cadastrar novos usuários.

- **`... json=${body}`**  
  ➝ Define o corpo da requisição em formato JSON, contendo nome, email, senha e administrador.

- **`... expected_status=${status_code_desejado}`**  
  ➝ Define qual status HTTP a resposta deve ter (por exemplo: `201` para sucesso).

- **`Log  ${resposta.json()}`**  
  ➝ Exibe no log o conteúdo JSON retornado pela API.

- **`IF  ${resposta.status_code} == 201`**  
  `Set Test Variable    ${ID_USUARIO}  ${resposta.json()["_id"]}`  
  ➝ Se o status for `201 (Created)`, guarda o ID do usuário criado na variável `${ID_USUARIO}`.

- **`Set Test Variable    ${RESPOSTA}    ${resposta.json()}`**  
  ➝ Salva toda a resposta JSON da API na variável `${RESPOSTA}` para ser reutilizada depois.

---

## 📌 Biblioteca: Collections

A biblioteca **Collections** do Robot Framework fornece keywords para manipulação de listas e dicionários.  

📍 **Por que é útil em testes de APIs?**  
- As respostas geralmente vêm em **formato JSON** (objetos e arrays).  
- Com **Collections** é possível acessar, validar e comparar dados retornados pela API de forma simples e organizada.  

---

## 📌 O que é uma API e seus principais elementos

### 🔹 O que é uma API?
- API significa **Application Programming Interface** (Interface de Programação de Aplicações).  
- Analogia: É como um **garçom de restaurante**:
  - Você faz um pedido (**requisição**).
  - A API leva até a cozinha (**servidor**).
  - Depois retorna com a comida pronta (**resposta**).  
- Em resumo: é um conjunto de regras que permite a **comunicação entre sistemas diferentes**.

---

### 🔑 Principais elementos de uma API

1. **Endpoint**
   - Endereço (URL) que indica o recurso que você quer acessar.  
   - Exemplo: `https://serverest.dev/usuarios`  
   - **Analogia:** é como o **número da mesa** no restaurante.

2. **Métodos HTTP**
   - Definem a ação desejada.  
   - Principais:
     - `GET` → Consultar dados  
     - `POST` → Criar um novo recurso  
     - `PUT` → Atualizar um recurso existente  
     - `DELETE` → Excluir um recurso  
   - **Analogia:** é como dizer ao garçom se você quer **pedir**, **alterar** ou **cancelar** um prato.

3. **Headers (cabeçalhos)**
   - Informações adicionais enviadas junto à requisição.  
   - Exemplos:
     - `Content-Type: application/json`
     - `Authorization: Bearer <token>`  
   - **Analogia:** instruções extras ao garçom, como **“sem cebola”** ou **“trazer rápido”**.

4. **Body (corpo da requisição)**
   - Onde você envia dados para **criar ou atualizar** algo.  
   - Exemplo em JSON:
     ```json
     {
       "nome": "Fulano da Silva",
       "email": "fulano@email.com",
       "password": "1234",
       "administrador": true
     }
     ```
   - **Analogia:** a lista de ingredientes que você deseja no prato.

5. **Status Code (código HTTP)**
   - Indica o resultado da requisição.  
   - Exemplos:
     - `200` → Sucesso (OK)  
     - `201` → Criado com sucesso  
     - `400` → Requisição inválida  
     - `401` → Não autorizado  
     - `404` → Não encontrado  
     - `500` → Erro interno do servidor  
   - **Analogia:** o garçom dizendo **“pedido pronto”**, **“não temos esse prato”** ou **“cozinha com problema”**.

6. **Response (resposta)**
   - Retorno enviado pela API após processar a requisição.  
   - Geralmente contém:
     - **Status code**
     - **Headers**
     - **Body** com os dados solicitados ou mensagem.  
   - **Analogia:** é o **prato servido na mesa** depois do pedido.

---

## ✅ Resumindo

- Uma **API** é o meio de comunicação entre sistemas.  
- Você envia uma **requisição** (pedido) para um **endpoint**, com **headers** e possivelmente um **body**.  
- O servidor processa e responde com um **status code** e uma **response** (resposta).  
