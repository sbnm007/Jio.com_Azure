***Settings***
Library                     SeleniumLibrary
Resource                            ../../../../Resources/Local_Keywords.robot

***Keywords***
    
Redirection to Value Plan Page
    # Clicking oon View Plan Button
    Wait Until Keyword Succeeds     30sec    3sec    Wait For And Click Element    xpath=//button[@aria-label="button Value"]    
    Set Screenshot Directory        /Results/Mobile/Prepaid_Screenshots/ValuePlan/
    # Taking Screenshot of View Page Load
    Take Page Screenshot             ValuePlan-PageLoaded

Validate UI and Content and functionality of Value Plans Page
    # Verifing View plan Page UI
    Plan Page UI Verification       Value
Verify and Validate Plan Cards and Recharge Redirection of Value Plans
    # Verifying All Plan card on View Plan Page
    Reloading Page
    # Verifying All Plan card 
    ${elements}=    Get WebElements                            xpath=//section[contains(@class,'desktop')]//div[contains(@class,"PlanName_planText")]
    ${length}=                          Get Length     ${elements}
    Log To Console  ${length}
    ${RURL}=        Get Location
    # Loop to verify and validate Plan cards 
    FOR     ${j}    IN RANGE   1  ${length}+1

        # Verifying Plan Card
        Plan Card Verification             Mobile_Prepaid       xpath=(//section[contains(@class,'desktop')]//div[contains(@class,"PlanName_planText")])[${j}]       xpath=(//section[contains(@class,'desktop')]//div[@class="Details_planCont__1xVvf"]//div[@class="j-grid"])[${j}]        xpath=(//button//div[contains(text(),'Recharge')])[${j}]        xpath=(//button//div[contains(text(),'View details')])[${j}]        Value
        
        # Verifying Recharge Pop-up
        common.Recharge Popup Verification                      xpath=(//button//div[contains(text(),'Recharge')])[${j}]     xpath=(//section[contains(@class,'desktop')]//div[contains(@class,"PlanName_planText")])[${j}]      xpath=(//button//div[contains(text(),'View details')])[${j}]        ${RURL}    ${Prepaid_Number}
        # Verifying View Details Pop-up
        View Details Popup Verification     Mobile_Prepaid      xpath=(//button//div[contains(text(),'View details')])[${j}]    xpath=//div[contains(@class,'visible')]//div[contains(@class,'PlanName_planText')]    xpath=//div[contains(@class,'j-modal-visible j-modal-closable')]//div[@class="customScroll_scroll__1lZUu"]      xpath=//div[contains(@class, 'visible')]//div[@class="Subscriptions_subscription__2l1MD"]     xpath=//div[contains(@class,'j-modal j-modal-visible j-modal-closable')]//i         Value
        
        # Open Pop-up
        Open Popup  xpath=(//button//div[contains(text(),'View details')])[${j}]
        
        # Verifying Recharge Pop-up
        common.Recharge Popup Verification                       xpath=(//div[contains(@class,'visible')]//button[normalize-space()='Recharge'])  xpath=(//div[contains(@class,'visible')]//div[contains(@class,'PlanName')])   xpath=(//section[contains(@class,'desktop')]//button[normalize-space()='View details'])[${j}]  ${RURL}    ${Prepaid_Number}
    END


Verify Redirection of More Information section Value Plans Page 
    # Checking Redirection Of More Information Section Value Plan Page
    More Information Section Redirection                         xpath=//section[contains(@class,'desktop')]//div[contains(@class,'MoreInformation')]//button[contains(@class,'j-button-size__medium secondary')]   https://jep-asset.akamaized.net/jio/plan/Mobility-Prepaid-Plan-Vouchers.pdf     Value