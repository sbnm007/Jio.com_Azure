*** Settings ***
Library    SeleniumLibrary
Resource    FiberPage_PO/Discover_PO/RedirectionToDiscover.robot
Resource    FiberPage_PO/Discover_PO/Banner_Functionality.robot
Resource    FiberPage_PO/Discover_PO/EasyRechargeandPaybills.robot
Resource    FiberPage_PO/Discover_PO/Redefining_dig_life.robot
Resource    FiberPage_PO/Discover_PO/Yet_To_Exp_JioFiber.robot
Resource    FiberPage_PO/Discover_PO/Popular_JioFiber.robot
Resource    FiberPage_PO/Discover_PO/Whats_new_JioFiber.robot
Resource    FiberPage_PO/Discover_PO/PlugSyncUpgrade.robot
Resource    FiberPage_PO/Discover_PO/NeedGuidance.robot
Resource    ../Excel_Activity.robot


*** Keywords ***
Test
    Landing on Fiber Discover Page

Carousel Visibility
    Landing on Fiber Discover Page
    Carousel Banner Visibility    

Easy recharge and Pay bills section Verification    
    Landing on Fiber Discover Page
    Easy recharge and Pay bills section Validation

Redefining digital life Verification
    Landing on Fiber Discover Page
    Redefining digital life Validation

Yet to experience JioFiber Verification 
    Landing on Fiber Discover Page
    Yet to experience JioFiber Validation

Popular JioFiber Plans Verification  
    Landing on Fiber Discover Page
    Popular JioFiber Plans Validation

Whats new in JioFiber Verification
    Landing on Fiber Discover Page
    Whats new in JioFiber Validation

Plug Sync and Upgrade Verification 
    Landing on Fiber Discover Page
    Plug Sync and Upgrade Validation

Need guidance section Verification
    Landing on Fiber Discover Page
    Need guidance section Validations
    
