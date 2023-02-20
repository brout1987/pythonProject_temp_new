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
    Create_ICE_element    ${primary_ice_user_name}  ${csp1_host_value}  primary
    @{args}=    Create List    ${csp1_host_value}  ENABLED
    Run_keyword_n_times_until_succeed    Wait_untl_ice_enabled   ${csp1_host_value}  ENABLED    wait=5s     retries=10

tc3_disabled_primary_ice
    [Documentation]    ice disable status check
    Shutdown_ice_element    ${csp1_host_value}
    Run_keyword_nd_op_state_disable    Wait_until_ice_disabled  ${csp1_host_value}      wait_time=5s    tries=5

tc4_create_secodary_ice
    [Documentation]    Create secondary ICE
    Create_ICE_element    ${secondary_ice_user_name}    ${csp2_host_value}      secondary   ${primary_ice_user_name}
    Run_keyword_n_times_until_succeed   Wait_untl_ice_enabled    ${csp2_host_value}   ENABLED   wait=5s     retries=10

tc5_disabled_secondary_ice
    [Documentation]    secondary ice disabled
    Shutdown_ice_element    ${csp2_host_value}
    Run_keyword_nd_op_state_disable    Wait_until_ice_disabled    ${csp2_host_value}   wait_time=5s    tries=5

#tc6_delete_primary_ice
#    [Documentation]    primary ice deleted
#    Delete_ice_element    ${csp1_host_value}
#
#tc7_delete_secondary_ice
#    [Documentation]    secondary ice deleted
#    Delete_ice_element    ${csp2_host_value}

#tc4_wait_primary_ice_get_enabed
#    [Documentation]    primary ICE status
#    Wait_untl_ice_enabled    ${csp1_host_value}