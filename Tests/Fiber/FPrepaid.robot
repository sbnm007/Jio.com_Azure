*** Settings ***
Library      SeleniumLibrary
Resource     ../../Resources/Fiber/FiberPrepaid_Page.robot
Resource     ../../Resources/Common.robot
Resource     ../../Resources/Excel_Activity.robot
Resource     ../../Resources/Local_Keywords.robot
Variables    FPrepaid_Variables.yaml 
Variables    ../../Resources/Common_Variables.yaml 
Resource                            ../../Resources/Tags.robot
Suite Setup                         Fiber Prepaid Tag Activity
Test Setup                          Begin Web Test
Test Teardown                       End Web Test

*** Test Cases ***
Confirm UI, Content and Redirection of Now upgrade your JioFiber section
    [Documentation]    TC01 to TC13
    [Tags]    ${TC01-FPrepaid}  TC01-FPrepaid    Sanity
    Visit JioFiber Prepaid Page on Jio.com
    Prepaid page UI Verification

Confirm UI, Content and Redirection of Monthly Subscriptions
    [Documentation]    TC14 to TC30 (TC29 - 92280 Out of Scope)
    [Tags]    ${TC14-FPrepaid}  TC14-FPrepaid    Sanity 
    Visit JioFiber Prepaid Page on Jio.com
    Verify Monthly Subscription Page
    

Confirm UI, Content and Redirection of Quaterly Subscriptions
    [Documentation]    TC31 to TC47 (TC46 - 92297 Out of Scope)
    [Tags]    ${TC31-FPrepaid}  TC31-FPrepaid    Sanity 
    Visit JioFiber Prepaid Page on Jio.com
    Verify Quarterly Subscription Page

Confirm UI, Content and Redirection of Semi-Annual Subscriptions
    [Documentation]    TC48 to TC64 (TC63 - 92313 Out of Scope)
    [Tags]    ${TC48-FPrepaid}  TC48-FPrepaid    Sanity 
    Visit JioFiber Prepaid Page on Jio.com
    Verify Semi-Annual Subscription Page

Confirm UI, Content and Redirection of Annual Subscriptions
    [Documentation]    TC65 to TC81 (TC80 - 92330 Out of Scope)
    [Tags]    ${TC65-FPrepaid}  TC65-FPrepaid    Sanity 
    Visit JioFiber Prepaid Page on Jio.com
    Verify Annual Subscription Page

Confirm UI, Content and Redirection of ISD Subscriptions
    [Documentation]    TC82 to TC92 (TC91 - 92341 Out of Scope)
    [Tags]    ${TC82-FPrepaid}  TC82-FPrepaid    Sanity 
    Visit JioFiber Prepaid Page on Jio.com
    Verify ISD Subscription Page

Confirm UI, Content and Redirection of Top-up Subscriptions
    [Documentation]    TC93 to TC102 (TC101 - 92351 Out of Scope)
    [Tags]    ${TC93-FPrepaid}  TC93-FPrepaid    Sanity 
    Visit JioFiber Prepaid Page on Jio.com
    Verify Top-up Subscription Page

Confirm UI, Content and Redirection of Data Sachet Subscriptions
    [Documentation]    TC103 to TC112 (TC111 - 92361 Out of Scope)
    [Tags]    ${TC103-FPrepaid}  TC103-FPrepaid    Sanity 
    Visit JioFiber Prepaid Page on Jio.com
    Verify Data Sachet Subscription Page

Confirm all FAQs have proper answers
    [Tags]    ${TC113-FPrepaid}    TC113-FPrepaid
    [Documentation]  TC113 to TC115  Sanity
    Visit JioFiber Prepaid Page on Jio.com
    Landing on FAQ Section and confirming FAQ answers
