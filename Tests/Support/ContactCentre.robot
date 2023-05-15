*** Settings ***
Resource                         ../../Resources/Common.robot
Resource                        ../../Resources/Support/SupportContactCentre_Page.robot
Resource                            ../../Resources/Tags.robot
Suite Setup                         Support Contact centre Tag Activity
Test Setup                      Begin Web Test
Test Teardown                   End Web Test



*** Test Cases ***
Confirm Contact Centre Section is Visible in Support tab
    [Documentation]  This is 92656-92667 TestCase (This is TC01 - TC12)
    [Tags]  ${TC01-SUC}    TC01-SUC   Sanity
    Visit Support Contact Centre page of Jio.com  
    Contact Centre section is visible on Support tab Validation 