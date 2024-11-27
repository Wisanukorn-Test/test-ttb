*** Settings ***
Library           AppiumLibrary

*** Variables ***
${PLATFORM_NAME}    Android
${DEVICE_NAME}      emulator-5554
${APP}              /path/to/Minimal-Todo.apk
${URL}              http://localhost:4723/wd/hub

*** Test Cases ***

Add New Task
    Open Application    ${URL}    platformName=${PLATFORM_NAME}    deviceName=${DEVICE_NAME}    app=${APP}
    Click Element    id=com.example:id/fab
    Input Text       id=com.example:id/taskInput    Buy Groceries
    Click Element    id=com.example:id/saveButton
    Element Text Should Be    id=com.example:id/taskTitle    Buy Groceries
    [Teardown]       Close Application

Edit Task
    Open Application    ${URL}    platformName=${PLATFORM_NAME}    deviceName=${DEVICE_NAME}    app=${APP}
    Click Element    id=com.example:id/taskTitle
    Input Text       id=com.example:id/taskInput    Buy Milk
    Click Element    id=com.example:id/saveButton
    Element Text Should Be    id=com.example:id/taskTitle    Buy Milk
    [Teardown]       Close Application

Delete Task
    Open Application    ${URL}    platformName=${PLATFORM_NAME}    deviceName=${DEVICE_NAME}    app=${APP}
    Click Element    id=com.example:id/deleteButton
    Confirm Deletion    id=com.example:id/confirmDelete
    [Teardown]       Close Application

Mark Task as Done
    Open Application    ${URL}    platformName=${PLATFORM_NAME}    deviceName=${DEVICE_NAME}    app=${APP}
    Click Element    id=com.example:id/taskTitle
    Click Element    id=com.example:id/markDone
    Element Should Contain    id=com.example:id/taskStatus    Done
    [Teardown]       Close Application
