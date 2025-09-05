# 📘 Guia Didático sobre Variáveis no Robot Framework

Este documento explica os diferentes tipos de variáveis no **Robot Framework**, suas formas de criação, escopo, utilidade e exemplos práticos.  

---

## 📑 Sumário

1. [Tipos de Escopo de Variáveis](#-tipos-de-escopo-de-variáveis)  
   1.1 [Variável Global](#1-variável-global)  
   1.2 [Variável de Suíte](#2-variável-de-suíte)  
   1.3 [Variável de Teste (Test Case)](#3-variável-de-teste-test-case)  
   1.4 [Variável Local (Keyword)](#4-variável-local-keyword)  
   1.5 [Analogia para Fixar](#-analogia-para-fixar)  
2. [Tipos de Estruturas de Variáveis](#-tipos-de-estruturas-de-variáveis)  
   2.1 [Variável Simples `${variavel}`](#1-variável-simples-variavel)  
   2.2 [Variável de Lista `@{lista}`](#2-lista-)  
   2.3 [Dicionário `&{}`](#3-dicionário-)  
3. [Resumo](#-resumo)  

---

## 🔹 Tipos de Escopo de Variáveis

### 1) **Variável Global**
- Pode ser acessada em **qualquer lugar**:
  - Em qualquer suíte de teste  
  - Em qualquer caso de teste  
  - Em qualquer keyword  
- **Duração:** existe durante toda a execução da automação.  
- **Utilidade:** guardar informações que **todos os testes precisam**, como:  
  - URL base do sistema  
  - Credenciais padrão (não sensíveis)  
  - Configurações gerais  
- **Formas de criação:**
  - Declarada no início da suíte (`*** Variables ***`)  
  - Criada em tempo de execução com `Set Global Variable`

### 2) **Variável de Suíte**
- Acessível em **qualquer caso de teste e keyword**, mas **apenas dentro da mesma suíte**.  
- **Duração:** desaparece ao final da execução da suíte.  
- **Utilidade:** compartilhar dados apenas entre os testes daquele arquivo.  
  - Exemplo: **token de autenticação** válido somente para os testes da suíte.  
- **Forma de criação:** `Set Suite Variable`

### 3) **Variável de Teste (Test Case)**
- Existe somente dentro do **caso de teste em que foi criada**.  
- Todas as keywords chamadas por esse teste podem acessá-la.  
- **Duração:** desaparece ao final do teste.  
- **Utilidade:** dados específicos de um teste.  
  - Exemplo: dados de um **usuário de teste** criado apenas para esse caso.  
- **Forma de criação:** `Set Test Variable`

### 4) **Variável Local (Keyword)**
- Só existe dentro da **keyword** em que foi criada.  
- **Duração:** desaparece ao término da keyword.  
- **Utilidade:** variáveis temporárias, como:  
  - Cálculos intermediários  
  - Resultados momentâneos  
- **Formas de criação:**  
  - `Set Variable`  
  - Atribuição direta dentro da keyword  

## 🎓 Analogia para Fixar

Imagine uma **escola**:

- **Variável Global** = *nome da escola* → todos os alunos e turmas sabem.  
- **Variável de Suíte** = *nome da turma* → apenas os alunos daquela turma sabem.  
- **Variável de Teste** = *trabalho em grupo* → só os alunos daquele grupo sabem.  
- **Variável Local** = *segredo pessoal* → só você (a keyword) sabe.  

## 🔹 Tipos de Estruturas de Variáveis

### 1) **Variável Simples `${variavel}`**
- Armazena **um único valor** (texto, número etc.).  
- **Exemplo:**
Log  ${MENSAGEM}   # Ex.: "Vamos aprender variáveis no Robot!"

### 2) **Variável de Lista `@{lista}`**
- Funciona como um **array**, armazenando vários valores em sequência.  
- Cada item é acessado por **índice** (começando em 0).  
- **Exemplo:**
@{FRUTAS} =  morango  banana  maçã  uva  abacaxi  
Log  ${FRUTAS[2]}   # Resultado: maçã  
- 🔹 **Uso:** percorrer ou acessar coleções de itens.

### 3) **Dicionário `&{dicionario}`**
- Armazena dados no formato **chave=valor**, como em JSON ou Map.  
- Permite acessar valores diretamente pela **chave**.  
- **Exemplo:**
&{PESSOA} =  nome=May  email=may@exemplo.com  idade=28  
Log  ${PESSOA.nome}   # Resultado: May  
- 🔹 **Uso:** quando precisamos guardar informações relacionadas.

## 📝 Resumo
- **SIMPLES `${}`** → um único valor.  
- **LISTA `@{}`** → coleção de valores indexados.  
- **DICIONÁRIO `&{}`** → coleção de pares chave=valor.
