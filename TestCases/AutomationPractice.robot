*** Settings ***
Library    SeleniumLibrary   
Library    String
*** Variables ***
${url}    https://rahulshettyacademy.com/AutomationPractice/
${browser}    chrome

*** Test Cases ***
Demo Auto
    Open Browser    ${url}    ${browser}
    Maximize Browser Window 
    Select Radio Button    radioButton    radio2
    Select From List By Value    dropdown-class-example    option2
    ${dropdrow}    Get Value    //select[@name='dropdown-class-example']
    Log To Console    ${dropdrow}
    Should Be Equal    ${dropdrow}    option2
    Sleep    2s
    Close Window