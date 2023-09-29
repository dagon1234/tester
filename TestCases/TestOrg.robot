*** Settings ***
Library  SeleniumLibrary
Resource    ../Org/Keyword.robot

*** Test Cases ***
TC:Invalid Login
    Launch Brower
    Verify Login
    Input Username    standard
    Input Password    secret_sauce
    Submit
    Verify Login Error    Epic sadface: Username and password do not match any user in this service
    Clear Login
    Browser Close
