*** Settings ***
Resource        ./base.robot

*** Keywords ***
#### Steps
Fazendo login com "${email}" e senha "${pass}"
    Input Text      ${INPUT_EMAIL}         ${email}
    Input Text      ${INPUT_PASS}          ${pass}
    Click Button    ${BUTTON_SUBMIT}

Devo ver o meu nome "${username}" na área logada
    Wait Until Element Contains     ${SPAN_USER}        ${username}

Logando com credenciais inválidas devo ver uma mensagem de alerta

    [Arguments]                     ${email}                ${pass}     ${expect_message}

    Input Text                      ${INPUT_EMAIL}          ${email}
    Input Text                      ${INPUT_PASS}           ${pass}
    Click Button                    ${BUTTON_SUBMIT}
    Wait Until Element Contains     ${DIV_ALERT}            ${expect_message}