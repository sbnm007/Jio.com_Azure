*** Settings ***
Library                            SeleniumLibrary
Resource                           ../../Resources/Shop/ShopAccessories_Page.robot
Resource                           ../../Resources/Common.robot
Variables                          Accessories_Variables.yaml 
Resource                            ../../Resources/Tags.robot
Suite Setup                        Shop Accessories Tag Activity
Test Setup                         Begin Web Test
Test Teardown                      End Web Test

*** Test Cases ***

Confirm 'Accessories' tab UI and Functionality
    [Tags]    ${TC01-SAccessories}    TC01-SAccessories   Sanity 
    [Documentation]    This is 1st to 3rd Test case
    Check 'Most Popular' and 'Most Value' sections UI and Functionality

Confirm UI and content of Accessories Filter options
    [Tags]    ${TC04-SAccessories}    TC04-SAccessories     Sanity
    [Documentation]    This is 4th to 12th Test case
    Check Show Filter UI and Functionality

Confirm the UI and content of 'Accessories' cards
    [Tags]    ${TC13-SAccessories}    TC13-SAccessories     Sanity
    [Documentation]    This is 13th to 36th Test case (TC25 is Out of Scope )
    Check Each Accessories Product UI and Functionality

# robot -d Results/Shop/Accessories Tests/Shop_page/Accessories/Main.robot