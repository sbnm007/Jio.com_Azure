*** Settings ***
Library                             OperatingSystem
Resource                            ../../Resources/Common.robot
Resource                            ../../Resources/Apps/Apps_page.robot
Resource                            ../../Resources/Excel_Activity.robot
Resource                            ../../Resources/Local_Keywords.robot
Variables                           Variables.yaml
Resource                            ../../Resources/Tags.robot
# Suite Setup                         Apps Tag Activity
Test Setup                          Begin Web Test
Test Teardown                       End Web Test



*** Test Cases ***
Confirm the redirection to Apps page when clicked 
    [Documentation]  This is 1st Test case     ((TC01)    107919 is Out of Scope)
    [Tags]  ${Apps_Home}    Apps_Home
    Visit Apps Page on Jio.com 


Confirm the layout of the Apps page
    [Documentation]  This is 2nd Test case
    [Tags]  ${Apps_Home}    Apps_Home
    Visit Apps Page on Jio.com 
    Apps Page Validation


Confirm UI Functionality of JioNews App
    [Documentation]    JioNews test case validation   (TC01-TC12) 
    [Tags]    ${JioNews}    JioNews    Ent
    Visit Apps Page on Jio.com
    Verify and Validate JioNews app


Confirm UI elements and Redirection of MyJio App Tile
    [Documentation]     This is common test case to verify UI elements of MyJio tile    (TC01-TC15)
    [Tags]    ${MyJio}    MyJio
    Visit Apps Page on Jio.com
    Verify and Validate MyJio app


Confirm UI Functionality of JioSaavn App
    [Documentation]    JioSaavn test case validation    (TC01-TC12)
    [Tags]    ${JioSaavn}    JioSaavn    Ent
    Visit Apps Page on Jio.com
    Verify and Validate JioSaavn app


Confirm UI Functionality of JioTV App
    [Documentation]    JioTV test case validation    (TC01-TC13)
    [Tags]    ${JioTV}    JioTV    Ent
    Visit Apps Page on Jio.com
    Verify and Validate JioTV app 


Confirm UI Functionality of JioCinema App
    [Documentation]    JioCinema test case validation    (TC01-TC13)
    [Tags]    ${JioCinema}    JioCinema    Ent
    Visit Apps Page on Jio.com
    Verify and Validate JioCinema app


Confirm UI elements and Redirection of JioPos Lite App Tile
    [Documentation]    This is common test case to verify UI elements of JioPos Lite tile    (TC01-TC11)
    [Tags]   ${JioPosLite}  JioPosLite
    Visit Apps Page on Jio.com
    Verify and Validate JioPos Lite app


Confirm UI elements and Redirection of JioHealth Hub App Tile
    [Documentation]     This is common test case to verify UI elements of JioHealth Hub tile    (TC01-TC15)
    [Tags]    ${JioHealthHub}    JioHealthHub
    Visit Apps Page on Jio.com
    Verify and Validate JioHealth Hub app


Confirm UI elements and Redirection of JioChat App Tile
    [Documentation]     This is common test case to verify UI elements of JioMeet tile    (TC01-TC12)
    [Tags]    ${JioChat}    Jiochat
    Visit Apps Page on Jio.com
    Verify and Validate JioChat app


Confirm UI elements and Redirection of JioMart App Tile
    [Documentation]     This is common test case to verify UI elements of JioMart tile    (TC01-TC12)
    [Tags]   ${JioMart}  JioMart
    Visit Apps Page on Jio.com
    Verify and Validate JioMart app


Confirm UI elements and Redirection of JioCloud App Tile
    [Documentation]          This is common test case to verify UI elements of JioCloud tile    (TC01-TC10)
    [Tags]    ${JioCloud}    JioCloud
    Visit Apps Page on Jio.com
    Verify and Validate JioCloud app


Confirm UI elements and Redirection of JioSecurity App Tile
    [Documentation]          This is common test case to verify UI elements of JioSecurity tile    (TC01-TC13)
    [Tags]    ${JioSecurity}    JioSecurity
    Visit Apps Page on Jio.com
    Verify and Validate JioSecurity app


Confirm UI elements and Redirection of JioMeet App Tile
    [Documentation]     This is common test case to verify UI elements of JioMeet tile ((TC01-TC10)  108100 is Out of Scope)
    [Tags]    ${JioMeet}    JioMeet
    Visit Apps Page on Jio.com
    Verify and Validate JioMeet app


Confirm UI elements and Redirection of JioCall App Tile
    [Documentation]     This is common test case to verify UI elements of JioCall tile    (TC01-TC12)
    [Tags]    ${JioCall}    JioCall
    Visit Apps Page on Jio.com
    Verify and Validate JioCall app


Confirm UI elements and Redirection of JioPages App Tile
    [Documentation]     This is common test case to verify UI elements of JioPages tile    (TC01-TC10)
    [Tags]    ${JioPages}    JioPages
    Visit Apps Page on Jio.com
    Verify and Validate JioPages app


Confirm UI Functionality of JioGames App
    [Documentation]    JioGames test case validation    (TC01-TC12)
    [Tags]    ${JioGames}    JioGames    Ent
    Visit Apps Page on Jio.com
    Verify and Validate JioGames app


Confirm UI elements and Redirection of JioHome App Tile
    [Documentation]     This is common test case to verify UI elements of JioHome tile    (TC01-TC12)
    [Tags]    ${JioHome}    JioHome
    Visit Apps Page on Jio.com
    Verify and Validate JioHome app
