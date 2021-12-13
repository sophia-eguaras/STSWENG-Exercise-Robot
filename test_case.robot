*** Settings ***
Documentation   A test suite with a single test for a valid login
...
...             This test follows the example using keywords from
...             the SeleniumLibrary
...
Resource        resources.robot

*** Test Cases ***
Valid login
    # open browser, set window size, check if in login page
    Open Browser To Login Page
    # input username
    Input Username  ${VALID USER}
    # input password
    Input Pass    ${VALID PASSWORD}
    # click login button
    Submit Credentials
    # should be open in products page
    Product Page Should Be Open
    # close browser
    [Teardown]    Close Browser

Locked Out login
    # open browser, set window size, check if in login page
    Open Browser To Login Page
    # input username
    Input Username      ${LOCKED OUT USER}
    # input password
    Input Pass          ${VALID PASSWORD}
    # click login button
    Submit Credentials
    # Error message is "Epic sadface: Sorry, this user has been locked out."
    Error Message Shown  Epic sadface: Sorry, this user has been locked out.
    # close browser
    [Teardown]    Close Browser

Wrong Password
    # open browser, set window size, check if in login page
    Open Browser To Login Page
    # input username
    Input Username      ${VALID USER}
    # input password
    Input Pass          ${INVALID PASSWORD}
    # click login button
    Submit Credentials
    # Error message is "Epic sadface: Username and password do not match any user in this service"
    Error Message Shown  Epic sadface: Username and password do not match any user in this service
    # close browser
    [Teardown]  Close Browser

Broken Login
    # open browser, set window size, check if in login page
    Open Browser To Login Page
    # input username
    Input Username      ${PROBLEM USER}
    # input password
    Input Pass          ${VALID PASSWORD}
    # click login button
    Submit Credentials
    # should be open in products page
    Product Page Should Be Open
    # inventory photos should show a pug (i.e broken inventory)
    Page Should Contain Image   src:/static/media/sl-404.168b1cce.jpg
    # close browser
    [Teardown]  Close Browser

*** Comment ***
# Original code before using keywords
# Settings
#Documentation   A test suite with a single test for a valid login
...
...             This test follows the example using keywords from
...             the SeleniumLibrary
...
Library         SeleniumLibrary

# Test Cases
Valid login
    # open browser
    Open browser    https://www.saucedemo.com/    edge
    # set window size
    Maximize Browser Window
    Set Selenium Speed    0
    # check if in login page
    Page Should Contain Element    login-button
    # input username
    Input Text    user-name    standard_user
    # input password
    Input Password    password    secret_sauce
    # click login button
    Click Button    login-button
    # should be open in products page
    Element Text Should Be    class:title   PRODUCTS
    # close browser
    [Teardown]    Close Browser

Locked Out login
    # open browser
    Open browser    https://www.saucedemo.com/    edge
    # set window size
    Maximize Browser Window
    Set Selenium Speed    0
    # check if in login page
    Page Should Contain Element    login-button
    # input username
    Input Text    user-name    locked_out_user
    # input password
    Input Password    password    secret_sauce
    # click login button
    Click Button    login-button
    # Error message is "Epic sadface: Sorry, this user has been locked out"
    Element Text Should Be    xpath://*[@id="login_button_container"]/div/form/div[3]/h3    Epic sadface: Sorry, this user has been locked out. 
    # close browser
    [Teardown]    Close Browser