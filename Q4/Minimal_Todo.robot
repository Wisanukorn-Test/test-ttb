*** Settings ***
Library           AppiumLibrary

*** Variables ***
${REMOTE_URL}      http://127.0.0.1:4723/wd/hub
${PLATFORM_NAME}   Android
${DEVICE_NAME}     emulator-5554
${APP_PATH}       C:/test_ttb/Q4/Minimal-Todo.apk
${AUTOMATION_NAME}  UiAutomator2

# Locator
${addToDoItemFAB_BTN}        //android.widget.ImageView[@resource-id="com.avjindersinghsekhon.minimaltodo:id/addToDoItemFAB"]
${userToDoEditText}        //android.widget.EditText[@resource-id="com.avjindersinghsekhon.minimaltodo:id/userToDoEditText"]
${DateSwitch}            //android.widget.Switch[@resource-id="com.avjindersinghsekhon.minimaltodo:id/toDoHasDateSwitchCompat"]
${ActionButton}        //android.widget.ImageView[@resource-id="com.avjindersinghsekhon.minimaltodo:id/makeToDoFloatingActionButton"]
${newTodoDateEditText}    //android.widget.EditText[@resource-id="com.avjindersinghsekhon.minimaltodo:id/newTodoDateEditText"]
${newTodoTimeEditText}                //android.widget.EditText[@resource-id="com.avjindersinghsekhon.minimaltodo:id/newTodoTimeEditText"]
${select_date}                            //android.view.View[@content-desc="29 November 2024"]
${select_date_2}                          //android.view.View[@content-desc="30 November 2024"]
${OK_BTN}                        //android.widget.Button[@resource-id="com.avjindersinghsekhon.minimaltodo:id/ok"]
${hour_text}                //android.widget.Button[@resource-id="com.avjindersinghsekhon.minimaltodo:id/hours"]
${mins_text}                //android.widget.Button[@resource-id="com.avjindersinghsekhon.minimaltodo:id/minutes"]
${Title_todo}            com.avjindersinghsekhon.minimaltodo:id/toDoListItemTextview
${Time_todo}            com.avjindersinghsekhon.minimaltodo:id/todoListItemTimeTextView
${listitem}    com.avjindersinghsekhon.minimaltodo:id/listItemLinearLayout
${error_message_date_past}        com.avjindersinghsekhon.minimaltodo:id/newToDoDateTimeReminderTextView

*** Test Cases ***

Add New Task With No Date And Time
    [Documentation]    สร้างรายการ New Task โดยไม่ระบุ Date และ เวลา
    Open Application    ${REMOTE_URL}    platformName=${PLATFORM_NAME}    deviceName=${DEVICE_NAME}    app=${APP_PATH}    automationName=${AUTOMATION_NAME}
    Wait Until Element Is Visible    ${addToDoItemFAB_BTN}
    Click Element    ${addToDoItemFAB_BTN}
    Wait Until Element Is Visible    ${userToDoEditText}
    Input Text    ${userToDoEditText}    Test
    Click Element    ${ActionButton}
    Wait Until Element Is Visible    ${Title_todo}
    Element Should Contain Text    ${Title_todo}    Test
    [Teardown]       Close Application

Add New Task With Date
    [Documentation]    สร้างรายการ New Task โดยระบุ Date
    Open Application    ${REMOTE_URL}    platformName=${PLATFORM_NAME}    deviceName=${DEVICE_NAME}    app=${APP_PATH}    automationName=${AUTOMATION_NAME}
    Wait Until Element Is Visible    ${addToDoItemFAB_BTN}
    Click Element    ${addToDoItemFAB_BTN}
    Wait Until Element Is Visible    ${userToDoEditText}
    Input Text    ${userToDoEditText}    Test_2
    Click Element    ${DateSwitch}
    # เลือก Date
    Click Element    ${newTodoDateEditText}
    Wait Until Element Is Visible   ${select_date} 
    Click Element    ${select_date}
    Click Element    ${OK_BTN}
    Click Element    ${ActionButton}
    Wait Until Element Is Visible    ${Title_todo}
    Element Should Contain Text    ${Title_todo}    Test_2
    Element Should Contain Text    ${Time_todo}    Nov 29, 2024
    [Teardown]       Close Application

Edit Task
    [Documentation]    แก้ไขรายการ Task แก้ไขทั้ง Title, Date and Time
    Open Application    ${REMOTE_URL}    platformName=${PLATFORM_NAME}    deviceName=${DEVICE_NAME}    app=${APP_PATH}    automationName=${AUTOMATION_NAME}
    Wait Until Element Is Visible    ${addToDoItemFAB_BTN}
    Click Element    ${addToDoItemFAB_BTN}
    Wait Until Element Is Visible    ${userToDoEditText}
    Input Text    ${userToDoEditText}    Test_3
    Click Element    ${DateSwitch}
    # เลือก Date
    Click Element    ${newTodoDateEditText}
    Wait Until Element Is Visible   ${select_date} 
    Click Element    ${select_date}
    Click Element    ${OK_BTN}
    Click Element    ${ActionButton}
    Wait Until Element Is Visible    ${Title_todo}
    Element Should Contain Text    ${Title_todo}    Test_3
    Element Should Contain Text    ${Time_todo}    Nov 29, 2024
    Click Element    ${listitem}
    Wait Until Element Is Visible    ${userToDoEditText}
    Clear Text    ${userToDoEditText}
    Input Text    ${userToDoEditText}    Test_4
    # เลือก Date
    Click Element    ${newTodoDateEditText}
    Wait Until Element Is Visible    ${select_date_2}
    Click Element    ${select_date_2}
    Click Element    ${OK_BTN}
    Click Element    ${ActionButton}
    Wait Until Element Is Visible    ${Title_todo}
    Element Should Contain Text    ${Title_todo}    Test_4
    Element Should Contain Text    ${Time_todo}    Nov 30, 2024

Case: Add Task Not Complete
    [Documentation]    กรณีสร้างรายการ Fail
    Open Application    ${REMOTE_URL}    platformName=${PLATFORM_NAME}    deviceName=${DEVICE_NAME}    app=${APP_PATH}    automationName=${AUTOMATION_NAME}
    Wait Until Element Is Visible    ${addToDoItemFAB_BTN}
    Click Element    ${addToDoItemFAB_BTN}
    Wait Until Element Is Visible    ${userToDoEditText}
    Input Text    ${userToDoEditText}    Test_5
    Click Element    ${DateSwitch}
    Click Element    ${newTodoTimeEditText}
    Wait Until Element Is Visible    ${OK_BTN}
    Click Element    ${OK_BTN}
    Wait Until Element Is Visible    ${error_message_date_past}
    Element Should Contain Text    ${error_message_date_past}    The date you entered is in the past.