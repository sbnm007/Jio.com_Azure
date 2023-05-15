***Settings***
Library                              SeleniumLibrary
Resource                            ../../../../Resources/Local_Keywords.robot
***Keywords***

Redirection to JioPhone AddOn Plan Page
    #Clicking on JioPhone Plan Button
    Wait For And Click Element                          xpath=//button[@aria-label="button JioPhone Data Add-on"]
    #Sleep  500ms
    URL Validation                                    https://www.jio.com/selfcare/plans/mobility/prepaid-plans-list/?category=JioPhone%20Data%20Add-on&categoryId=SmlvUGhvbmUgRGF0YSBBZGQtb24=
    Set Screenshot Directory                            ./Results/Mobile/Prepaid_Screenshots/JioPhoneAddOn-Plans/
    #Taking Screenshot of JioPhone Plans Page Load
    Take Page Screenshot                                 JioPhone-AddOn-PageLoaded


Validate UI and Content of JioPhone AddOn Plans Page
    #Verifing Annual plan Page UI
    Plan Page UI Verification       JioPhone Data Add-on
    
Verify and Validate Plan Cards and Recharge Redirection of All JioPhone AddOn Plans
    Reloading Page
    #Verifying All Plan card on JioPhone Add-On Plan Page
    ${elements}=    Get WebElements     xpath=//section[contains(@class,'desktop')]//div[contains(@class,"PlanName_planText")]
    ${length}=                          Get Length     ${elements}
    ${RURL}=        Get Location
    #Loop to verify and validate Plan cards of Data Add-on page
    FOR     ${j}    IN RANGE   1  ${length}+1

        # Verifying Plan Card
        Plan Card Verification                  Mobile_Prepaid     xpath=(//section[contains(@class,'desktop')]//div[contains(@class,"PlanName_planText")])[${j}]       xpath=(//section[contains(@class,'desktop')]//div[@class="Details_planCont__1xVvf"]//div[@class="j-grid"])[${j}]        xpath=(//button//div[contains(text(),'Recharge')])[${j}]        xpath=(//button//div[contains(text(),'View details')])[${j}]        JioPhone Data Add-on
        
        # Verifying Recharge Pop-up
        #common.Recharge Popup Verification      xpath=(//button//div[contains(text(),'Recharge')])[${j}]     xpath=(//section[contains(@class,'desktop')]//div[contains(@class,"PlanName_planText")])[${j}]      xpath=(//button//div[contains(text(),'View details')])[${j}]        ${RURL}
        
        # Verifying View Details Pop-up
        View Details Popup Verification         Mobile_Prepaid      xpath=(//button//div[contains(text(),'View details')])[${j}]    xpath=(//div[contains(@class,' j-modal-visible')]//div[contains(@class,'PlanName_planText')])    xpath=//div[contains(@class,'j-modal-visible j-modal-closable')]//div[@class="customScroll_scroll__1lZUu"]      xpath=//div[contains(@class, 'visible')]//div[@class="Subscriptions_subscription__2l1MD"]     xpath=//div[contains(@class,'j-modal j-modal-visible j-modal-closable')]//i         JioPhone Add-On
        
        # Open Pop-up
        #Open Popup                              xpath=(//button//div[contains(text(),'View details')])[${j}]
        
        # Verifying Recharge Pop-up
        #common.Recharge Popup Verification      xpath=//div[contains(@class,'j-modal-visible')]//button[normalize-space()='Recharge']  xpath=//div[contains(@class,'j-modal-visible')]//div[contains(@class,'PlanName')]   xpath=(//section[contains(@class,'desktop')]//button[normalize-space()='View details'])[${j}]  ${RURL}
    END

Verify Redirection of More Information section JioPhone AddOn Plans Page
    More Information Section Redirection    xpath=//section[contains(@class,'desktop')]//div[contains(@class,'MoreInformation')]//button[contains(@class,'j-button-size__medium secondary')]   https://jep-asset.akamaized.net/jio/plan/Mobility-Prepaid-Plan-Vouchers.pdf    JioPhone-AddOn      