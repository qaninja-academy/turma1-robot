*** Settings ***
Documentation   O usuário informa suas credenciais de acesso e vai para a area logada
Resource        ../../resources/web/steps/login.robot


Test Setup      Abrir navegador
Test Teardown   Fechar navegador

*** Test Cases ***
Login com sucesso
    Fazendo login com "papito@ninjaplus.com" e senha "pwd123"
    Devo ver o meu nome "Papito" na área logada


