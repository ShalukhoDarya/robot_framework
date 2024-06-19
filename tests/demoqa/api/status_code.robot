*** Settings ***
Library  RequestsLibrary

*** Variables ***
${URL}  https://demoqa.com/
${BROWSER}   ff
${BROWSER_OPTIONS}    headless

*** Test Cases ***
Check Status Code
    Create Session  demo  ${URL}  ${BROWSER}  options=${BROWSER_OPTIONS}
    ${response}=  GET On Session  demo  ${URL}
    Should Be Equal As Strings  ${response.status_code}  200