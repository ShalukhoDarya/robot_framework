*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${URL}  https://demoqa.com/
${BROWSER}   ff
${BROWSER_OPTIONS}    headless
${ELEMENTS_CARD}  xpath=//h5[text()='Elements']
${FORMS_CARD}  xpath=//h5[text()='Forms']
${ALERTS_CARD}  xpath=//h5[text()='Alerts, Frame & Windows']
${WIDGETS}  xpath=//h5[text()='Widgets']
${INTERACTIONS}  xpath=//h5[text()='Interactions']
${BOOKS}  xpath=//h5[text()='Book Store Application']
${LOGO}  xpath=//img[@src='/images/Toolsqa.jpg']

*** Keywords ***
Open DemoQa Home Page
    Open Browser  ${URL}  ${BROWSER}  options=${BROWSER_OPTIONS}

Go To Elements Card
    Click Element  ${ELEMENTS_CARD}

Go To Forms Card
    Click Element  ${FORMS_CARD}

Go To Alerts Card
    Click Element  ${ALERTS_CARD}

Go To Widgets Card
    Click Element  ${WIDGETS}

Go To Interactions Card
    Click Element  ${INTERACTIONS}

Scroll to Book Card
    Execute JavaScript    window.scrollTo(0, document.body.scrollHeight);

Go to Book Store Application Card
    Click Element  ${BOOKS}

Click on Logo
    Click Element  ${LOGO}
