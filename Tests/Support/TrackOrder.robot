*** Settings ***
Resource                        ../../Resources/Common.robot
Resource                       ../../Resources/Support/SupportTrackOrder_Page.robot
Resource                            ../../Resources/Tags.robot
Suite Setup                         Support Track Order Tag Activity
Test Setup                      Begin Web Test
Test Teardown                   End Web Test


*** Test Cases ***
Confirm the UI and content of Track Order page and 'View Order Details' in Devices Section
    [Documentation]    This is 1st to 7th Test Case
    [Tags]    ${TC01-SUTO}    TC01-SUTO  Sanity
    Visit Track Order Page of Jio.com
    UI of 'Track Order' and 'Devices' Page Validation

Confirm UI and Content of eSIM request page in Track Order Section
    [Documentation]    This is 8th to 15th Test Case ( TC14,TC15 Out of scope)
    [Tags]    ${TC08-SUTO}    TC08-SUTO  Sanity
    Visit Track Order Page of Jio.com    
    UI of 'Esim Request' Page Validation

Confirm UI and Content of 'Jio SIM and JioFiber ' Section in Track Order Section
    [Documentation]    This is 16th to 45th Test Case 
    [Tags]    ${TC16-SUTO}    TC16-SUTO  Sanity
    Visit Track Order Page of Jio.com
    UI and Functionality of 'JioSIM and JioFiber' section
