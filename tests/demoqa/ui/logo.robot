*** Settings ***
Library    SeleniumLibrary
Resource   ../../../resources/home.robot

*** Test Cases ***
Open Home Page from All pages
    Open DemoQa Home Page
    Maximize Browser Window
    Sleep    1s
    Go To Elements Card
    Click on Logo
    Go To Forms Card
    Click on Logo
    Go To Alerts Card
    Click on Logo
    Go To Widgets Card
    Click on Logo
    Go To Interactions Card
    Click on Logo
    Scroll to Book Card
    Go to Book Store Application Card
    Sleep   0.5s
    Click on Logo
    Close All Browsers

