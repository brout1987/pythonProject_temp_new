*** Settings ***

Library    SeleniumLibrary
Resource    ../Travel_keyword/common_keywords.robot

*** Test Cases ***

Login with Valid credential TC1
    [Documentation]    Login into MakeMyTrip travel site with valid credential
    [Tags]    TC1
    Login To MakeMyTrip

Flight booking as per given options TC2
    [Documentation]    check travling is one way, round trip or multi city
    [Tags]    TC2
    [Setup]    Login To MakeMyTrip
    Booking Details

