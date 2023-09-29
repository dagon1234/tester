*** Settings ***
Library    SeleniumLibrary   
Library    DataDriver    ../TestData/bmiData.xlsx    sheet_name=Sheet1
Test Template    Verify Calculator Template
Suite Setup         Launch Browse
Suite Teardown      Close Browse
*** Variables ***
${url}    https://www.calculator.net/bmi-calculator.html
${browser}    chrome
${location}    //div[@class="bigtext"]

*** Test Cases ***
TC1:Test BMI:${no}    ${Age}    ${Gender}    ${Height}    ${Weight}    ${status}

*** Keywords ***
Verify Calculator Template
    [Arguments]    ${Age}    ${Gender}    ${Height}    ${Weight}    ${status}
    
    Input Text    //input[@id='cage']    ${Age}
    Execute Javascript    document.querySelector('input[value=${Gender}]').click()
    Input Text    //input[@id='cheightmeter']    ${Height}
    Input Text    //input[@id='ckg']    ${Weight}
    Click Element   //input[@value="Calculate"]
    ${bmiStatus}    Get Text    ${location}//font
    Log To Console    ${bmiStatus}
    Should Be Equal As Strings    ${bmiStatus}    ${status}

Launch Browse
    Open Browser    ${url}    ${browser}
    Maximize Browser Window 

Close Browse
    Close Browser