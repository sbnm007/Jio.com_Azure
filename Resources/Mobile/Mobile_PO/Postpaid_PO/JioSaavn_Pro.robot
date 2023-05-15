*** Settings ***
Library                              SeleniumLibrary
Library                              String
Library                              ExcelLibrary
Resource                            ../../../../Resources/Local_Keywords.robot

*** Variables ***
${JS_URL}          'https://www.jiosaavn.com/pro/?utm_source=jiowebsite&utm_medium=jiosaavnsubsciption&utm_campaign=jiowebsiteprosubscription?referrer=&shortlink=c0c3d9f7&pid=MyJio&c=JioWebsite&af_channel=JioSaavnSubscriptionPage&af_adset=ProPurchase'

*** Keywords ***

Redirection to JioSaavn Pro Plans Page                       #TC 158
    Go To                                               https://www.jio.com/selfcare/plans/mobility/postpaid-plans-home/
    Wait For And Click Element                                  xpath=//button[normalize-space()='JioSaavn Pro']
    Sleep                                               250ms
    Set Screenshot Directory                           /Results/Mobile/Postpaid_Screenshots/JioSaavnPro/
    Take Page Screenshot                                     JioSaavn Pro_PageLoaded


Validate UI and Content of JioSaavn Pro Plans Page          #TC 159
    Plan Page UI Verification           JioSaavn Pro
    


Verify and Validate Plan Cards of All JioSaavn Pro Plans        #TC 160-162
    ${elements}=    Get WebElements                             xpath=//section[contains(@class,'desktop')]//div[contains(@class,"PlanName_planText")]
    ${j}       Set Variable        1
    
    #Loop to verify and validate Plan cards of JioSaavn Pro Plans
    FOR  ${element}  IN  @{elements}

        # Verifying Plan Card
        Plan Card Verification      Mobile_Prepaid              xpath=(//section[contains(@class,'desktop')]//div[contains(@class,"PlanName_planText")])[${j}]       xpath=(//section[contains(@class,'desktop')]//div[@class="Details_planCont__1xVvf"]//div[@class="j-grid"])[${j}]        xpath=(//section[contains(@class,'desktop')]//button//div[contains(text(),'Recharge')])[${j}]        xpath=(//section[contains(@class,'desktop')]//button//div[contains(text(),'View details')])[${j}]        JioSaavn Pro

        Redirection On Clicking     xpath=(//section[contains(@class,'desktop')]//button//div[contains(text(),'Recharge')])[${j}]  ${JS_URL}  JioSaavnPro_${j}

        # Verifying View Details Pop-up
        View Details Popup Verification     Mobile_Prepaid      xpath=(//section[contains(@class,'desktop')]//button//div[contains(text(),'View details')])[${j}]    xpath=//div[contains(@class,'visible')]//div[contains(@class,'PlanName_planText')]    xpath=//div[contains(@class,'j-modal-visible j-modal-closable')]//div[@class="customScroll_scroll__1lZUu"]      xpath=//div[@class="Subscriptions_subscription__2l1MD"]     xpath=//div[contains(@class,'j-modal j-modal-visible j-modal-closable')]//i        JioSaavn Pro
        
        Redirection On Clicking     xpath=(//button//div[contains(text(),'Recharge')])  ${JS_URL}  JioSaavnPro_View_${j}
        
        ${j}=   Evaluate     ${j} + 1
        
    END


Verify Redirection of More Information section on JioSaavn Pro Plans Page       #TC 166
    More Information Section Redirection                    xpath=//section[contains(@class,'desktop')]//div[contains(@class,'MoreInformation')]//button[contains(@class,'j-button-size__medium secondary')]   https://jep-asset.akamaized.net/jio/plan/Plan-Vouchers-1-Dec-2021.pdf       JioSaavn Pro

