***Settings***
Library                     SeleniumLibrary
Resource                    ../../../Local_Keywords.robot

***Keywords***

Redirection to Popular Plan Page
    
    # Clicking oon Popular Plan Button
    Wait For And Click Element                          xpath=//button[@aria-label="button Popular Plans"]
    #Sleep  500ms
    URL Validation                                      https://www.jio.com/selfcare/plans/mobility/prepaid-plans-list/?category=Popular%20Plans&categoryId=UG9wdWxhciBQbGFucw==
    Set Screenshot Directory                            /Results/Mobile/Prepaid_Screenshots/Popular-Plans/
    # Taking Screenshot of Popular Page Load
    Take Page Screenshot                                Popular-Plans_PageLoaded


Validate UI and Content of Popular Plans Page          
    Plan Page UI Verification           Popular Plans


Filter button functionality of Popular Plans Page
    Reloading Page
    Filter Button Verification

View all Sub plans button Redirection on Popular Plans Page
    Reloading Page
    View all Sub plans button Redirection
    


Verify and Validate Plan Cards and Recharge Redirection of All Popular Plans
    
    Reloading Page
    
    # Select all options  
    Select All Filters
    
    # Verifying All Plan card on Popular Plan Page
    ${elements}=    Get WebElements             xpath=//section[contains(@class,'desktop')]//div[contains(@class,"PlanName_planText")]
    ${length}=      Get Length                  ${elements}
    ${RURL}=        Get Location
    # Loop to verify and validate Plan cards of Data Add-on page
    FOR     ${j}    IN RANGE   1  ${length}

        #  Verifying Plan Card
        Plan Card Verification                  Mobile_Prepaid     xpath=(//section[contains(@class,'desktop')]//div[contains(@class,"PlanName_planText")])[${j}]       xpath=(//section[contains(@class,'desktop')]//div[@class="Details_planCont__1xVvf"]//div[@class="j-grid"])[${j}]        xpath=(//button//div[contains(text(),'Recharge')])[${j}]        xpath=(//button//div[contains(text(),'View details')])[${j}]        Popular
        
        #  Verifying Recharge Pop-up
        common.Recharge Popup Verification      xpath=(//button//div[contains(text(),'Recharge')])[${j}]     xpath=(//*[contains(@class,"desktop")]//*[contains(@class,"PlanName_planText")])[${j}]      xpath=(//button//div[contains(text(),'View details')])[${j}]        ${RURL}    ${Prepaid_Number}
        
        # Select All Filters 
        
        #  Verifying View Details Pop-up
        View Details Popup Verification         Mobile_Prepaid      xpath=(//button//div[contains(text(),'View details')])[${j}]    xpath=(//div[contains(@class,' j-modal-visible')]//div[contains(@class,'PlanName_planText')])[1]    xpath=//div[contains(@class,'j-modal-visible j-modal-closable')]//div[@class="customScroll_scroll__1lZUu"]      xpath=//div[contains(@class, 'visible')]//div[@class="Subscriptions_subscription__2l1MD"]     xpath=//div[contains(@class,'j-modal j-modal-visible j-modal-closable')]//i         Popular
        
        #  Open Pop-up
        Open Popup                              xpath=(//button//div[contains(text(),'View details')])[${j}]
        
        #Sleep    1s

        #  Verifying Recharge Pop-up
        common.Recharge Popup Verification      xpath=//div[contains(@class,'j-modal-visible')]//button[normalize-space()='Recharge']  xpath=//div[contains(@class,'j-modal-visible')]//div[contains(@class,'PlanName')]   xpath=(//section[contains(@class,'desktop')]//button[normalize-space()='View details'])[${j}]  ${RURL}    ${Prepaid_Number}
    END
    

Verify Redirection of More Information section Popular Plans Page
    More Information Section Redirection        xpath=//section[contains(@class,'desktop')]//div[contains(@class,'MoreInformation')]//button[contains(@class,'j-button-size__medium secondary')]   https://jep-asset.akamaized.net/jio/plan/Mobility-Prepaid-Plan-Vouchers.pdf     PopularPlans  
