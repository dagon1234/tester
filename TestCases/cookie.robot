*** Settings ***
Library    SeleniumLibrary   
*** Variables ***
${url}    https://www.osano.com/cookieconsent/demos/
${browser}    chrome
${reject}    //div[@role='dialog']/div[2]/button[3]

*** Test Cases ***
TC1
    Open Browser    ${url}    ${browser}
    Maximize Browser Window 

    ${status}    Run Keyword And Return Status    
    ...    Page Should Contain Element    ${reject}    
    Log To Console    status =${status}
    Run Keyword If    ${status}    Click Element    ${reject}

    Close Browser