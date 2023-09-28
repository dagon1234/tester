*** Settings ***
Library    SeleniumLibrary
*** Variables ***
${url}    https://petstore.octoperf.com/actions/Catalog.action
${browser}    chrome
${user}    j2ee
*** Test Cases ***
#Demo Login
#    Open Browser    ${url}    ${browser}
#    Maximize Browser Window
#    Click Element    //area[@alt='Dogs']
#    Click Link    //:a[contains(text(),'K9-RT-01')]
#    Click Element    //a[contains(text(),'Add to Cart')]
#    Click Link    //a[contains(text(),'Proceed to Checkout')]
#    Input Text    //input[@name='username']    ${user}
#    Click Element    //input[@value='Login']
#    Click Link    //a[contains(text(),'Sign Out')]
#    Sleep    2s
#    Close Browser

Demo Basic Element Locator
    Open Browser    ${url}    ${browser}
    Maximize Browser Window
    Click Element    css:area[alt=Dogs]
    Click Link    css:a[href$=K9-RT-01]
    Click Link    css:a.Button
    Click Link    css:#Cart > a
    Input Text    css:input[name=username]    ${user}
    Click Element    css:input[name=signon]
    Sleep    2s
    Click Link    css:a[href$='signoff=']
    Sleep    2s
    Close Browser