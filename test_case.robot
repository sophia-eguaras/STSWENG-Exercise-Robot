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
    Page Should Contain Image   xpath=//img[contains(@src, "sl-404.168b1cce.jpg")]
    # close browser
    [Teardown]  Close Browser

Sort A to Z
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
    # click the filter
    Click Element   css:*[class="product_sort_container"]
    Element Text Should Be  xpath://*[@id="header_container"]/div[2]/div[2]/span/select/option[1]    ${A TO Z}
    # should have the first product alphabetically
    Element Text Should Be      css:*[id="item_4_title_link"]      ${FIRST PRODUCT}
    # close browser
    [Teardown]  Close Browser

Sort Z to A
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
    # click the filter
    Click Element   css:*[class="product_sort_container"]
    Element Text Should Be  xpath://*[@id="header_container"]/div[2]/div[2]/span/select/option[2]    ${Z TO A}
    # should have the last product alphabetically
    Element Text Should Be      css:*[id="item_3_title_link"]  ${LAST PRODUCT}
    # close browser
    [Teardown]  Close Browser

Sort Low to High
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
    # click the filter
    Click Element   css:*[class="product_sort_container"]
    Element Text Should Be  xpath://*[@id="header_container"]/div[2]/div[2]/span/select/option[3]    ${LOW TO HIGH}
    # should have the cheap product first
    Element Text Should Be      css:*[id="item_2_title_link"]  ${CHEAP PRODUCT}
    # close browser
    [Teardown]  Close Browser

Sort High to Low
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
    # click the filter
    Click Element   css:*[class="product_sort_container"]
    Element Text Should Be  xpath://*[@id="header_container"]/div[2]/div[2]/span/select/option[4]    ${HIGH TO LOW}
    # should have the expensive product first
    Element Text Should Be      css:*[id="item_5_title_link"]  ${EXPENSIVE PRODUCT}
    # close browser
    [Teardown]  Close Browser
