*** Settings ***
Library    SeleniumLibrary
Resource    ../../Resources/Fiber/FiberPostpaid_Page.robot    
Resource    ../../Resources/Common.robot                      
Resource    ../../Resources/Local_Keywords.robot              
Resource    ../../Resources/Excel_activity.robot                  
Variables   FPostpaid_Variables.yaml 
Resource                            ../../Resources/Tags.robot
Suite Setup                         Fiber Postpaid Tag Activity
Test Setup                          Begin Web Test
Test Teardown                       End Web Test

*** Test Cases ***
Confirm user is redirected to Postpaid section on clicking Postpaid option from sub header
    [Tags]              ${TC01-FPostpaid}  TC01-FPostpaid    Sanity
    [Documentation]     TC01
    Verify Page Redirection of Postpaid Section

Confirm UI and content of Postpaid page
    [Tags]              ${TC02-FPostpaid}  TC02-FPostpaid    Sanity
    [Documentation]     TC02 to TC03
    Verify and Validate UI of Postpaid Page

Confirm banners are visible below top navbar on Postpaid page   
    [Tags]              ${TC04-FPostpaid}  TC04-FPostpaid    Sanity
    [Documentation]     TC04 to TC06  
    Verify and Validate banner are visible, it's carousal functionality and banner redirection

Confirm Postpaid Fiber plans section is visible and verify the UI elements and content
    [Tags]              ${TC10-FPostpaid}  TC10-FPostpaid    Sanity
    [Documentation]     TC10 and TC11
    Verify Postpaid Fiber plans section is visible and validate the UI elements and content
    
Confirm the UI and content redirection of Monthly Plans page
    [Tags]              ${TC12-FPostpaid}  TC12-FPostpaid    Sanity
    [Documentation]     TC12 to TC25 (TC24 out of scope) 
    Verify and Validate the UI and Content of Monthy Plans Page 

Confirm the UI and content redirection of Quarterly Plans page 
    [Tags]              ${TC26-FPostpaid}  TC26-FPostpaid  Sanity
    [Documentation]     TC26 to TC39 (TC38 Out of scope)
    Verify and Validate the UI and Content of Quarterly Plans Page

Confirm the UI and content redirection of Semi-Annual Plans page
    [Tags]              ${TC40-FPostpaid}  TC40-FPostpaid 
    [Documentation]     TC40 to TC53 (TC52 Out of scope)
    Verify and Validate the UI and Content of Semi-Annual Plans Page

Confirm the UI and content redirection of Annual Plans page
    [Tags]              ${TC54-FPostpaid}  TC54-FPostpaid    Sanity
    [Documentation]     TC54 to TC67 (TC66 Out of scope)
    Verify and Validate the UI and content of Annual Plans page

Confirm UI and content of ISD Plans page and plan cards
    [Tags]               ${TC68-FPostpaid}  TC68-FPostpaid    Sanity
    [Documentation]      TC68 to TC78 (TC77 Out of scope)
    Verify and Validate the UI and content of ISD Plans page
   
Confirm UI and functionality of all plan cards in Data Sachet section
    [Tags]                ${TC79-FPostpaid}  TC79-FPostpaid    Sanity
    [Documentation]       TC79 and TC89 (TC81,TC88 Out of scope)
    Verify and Validate UI and content of all plan cards in Data Sachet section

Confirm Entertainment on demand section is visible and verify the UI elements and content
    [Tags]                 ${TC90-FPostpaid}  TC90-FPostpaid 
    [Documentation]        TC90
    Verify and Validate Entertainment on demand section is visible and verify the UI elements and content

Confirm Incredible Fiber plans section is visible and verify the UI elements and content
    [Tags]                 ${TC91-FPostpaid}  TC91-FPostpaid    Sanity
    [Documentation]        TC91 to TC95
    Verify and Validate Incredible Fiber plans section is visible and verify the UI elements and content

Confirm redirection of all plan buttons under 'Speeds as per your digital needs'
    [Tags]                 ${TC96-FPostpaid}  TC96-FPostpaid    Sanity
    [Documentation]        TC96 and TC97
    Verify and Validate Redirection of all plan buttons under 'Speeds as per your digital needs'

Confirm UI elements & content of banners under 'Switch to Jio' & confirm user redirected to respective lead pages on clicking the banner
    [Tags]                 ${TC98-FPostpaid}  TC98-FPostpaid    Sanity
    [Documentation]        TC98
    Verify and Validate UI elements & content of banners under 'Switch to Jio' & confirm user redirected to respective lead pages on clicking the banner(s)
