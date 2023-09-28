*** Settings ***
Library    SeleniumLibrary   
*** Variables ***
${url}    https://th.indeed.com/
${browser}    chrome

*** Test Cases ***
TC1
    Open Browser    ${url}    ${browser}
    Maximize Browser Window 
    
    Input Text    //input[@id='text-input-what']    Software Tester
    Sleep    2s

    Press Keys    //input[@id='text-input-what']    CTRL+A+DELETE
    Sleep    2s

    Input Text    //input[@id='text-input-what']    Robot Framework
    Sleep    2s

    Input Text    //input[@id='text-input-where']    Bangkok
    Sleep    2s

    Click Button    //button[contains(text(),'Find jobs')]
    
    ${job}    Get Text    css:div[class^="jobsearch-JobCountAndSortPane-jobCount"]
    Log To Console    ${job}

    Close Browser