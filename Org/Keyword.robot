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
    [Arguments]    ${user}
    Input Text    ${uName}    ${user}
Input Password
    [Arguments]    ${pass}
    Input Text    ${uPass}    ${pass}
Submit
    Click Button    ${LogBut}
Verify Login Error
    [Arguments]    ${errMsg}
    element should contain    ${VerityLog}    ${errMsg}
Clear Login
    Clear Element Text     ${uName}
    Clear Element Text    ${uPass}
    click element    ${errorBut}
Browser Close
    sleep    3
    close Browser