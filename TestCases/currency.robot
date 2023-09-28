*** Settings ***
Library    SeleniumLibrary   
Library    String
*** Variables ***
${url}    https://www.currency.me.uk/convert/usd/thb
${browser}    chrome

*** Test Cases ***
Demo Regex
    Open Browser    ${url}    ${browser}
    Maximize Browser Window
    Click Link    //a[contains(text(),'Euro')]
    Input Text    //input[@id='amount']    123
    
    ${EUR}    Get Text    //div[@id='tofrom2a']//span[@class='mini ccyrate']//b    
    Log To Console    ${EUR}
    ${OnlyEUR}   Get Regexp Matches   ${EUR}    \\d.\\d+
    Log To Console    ${OnlyEUR}[0]

    ${USD}    Get Text    //div[@id='tofrom4a']//span[@class='mini ccyrate']//b
    Log To Console    ${USD} 
    ${OnlyUSD}   Get Regexp Matches   ${USD}    \\d.\\d+
    Log To Console    ${OnlyEUR}[0]

    Sleep    3s
    Close Browser
    