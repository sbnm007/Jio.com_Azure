***Settings***
Library                             SeleniumLibrary
Resource                            ../../../Local_Keywords.robot

***Keywords***
Redirection to Top-up Plan Page
    # Clicking on Top-Up Plan Button
    Wait For And Click Element          xpath=//button[@aria-label="button Top-up"]
    Set Screenshot Directory            /Results/Mobile/Prepaid_Screenshots/Top-upPlan/
    URL Validation                      https://www.jio.com/selfcare/plans/mobility/prepaid-plans-list/?category=Top-up&categoryId=VG9wLXVw
    # Taking Screenshot of Top-Up Page Load
    Take Page Screenshot                     Top-upPlan-PageLoaded
    
Validate UI and Content and functionality of Top-up Plans Page
    # Verifing Top-Up plan Page UI
    Plan Page UI Verification       Top-up

Verify and Validate Plan Cards and Recharge Redirection of Top-up Plans
    Reloading Page
    # Verifying All Plan card on Top-Up Plan Page
    ${elements_topup}=    Get WebElements       xpath=//section[contains(@class,'desktop')]//div[contains(@class,"PlanName_planText")]
    ${length_topup}=                            Get Length     ${elements_topup}
    Log To Console        ${length_topup}
    ${RURL}=        Get Location
    # Loop to verify and validate Plan cards of Data Add-on page
    FOR     ${j}    IN RANGE   1  ${length_topup}+1

        #  Verifying Plan Card
        Plan Card Verification                  Mobile_Prepaid     xpath=(//section[contains(@class,'desktop')]//div[contains(@class,"PlanName_planText")])[${j}]       xpath=(//section[contains(@class,'desktop')]//div[@class="Details_planCont__1xVvf"]//div[@class="j-grid"])[${j}]        xpath=(//button//div[contains(text(),'Recharge')])[${j}]        xpath=(//button//div[contains(text(),'View details')])[${j}]        Top-Up
        
        #  Verifying Recharge Pop-up
        common.Recharge Popup Verification      xpath=(//button//div[contains(text(),'Recharge')])[${j}]     xpath=(//section[contains(@class,'desktop')]//div[contains(@class,"PlanName_planText")])[${j}]      xpath=(//button//div[contains(text(),'View details')])[${j}]        ${RURL}    ${Prepaid_Number} # PrePaid Number should have valid recharge
        
        #  Verifying View Details Pop-up
        View Details Popup Verification         Mobile_Prepaid      xpath=(//button//div[contains(text(),'View details')])[${j}]    xpath=(//div[contains(@class,' j-modal-visible')]//div[contains(@class,'PlanName_planText')])    xpath=//div[contains(@class,'j-modal-visible j-modal-closable')]//div[@class="customScroll_scroll__1lZUu"]      xpath=//div[contains(@class, 'visible')]//div[@class="Subscriptions_subscription__2l1MD"]     xpath=//div[contains(@class,'j-modal j-modal-visible j-modal-closable')]//i         Top-Up
        
        #  Open Pop-up
        Open Popup                              xpath=(//button//div[contains(text(),'View details')])[${j}]
        
        #  Verifying Recharge Pop-up
        common.Recharge Popup Verification      xpath=//div[contains(@class,'j-modal-visible')]//button[normalize-space()='Recharge']  xpath=//div[contains(@class,'j-modal-visible')]//div[contains(@class,'PlanName')]   xpath=(//section[contains(@class,'desktop')]//button[normalize-space()='View details'])[${j}]  ${RURL}    ${Prepaid_Number}
    END



Verify Redirection of More Information section Top-up Plans Page
    # Checking Redirection Of More Information Section Inside Top-Up Plans Page
    More Information Section Redirection        xpath=//section[contains(@class,'desktop')]//div[contains(@class,'MoreInformation')]//button[contains(@class,'j-button-size__medium secondary')]   https://jep-asset.akamaized.net/jio/plan/Mobility-Prepaid-Plan-Vouchers.pdf     Top-up  