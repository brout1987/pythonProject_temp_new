*** Settings ***
Library    SeleniumLibrary
Variables  ../Variables/commonConf.py
Variables  ../Variables/allLocators.py
Variables    ../Variables/elementTestData.py

*** Test Cases ***
Login_to_EMS
    Open Browser    ${Ems_log_URL}      ${Browser}
    Set Browser Implicit Wait    5
    Input Text    ${username_xpath}     ${Ems_username}
    Input Password    ${password_xpath}     ${Ems_password}
    Click Button    ${login_xpath}



