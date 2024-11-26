*** Settings ***
Resource    Resources/import.resource
Suite Setup    Open Website


*** Test Cases ***
Login Success
    [Documentation]    To verify that a user can log in successfully when they put a correct username and password.
    [Tags]    Login_Feature     success
    Input Username    ${INPUT_USERNAME_PASS}
    Input Password    ${INPUT_PASSWORD_PASS}
    Click Login Button
    Wait Until Element Contains    ${msg_error}    ${msg_login_success}
    Click Logout Button
    Wait Until Element Contains    ${msg_error}    ${msg_logout_success}

Login Failed - Password Incorrect
    [Documentation]  To verify that a user can login unsuccessfully when they put a correct username but wrong password.
    [Tags]    Login_Feature    fail
    Input Username    ${INPUT_USERNAME_PASS}
    Input Password    ${INPUT_PASSWORD_FAIL}
    Click Login Button
    Wait Until Element Contains    ${msg_error}    ${msg_password_fail}

Login Failed - Username Not Found
    [Documentation]    To verify that a user can login unsuccessfully when they put a username that did not exist.
    [Tags]    Login_Feature    fail
    Input Username    ${INPUT_USERNAME_FAIL}
    Press Keys    ${username_input}    CTRL+A+BACKSPACE
    Input Password    ${INPUT_PASSWORD_PASS}
    Click Login Button
    Wait Until Element Contains    ${msg_error}    ${msg_username_fail}
