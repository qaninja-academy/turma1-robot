*** Settings ***
Resource    ./base_api.robot

*** Test Cases ***
Test: Unique Id
    remove user by email                papito@yahoo.com
    &{user}=                            create dictionary       full_name=Papito   email=papito@yahoo.com  password=vaiplaneta
    ${user_id}=                         post user Return Id     ${user}

    ${response}=                        Delete User             ${user_id}
    ${code}=                            convert to string       ${response.status_code}
    should be equal                     ${code}                 204

Test: User not found
    ${user_id}=                         convert to string       9999
    ${response}=                        Delete User             ${user_id}
    ${code}=                            convert to string       ${response.status_code}
    should be equal                     ${code}                 404
