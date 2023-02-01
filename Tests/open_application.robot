*** Settings ***
Library    AppiumLibrary
Resource	objectmaps.robot
*** Variables ***
${APPIUM_SERVER}    http://localhost:4723/wd/hub
${PLATFORM_NAME}    Android
${DEVICE_NAME}    Android Emulator
${APP}       ${CURDIR}\\Sample Android App.apk
${APP_PACKAGE}    com.loginmodule.learning
${APP_ACTIVITY}    com.loginmodule.learning.activities.LoginActivity
*** Test Cases ***
Mobile Test
    Launch Mobile Application
    Login User    test@test.com    password@1234
*** Keywords ***
Launch Mobile Application
    Open Application    ${APPIUM_SERVER}
    ...    platformName=${PLATFORM_NAME}
    ...    deviceName=${DEVICE_NAME}
    ...    app=${APP}
    ...    appPackage=${APP_PACKAGE}
    ...    appActivity=${APP_ACTIVITY}
Login User
    [Arguments]    ${i_email}    ${i_pw}
    Input Text    ${Form.Login.EmailAddress.Txt}    ${i_email}
    Input Text    ${Form.Login.Password.Txt}    ${i_pw}
    Click Element    ${Form.Login.Login.Btn}