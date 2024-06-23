*** Settings ***
Library    SeleniumLibrary
Library    OperatingSystem

*** Keywords ***
Open Headless Browser
    Set Environment Variable    BROWSER    chrome
    Run Browser Tests
    Set Environment Variable    BROWSER    firefox
    Run Browser Tests

Run Browser Tests
    ${BROWSER}    Get Environment Variable    BROWSER
    ${options}=    Create Dictionary    chrome=ChromeOptions    firefox=FirefoxOptions
    ${browser_options}=    Evaluate    sys.modules['selenium.webdriver'].${options['${BROWSER}']}()    sys, selenium.webdriver
    Call Method    ${browser_options}    add_argument    --headless
    ${profile}=    Run Keyword If    '${BROWSER}' == 'firefox'    Create Firefox Profile
    Open Browser    https://www.google.com    browser=${BROWSER.lower()}    options=${browser_options}    ff_profile_dir=${profile}

Create Firefox Profile
    ${profile}=    Evaluate    sys.modules['selenium.webdriver'].FirefoxProfile()    sys, selenium.webdriver
    Call Method    ${profile}    set_preference    browser.privatebrowsing.autostart    true
    [Return]    ${profile.path}