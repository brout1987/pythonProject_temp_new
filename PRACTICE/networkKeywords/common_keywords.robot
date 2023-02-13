*** Settings ***
Library     SeleniumLibrary
Library     BuiltIn
Library    String
Resource    ../Variables/network_elements_locators.robot
#Variables    ../Variables/network_element_Locators.py
Resource    ../Variables/commonConfiguration.robot




*** Keywords ***
Login_to_ems
    [Documentation]    Open url and Login to ems and Maximize browser
    #${wait_time}=   Get Selenium Implicit Wait
    Open Browser    ${Ems_log_URL}    ${Browser}
    Maximize Browser Window
    Set Selenium Implicit Wait    5 second
    Input Text    ${username_xpath}     ${Ems_username}
    Input Password    ${password_xpath}     ${Ems_password}
    Click Button    ${login_xpath}
    Title Should Be     ${ems_window_title}
    #Log To Console    ${wait_time}
    Sleep    3
    Click Image     ${new_gui_xpath}
    Wait Until Keyword Succeeds     5s  10s     Switch Window    ${newEms_window_title}
    Sleep    3
    #Wait Until Element Contains     ${newEms_window_title}
    #Wait       Switch Browser           ${newEms_window_title}

Create_EC_Page
        [Arguments]    ${Ec1_user_name}     ${Ec1_dns_name}     ${Primary1_ip}      ${Secondar1_ip}
        Click Button    ${create_buttom_xpath}
        Input Text      ${EC_Name_xpath}    ${Ec1_user_name}
        Input Text      ${EC_DNS_Name_xpath}    ${Ec1_dns_name}
        Input Text      ${EC_primary_addr_xpath}    ${Primary1_ip}
        Input Text      ${EC_secondary_addr_xpath}      ${Secondar1_ip}
        Click Button    ${save_button_xpath}

Delete_EC_Page
    [Documentation]    before create new EC element check condition
    ${existing_ECs_IP_new_xpath}=   Replace String    ${existing_ECs_IP_xpath}  \***    ${Primary_ip}
    ${val}=     Get Webelements  ${existing_ECs_IP_new_xpath}
    #${val}=     Get Webelement  ${existing_ECs_IP_xpath}
    #${val}=     Get Variables
    log     ${val}
    IF      ${val}
        Click Element   ${delete_button_xpath}
        Click Element    ${yes_conformation_xapth}

    END



