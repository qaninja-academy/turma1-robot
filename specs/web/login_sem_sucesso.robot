*** Settings ***
Documentation   O usuário informa suas credenciais incorretas e é notificado com uma mensagem de alerta
Resource        ../../resources/web/steps/login.robot
Test Template   Logando com credenciais inválidas devo ver uma mensagem de alerta

# DDT (Data Driven Testing)

Test Setup      Abrir navegador
Test Teardown   Fechar navegador

*** Test Cases ***
Senha inválida              papito@ninjaplus.com        asdfgh      Usuário e/ou senha inválidos
Usuario nao cadastrado      404@yahoo.com               123456      Usuário e/ou senha inválidos
Email nao informado         ${EMPTY}                    abc123      Opps. Cadê o email?
Senha nao informada         papito@ninjaplus.com        ${EMPTY}    Opps. Cadê a senha?