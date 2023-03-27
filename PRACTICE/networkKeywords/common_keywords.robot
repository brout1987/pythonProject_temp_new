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
    Set Screenshot Directory    ../../Logs
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
Close_Browser
        Close All Browsers

Create_EC_Page
        [Arguments]    ${Ec1_user_name}     ${Ec1_dns_name}     ${Primary1_ip}      ${Secondar1_ip}
        Click Button    ${create_buttom_xpath}
        Input Text      ${EC_Name_xpath}    ${Ec1_user_name}
        Input Text      ${EC_DNS_Name_xpath}    ${Ec1_dns_name}
        Input Text      ${EC_primary_addr_xpath}    ${Primary1_ip}
        Input Text      ${EC_secondary_addr_xpath}      ${Secondar1_ip}
        Click Button    ${save_button_xpath}

Replace_Existing_xpath
    [Documentation]
    [Arguments]    ${xpath}     ${value}
    ${new_xpath}=   Replace String    ${xpath}  \***    ${value}
    Wait Until Element Is Visible    ${new_xpath}
    [Return]    ${new_xpath}

Start_EC_elements
    [Documentation]    Start ec element
    [Arguments]    ${start_ec}
    ${ip}=  Replace_Existing_xpath    ${ECs_IP_xpath}     ${start_ec}
    Log    ${ip}
    Click Element    ${ip}
    Click Element    ${EC_start_button_xpath}
    Click Element    ${yes_conformation_xapth}
    Sleep    3

Edit_ECs_element
    [Documentation]    store value in a variable and Edit ECs data
    [Arguments]    ${Edit_ECs_data}
    ${new_ec_variable}=     Replace_Existing_xpath  ${ECs_IP_xpath}     ${Edit_ECs_data}
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
    ${new_EC_val}=     Replace_Existing_xpath   ${ECs_IP_xpath}  ${delete_EC}
    ${new_EC_val1}=     Get Webelements  ${new_EC_val}
    #${val}=     Get Webelement  ${existing_ECs_IP_xpath}
    #${val}=     Get Variables
    log     ${new_EC_val1}
    IF      ${new_EC_val1}
        Sleep    3
        Click Element   ${delete_button_xpath}
        Click Element    ${yes_conformation_xapth}

    END

Create_ICE_element
    [Documentation]    Create ICE
    [Arguments]    ${ice_user_name}     ${csp_host_name}    ${ice_type}     ${ice_primary_name_val}=None
    Click Element    ${ice_create_button_xpath}
    Wait Until Element Is Visible    ${ice_details_page_xpath}
    Input Text  ${EC_Name_xpath}   ${ice_user_name}
    Wait Until Element Is Visible    ${ice_type_visible_xpath}
    Click Element    ${ice_type_visible_xpath}
    log     Click on SIP gateway ICE
    Wait Until Keyword Succeeds    5s   10s     Click Element   ${sip_gateway_ice_xpath}
    Click Element    ${ice_host_name_xpath}
    ${csp_hn_xpath}     Replace_Existing_xpath    ${csp_host_name_xpath}     ${csp_host_name}
    Log    ${csp_hn_xpath}
    Click Element    ${csp_hn_xpath}
    Click Element    ${home_see_xpath}
    Click Element    ${primary_see_xapth}
    Click Element    ${ec_dropdown_xpath}
    Click Element    ${primary_ec_xpath}
    Page Should Contain Radio Button    IsPrimary
#    Click Element    ${cdr_manager_xpath}
#    Click Button
    IF  '${ice_type}' == 'primary'

        #Select Radio Button    IsPrimary  off
        Radio Button Should Be Set To   IsPrimary  on
        Click Button    ${save_button_xpath}
        Sleep    1
    ELSE
        Sleep    1
        Click Element    ${secondary_ice_radio_btn_xpath}
        Wait Until Element Is Visible    ${primary_ice_selection_xpath}
        Click Element    ${primary_ice_selection_xpath}
        ${new_ice_val}    Replace_Existing_xpath    ${csp_host_name_xpath}   ${ice_primary_name_val}
        Click Element    ${new_ice_val}
        Click Button    ${save_button_xpath}
    END


Wait_untl_ice_enabled
    [Documentation]    check ICE enabled status
    [Arguments]    ${host_name}     ${status}
    Refresh_button    ${csp1_host_value}
    ${ice_xpath}   Replace_Existing_xpath    ${ice_op_enable_state_xpath}   ${host_name}

Run_keyword_n_times_until_succeed
    [Documentation]     add new doc
    [Arguments]     ${keyword}    @{args}   ${wait}=2s   ${retries}=5
    FOR  ${index}  IN RANGE  ${retries}
        ${result}   ${error}    Run Keyword And Ignore Error    ${keyword}   @{args}
        Pass Execution If    '${result}' == 'PASS'      Keyword Execution is successful
        sleep   ${wait}
    END
    Fail    ${error}

Refresh_button
    [Documentation]    click refresh button
    [Arguments]    ${host_name}
    Click Element    ${refresh_button_xpath}
    ${csp_host_xpath}   Replace_Existing_xpath    ${ice_csp_host_name_xpath}    ${host_name}


wait_until_ice_disabled
    [Documentation]    refresh ice and wait until ICE status disable
    [Arguments]    ${csp_value}
#    Shutdown_ice_element    ${csp_value}
    Refresh_button    ${csp_value}
    ${ice_stats_disable}    Replace_Existing_xpath  ${ice_op_disable_state_xpath}   ${csp_value}

shutdown_ice_element
    [Documentation]    ice shutdown
    [Arguments]    ${ice_shutdown}
    ${shut_down_val}    Replace_Existing_xpath    ${ice_csp_host_name_xpath}    ${ice_shutdown}
    Click Element    ${shut_down_val}
    Click Element    ${shutdown_button_xpath}
    Click Element   ${yes_conformation_xapth}

run_keyword_nd_op_state_disable
    [Documentation]    run till ice element disabled
    [Arguments]    ${new_keyword}   @{new_args}     ${tries}=3     ${wait_time}=2s
    FOR    ${index}     IN RANGE    ${tries}
        ${new_result}   ${new_error}    Run Keyword And Ignore Error    ${new_keyword}  @{new_args}
        Pass Execution If    '${new_result}' == 'PASS'  successful
        Sleep    ${wait_time}
    END
    Fail    ${new_result}

Delete_ice_element
    [Documentation]    deleted ice
    [Arguments]    ${delted_csp}
    ${deleted_val}  Replace_Existing_xpath    ${ice_op_disable_state_xpath}     ${delted_csp}
    Click Element    ${deleted_val}
    Click Element    ${delete_button_xpath}
    Click Element    ${yes_conformation_xapth}
    Sleep    2
    

