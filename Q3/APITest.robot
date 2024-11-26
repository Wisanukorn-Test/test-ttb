*** Settings ***
Library    Selenium2Library
Library    RequestsLibrary
Library    JSONLibrary
Library    json


*** Variables ***
# API URL Base
${API_URL}    https://reqres.in/api
${ID}     12
${EMAIL}     rachel.howell@reqres.in
${FIRST_NAME}     Rachel
${LAST_NAME}     Howell
${AVATAR}     https://reqres.in/img/faces/12-image.jpg

*** Test Cases ***

Get User Profile Success
    [Documentation]  To verify get user profile api will return correct data when trying to get profile of existing user
    [Tags]    Get_user_profile
    ${response}=  GET    ${API_URL}/users/${ID}
    Should Be Equal As Strings     ${response.status_code}     200
    ${resp_body}=    Convert String To Json    ${response.content}
    Should Be Equal As Strings   ${resp_body['data']['id']}             ${ID}
    Should Be Equal As Strings   ${resp_body['data']['email']}         ${EMAIL}
    Should Be Equal As Strings    ${resp_body['data']['first_name']}     ${FIRST_NAME}
    Should Be Equal As Strings   ${resp_body['data']['last_name']}     ${LAST_NAME}
    Should Be Equal As Strings    ${resp_body['data']['avatar']}         ${AVATAR}
    Log To Console    ${resp_body}

Get user profile but user not found
    [Documentation]  To verify get user profile api will return 404 not found when trying to get profile of not existing user
    [Tags]    Get_user_profile
    Create Session  Get_user_profile  ${API_URL}
    ${resp}=  Get Request  Get_user_profile    /users/1234
    Should Be Equal As Strings     ${resp.status_code}     404
    Should Be Equal As Strings     ${resp.content}     {}
    Log To Console  ${resp.status_code}
    Log To Console  ${resp.content}
