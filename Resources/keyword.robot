*** Settings ***
Library     SeleniumLibrary
Resource    ../Resources/Variable.robot


*** Keywords ***
Launch Browse
    Open Browser    ${url}    ${browser}
    Maximize Browser Window

Verify Login Page
    Title Should Be    ${title}

Input Username
    [Arguments]    ${username}
    Input Text    ${usernameLoc}    ${username}

Input Passwords
    [Arguments]    ${password}
    Input Text    ${passwordLoc}    ${password}

Submit Credentials
    Click Button    ${lodinBtn}

Verify Login Message
    [Arguments]    ${errMsg}
    element should contain    ${errorMsgLoc}    ${errMsg}

Clear Login
    Clear Element Text    ${usernameLoc}
    Clear Element Text    ${passwordLoc}
    click element    ${cleanLoc}

Browser Close
    close Browser
