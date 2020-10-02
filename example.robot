*** Settings ***
Documentation     Example test
Library           SeleniumLibrary
Suite Setup       Go to Sauce Demo Site
Suite Teardown    Close All Browsers

*** Variables ***
${URL}=           https://www.saucedemo.com/index.html
${Chrome Path}=    venv/Scripts/chromedriver.exe

*** Test Cases ***
User is able to log in Sauce Demo Site with standard user
    [Documentation]    Making sure user can access Sauce Demo site
    Enter Username    standard_user
    Enter Password    secret_sauce
    Click Submit
    # actual test
    ${current title}=    Get Title
    ${current url}=    Get Location
    Should Be Equal    ${current title}    Swag Labs
    Should Be Equal    ${current url}    https://www.saucedemo.com/inventory.html

User sees error message when logging in with Locked User
    [Documentation]    Locked user shows error message with sad face


*** Keywords ***
Go to Sauce Demo Site
    [Documentation]    Open a Chrome Browser
    Open Browser    url=${URL}    browser=chrome    options=None    executable_path=${Chrome Path}

Enter Username
    [Documentation]    Enters username
    [Arguments]    ${username}
    Input Text    id:user-name    ${username}

Enter Password
    [Documentation]    Enters password
    [Arguments]    ${password}
    Input Text    id:password    ${password}

Click Submit
    [Documentation]    Clicks on submit button
    Click Button    login-button
