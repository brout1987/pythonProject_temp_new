*** Settings ***
Library    SeleniumLibrary
Library    BuiltIn
Resource    ../../networkKeywords/common_keywords.robot
Resource    ../../Variables/commonConfiguration.robot
Resource    ../../Variables/network_elements_locators.robot

*** Test Cases ***
tc1_ice_page_visible
    [Documentation]    ICE page visibility check
    Login_to_ems
    Click Element    ${ice_page_xpath}
    Wait Until Element Is Visible    ${ice_summary_xpath}
    Sleep    2

tc2_create_primary_ice
    [Documentation]    Create primary ICE
    Click Element    ${ice_create_button_xpath}
    Wait Until Element Is Visible    ${ice_details_page_xpath}
    Input Text  ${EC_Name_xpath}   ${ice_user_name}
    Wait Until Element Is Visible    ${ice_type_visible_xpath}
    Click Element    ${ice_type_visible_xpath}
    # Select From List By Value   ${ice_type_visible_xpath}    SIP Gateway ICE
#    Click Element   ${ice_type_xpath}
#    Mouse Down  ${sip_gateway_ice_xpath}
    Click Element    ${sip_gateway_ice_xpath}
    Click Element    ${ice_host_name_xpath}
    Click Element    ${CSPs_host_name_xpath}
    Click Element    ${home_see_xpath}
    Click Element    ${primary_see_xapth}
    Click Element    ${event_collector_dropdown_xpath}
    Click Element    ${primary_ec_xpath}

