*** Settings ***
Library    SeleniumLibrary   
*** Variables ***
${url}    https://swisnl.github.io/jQuery-contextMenu/demo.html
${browser}    chrome

*** Test Cases ***
TC1
    Open Browser    ${url}    ${browser}
    Maximize Browser Window 
    
    Open Context Menu    //span[contains(text(),'right click me')]
    Element Should Contain    //span[contains(text(),'right click me')]    right click
    Sleep    2s

    Click Element    css:li[class$='edit']
    ${text}    Handle Alert    accept
    Log To Console    ${text}
    Should Contain    ${text}    edit

    Sleep    2s
    Close Browser