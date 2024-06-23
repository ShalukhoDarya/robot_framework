*** Settings ***
Library    SeleniumLibrary
Library    OperatingSystem

*** Keywords ***
Open Headless Browser
    Set Environment Variable    BROWSER   chrome
    ${options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    Call Method    ${options}    add_argument    --headless
    ${BROWSER}    Get Environment Variable    BROWSER
    Run Keyword If    '${BROWSER}' == 'Chrome'    Open Browser    https://www.google.com    browser=chrome    options=${options}