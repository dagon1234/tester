*** Settings ***
Library    SeleniumLibrary
*** Variables ***
${url}    https://www.saucedemo.com/
${browser}    chrome
@{list1}    user-name    password
&{list2}    user=user-name    pass=password
*** Test Cases ***
Demo Login
    Open Browser    ${url}    ${browser}
    Maximize Browser Window
    # Input Text    id:user-name    standard_user
    # Input Text    id:password    secret_sauce
    # Input Text    id:${list1}[0]    standard_user
    # Input Text    id:${list1}[1]    secret_sauce
    Input Text    id:${list2}[user]    standard_user
    Input Text    id:${list2}[pass]    secret_sauce
    Click Button    id:login-button
    Sleep    2s
    ${text}    Get Text    class:inventory_item
    Log To Console    ${text}
    Sleep    3s
    Close Browser