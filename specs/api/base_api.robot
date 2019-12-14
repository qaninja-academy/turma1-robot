*** Settings ***
Library     RequestsLibrary
Library     JSONLibrary
Library     Collections
Library     OperatingSystem

Library     ../../resources/lib/db.py

*** Variables ***
${BASE_URL}         http://ninjaplus-api:3000
${ADMIN_USER}       papito@ninjaplus.com
${ADMIN_PASS}       pwd123

*** Keywords ***
Get User
    [Arguments]           ${user_id}

    ${token}=             Get Token               ${ADMIN_USER}   ${ADMIN_PASS}

    create session        nplus                   ${BASE_URL}
    &{headers}=           create dictionary       Content-Type=application/json   Authorization=${token}

    ${response}=          get request             nplus   /user/${user_id}   headers=${headers}
    log                   ${response.text}
    [return]              ${response}

Post User
    [Arguments]           ${body}
    create session        nplus                   ${BASE_URL}
    &{headers}=           create dictionary       Content-Type=application/json

    ${response}=          post request            nplus   /user   data=${body}    headers=${headers}
    log                   ${response.text}
    [return]              ${response}

Post User Return Id
    [Arguments]           ${body}
    create session        nplus                   ${BASE_URL}
    &{headers}=           create dictionary       Content-Type=application/json

    ${response}=          post request            nplus   /user   data=${body}    headers=${headers}
    log                   ${response.text}
    ${user_id}            convert to string       ${response.json()['id']}
    [return]              ${user_id}

Delete User
    [Arguments]           ${user_id}

    ${token}=             Get Token               ${ADMIN_USER}   ${ADMIN_PASS}

    create session        nplus                   ${BASE_URL}
    &{headers}=           create dictionary       Content-Type=application/json   Authorization=${token}

    ${response}=          delete request             nplus   /user/${user_id}   headers=${headers}
    log                   ${response.text}
    [return]              ${response}

Get Token
    [Arguments]           ${email}                 ${pass}

    create session        nplus                   ${BASE_URL}
    &{body}               create dictionary       email=${email}       password=${pass}
    &{headers}=           create dictionary       Content-Type=application/json

    ${response}=          post request            nplus   /auth   data=${body}   headers=${headers}
    log                   ${response.text}
    ${token}              convert to string       JWT ${response.json()['token']}
    [return]              ${token}

Put User
    [Arguments]           ${user_id}                        ${old_data}      ${new_data}

    ${email}=             Get From Dictionary    ${old_data}       email
    ${pass}=              Get From Dictionary    ${old_data}       password

    ${token}=             Get Token                         ${email}   ${pass}

    create session        nplus                             ${BASE_URL}
    &{headers}=           create dictionary                 Content-Type=application/json   Authorization=${token}

    ${response}=          put request                       nplus  /user/${user_id}  data=${new_data}  headers=${headers}
    log                   ${response.text}
    [return]              ${response}