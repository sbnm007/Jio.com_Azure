*** Settings ***
Library    SeleniumLibrary
Resource    ../../../Common.robot
Variables   ../../../../Tests/Fiber/FPostpaid_Variables.yaml
Resource     ../Postpaid_PO/RedirectionToPostpaid.robot
Resource         ../../../Excel_Activity.robot
Resource        ../../../Local_Keywords.robot
*** Keywords ***

Verify UI elements & content of banners under 'Switch to Jio' & confirm user redirected to respective lead pages on clicking the banner(s)
    Scroll To    xpath://section[contains(@class,"carouselContainer")]
    
    # For loop to check the redirection of Promo cards buttons
    FOR  ${i}  IN RANGE    0    3
    
    # Checking redirection of promo card buttons and taking screenshot
    Redirection On Clicking    xpath:(//a[contains(@class,"promoCards")])[${i+1}]   ${Discover_more_Urls[${i}]}    Promo_card_button${i+1}

    END
    
