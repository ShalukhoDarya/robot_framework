*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${SEARCH}    https://www.google.com
${BROWSER}          chrome

*** Test Cases ***
Google Search Test
    [Documentation]    Тест выполняет поиск в Google и проверяет результаты
    Open Browser To Google
    Handle Cookies Popup
    Input Search Query
    Verify Search Results

*** Keywords ***
Open Browser To Google
    Open Browser    ${SEARCH}    ${BROWSER}
    Maximize Browser Window
    Sleep    2s

Handle Cookies Popup
    Click Element    xpath://*[@id="W0wltc"]

Input Search Query
    Input Text    name:q    Robot Framework
    Press Keys    name:q    ENTER
    Sleep    2s

Verify Search Results
    Title Should Be    Robot Framework - Google Search
    [Teardown]    Close Browser