*** Settings ***
Library  SeleniumLibrary
*** Variables ***

*** Test Cases ***
TC1
    Open Browser  http://www.example.com   chrome
    ...    options=add_experimental_option("detach", True)
    Maximize Browser Window
    ${url}    Get Location
    ${title}    Get Title
    Log To Console    ${url} with ${title}
    sleep  3s
    # Close Browser
