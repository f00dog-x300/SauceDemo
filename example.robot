*** Settings ***
Documentation     Example test
Library           SeleniumLibrary
Test Setup        Go to Sauce Demo Site
Test Teardown     Close All Browsers

*** Variables ***
${URL}=           https://www.saucedemo.com/index.html
${Chrome Path}=    venv/Scripts/chromedriver.exe

*** Test Cases ***
DMCD-2891: User is able to access Sauce Demo Site
    [Documentation]    Making sure user can access Sauce Demo site
    Log To Console    Starting Test
    Sleep    5sec    reason=To see if opening browser works

*** Keywords ***
Go to Sauce Demo Site
    [Documentation]    Open a Chrome Browser
    Open Browser    url=${URL}    browser=chrome    options=None    executable_path=${Chrome Path}
