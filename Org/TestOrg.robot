*** Settings ***
Library  SeleniumLibrary
Resource    ./Keyword.robot

*** Test Cases ***
TC:Invalid Login
    Launch Brower
    Verify Login
    Input Username
    Input Password
    Submit
    Verify Login Error
    Clear Login
    Browser Close
