*** Settings ***
Library      SeleniumLibrary
Resource     ../../Resources/Fiber/FiberPaybills_Page.robot
Resource     ../../Resources/Common.robot
Resource     ../../Resources/Local_Keywords.robot              
Resource     ../../Resources/Excel_Activity.robot              
Variables    FPay_Bills_Variables.yaml 
Resource                            ../../Resources/Tags.robot
Suite Setup                         Fiber Paybills Tag Activity
Test Setup                          Begin Web Test
Test Teardown                       End Web Test

*** Test Cases ***

Confirm UI, redirection & functionalities of JioFiber tab
    [Tags]    ${TC01-FPaybills}    TC01-FPaybills    Sanity
    [Documentation]    TC01 to TC10
    Confirm UI of 'i',valid & invalid Prepaid JioFiber number or Amount Toast/popup
    
Confirm functionalities of toast of Mobile tab
    [Tags]    ${TC11-FPaybills}    TC11-FPaybills
    [Documentation]   TC11 to TC15
    Verify functionalities of Pay Bills Page Mobile tab
    
Confirm UI, redirection of inactive accounts page
    [Tags]    ${TC16-FPaybills}    TC16-FPaybills    Sanity
    [Documentation]    TC16 to TC19
    Confirm redirection and UI of Pay for inactive account page
