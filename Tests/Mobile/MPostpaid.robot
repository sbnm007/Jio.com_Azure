*** Settings ***
Resource                            ../../Resources/Common.robot
Resource                            ../../Resources/Local_keywords.robot
Resource                            ../../Resources/Mobile/Mobile_Postpaid.robot
Resource                            ../../Resources/Tags.robot
Suite Setup                         Mobile Postpaid Tag Activity
Test Setup                          Begin Web Test
Test Teardown                       End Web Test


*** Test Cases ***
Confirm Redirection to Postpaid Page
    [Documentation]  TC01
    [Tags]           ${TC01-MPostpaid}    TC01-MPostpaid
    Visit Postpaid page of Jio.com

Confirm Mobile Prepaid Page and Functionality 
    [Documentation]    TC02
    [Tags]           ${TC02-MPostpaid}    TC02-MPostpaid    Sanity
    Verify and Validate Postpaid Page

Verifying the options selected on header on postpaid page
    [Documentation]    TC03 to TC04
    [Tags]           ${TC03-MPostpaid}    TC03-MPostpaid
    Verifying the options selected on header on postpaid page

Confirm View All Plans Button Redirection on Postpaid Page
    [Documentation]    TC10 to TC11
    [Tags]           ${TC10-MPostpaid}    TC10-MPostpaid
    Verify View All Plans Button Redirection on Postpaid Page
    
# Confirm UI, Content and Functionality of Main Plans Page
#     [Documentation]  TC12 to TC28
#     [Tags]           TC12-MPostpaid    Sanity
#     Verify and Validate Main Plans Page

Confirm UI, Content and Functionality of ISD Page
    [Documentation]  TC29 to TC42
    [Tags]           ${TC29-MPostpaid}    TC29-MPostpaid    Sanity
    Verify and Validate Postpaid-ISD Plans Page

Confirm UI, Content and Functionality of IR Page
    [Documentation]  TC43 to TC67
    [Tags]           ${TC43-MPostpaid}    TC43-MPostpaid    Sanity
    Verify and Validate Postpaid IR Plans Page
    
Confirm UI, Content and Functionality of In-Flight Page
    [Documentation]  TC68 to TC82
    [Tags]           ${TC68-MPostpaid}    TC68-MPostpaid    Sanity
    Verify and Validate Postpaid In-Flight Packs Plans Page

# Confirm Redirection to JioSaavn pro Plans Page. Verify UI, Content and Functionality of All plans.
#     [Documentation]  TC83 to TC90
#     [Tags]           TC83-MPostpaid    Sanity  
#     Verify and Validate JioSaavn Pro Plans Page

Confirm UI and Content of Top-selling postpaid plans Page
    [Documentation]    TC91 to TC96
    [Tags]           ${TC91-MPostpaid}    TC91-MPostpaid    Sanity
    Verify and Validate Top-selling postpaid plans

Confirm UI elements and content of 'Already a Jio Postpaid user?'
    [Documentation]    TC97 to TC98
    [Tags]           ${TC97-MPostpaid}    TC97-MPostpaid
    Verify and Validate 'Already a Jio Postpaid user?' section 


# robot -d Results/Mobile Tests/Mobile/MPostpaid.robot
# robotmetrics --metrics-report-name PostpaidPage-Report.html

