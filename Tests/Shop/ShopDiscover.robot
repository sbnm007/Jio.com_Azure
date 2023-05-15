*** Settings ***
Library                                   SeleniumLibrary
Resource                                  ../../Resources/Shop/ShopDiscover_Page.robot
Resource                                  ../../Resources/Common.robot
Variables                                 Discover_Variables.yaml
Resource                            ../../Resources/Tags.robot
Suite Setup                         Shop Discover Tag Activity
Test Setup                                Begin Web Test
Test Teardown                             End Web Test

*** Test Cases ***

Confirm banner carousel is visible to user
    [Tags]    ${TC01-SDiscover}    TC01-SDiscover    Sanity
    [Documentation]    This is 1st to 7th Test case    (TC04 Out of Scope)
    Check banner carousel is visible to user

Confirm Quick Action Buttons are visible to user
    [Tags]    ${TC08-SDiscover}    TC08-SDiscover    Sanity
    [Documentation]     This is 8th to 12th Test case
    Check Quick Action Buttons are visible to user

Confirm 'Launched and its here!' section is visible to user
    [Tags]    ${TC13-SDiscover}    TC13-SDiscover    Sanity
    [Documentation]    This is 13th to 16th Test case
    Check 'Launched and its here!' section is visible to user

# vivek
Confirm 'Bringing people together' section is visible to user
    [Tags]    ${TC17-SDiscover}    TC17-SDiscover    Sanity
    [Documentation]    This is 17th to 19th Test case
    Bringing people together section visibility along with UI and redirection to GetJioFiber

Confirm 'Trending right now' section is visible to user along with UI and is redirected to respective product page when clicking on product tile
    [Tags]   ${TC20-SDiscover}     TC20-SDiscover    Sanity
    [Documentation]    This is 20th to 22nd Test case
    Trending right now section is visible to user along with UI and is redirected to respective product page when clicking on product tile

Confirm 'Always find new offers' section is visible to user and is redirected to relevant product page on clicking on Buy Now button
    [Tags]    ${TC23-SDiscover}    TC23-SDiscover    Sanity
    [Documentation]    This is 23rd to 25th Test case
    Always find new offers section is visible to user along with UI and is redirected to relevant product page on clicking on Buy Now button

Confirm 'More reasons to shop here' section is visible to user
    [Tags]    ${TC26-SDiscover}    TC26-SDiscover    Sanity
    [Documentation]    This is 26th to 27th Test case
    More reasons to shop here section is visible to user along with UI

Confirm 'Need guidance?' section is visible to user along with UI and is redirected to Online Shopping FAQ page and contact centre
    [Tags]    ${TC28-SDiscover}    TC28-SDiscover    Sanity
    [Documentation]    This is 28th to 31st Test case
    Need guidance? section is visible to user along with UI and is redirected to Online Shopping FAQ page and contact centre

# robot -d Results/ShopPage/Discover -i 92535 Tests/Shop_page/Discover/Main.robot