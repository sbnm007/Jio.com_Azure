*** Settings ***
Library                                     SeleniumLibrary
Resource                                    ../../Resources/Shop/ShopSmartphone_Page.robot
Resource                                    ../../Resources/Common.robot
Variables                                   Smartphone_Variables.yaml 
Resource                            ../../Resources/Tags.robot
Suite Setup                         Shop Smartphones Tag Activity
Test Setup                                  Begin Web Test
Test Teardown                               End Web Test

*** Test Cases ***

Confirm 'Most popular' and 'Most Value' sections are visible under 'Smartphone' tab
    [Tags]    ${TC01-SSmartphones}    TC01-SSmartphones    Sanity  
    [Documentation]    This is 1st to 3rd Test case
    # Skip
    Check 'Most Popular' and 'Most Value' sections UI and Functionality

Confirm the UI and content of 'Smartphone' cards
    [Tags]    ${TC04-SSmartphones}    TC04-SSmartphones    Sanity
    [Documentation]    This is 4th to 28th Test case
    # Skip
    Check Each Smart Devices Product UI and Functionality
    
Confirm UI and content of SmartPhone Filter options
    [Tags]    ${TC29-SSmartphones}    TC29-SSmartphones    Sanity
    [Documentation]    This is 29th to 38th Test case
    # Skip
    Check Show Filter UI and Functionality
    
# robot -d Results/Shop/Smartphone Tests/Shop/Smartphone/Main.robot