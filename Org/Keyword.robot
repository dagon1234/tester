*** Settings ***
Library    SeleniumLibrary
Resource   ./Variables.robot
*** Keywords ***
Launch Brower
    Open Browser  ${url}  ${browser}
    Maximize Browser Window
Verify Login
    Title Should Be    ${title}
Input Username
    Input Text    ${uName}    standard
Input Password
    Input Text    ${uPass}    secret_sauce
Submit
    Click Button    ${LogBut}
Verify Login Error
    element should contain    ${VerityLog}    ${errMsg}
Clear Login
    Clear Element Text     ${uName}
    Clear Element Text    ${uPass}
    click element    ${errorBut}
Browser Close
    sleep    3
    close Browser