*** Settings ***
Resource                        ../../Resources/Common.robot
Resource                        ../../Resources/Support/SupportLocateUs_Page.robot
Resource                            ../../Resources/Tags.robot
Suite Setup                         Support Locate Us Tag Activity
Test Setup                      Begin Web Test
Test Teardown                   End Web Test


*** Test Cases ***

Confirm UI and Content of Locate Us Page 
    [Documentation]    TC01 to TC33    Sanity
    [Tags]    ${TC01-SULU}    TC01-SULU  
    Visit LocateUs Support Page of Jio.com
    UI and content Of 'Stores', 'Services Centers' and 'Hotspots' 

    # robot -d Results/Support_Results/LocateUs -i TC01-SULU Tests/Support_page/LocateUs_main.robot