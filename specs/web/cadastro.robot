*** Settings ***
Documentation   Formulário de cadastro de filmes
Resource        ../../resources/web/steps/cadastro.robot

Test Setup      Abrir navegador
Test Teardown   Fechar navegador

*** Test Cases ***
Novo filme
    Dado que estou logado com credenciais validas
    Quando eu faço o cadastro de um novo filme
    Entao este filme deve ser exibido na lista
