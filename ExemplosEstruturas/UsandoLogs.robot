*** Settings ***
Documentation   Suíte de exemplo didático para exemplificar o uso de LOGs nos testes
...             Os LOGs são de grande utilidade, faça LOGs para analisar como seu teste está sendo executado nas entrelinhas
...             Os LOGs te ajudam a encontrar falhas na automação dos seus testes
...             Use LOGs sem moderação!!
Library         SeleniumLibrary

*** Variable ***
@{FRUTAS}   maça  banana  uva  abacaxi

*** Test Case ***
Caso de teste exemplo 01
    Usando LOG para mensagens
    Usando LOG Console
    Usando screenshot

*** Keywords ***
Usando LOG para mensagens
# Primeiro tipo de log: basicamente ele imprime uma informação no terminal. 
# Na linha 22 é setada uma variável e logada logo abaixo. O intuito é mostrar que é possível passar uma variável dentro de um texto.
    Log     Minha mensagem de LOG 
    ${VAR}  Set Variable    variável qualquer
    Log     Posso logar uma ${VAR} no meio de um log

Usando LOG Console
# É possível imprimir apenas no console (linha 27).
# "Log many" é utilizado para imprimir listas. 
    Log To Console      Posso logar na saída do console
    Log Many            Posso logar minha lista completa @{FRUTAS}
    Log                 Posso logar somente itens da minha lista ${FRUTAS[0]} - ${FRUTAS[1]}
# Acima consigo imprimir itens específicos da lista. Lembrando que o índice começa em zero. 
Usando screenshot
    Log     Nos testes web, podemos logar screenshots com a SeleniumLibrary
    Open Browser    http://www.robotizandotestes.blogspot.com.br    chrome
    Capture Page Screenshot      nome_do_meuscreenshot.png
    Close Browser