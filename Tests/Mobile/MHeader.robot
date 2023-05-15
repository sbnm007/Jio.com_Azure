*** Settings ***
Resource                            ../../Resources/Common.robot
Resource                            ../../Resources/Local_keywords.robot
Resource                            ../../Resources/Mobile/Mobile_Header.robot
Variables                           MHeader_Variables.yaml
Resource                            ../../Resources/Tags.robot
Suite Setup                         Mobile Header Tag Activity
Test Setup        Begin Web Test
Test Teardown     End Web Test


*** Test Cases ***

Confirm Mobile Page UI & Sub-Header Menu Redirection of Mobile Page
    [Documentation]    TC01 to TC07
    [Tags]           ${TC01-MHeader}    TC01-MHeader    Sanity
    Verify Mobile Page UI & Sub-Header Menu Redirection of Mobile Page

Confirm Header Menu Redirection from Mobile Page
    [Documentation]     TC08 to TC12
    [Tags]           ${TC08-MHeader}    TC08-MHeader    Sanity
    Verify Header menu Redirections             

Confirm Search Bar Functionality from Mobile Page
    [Documentation]     TC13 to TC24   (TC24 Partially Automated)
    [Tags]           ${TC13-MHeader}    TC13-MHeader    Sanity
    Verify Search bar Functionality                         

Confirm Log-in Icon Redirection from Mobile Page
    [Documentation]     TC25
    [Tags]           ${TC25-MHeader}    TC25-MHeader
    Verify Log-in Icon Functionality                       
    
# Confirm on clicking cart icon user redirected to shopping page                 
#     [Documentation]     TC26
#     [Tags]           ${TC26-MHeader}    TC26-MHeader  (TC26 Pending)
#     Verify MyCart icon redirection with product in Cart
    
 # robot -d Results/Mobile  Tests/Mobile/MHeader.robot
 # robotmetrics --metrics-report-name HeaderPage-Report.html
