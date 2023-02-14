*** Settings ***
Library    SeleniumLibrary
Library    BuiltIn
Resource    ../../networkKeywords/common_keywords.robot
Resource    ../../Variables/network_elements_locators.robot
Resource    ../../Variables/commonConfiguration.robot

*** Test Cases ***
Login_to_EMS_EC_Creation
    [Documentation]    Login to EMS and click EC page
    Login_to_ems
    Click Element   ${EC_xpath}
    Wait Until Element Is Visible       ${EC_page_summary}

TC1_Create_Primary_EC
    [Documentation]    create Primary EC
    Create_EC_Page      ${Ec_user_name}     ${Ec_dns_name}      ${Primary_ip}   ${Secondary_ip}
    Replace_Existing_ip_address    ${Primary_ip}

TC2_Create_Secondary_EC
    [Documentation]    Create Secondary EC
    Create_EC_Page    ${Ec_sec_user_name}   ${Ec_sec_dns_name}  ${Secondary_ip1}    ${Secondary_ip2}
    Replace_Existing_ip_address    ${Secondary_ip1}

TC3_Start_Shutdown_EC
    Start_EC_elements   ${Primary_ip}

TC4_Delete_EC
    Delete_EC_Page      ${Primary_ip}



