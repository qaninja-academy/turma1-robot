*** Settings ***
Resource    ./base_api.robot

*** Variables ***
${BASE_URL}         http://ninjaplus-api:3000
${TOKEN}
${OLD_EMAIL}        bart@yahoo.com
${NEW_EMAIL}        bart@gmail.com
${PASS}             pwd123

*** Test Cases ***
Test: Update a new User
    Remove User By Email                    ${OLD_EMAIL}
    Remove User By Email                    ${NEW_EMAIL}

    &{old_data}=                            create dictionary           full_name=Bart  email=bart@yahoo.com    password=vaiplaneta

    ${user_id}=     Post User Return Id     ${old_data}

    &{new_data}=                            create dictionary           full_name=Bart Simpson  email=bart@gmail.com    password=vaiplaneta

    ${response}=                            Put User                    ${user_id}      ${old_data}     ${new_data}
    ${code}=                                convert to string           ${response.status_code}
    should be equal                         ${code}                     200

