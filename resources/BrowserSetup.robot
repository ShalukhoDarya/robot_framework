*** Settings ***
Library    SeleniumLibrary

*** Keywords ***
Setup Browser
    [Arguments]    ${browser}
    Run Keyword If    '${BROWSER}' == 'chrome'    Setup Chrome
    Run Keyword If    '${BROWSER}' == 'firefox'    Setup Firefox

Setup Chrome
    ${chrome_options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    Call Method    ${chrome_options}    add_argument    --headless
    Call Method    ${chrome_options}    add_argument    --no-sandbox
    Call Method    ${chrome_options}    add_argument    --disable-dev-shm-usage
    Create WebDriver    Chrome    chrome_options=${chrome_options}

Setup Firefox
    ${firefox_options}=    Evaluate    sys.modules['selenium.webdriver'].FirefoxOptions()    sys, selenium.webdriver
    Call Method    ${firefox_options}    add_argument    --headless
    Create WebDriver    Firefox    firefox_options=${firefox_options}