*** Settings ***
Library    SeleniumLibrary
Library    BuiltIn
Resource    ../../networkKeywords/common_keywords.robot
Resource    ../../Variables/network_elements_locators.robot
Resource    ../../Variables/commonConfiguration.robot

*** Test Cases ***
Login_to_EMS_EC_Creation
    [Documentation] Login to EMS page and EC page check
    Login_to_ems
    Click Element   ${EC_xpath}
    Wait Until Element Is Visible       ${EC_page_summary}

TC1_Create_Primary_EC
    [Documentation]    create Primary EC
    Create_EC_Page      ${Ec_user_name}     ${Ec_dns_name}      ${Primary_ip}   ${Secondary_ip}
    ${existing_ECs_IP_xpath}=   Replace String    ${existing_ECs_IP_xpath}  \***    10.10.40.174
    Wait Until Element Is Visible   ${existing_ECs_IP_xpath}

TC2_Create_Secondary_EC
    [Documentation]    Create Secondary EC
    Create_EC_Page    ${Ec_sec_user_name}   ${Ec_sec_dns_name}  ${Secondary_ip1}    ${Secondary_ip2}

TC2_Start_Shutdown_EC
    ${existing_ECs_IP_xpath}=   Replace String    ${existing_ECs_IP_xpath}  \***    10.10.40.174
    Click Element    ${existing_ECs_IP_xpath}
    Click Element    ${EC_start_button_xpath}
    Click Element    ${yes_conformation_xapth}
    Sleep    5

TC3_Delete_EC
    Delete_EC_Page



