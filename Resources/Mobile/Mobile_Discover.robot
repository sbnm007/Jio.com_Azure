*** Settings ***
Resource                            Mobile_PO/Discover_PO/RedirectionToMobile.robot
Resource                            Mobile_PO/Discover_PO/Banner_Functionality.robot
Resource                            Mobile_PO/Discover_PO/Hot_deals_on_cool_devices.robot
Resource                            Mobile_PO/Discover_PO/A_bouquet_of_JioApps.robot
Resource                            Mobile_PO/Discover_PO/Here_why_India_prefers_Jio.robot
Resource                            Mobile_PO/Discover_PO/What_Trending.robot
Resource                            Mobile_PO/Discover_PO/Already_a_Jio_User.robot
Resource                            Mobile_PO/Discover_PO/Popular_Mobile_Plans.robot
Resource                            Mobile_PO/Discover_PO/ThrilledAboutJioBenefits.robot
Resource                            Mobile_PO/Discover_PO/Easily_Recharge.robot
Resource                            Mobile_PO/Discover_PO/Discover_UI.robot
Resource                            ../Fiber/FiberPage_PO/Discover_PO/NeedGuidance.robot

#Rearrange according TC order on devops
*** Keywords ***
Verify Discover Page UI
    Landing on Mobile Page
    Discover Page UI Verification

Discover Carousel Banner Verification
    Landing on Mobile Page 
    Discover Carousel Banner Validation
    
Easily recharge or pay bills online Section Verification
    Landing on Mobile Page
    Easily recharge or pay bills online Section Validation

Here why India prefers Jio Section Verification
    Landing on Mobile Page
    Here why India prefers Jio Section Validation

Thrilled about Jio benefits Section Verification
    Landing on Mobile Page
    Thrilled about Jio benefits Section Validation 

Popular Mobile Plans Section Verification
    Landing on Mobile Page
    Popular Mobile Plans Section Validation

What Trending Section Verification
    Landing on Mobile Page
    What Trending Section Validation

Already a Jio User Section Verification
    Landing on Mobile Page
    Already a Jio User Section Validation

Hot deals on cool devices Section Verification
    Landing on Mobile Page
    Hot deals on cool devices Section Validation

A bouquet of JioApps Section Verification
    Landing on Mobile Page
    A Bouquet of JioApps Section Validation

Discover Need Guidance Section Verification
    Landing on Mobile Page
    Need guidance section Validation
