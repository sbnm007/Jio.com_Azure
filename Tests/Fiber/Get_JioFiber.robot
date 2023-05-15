*** Settings ***
Library    SeleniumLibrary
Library    Dialogs
Resource    ../../Resources/Fiber/FiberGet_JioFiber_Page.robot  
Resource    ../../Resources/Excel_activity.robot
Resource    ../../Resources/Common.robot
Resource    ../../Resources/Local_keywords.robot 
Variables    Get_JioFiber_Variables.yaml
Resource                            ../../Resources/Tags.robot
Suite Setup                         Fiber Get Jio Fiber Tag Activity
Test Setup                          Begin Web Test
Test Teardown                       End Web Test

*** Test Cases ***
Confirm Get JioFiber main page Functionality
    [Documentation]    TC01 to TC09
    [Tags]    ${TC01-FGetJioFiber}    TC01-FGetJioFiber  Sanity
    Verify and Validate Get JioFiber page

Confirm Verify OTP page Functionality
    [Documentation]    TC10 to TC17       (TC15 Out of Scope)
    [Tags]    ${TC10-FGetJioFiber}    TC10-FGetJioFiber  Sanity
    Verify and Validate Verify OTP page
        
Confirm Installation address page Functionality
    [Documentation]    TC18 to TC26
    [Tags]    ${TC18-FGetJioFiber}    TC18-FGetJioFiber
    Verify and Validate Installation address page

Confirm Installation address map page Functionality
    [Documentation]   TC27 to TC31
    [Tags]    ${TC27-FGetJioFiber}    TC27-FGetJioFiber
    Verify and Validate Installation address map page

Confirm If Maximum attempts toast appears
    [Documentation]   TC32
    [Tags]    ${TC32-FGetJioFiber}    TC32-FGetJioFiber
    Verify and Validate If Maximum attempts toast appears
