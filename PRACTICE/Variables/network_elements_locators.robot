*** Settings ***
Library    String
Resource    ../Variables/commonConfiguration.robot


*** Variables ***
#Login page locator
${username_xpath}  id:P101_USERNAME
${password_xpath}  id:P101_PASSWORD
${login_xpath}  //*[@class='button-alt1']
${new_gui_xpath}  xpath://*[@id='navbar']/img[2]

#EC_page_locator

${EC_xpath}     //*[text()="Event Collectors (EC)"]
${EC_page_summary}      //*[text()="Event Collectors Summary"]
${create_buttom_xpath}      //*[@id="create-button"]
${EC_Name_xpath}        //*[@id="NAME"]
${EC_DNS_Name_xpath}        //*[@id="DNSNAME"]
${EC_primary_addr_xpath}        //*[@id="PrimaryIPAddress"]
${EC_secondary_addr_xpath}      //*[@id="SecondaryIPAddress"]
${save_button_xpath}        //*[@id="save"]
${Primary_IP_xpath}       //*[text()="Primary IP"]
${ECs_IP_xpath}    //*[contains(@class,"PrimaryIPAddress") and text()="***"]
${delete_button_xpath}      //*[@id="delete-button"]
${yes_conformation_xapth}     //*[@id="yes"]/span
${EC_start_button_xpath}    //*[@id="start-button"]
${edit_button_xpath}        //*[@id="edit-button"]
${paired_ec_xpath}      //mat-dialog-container[@role='dialog']//mat-select[@role='listbox']
${demo_ip_xpath}        //*[contains(@class,"mat-option-text") and text()=" Demo_EC2 "]
${save_button_xpath}    //*[@id="save"]

#ICE page locators
${ice_page_xpath}       //*[text()="IP Call Control Elements (ICE)"]
${ice_summary_xpath}    //*[text()="IP Call Control Elements Summary"]
${ice_create_button_xpath}      //*[@id="create-button"]
${ice_details_page_xpath}       //*[text()="ICE Details"]
${ice_type_visible_xpath}       //*[text()="ICE Type"]//ancestor::div[@class="mat-form-field-infix"]
${sip_gateway_ice_xpath}        //*[contains(text(), " SIP Gateway ICE ")]
${ice_host_name_xpath}      //*[text()="ICE Host Name"]//ancestor::div[@class="mat-form-field-infix"]
${home_see_xpath}       //*[text()="Home SEE"]//ancestor::div[@class="mat-form-field-infix"]
${primary_see_xapth}        //*[text()=" SEE_primary "]
${ec_dropdown_xpath}       //*[text()="Event Collector"]//ancestor::div[@class="mat-form-field-infix"]
${primary_ec_xpath}     //*[contains(text(), " EC1 ")]
${cdr_manager_xpath}    //*[text()="CDR Manager"]//ancestor::div[@class="mat-form-field-infix"]

#CSP host name
${csp_host_name_xpath}     //span[contains(text(), "***")]
${ice_csp_host_name_xpath}     //td[contains(text(), "***")]
${ice_op_enable_state_xpath}   //*[text()="***"]//following-sibling::td[text()="ENABLED"]
${ice_op_disable_state_xpath}   //*[text()="***"]//following-sibling::td[text()="DISABLED"]
${refresh_button_xpath}   //*[@id="refresh-button"]
${shutdown_button_xpath}    //*[@id="shutdown-button"]
${delete_button_xpath}      //*[@id="delete-button"]


