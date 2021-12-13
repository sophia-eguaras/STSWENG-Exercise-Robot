*** Settings ***
Documentation   A resource file with reusable keywords and variables
...
...             Creating system specific keywords from default keywords
...             from SeleniumLibrary
...
Library         SeleniumLibrary

*** Variables ***
${SERVER}               www.saucedemo.com
${BROWSER}              edge
${DELAY}                0
${VALID USER}           standard_user
${LOCKED OUT USER}      locked_out_user
${PROBLEM USER}         problem_user
${VALID PASSWORD}       secret_sauce
${INVALID PASSWORD}     mali_na_password
${A TO Z}               Name (A to Z)
${Z TO A}               Name (Z to A)
${LOW TO HIGH}          Price (low to high)
${HIGH TO LOW}          Price (high to low)
${FIRST PRODUCT}        Sauce Labs Backpack
${LAST PRODUCT}         Test.allTheThings() T-Shirt (Red)
${CHEAP PRODUCT}        Sauce Labs Onesie
${EXPENSIVE PRODUCT}    Sauce Labs Fleece Jacket
${LOGIN URL}            https://${SERVER}/
${HOME URL}             https://${SERVER}/inventory.html

*** Keywords ***
Open Browser To Login Page
    Open browser    ${LOGIN URL}    ${BROWSER}
    Maximize Browser Window
    Set Selenium Speed    ${DELAY}
    Login Page Should Be Open

Login Page Should Be Open
    Page Should Contain Element    login-button

Product Page Should Be Open
    Element Text Should Be    class:title   PRODUCTS

Input Username
    [Arguments]     ${username}
    Input Text    user-name    ${username}

Input Pass
    [Arguments]     ${password}
    Input Text    password    ${password}

Submit Credentials
    ClickButton     login-button

Error Message Shown
    [Arguments]     ${error}
    Element Text Should Be  css:*[data-test="error"]  ${error}
