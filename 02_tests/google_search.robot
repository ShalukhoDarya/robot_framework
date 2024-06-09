*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${SEARCH}    https://www.google.com
${BROWSER}   ${BROWSER}

*** Test Cases ***
Google Search Test
    [Documentation]    The test performs a Google search and checks the results
    [Tags]  smoke
    Open Browser   ${SEARCH}    ${BROWSER}
    Handle Cookies Popup
    Input Search Query
    Verify Search Results
    Close Browser

*** Keywords ***
Handle Cookies Popup
    Click Element    xpath://*[@id="W0wltc"]

Input Search Query
    Input Text    name:q    Robot Framework
    Press Keys    name:q    ENTER
    Sleep    2s

Verify Search Results
    ${title} =    Get Title
    Run Keyword If    '${title}' == 'Robot Framework'    Title Should Be    Robot Framework