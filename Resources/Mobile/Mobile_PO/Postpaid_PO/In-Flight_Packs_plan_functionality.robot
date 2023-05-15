***Settings***
Library                     SeleniumLibrary
Resource                    ../../../../Resources/Local_Keywords.robot
Resource                    ../../../../Resources/Excel_activity.robot

*** Variables ***
@{FlightTnC}    https://www.jio.com/en-in/terms-conditions-inflight-service

***Keywords***

Redirection to In-Flight Packs Plan Page
    [Arguments]               ${Page_Name}    
    
    #Clicking on In-Flight pack  Plan Button
    Wait For And Click Element                  xpath=//button[@aria-label="button In-Flight Packs"]
    ${P_Name}  Set Variable   ${Page_Name}
    Set Global Variable       ${P_Name}         ${P_Name}
    Set Screenshot Directory                /Results/Mobile/Postpaid_Screenshots/FlightPacks/
    
    #Taking Screenshot of In-Flight pack Page Load
    Take Page Screenshot                 In-FlightPacks-Plan-PageLoaded

Validate UI and Content and functionality of In-Flight Packs Plans Page
    #Verifing In-Flight pack plan Page UI
    Plan Page UI Verification            In-Flight Packs

Verify and Validate Plan Cards and Recharge Redirection of In-Flight Packs Plans
    Reloading Page
    
    #Verifying All Plan card on In-Flight Plan Page
    ${elements}=    Get WebElements             xpath=//section[contains(@class,'desktop')]//div[contains(@class,"PlanName_planText")]
    ${length}=      Get Length     ${elements}
    Log To Console    ${length}
    ${RURL}=        Get Location
    
    #Loop to verify and validate Plan cards of Data Add-on page
    FOR     ${j}    IN RANGE   1  ${length}+1

        # Verifying Plan Card
        Plan Card Verification                  Mobile_Prepaid     xpath=(//section[contains(@class,'desktop')]//div[contains(@class,"PlanName_planText")])[${j}]       xpath=(//section[contains(@class,'desktop')]//div[@class="Details_planCont__1xVvf"]//div[@class="j-grid"])[${j}]        xpath=(//button//div[contains(text(),'Recharge')])[${j}]        xpath=(//button//div[contains(text(),'View details')])[${j}]        In-Flight
        
        # Verifying Recharge Pop-up
        common.Recharge Popup Verification      xpath=(//button//div[contains(text(),'Recharge')])[${j}]     xpath=(//section[contains(@class,'desktop')]//div[contains(@class,"PlanName_planText")])[${j}]      xpath=(//button//div[contains(text(),'View details')])[${j}]        ${RURL}    ${COCP_OR_Postpaid_Number}
        
        # Verifying View Details Pop-up
        View Details Popup Verification         Mobile_Prepaid     xpath=(//button//div[contains(text(),'View details')])[${j}]    xpath=(//div[contains(@class,' j-modal-visible')]//div[contains(@class,'PlanName_planText')])    xpath=//div[contains(@class,'j-modal-visible j-modal-closable')]//div[@class="customScroll_scroll__1lZUu"]      xpath=//div[contains(@class, 'visible')]//div[@class="Subscriptions_subscription__2l1MD"]     xpath=//div[contains(@class,'j-modal j-modal-visible j-modal-closable')]//i         In-Flight
        
        # Open Pop-up
        Open Popup                              xpath=(//button//div[contains(text(),'View details')])[${j}]
        
        # Verifying Recharge Pop-up
        common.Recharge Popup Verification      xpath=//div[contains(@class,'j-modal-visible')]//button[normalize-space()='Recharge']  xpath=//div[contains(@class,'j-modal-visible')]//div[contains(@class,'PlanName')]   xpath=(//section[contains(@class,'desktop')]//button[normalize-space()='View details'])[${j}]  ${RURL}    ${COCP_OR_Postpaid_Number}
    END

Verify Redirection of FAQ section In-Flight Packs Page
    FAQ Section Verification                    ${PoFAQ_URL}    InFlight-FAQ 

Verify Redirection of More Information section In-Flight Packs Page
   More Information Section Redirection         xpath=//section[contains(@class,'--desktop')]//div[contains(@class,'MoreInformation')]//button[contains(@class,'secondary')]   https://www.jio.com/en-in/terms-conditions-inflight-service    In-Flight Packs
