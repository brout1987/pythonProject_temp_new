*** Settings ***
Library    SeleniumLibrary
Library    BuiltIn
Resource    ../../networkKeywords/common_keywords.robot
Suite Setup    Login_to_ems
Suite Teardown    Close_Browser

*** Test Cases ***
Login_to_EMS
   Login_to_ems
Close Browser
   Close Browser






