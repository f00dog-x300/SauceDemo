*** Settings ***
Documentation     Example test
Library           SeleniumLibrary
Suite Setup       Go to Sauce Demo Site
Suite Teardown    Close All Browsers

*** Variables ***
${URL}=           https://www.saucedemo.com/index.html
${Chrome Path}=    venv/Scripts/chromedriver.exe

*** Test Cases ***
DMCD-2891: User is able to log in Sauce Demo Site
    [Documentation]    Making sure user can access Sauce Demo site
    Log To Console    Starting Test
    Enter Username    standard_user
    Enter Password    secret_sauce
    Click Submit
    Sleep    5sec    reason=To see if opening browser works
    ${current title}=    Get Title
    ${current url}=    Get Location
    Should Be Equal    ${current title}    Swag Labs
    Should Be Equal    ${current url}    https://www.saucedemo.com/inventory.html

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
