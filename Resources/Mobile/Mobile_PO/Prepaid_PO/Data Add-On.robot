*** Settings ***
Library                              SeleniumLibrary
Library                              String
Library                              ExcelLibrary
Resource                            ../../../Local_Keywords.robot

*** Keywords ***
Redirection to Data Add-On Plans Page                       
    Wait For And Click Element          xpath=//button[@aria-label="button Data Add-On"]
    Sleep                               250ms
    Set Screenshot Directory            /Results/Mobile/Prepaid_Screenshots/DataAdd-On/
    Take Page Screenshot                Data Add-On_PageLoaded


Validate UI and Content of Data Add-On Plans Page           
    Plan Page UI Verification           Data Add-On

    
Filter button functionality of Data Add-On Plans Page       
    Reloading Page
    Filter Button Verification

View all Sub plans button Redirection on Data Add-On Page
    Reloading Page
    View all Sub plans button Redirection

Verify and Validate Plan Cards and Recharge Redirection of All Data Add-On Plans        #TC 70-75
    
    Reloading Page
    
    # Select all options  
    Select All Filters
    
    # Verifying All Plan card on Data Add-On Plan Page
    ${elements}=    Get WebElements     xpath=//section[contains(@class,'desktop')]//div[contains(@class,"PlanName_planText")]
    ${length}=                          Get Length     ${elements}
    ${RURL}=        Get Location
    
    # Loop to verify and validate Plan cards of Data Add-on page
    FOR     ${j}    IN RANGE   1  ${length}+1

        # Verifying Plan Card
        Plan Card Verification                  Mobile_Prepaid     xpath=(//section[contains(@class,'desktop')]//div[contains(@class,"PlanName_planText")])[${j}]       xpath=(//section[contains(@class,'desktop')]//div[@class="Details_planCont__1xVvf"]//div[@class="j-grid"])[${j}]        xpath=(//button//div[contains(text(),'Recharge')])[${j}]        xpath=(//button//div[contains(text(),'View details')])[${j}]        Data Add-On
        
        # Verifying Recharge Pop-up
        common.Recharge Popup Verification      xpath=(//button//div[contains(text(),'Recharge')])[${j}]     xpath=(//section[contains(@class,'desktop')]//div[contains(@class,"PlanName_planText")])[${j}]      xpath=(//button//div[contains(text(),'View details')])[${j}]        ${RURL}     ${Prepaid_Number}
        
        # Verifying View Details Pop-up
        View Details Popup Verification         Mobile_Prepaid      xpath=(//button//div[contains(text(),'View details')])[${j}]    xpath=(//div[contains(@class,' j-modal-visible')]//div[contains(@class,'PlanName_planText')])    xpath=//div[contains(@class,'j-modal-visible j-modal-closable')]//div[@class="customScroll_scroll__1lZUu"]      xpath=//div[contains(@class, 'visible')]//div[@class="Subscriptions_subscription__2l1MD"]     xpath=//div[contains(@class,'j-modal j-modal-visible j-modal-closable')]//i         Data Add-On
        
        # Open Pop-up
        Open Popup                              xpath=(//button//div[contains(text(),'View details')])[${j}]
        
        # Verifying Recharge Pop-up
        common.Recharge Popup Verification      xpath=//div[contains(@class,'j-modal-visible')]//button[normalize-space()='Recharge']  xpath=//div[contains(@class,'j-modal-visible')]//div[contains(@class,'PlanName')]   xpath=(//section[contains(@class,'desktop')]//button[normalize-space()='View details'])[${j}]  ${RURL}    ${Prepaid_Number}
    END
    
Verify Redirection of More Information section Data Add-On Page
    More Information Section Redirection        xpath=//section[contains(@class,'desktop')]//div[contains(@class,'MoreInformation')]//button[contains(@class,'j-button-size__medium secondary')]   https://jep-asset.akamaized.net/jio/plan/Mobility-Prepaid-Plan-Vouchers.pdf     Data-AddOnPlans  