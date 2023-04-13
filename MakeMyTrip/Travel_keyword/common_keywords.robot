*** Settings ***
Library    SeleniumLibrary
Library    TravelDetails.py

*** Variables ***

${username}     barada.prasanna1987@gmail.com
${password}     Prasanna@123
${travle}       Round Trip

*** Keywords ***

Login to MakeMyTrip
    Login

booking details
    Flight Booking Details      ${travle}

