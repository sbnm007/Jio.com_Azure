*** Settings ***
Resource                            ../../Resources/Common.robot
Resource                            ../../Resources/Local_keywords.robot
Resource                            ../../Resources/Mobile/Mobile_Prepaid.robot
Resource                            ../../Resources/Tags.robot
Suite Setup                         Mobile Prepaid Tag Activity
Test Setup                          Begin Web Test
Test Teardown                       End Web Test


*** Test Cases ***
Confirm Redirection Mobile Prepaid Page and Functionality      
    [Documentation]  TC01 to TC04
    [Tags]    ${TC01-MPrepaid}    TC01-MPrepaid    Sanity
    Verify and Validate Prepaid Page        
    
Confirm Popular Page and Functionality
    [Documentation]  TC05 to TC022      (TC22 Out of Scope)
    [Tags]    ${TC05-MPrepaid}    TC05-MPrepaid    Sanity  
    Verify and Validate Popular Plans Page

Confirm Annual Plan Page and Functionality
    [Documentation]  TC23 to TC32    (TC27,TC31 Out of Scope)
    [Tags]    ${TC23-MPrepaid}    TC23-MPrepaid    Sanity
    Verify and Validate Annual Plans Page

Confirm JioPhone Plan Page and Functionality
    [Documentation]  TC33 to TC42    (TC37,TC39-TC41 Out of Scope)
    [Tags]    ${TC33-MPrepaid}    TC33-MPrepaid    Sanity
    Verify and Validate JioPhone Plans Page

# Confirm Data Add-On Plan Page and Functionality
#     [Documentation]   TC43 to TC59    (TC43,TC44,TC51-TC59 Out of Scope)(All out of scope)
#     [Tags]    ${TC43-MPrepaid}    TC43-MPrepaid    Sanity
#     Verify and Validate Data Add-On Page

Confirm No Daily Limit Plan Page and Functionality
    [Documentation]  TC60 to TC69    (TC64,TC68 Out of Scope)
    [Tags]     ${TC60-MPrepaid}    TC60-MPrepaid    Sanity
    Verify and Validate No Daily Limit Plans Page

Confirm JioPhone Add-On Plan Page and Functionality
    [Documentation]  TC70 to TC79    (TC74,TC76-TC78 Out of Scope)
    [Tags]    ${TC70-MPrepaid}    TC70-MPrepaid    Sanity 
    Verify and Validate JioPhone AddOn Plans Page

Confirm UI, Content and Functionality of ISD Page
    [Documentation]  TC80 to TC89
    [Tags]    ${TC80-MPrepaid}    TC80-MPrepaid    Sanity
    Verify and Validate Prepaid-ISD Plans Page

Confirm UI, Content and Functionality of IR Page
    [Documentation]  TC90 to TC109  
    [Tags]    ${TC90-MPrepaid}    TC90-MPrepaid    Sanity  
    Verify and Validate Prepaid IR Plans Page

Confirm UI, Content and Functionality of In-Flight Page
    [Documentation]  TC110 to TC119  (TC118 Out of scope)
    [Tags]    ${TC110-MPrepaid}    TC110-MPrepaid
    Verify and Validate Prepaid In-Flight Packs Plans Page


Confirm Top-up Plans Plan Page and Functionality
    [Documentation]  TC120 to TC128      (TC127 Out of scope)
    [Tags]    ${TC120-MPrepaid}    TC120-MPrepaid  Sanity 
    Verify and Validate Top-up Plans Page

Confirm Redirection to JioLink Plans Page. Verify UI, Content and Functionality of All plans.
    [Documentation]     TC129 to TC145      (TC140, TC142-TC144 Out of scope)
    [Tags]    ${TC129-MPrepaid}    TC129-MPrepaid  Sanity
    Verify and Validate JioLink Plans Page


Confirm Redirection to JioSaavn pro Plans Page. Verify UI, Content and Functionality of All plans.
    [Documentation]     TC146 to TC154        (TC153  Out of scope)
    [Tags]    ${TC146-MPrepaid}    TC146-MPrepaid  Sanity
    Verify and Validate JioSaavn Pro Plans Page


Confirm Value Plans Plan Page and Functionality
    [Documentation]  TC155 to TC164        (TC159, TC163 Out of Scope)
    [Tags]    ${TC155-MPrepaid}    TC155-MPrepaid  Sanity  
    Verify and Validate Value Plans Page

Confirm user is able to scroll after removing the applied filter from Popular plans page.
    [Documentation]  TC165    
    [Tags]    ${TC165-MPrepaid}    TC165-MPrepaid   Sanity
    Confirm The UI And Its Elements' Functionality Of Find India's most-loved plans here section

Verify UI elements & content below ' How much data you want?'
    [Documentation]  TC166-TC167      
    [Tags]    ${TC166-MPrepaid}    TC166-MPrepaid  Sanity
    Confirm The UI Of Get The Speed As Per Your Digital Needs Section

Verify UI Element And Its Redirection Of Discover More With Jio Section    
    [Documentation]  TC168      
    [Tags]     ${TC168-MPrepaid}    TC168-MPrepaid  Sanity
    Confirm The UI Of Discover More With Jio Section

# robot -d Results/Mobile Tests/Mobile/MPrepaid.robot
# robotmetrics --metrics-report-name DiscoverPage-Report.html