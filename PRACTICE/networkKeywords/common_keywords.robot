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

Replace_Existing_ip_address
    [Documentation]    Replace_Existing_ip_address and check same IP is craeted or not
    [Arguments]    ${new_Primary_ip}
    ${existing_ECs_IP_new_xpath}=   Replace String    ${existing_ECs_IP_xpath}  \***    ${new_Primary_ip}
    Wait Until Element Is Visible    ${existing_ECs_IP_new_xpath}
    [Return]    ${existing_ECs_IP_new_xpath}

Start_EC_elements
    [Documentation]    shut down ec elements using Replace_Existing_ip_address
    [Arguments]    ${Shutdown_ip_address}
    ${ip}=  Replace_Existing_ip_address     ${Shutdown_ip_address}
    Log    ${ip}
    Click Element    ${ip}
    Click Element    ${EC_start_button_xpath}
    Click Element    ${yes_conformation_xapth}
    Sleep    3

Edit_ECs_element
    [Documentation]    store value in a variable and Edit ECs data
    [Arguments]    ${Edit_ECs_data}
    ${new_ec_variable}=     Replace_Existing_ip_address    ${Edit_ECs_data}
    Click Element    ${new_ec_variable}
    Click Element    ${edit_button_xpath}
    Wait Until Element Is Visible    ${paired_ec_xpath}
    Click Element       ${paired_ec_xpath}
    Mouse Down    ${demo_ip_xpath}
    Click Element    ${demo_ip_xpath}
    Click Button    ${save_button_xpath}
    Sleep    2

Delete_EC_Page
    [Documentation]    before create new EC element check condition and delete EC
    [Arguments]    ${delete_EC}
    ${new_EC_val}=     Replace_Existing_ip_address    ${delete_EC}
    ${new_EC_val1}=     Get Webelements  ${new_EC_val}
    #${val}=     Get Webelement  ${existing_ECs_IP_xpath}
    #${val}=     Get Variables
    log     ${new_EC_val1}
    IF      ${new_EC_val1}
        Sleep    3
        Click Element   ${delete_button_xpath}
        Click Element    ${yes_conformation_xapth}

    END



