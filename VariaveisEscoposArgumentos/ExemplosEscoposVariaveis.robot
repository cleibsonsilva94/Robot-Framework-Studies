*** Settings ***
Documentation   Exemplo de escopo de variáveis: GLOBAIS, SUITE, TESTE (test case) e LOCAL (keyword)
Library         String

*** Variable ***
${GLOBAL_INSTANCIADA}     Minha variável GLOBAL_INSTANCIADA foi instanciada para a suíte

*** Test Cases ***
Caso de teste de exemplo 01
    Uma keyword qualquer 01
    Uma keyword qualquer 02

Caso de teste de exemplo 02
    Uma keyword qualquer 02
    Uma keyword qualquer 03

Caso de teste de exemplo 03
    Uma keyword qualquer 04

*** Keywords ***
Uma keyword qualquer 01
    ${GLOBAL_CRIADA_EM_TEMPO_EXECUCAO}     Generate Random String
    #A variável "global" pode ser utilizada em todas as suítes em execução
    Set Global Variable    ${GLOBAL_CRIADA_EM_TEMPO_EXECUCAO}
    #A variável "suite" pode ser utilizada somente nos testes da suíte em execução
    Set Suite Variable     ${SUITE_CRIADA_EM_TEMPO_EXECUCAO}    Variável da suíte
    #A variável "test" pode ser utilizada somente nas todas as keywords do teste em execução
    Set Test Variable      ${TESTE_01}   Variável do teste 01
    Log         ${TESTE_01}
    #A variável "local" pode ser utilizada somente na keyword em execução
    ${LOCAL}    Set Variable    Variável local da keyword 01
    Log   ${LOCAL}

Uma keyword qualquer 02
    ${LOCAL}     Set Variable    Variável local da keyword 02
    Log    ${LOCAL}
    Log    ${GLOBAL_INSTANCIADA} / ${GLOBAL_CRIADA_EM_TEMPO_EXECUCAO} / ${SUITE_CRIADA_EM_TEMPO_EXECUCAO} / ${LOCAL}
    # A keyword abaixo vai funcionar no Caso de Teste 01 e falhar no Case de Teste 02
    Log    ${TESTE_01}

Uma keyword qualquer 03
    ${LOCAL}     Set Variable    Variável local da keyword 03
    Log    ${LOCAL}
    Log    ${GLOBAL_INSTANCIADA} / ${GLOBAL_CRIADA_EM_TEMPO_EXECUCAO} / ${SUITE_CRIADA_EM_TEMPO_EXECUCAO} / ${LOCAL}

Uma keyword qualquer 04
    ${LOCAL}     Set Variable    Variável local da keyword 04
    Log    ${LOCAL}
    Log    ${GLOBAL_INSTANCIADA} / ${GLOBAL_CRIADA_EM_TEMPO_EXECUCAO} / ${SUITE_CRIADA_EM_TEMPO_EXECUCAO} / ${LOCAL}

# =========================
# EXPLICAÇÃO SOBRE VARIÁVEIS
# =========================

# 1) VARIÁVEL GLOBAL
# - Uma variável GLOBAL pode ser acessada em QUALQUER lugar:
#   - em qualquer suíte de teste
#   - em qualquer caso de teste
#   - em qualquer keyword
# - Ou seja, ela "vive" durante toda a execução do conjunto de testes.
# - Útil para informações que TODOS os testes precisam, como:
#   -> URL base do sistema
#   -> credenciais padrão (se não forem sensíveis)
#   -> configurações comuns
# - Pode ser criada de duas formas:
#   a) Instanciada no início da suíte (no bloco *** Variables ***)
#   b) Criada em tempo de execução com "Set Global Variable"

# 2) VARIÁVEL DE SUITE
# - Uma variável SUITE é acessível em qualquer caso de teste
#   e keyword DENTRO DA MESMA SUITE.
# - Quando termina a suíte, a variável deixa de existir.
# - Serve para compartilhar dados apenas entre os testes daquele arquivo de suíte.
#   Exemplo: token de autenticação gerado só para os testes dessa suíte.
# - Criada em tempo de execução com "Set Suite Variable".

# 3) VARIÁVEL DE TESTE (TEST CASE)
# - Uma variável de TESTE só existe dentro do caso de teste em que foi criada.
# - Todas as keywords chamadas por aquele teste podem usá-la,
#   mas quando o teste termina, a variável desaparece.
# - Serve para dados específicos daquele teste em execução.
#   Exemplo: dados de um usuário de teste criado apenas para esse caso.
# - Criada com "Set Test Variable".

# 4) VARIÁVEL LOCAL (KEYWORD)
# - Uma variável LOCAL só existe dentro da keyword em que foi criada.
# - Fora da keyword, ela não pode ser acessada.
# - É a mais restrita de todas, ideal para variáveis temporárias,
#   como cálculos intermediários ou resultados momentâneos.
# - Criada com "Set Variable" ou atribuindo valor diretamente dentro da keyword.


# =========================
# ANALOGIA PARA FIXAR
# =========================
# Imagine que você está em uma ESCOLA:
# - VARIÁVEL GLOBAL = o "nome da escola" → todo mundo da escola sabe, em todas as turmas.
# - VARIÁVEL SUITE  = o "nome da turma" → todos da mesma turma sabem, mas outra turma não.
# - VARIÁVEL TESTE  = o "trabalho em grupo" → só os alunos daquele grupo (teste) sabem.
# - VARIÁVEL LOCAL  = o "segredo pessoal" → só você (a keyword) sabe, e mais ninguém.