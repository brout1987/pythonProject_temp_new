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
#    Replace_Existing_xpath      ${Primary_ip}

TC2_Start_Primary_EC
    Start_EC_elements   ${Primary_ip}

TC3_Create_Secondary_EC
    [Documentation]    Create Secondary EC
    Create_EC_Page    ${Ec_sec_user_name}   ${Ec_sec_dns_name}  ${Secondary_ip1}    ${Secondary_ip2}
#    Replace_Existing_xpath  ${Secondary_ip1}

TC4_Start_Secondary_EC
    Start_EC_elements   ${Secondary_ip1}

TC5_Edit_primary_EC
    Edit_ECs_element    ${Primary_ip}

#TC6_Edit_secondary_EC

TC6_Delete_Primary_Secondary_EC
    Delete_EC_Page      ${Primary_ip}
    Delete_EC_Page      ${Secondary_ip1}
    Log     Both Primary and Secondary ECs deleted



