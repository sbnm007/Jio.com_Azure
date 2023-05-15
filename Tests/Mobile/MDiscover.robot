*** Settings ***
Resource                            ../../Resources/Common.robot
Resource                            ../../Resources/Local_keywords.robot
Variables                           ../../Resources/Common_Variables.yaml
Resource                            ../../Resources/Mobile/Mobile_Discover.robot
Resource                            ../../Resources/Excel_activity.robot
Variables                           MDiscover_Variable.yaml
Resource                            ../../Resources/Tags.robot
Suite Setup                         Mobile Discover Tag Activity
Test Setup                          Begin Web Test
Test Teardown                       End Web Test

*** Test Cases ***
Confirm Redirection, UI and Content of Discover page
    [Documentation]  TC01
    [Tags]    ${TC01-MDiscover}    TC01-MDiscover
    Verify Discover Page UI

Confirm UI, Content and Functionality of Carousel Banner 
    [Documentation]  TC02-TC08
    [Tags]    ${TC02-MDiscover}   TC02-MDiscover    Sanity
    Discover Carousel Banner Verification

Confirm UI, Content and Functionality of Easily recharge or pay bills online
    [Documentation]    TC09-TC036
    [Tags]    ${TC09-MDiscover}    TC09-MDiscover    Sanity
    Easily recharge or pay bills online Section Verification
    
Confirm UI and Content of Here’s why India prefers Jio Section
    [Documentation]    TC37-TC38
    [Tags]    ${TC37-MDiscover}    TC37-MDiscover      
    Here why India prefers Jio Section Verification

Confirm UI, Content and Functionality of Thrilled about Jio Benefits Section 
    [Documentation]    TC39-TC58   (TC45 Partially Automated)
    [Tags]    ${TC39-MDiscover}    TC39-MDiscover    Sanity
    Thrilled about Jio benefits Section Verification    

Confirm UI, Content and Functionality of Popular Mobile Plans
    [Documentation]    TC59-TC66        (TC51-TC57 Partially Automated)
    [Tags]   ${TC59-MDiscover}    TC59-MDiscover    Sanity
    Popular Mobile Plans Section Verification

Confirm UI, Content and Redirection of What's Trending Section
    [Documentation]    TC67-TC70
    [Tags]   ${TC67-MDiscover}    TC67-MDiscover    Sanity
    What Trending Section Verification

Confirm UI, Content and Redirection of Already a Jio User Section
    [Documentation]    TC71-TC74
    [Tags]   ${TC71-MDiscover}    TC71-MDiscover   Sanity
    Already a Jio User Section Verification

Confirm UI, Content and Redirection of Hot deals on cool devices Section
    [Documentation]    TC75-TC79
    [Tags]   ${TC75-MDiscover}    TC75-MDiscover    Sanity
    Hot deals on cool devices Section Verification

Confirm UI, Content and Redirection of A bouquet of JioApps Section
    [Documentation]    TC80-TC82
    [Tags]   ${TC80-MDiscover}    TC80-MDiscover    Sanity
    A bouquet of JioApps Section Verification

Confirm UI, Content and Redirection of Need Guidance Section
    [Documentation]    TC83-TC88
    [Tags]   ${TC83-MDiscover}    TC83-MDiscover    Sanity
    Discover Need Guidance Section Verification

# robot -d Results/Mobile Tests/Mobile/MDiscover.robot
# robotmetrics --metrics-report-name DiscoverPage-Report.html
