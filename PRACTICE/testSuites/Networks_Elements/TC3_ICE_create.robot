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
    Create_ICE_element    ${primary_ice_user_name}  ${csp1_host_value}      primary

tc3_create_secodary_ice
    [Documentation]    Create secondary ICE
    Create_ICE_element    ${secondary_ice_user_name}    ${csp2_host_value}      secondary