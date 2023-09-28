*** Settings ***
Library    SeleniumLibrary   
Library    String
*** Variables ***
${url}    https://demo.seleniumeasy.com/basic-radiobutton-demo.html
${browser}    chrome

*** Test Cases ***
Demo radio button
    Open Browser    ${url}    ${browser}
    Maximize Browser Window   
    Scroll Element Into View    css:.groupradiobutton
    Select Radio Button    gender    Male
    Select Radio Button    ageGroup    0 - 5
    Click Button    //button[contains(text(),'Get values')]
    ${text}    Get Text    css:p.groupradiobutton
    Log To Console    ${text}
    ${showAge}    Get Regexp Matches    ${text}    \\d\\s-\\s\\d
    Log To Console    ${showAge}
    ${showSex}    Get Regexp Matches    ${text}    \\w{4,}
    Should Be Equal    ${showSex}[0]    Male
    Should Contain    ${text}    Male
    Sleep    3s
    Close Browser