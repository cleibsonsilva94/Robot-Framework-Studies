*** Settings ***
Documentation   Exemplo de tipos de variáveis: SIMPLES, LISTAS e DICIONÁRIOS
*** Variable ***
#Simples
${SIMPLES}   Vamos ver os tipos de variáveis no robot!

#Tipo Lista (arrays) - separar itens com espaço duplo e começa com o valor "0"
@{FRUTAS}    morango   banana   maça   uva   abacaxi

#Tipo Dicionário (chave=valor) - separar cada chave=valor com espaço duplo
&{PESSOA}    nome=May Fernandes   email=mayfernandes@exemplo.com.br   idade=28   sexo=feminino

*** Test Cases ***
Caso de teste de exemplo 01
    Uma keyword qualquer 01

*** Keywords ***
Uma keyword qualquer 01
    # Lendo um valor Simples
    Log    ${SIMPLES}

    # Lendo um item de uma Lista
    Log    Essa tem que ser maça: ${FRUTAS[2]} e essa tem que ser morango: ${FRUTAS[0]}

    # Lendo chaves de um Dicionário
    Log    Nome: ${PESSOA.nome} e email: ${PESSOA.email}

# # ===========================
# EXPLICAÇÃO SOBRE VARIÁVEIS 2
# =============================
#
# 1) VARIÁVEL SIMPLES (${variavel})
#    - Armazena apenas um valor único (texto, número, etc).
#    - Exemplo: ${SIMPLES} = "Vamos ver os tipos de variáveis no robot!"
#    - Uso comum: guardar uma informação isolada que será reutilizada.
#
# 2) VARIÁVEL DO TIPO LISTA (@{lista})
#    - Funciona como um array: armazena vários valores em sequência.
#    - Cada item pode ser acessado pelo índice, que começa em 0.
#    - Exemplo: @{FRUTAS} = morango, banana, maçã, uva, abacaxi
#    - Uso: ideal para quando precisamos percorrer ou acessar uma coleção de itens.
#      Exemplo de acesso: ${FRUTAS[2]} → "maçã"
#
# 3) VARIÁVEL DO TIPO DICIONÁRIO (&{dicionario})
#    - Armazena pares chave=valor, como em um objeto JSON ou mapa.
#    - Permite acessar valores diretamente pela chave.
#    - Exemplo: &{PESSOA} = nome=May, email=may@exemplo.com, idade=28
#    - Uso: quando precisamos guardar informações relacionadas entre si.
#      Exemplo de acesso: ${PESSOA.nome} → "May"
#
# Em resumo:
# - SIMPLES → Um único valor.
# - LISTA → Conjunto de valores indexados.
# - DICIONÁRIO → Conjunto de valores associados a chaves.