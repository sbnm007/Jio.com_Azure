*** Settings ***
Library    SeleniumLibrary
Resource    ../../Resources/Fiber/FiberServices_Page.robot
Resource    ../../Resources/Common.robot
Resource    ../../Resources/Excel_Activity.robot
Resource    ../../Resources/Local_Keywords.robot
Variables   ../../Tests/Fiber/FServices_Variables.yaml 
Variables    ../../Resources/Common_Variables.yaml 
Resource                            ../../Resources/Tags.robot
Suite Setup                          Fiber Services Tag Activity
Test Setup                          Begin Web Test
Test Teardown                       End Web Test

*** Test Cases ***
Confirm the UI elements and content of 'Services' page
    [Documentation]    TC01 to TC04  
    [Tags]    ${TC01-FServices}    TC01-FServices  Sanity
    Visit Fiber Services Page
    Verify and Validate Services Page

Confirm Redirection and UI elements of Jio TV Plus
    [Documentation]    TC05 to TC07
    [Tags]    ${TC05-FServices}    TC05-FServices  Sanity
    Visit Fiber Services Page
    Verify and Validate Giga-fast fun time-JioTV+ page

Confirm Redirection and UI elements of Jio Games
    [Documentation]    TC08 to TC10
    [Tags]    ${TC08-FServices}    TC08-FServices  Sanity
    Visit Fiber Services Page
    Verify and Validate Giga-fast fun time-JioGames page

Confirm Redirection and UI elements of Jio Join
    [Documentation]    TC11 to TC13
    [Tags]    ${TC11-FServices}    TC11-FServices  Sanity
    Visit Fiber Services Page
    Verify and Validate Giga-fast fun time-JioJoin page

Confirm Redirection and UI elements of Jio Photos
    [Documentation]    TC14 to TC16 
    [Tags]    ${TC14-FServices}    TC14-FServices  Sanity
    Visit Fiber Services Page
    Verify and Validate Giga-fast fun time-JioPhotos page

Confirm Redirection and UI elements of Jio Set Top Box 
    [Documentation]    TC17 to TC19 
    [Tags]    ${TC17-FServices}    TC17-FServices  Sanity
    Visit Fiber Services Page
    Verify and Validate Jio set top box page

Confirm Redirection and UI elements of "High speed internet & Free HD Voice" page
    [Documentation]    TC20 to TC22 
    [Tags]    ${TC20-FServices}    TC20-FServices  Sanity
    Visit Fiber Services Page
    Verify and Validate High Speed Internet and Free HD Voice page

Confirm Redirection and UI elements of "Home Networking & Smart Security" page
    [Documentation]    TC23 to TC25
    [Tags]    ${TC23-FServices}    TC23-FServices  Sanity
    Visit Fiber Services Page
    Verify and Validate Home Networking & Smart Security page

Confirm Redirection and UI elements of JioCentreX Page
    [Documentation]    TC26 to TC48    (TC37 - Not Automatable , TC39 and TC48 - Partially Automated)
    [Tags]    ${TC26-FServices}    TC26-FServices  Sanity
    Visit Fiber Services Page
    Verify and Validate JioCentrex Page
