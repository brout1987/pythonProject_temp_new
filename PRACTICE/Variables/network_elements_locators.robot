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
${existing_ECs_IP_xpath}    //*[contains(@class,"PrimaryIPAddress") and text()="***"]
${existing_ECs_IP_new_xpath}   Replace String    ${existing_ECs_IP_xpath}  \***    ${Primary_ip}
${delete_button_xpath}      //*[@id="delete-button"]
${yes_conformation_xapth}     //*[@id="yes"]/span
${EC_start_button_xpath}    //*[@id="start-button"]