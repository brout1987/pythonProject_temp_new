*** Variables ***
# EMS login page
${Ems_log_URL}      http://10.51.98.191/apex/f?p=1000:101:121416529437853::::FAPP_CALLER_APP,FAPP_CALLER_PAGE:1001,3
${Ems_username}     acxmanager
${Ems_password}     acxmgr

${Browser}                  chrome
${ems_window_title}         EMS Console
${newEms_window_title}      New EMS console
${newEms_url}               http://10.51.98.191/ems-gui/ems-app/#/

#Primary EC data
${Ec_user_name}     Demo_EC1
${Ec_dns_name}      vmcsp3
${Primary_ip}       10.10.40.174
${Secondary_ip}     10.10.50.174

#Secondary EC data
${Ec_sec_user_name}     Demo_EC2
${Ec_sec_dns_name}      vmcsp4
${Secondary_ip1}       10.10.40.175
${Secondary_ip2}     10.10.50.175

#Primary ICE username
${primary_ice_user_name}    demo_ICE1
#Secondary ICE username
${secondary_ice_user_name}    demo_ICE2


${csp1_host_value}      CSP1
${csp2_host_value}      CSP2

#${ice_primary_state_value}  ENABLED


