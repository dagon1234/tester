*** Settings ***
Library             SeleniumLibrary
Resource            ../Resources/keyword.robot

# Test Setup/teardown ทำทุกครั้งที่test
# suite Setup/teardown ทำรอบเดียวคลุมหลายtest
Suite Setup         Launch Browse
Suite Teardown      Browser Close


*** Test Cases ***
Verify Invalid Login - wrong username
    Verify Login Page
    Input Username    standard
    Input Passwords    secret_sauce
    Submit Credentials
    Verify Login Message    Epic sadface: Username and password do not match any user in this service
    Clear Login

Verify Invalid Login - 'locked_out_user' worong password
    Verify Login Page
    Input Username    locked_out_user
    Input Passwords    secret
    Submit Credentials
    Verify Login Message    Epic sadface: Username and password do not match any user in this service
    Clear Login

Verify Invalid Login - wrong password
    Verify Login Page
    Input Username    standard_user
    Input Passwords    secret
    Submit Credentials
    Verify Login Message    Epic sadface: Username and password do not match any user in this service
    Clear Login
