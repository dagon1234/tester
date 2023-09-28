*** Settings ***
Library    SeleniumLibrary   
*** Variables ***
${url}    https://www.calculatestuff.com/miscellaneous/tip-calculator
${browser}    chrome
${bill}    250
${split}    3

*** Test Cases ***
TC1
    Open Browser    ${url}    ${browser}
    Maximize Browser Window 
    ${timeout}    Get Selenium Timeout
    Log To Console    ${timeout}

    Input Text    //input[@id='bill_amount']    ${bill}
    Select Checkbox    //input[@id='split_bill']
    Wait Until Element Is Visible    //input[@id='split_between']    10s

    Input Text    //input[@id='split_between']    ${split} 
    Click Button    //input[@id='calculate-button']
    Wait Until Element Is Visible    //h4[contains(text(),'Per Person')]    10s

    ${tip}    Get Text    //div[@id='results']/div[3]/div[2]
    Log To Console    ${tip}
    ${price}    Get Text    //div[@id='results']/div[4]/div[2]
    Log To Console    ${price}
    Close Browser
