*** Settings ***
Library        SeleniumLibrary
Resource       ../../Resources/Fiber/FiberRecharge_Page.robot
Resource       ../../Resources/Common.robot
Resource       ../../Resources/Excel_Activity.robot
Resource       ../../Resources/Local_Keywords.robot
Variables      FRecharge_Variables.yaml 
Variables      ../../Resources/Common_Variables.yaml 
Resource                            ../../Resources/Tags.robot
Suite Setup                         Fiber Recharge Tag Activity
Test Setup                          Begin Web Test
Test Teardown                       End Web Test

*** Test Cases ***
Confirm UI of JioFiber Tab and user gets toast on entering wrong JioFiber number
    [Tags]    ${TC01-FRecharge}    TC01-FRecharge  Sanity
    [Documentation]    TC01 to TC08
    Confirm UI and functionality of JioFiber Tab and toast on entering wrong JioFiber No

Confirm Redirection,UI and functionality of Select plan page for JioFiber
    [Tags]    ${TC09-FRecharge}    TC09-FRecharge  Sanity
    [Documentation]    TC09 to TC12
    Confirm UI, redirection and functionality of View details button, Select plan page for JioFiber Tab

Confirm redirection to Recharge page on editing number and UI, functionalities of ISD tab for Fiber Tab
    [Tags]    ${TC13-FRecharge}    TC13-FRecharge  Sanity
    [Documentation]    TC13 to TC16
    Confirm UI and functionality of ISD tab for Fiber Tab

Confirm UI and Redirection from Recharge Page on Entering Mobile Number
    [Tags]    ${TC17-FRecharge}    TC17-FRecharge  Sanity
    [Documentation]    TC17 to TC19
    Confirm UI and Redirection from Recharge Page

Confirm UI elements of Select plan page
    [Tags]    ${TC20-FRecharge}    TC20-FRecharge  Sanity
    [Documentation]    TC20 to TC24
    Confirm UI and redirection of View details button and Select plan page

Confirm redirection to Recharge page on editing number and UI, functionalities of ISD tab
    [Tags]    ${TC25-FRecharge}    TC25-FRecharge  Sanity
    [Documentation]    TC25 to TC28
    Confirm UI and functionality of ISD tab

Confirm user is able to switch to International Roaming tab and verify UI elements
    [Tags]    ${TC29-FRecharge}    TC29-FRecharge  Sanity
    [Documentation]    TC29 to TC30
    Confirm UI and functionality of International Roaming tab
