*** Settings ***
Library  SeleniumLibrary
Library    String
*** Variables ***
${url}    https://jqueryui.com/autocomplete/?fbclid=IwAR2HXFyIwO-ULe6hd2SBoemAXEwYUSl1CSed7T1CanYneWupiKA3Wtl-BhI
${browser}    chrome
${search}    JavaScript

*** Test Cases ***
Demo 
   Open Browser    ${url}    ${browser}
   Maximize Browser Window
   
   Select Frame    css:.demo-frame
   Input Text    css:#tags    a

   Wait Until Page Contains Element    css:li.ui-menu-item
   @{elements}    Get WebElements    css:li.ui-menu-item
   ${found}    Set Variable    ${True}

   FOR  ${elem}  IN  @{elements}
       ${text}    Get Text    ${elem}
       Log To Console    ${text}
       ${found}    Set Variable If    
       ...    '${text}'=='${search}'    ${True}    ${False}
       Exit For Loop If    ${found}
   END 
   Run Keyword If    ${found}    Click element    ${elem}
   Run Keyword And Continue On Failure
   ...  Should Be True    ${found}    msg=${search} not found
   
   Sleep    2s

   Close Browser