*** Settings ***
Library    SeleniumLibrary   
Library    String
*** Variables ***
${url}    http://demo.nopcommerce.com/register
${browser}    chrome
${emial}    email7@gmail.com
${pass}    1234567890
*** Test Cases ***
Demo Auto
    Open Browser    ${url}    ${browser}
    Maximize Browser Window 

    Select Radio Button    Gender    F
    Input Text    //input[@id='FirstName']    fname
    Input Text    //input[@id='LastName']    lname
    Select From List By Value    DateOfBirthDay    1
    Select From List By Value    DateOfBirthMonth    1
    Select From List By Value    DateOfBirthYear    1913
    Input Text    //input[@id='Email']    ${emial}

    Input Text    //input[@id='Password']   ${pass}
    Input Text    //input[@id='ConfirmPassword']    ${pass}

    Checkbox Should Be Selected    //input[@type='checkbox']
    ${checkbox}    Get Value    //input[@type='checkbox']
    Should Be Equal    ${checkbox}    true

    Click Button    //button[@id='register-button']

    Click Link    //a[contains(text(),'Log in')]

    Input Text    //input[@id='Email']    ${emial}  
    Input Text    //input[@id='Password']    ${pass}  

    Click Button    //button[contains(text(),'Log in')]
    Sleep    5s
    Close Browser