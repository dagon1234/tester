*** Settings ***
Library    SeleniumLibrary   
*** Variables ***
${url}    https://www.jqueryscript.net/demo/Price-Range-Slider-jQuery-UI/
${browser}    chrome
${left}    //div[@id='slider-range']/span[1]
${right}    //div[@id='slider-range']/span[2]
*** Test Cases ***
TC1
    Open Browser    ${url}    ${browser}
    Maximize Browser Window 

    ${x}    Get Horizontal Position    ${left}
    ${y}    Get Vertical Position    ${left}

    ${x1}    Get Horizontal Position    ${right}
    ${y1}    Get Vertical Position    ${right}

    ${x}    Evaluate    ${x}+100
    ${x1}    Evaluate    ${x1}-(100+610)
    
    Drag And Drop By Offset    ${left}    ${x}    ${y}
    Drag And Drop By Offset    ${right}    ${x1}    ${y1}

    Sleep    2s
    Close Browser