*** Settings ***
Resource    import.resource


*** Keywords ***
# Open website
Open Website
    [Documentation]    เปิด Website
    Open Browser    ${url}    ${browser_chrome}
    Maximize Browser Window

# Function Login

Input Username In BOX
    [Documentation]    กรอก Username
    [Arguments]    ${username}
    Wait Until Page Contains Element    ${username_input}
    Input Text    ${username_input}    ${username}    clear=True

Input Password In BOX
    [Documentation]     กรอก Password
    [Arguments]    ${password}
    Wait Until Page Contains Element    ${password_input}
    Input Text    ${password_input}    ${password}    clear=True

Click Login Button
    [Documentation]    กดปุ่ม Login
    Wait Until Element Is Visible    ${login_button}
    Click Element    ${login_button}

Click Logout Button
    [Documentation]    กดปุ่ม Logout
    Wait Until Element Is Visible    ${logout_button}
    Click Element    ${logout_button}
