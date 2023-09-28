*** Settings ***
Library    SeleniumLibrary
*** Variables ***
${url}    https://www.ebay.com/
${browser}    chrome
${search}    Macbook pro m2 used

*** Test Cases ***
Demo
    Open Browser    ${url}    ${browser}
    Maximize Browser Window
    Input Text    //input[@id='gh-ac']    ${search}
    Click Button    //input[@id='gh-btn']
    Sleep    2s
    ${name}    Get Text    //h1[@class='srp-controls__count-heading']/span[2]
    Log To Console    ${name}
    ${value}    Get Text    //h1[@class='srp-controls__count-heading']/span[1]
    Should Be Equal As Numbers    ${value}    479
    Sleep    3s
    Close Browser