*** Settings ***
Library    SeleniumLibrary
Library    BuiltIn
Resource    ../../networkKeywords/common_keywords.robot

*** Test Cases ***
Login_to_EMS
   Login_to_ems
Close Browser
   Close Browser






