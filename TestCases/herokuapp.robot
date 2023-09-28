*** Settings ***
Library    SeleniumLibrary   
*** Variables ***
${url}    http://the-internet.herokuapp.com/javascript_alerts
${browser}    chrome

*** Test Cases ***
JavaScript Alerts
    Open Browser    ${url}    ${browser}
    Maximize Browser Window 

    Click Button    //button[contains(text(),'Click for JS Alert')]
    ${message}    Handle Alert  accept
    Log To Console    ${message}

    Click Button    //button[contains(text(),'Click for JS Confirm')]
    ${message1}    Handle Alert  dismiss
    Log To Console    ${message1}

    Click Button    //button[contains(text(),'Click for JS Prompt')]
    Input Text Into Alert    Test

    Sleep    4s
    Close Browser