*** Settings ***
Resource        ./base.robot
Library         ../../lib/db.py

*** Variables ***
# DataTest
${Title}        Resident Evil
${Status}       Disponível
${Year}         2002
${ReleaseDate}  01/12/2002
@{Cast}         Milla Jovovich      Ali Larter      Ian Glen        Shawn Roberts
${Plot}         Alice tem a missao de desativar a rainha vermelha na colmeia pq alguem jogou um virus e deu ruim

*** Keywords ***
#### Steps
Dado que estou logado com credenciais validas
    Input Text      ${INPUT_EMAIL}         papito@ninjaplus.com
    Input Text      ${INPUT_PASS}          pwd123
    Click Button    ${BUTTON_SUBMIT}

Quando eu faço o cadastro de um novo filme
    Remove Movie By Title               ${Title}
    Click Button                        ${BUTTON_ADD}
    Input Text                          ${INPUT_TITLE}      ${Title}
    Click Element                       ${DROP_STATUS}
    Wait Until Element Is Visible       ${OPTION_AVAILABLE}
    Click Element                       ${OPTION_AVAILABLE}
    Input Text                          ${INPUT_YEAR}       ${Year}
    Input Text                          ${INPUT_RDATE}      ${ReleaseDate}
    : FOR       ${item}    IN   @{Cast}
    \       Input Text      ${INPUT_CAST}       ${item}
    \       Press Keys      ${INPUT_CAST}       TAB
    \       Log             ${item}
    Input Text                          ${TEXT_PLOT}        ${Plot}
    Click Button                        ${BUTTON_SAVE}

Entao este filme deve ser exibido na lista
    Wait Until Element contains         ${TABLE_ITEM}      ${Title}
