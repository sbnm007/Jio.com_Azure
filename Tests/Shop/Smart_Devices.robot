*** Settings ***
Library                          SeleniumLibrary
Resource                         ../../Resources/Shop/ShopSmartDevices_Page.robot
Resource                         ../../Resources/Common.robot
Variables                        Smart_Devices_Variables.yaml 
Resource                            ../../Resources/Tags.robot
Suite Setup                         Shop Smartdevices Tag Activity
Test Setup                       Begin Web Test
Test Teardown                    End Web Test

*** Test Cases ***

Confirm Smart Devices Prdouct UI and Functionality
    [Tags]    ${TC01-SSmartDevices}    TC01-SSmartDevices    Sanity
    [Documentation]    This is 1st to 26th Test case
    Check Each Smart Devices Product UI and Functionality

Confirm 'Smart Devices' tab UI and Functionality
    [Tags]    ${TC27-SSmartDevices}    TC27-SSmartDevices    Sanity
    [Documentation]    This is 27th to 29th Test case
    Check 'Most Popular' and 'Most Value' sections UI and Functionality

Confirm Show Filter UI and Functionality
    [Tags]    ${TC30-SSmartDevices}    TC30-SSmartDevices    Sanity
    [Documentation]     This is 30th to 36th Test case
    Check Show Filter UI and Functionality
    
# robot -d Results/ShopPage/Smart_Devices -i TC01-SSmart_Devices Tests/Shop_page/Smart_Devices_Main.robot