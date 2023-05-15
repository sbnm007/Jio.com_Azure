*** Settings ***
Library                         SeleniumLibrary
Resource                        ../../Resources/Fiber/FiberDiscover_Page.robot
Resource                        ../../Resources/Common.robot
Resource                        ../../Resources/Local_Keywords.robot
Resource                        ../../Resources/Excel_Activity.robot
Variables                       ../Fiber/FDiscover_Variables.yaml
Resource                            ../../Resources/Tags.robot
Suite Setup                     Fiber Discover Tag Activity
Test Setup                      Begin Web Test
Test Teardown                   End Web Test

*** Test Cases ***
Confirm Banner carousel is visible
    [Documentation]    TC01 to TC07    (TC2, TC6 Out of Scope)
    [Tags]    ${TC01-FDiscover}    TC01-FDiscover    Sanity
    Carousel Visibility

Confirm UI, Content and Redirection of Easy recharge and Pay bills section
    [Documentation]    TC08 to TC18
    [Tags]    ${TC08-FDiscover}    TC08-FDiscover        
    Easy recharge and Pay bills section Verification

Confirm UI, Content and Redirection of Redefining digital life section
    [Documentation]    TC19-TC22
    [Tags]       ${TC19-FDiscover}   TC19-FDiscover     Sanity
    Redefining digital life Verification

Confirm UI, Content and Redirection of Yet to experience JioFiber section
    [Documentation]     TC23-TC28   
    [Tags]      ${TC23-FDiscover}      TC23-FDiscover    
    Yet to experience JioFiber Verification  

Confirm UI, Content and Redirection of Popular JioFiber Plans section
    [Documentation]    TC29-TC47 
    [Tags]      ${TC29-FDiscover}    TC29-FDiscover    Sanity
    Popular JioFiber Plans Verification      

Confirm UI, Content and Redirection of What’s new in JioFiber section
    [Documentation]    TC48-TC51
    [Tags]    ${TC48-FDiscover}    TC48-FDiscover    Sanity
    Whats new in JioFiber Verification    

Confirm UI, Content and Redirection of Plug Sync and Upgrade section
    [Documentation]    TC52-TC55
    [Tags]    ${TC52-FDiscover}    TC52-FDiscover    Sanity
    Plug Sync and Upgrade Verification   

Confirm UI, Content and Redirection of Need guidance? section
    [Documentation]    TC56-TC58
    [Tags]    ${TC56-FDiscover}    TC56-FDiscover    Sanity
    Need guidance section Verification
    
