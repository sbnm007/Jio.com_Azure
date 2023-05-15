*** Settings ***
Library                              SeleniumLibrary
Library                              String
Library                              ExcelLibrary
Resource                            ../../../../Resources/Local_Keywords.robot

*** Variables ***
${JS_URL} =         https://www.jiosaavn.com/pro/?utm_source=jiowebsite&utm_medium=jiosaavnsubsciption&utm_campaign=jiowebsiteprosubscription?referrer=&shortlink=c0c3d9f7&pid=MyJio&c=JioWebsite&af_channel=JioSaavnSubscriptionPage&af_adset=ProPurchase
*** Keywords ***

Redirection to JioSaavn Pro Plans Page  
    # Go to Prepaid inside mobile tab                     
    Go To                                               https://www.jio.com/selfcare/plans/mobility/prepaid-plans-home/
    # Clicking JioSaaven Pro under 'Refuel your digital life' Section
    Wait For And Click Element                          xpath=//button[normalize-space()='JioSaavn Pro']
    Sleep                                               250ms
    Set Screenshot Directory                            /Results/Mobile/Prepaid_Screenshots/JioSaavnPro/
    Take Page Screenshot                                JioSaavn Pro_PageLoaded


Validate UI and Content of JioSaavn Pro Plans Page          
    Plan Page UI Verification           JioSaavn Pro
    


Verify and Validate Plan Cards of All JioSaavn Pro Plans        
    ${elements_jiosaavn}=    Get WebElements     xpath=//section[contains(@class,'desktop')]//div[contains(@class,"PlanName_planText")]
    ${count_jiosaavn}=    Get Length    ${elements_jiosaavn}
    Log To Console             ${count_jiosaavn}
    ${j}       Set Variable        1
    # Loop To Verify And Validate Plan Cards Of Jiosaavn Pro Plans
    FOR  ${element}  IN  @{elements_jiosaavn}

        # Verifying Plan Card
        Plan Card Verification      Mobile_Prepaid     xpath=(//section[contains(@class,'desktop')]//div[contains(@class,"PlanName_planText")])[${j}]       xpath=(//section[contains(@class,'desktop')]//div[@class="Details_planCont__1xVvf"]//div[@class="j-grid"])[${j}]        xpath=(//section[contains(@class,'desktop')]//button//div[contains(text(),'Recharge')])[${j}]        xpath=(//section[contains(@class,'desktop')]//button//div[contains(text(),'View details')])[${j}]        JioSaavn Pro
        
        # Verifying Redirection Of Plan Card by clicking 'Recharge'
        Redirection On Clicking     xpath=(//section[contains(@class,'desktop')]//button//div[contains(text(),'Recharge')])[${j}]  ${JS_URL}  JioSaavnPro_${j}

        # Verifying 'View Details' Of Plan Card
        # View Details Popup Verification     Mobile_Prepaid      xpath=(//section[contains(@class,'desktop')]//button//div[contains(text(),'View details')])[${j}]    xpath=//div[contains(@class,'visible')]//div[contains(@class,'PlanName_planText')]    xpath=//div[contains(@class,'j-modal-visible j-modal-closable')]//div[@class="customScroll_scroll__1lZUu"]      xpath=//div[@class="Subscriptions_subscription__2l1MD"]     xpath=//div[contains(@class,'j-modal j-modal-visible j-modal-closable')]//i        JioSaavn Pro
        View Details Pop up Verification 2            xpath:(//section[contains(@class,"desktop")]//button[@class='j-button j-button-size__medium tertiary'])[${j}]  xpath:(//*[contains(@class,"planDetailsPopup")])[${j}]   Mobile_Prepaid   123   ${j}  xpath:(//div[@class='j-modal j-modal-visible j-modal-closable j-modal-size-s planDetailsPopup j-modal-kind-dialog']//div[@class='j-modal-container']//div//header[@class='j-modal-header']//button[@aria-label='button'])
        
        # Checking Redirection Inside 'View Details' Of Plan Card
        Redirection On Clicking     xpath=(//button//div[contains(text(),'Recharge')])  ${JS_URL}  JioSaavnPro_View_${j}
        ${j}=   Evaluate     ${j} + 1
    END


Verify Redirection of More Information section on JioSaavn Pro Plans Page
        # More Information Section Redirection inside JioSaavn Pro Plans Page
        More Information Section Redirection    xpath=//section[contains(@class,'desktop')]//div[contains(@class,'MoreInformation')]//button[contains(@class,'j-button-size__medium secondary')]   https://jep-asset.akamaized.net/jio/plan/Mobility-Prepaid-Plan-Vouchers.pdf       JioSaavn Pro
