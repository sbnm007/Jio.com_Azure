*** Settings ***
Resource                            ../../Resources/Common.robot
Resource                            ../../Resources/Local_keywords.robot    
Resource                            ../../Resources/Mobile/Mobile_Recharge.robot
Resource                            ../../Resources/Tags.robot
Suite Setup                         Mobile Recharge Tag Activity
Test Setup                          Begin Web Test
Test Teardown                       End Web Test

*** Test Cases ***
Confirm UI of Mobile Recharge page
    [Documentation]     TC01 To TC08
    [Tags]    ${TC01-MRecharge}    TC01-MRecharge
    Visit Mobile Recharge Page
    Recharge Page UI Validation

Confirm UI and Functionallity of Mobile View Details Section
    [Documentation]     TC09 To TC13
    [Tags]    ${TC09-MRecharge}    TC09-MRecharge
    Visit Mobile Recharge Page
    Mobile View Details Section UI Verification

Confirm UI and Functionallity Mobile ISD page
    [Documentation]     TC14 To TC22
    [Tags]    ${TC14-MRecharge}    TC14-MRecharge    Sanity
    Visit Mobile Recharge Page
    MR-ISD Section Validation

Confirm UI and Functionallity of Mobile International Roaming Page
    [Documentation]     TC23 To TC32
    [Tags]    ${TC23-MRecharge}    TC23-MRecharge    Sanity
    Visit Mobile Recharge Page
    MR-International Roaming Section Validation

Confirm UI and Functionallity of Fiber View Details Section
    [Documentation]     TC33 To TC43
    [Tags]    ${TC33-MRecharge}    TC33-MRecharge
    Visit Mobile Recharge Page
    Fiber View Details Section UI Verification

Confirm UI and Functionallity of Mobile Payment Gateway Page 
    [Documentation]     TC44 To TC47    (TC45,TC46 Out of Scope)
    [Tags]    ${TC44-MRecharge}    TC44-MRecharge    Sanity
    Visit Mobile Recharge Page
    MR-Payment Gateway Page Validation

Confirm UI and redirection of Recharge 'here' hyperlink in Recharge page
    [Documentation]    TC48 & TC49
    [Tags]    ${TC48-MRecharge}    TC48-MRecharge
    Visit Mobile Recharge Page
    Recharge Here - JioLink Validation

# robot -d Results/Mobile Tests/Mobile/MRecharge.robot
# robotmetrics --metrics-report-name DiscoverPage-Report.html

