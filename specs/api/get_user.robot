*** Settings ***
Resource    ./base_api.robot

*** Test Cases ***
Test: Unique Id
    ${user_id}=                         convert to string       1
    ${response}=                        Get User                ${user_id}
    ${code}=                            convert to string       ${response.status_code}
    should be equal                     ${code}                 200
    dictionary should contain value     ${response.json()}      Papito
    dictionary should contain value     ${response.json()}      papito@ninjaplus.com

Test: User not found
    ${user_id}=                         convert to string       9999
    ${response}=                        Get User                ${user_id}
    ${code}=                            convert to string       ${response.status_code}
    should be equal                     ${code}                 404

