*** Settings ***
Library  RequestsLibrary

*** Variables ***
${URL}  https://demoqa.com/

*** Test Cases ***
Check Status Code
    Create Session  demo  ${URL}
    ${response}=  GET On Session  demo  ${URL}
    Should Be Equal As Strings  ${response.status_code}  200