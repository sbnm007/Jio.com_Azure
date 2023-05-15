*** Settings ***
Library                                 SeleniumLibrary
Resource                                ../../Resources/Shop/ShopJioFi_Page.robot
Resource                                ../../Resources/Common.robot
Variables                               JioFi_Variables.yaml 
Resource                            ../../Resources/Tags.robot
Suite Setup                         Shop Jio Fi Tag Activity
Test Setup                              Begin Web Test
Test Teardown                           End Web Test

*** Test Cases ***
Confirm the UI and content of 'JioFi' page
    [Tags]    ${TC01-SJioFi}    TC01-SJioFi    Sanity
    [Documentation]    This is 1st to 3rd Test case
    Check the UI and content of 'JioFi' page

Verify UI elements & content on Filter options on JioFi page
    [Tags]    ${TC04-SJioFi}    TC04-SJioFi    Sanity
    [Documentation]   This is 4th to 10th Test case
    UI Validation of Filter options on JioFi page

Confirm the UI and content of 'JioFi' product page
    [Tags]    ${TC11-SJioFi}    TC11-SJioFi    Sanity
    [Documentation]    This is 11th to 27th Test case (TC15,16,17,18 Out of Scope)
    Check UI and content of 'JioFi' product page

    


# robot -d Results/ShopPage/JioFi -i TC11-SJioFi Tests/Shop_Page/JioFi_Main.robot
# robot -d Results/ShopPage/JioFi Tests/Shop_Page/JioFi_Main.robot
