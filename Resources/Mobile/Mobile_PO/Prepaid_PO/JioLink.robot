*** Settings ***
Library                              SeleniumLibrary
Library                              String
Library                              ExcelLibrary
Resource                            ../../../../Resources/Local_Keywords.robot



*** Keywords ***

Redirection to JioLink Plans Page                       
    Go To                                   https://www.jio.com/selfcare/plans/mobility/prepaid-plans-home/
    Wait For And Click Element              xpath=//button[normalize-space()='JioLink']
    Sleep                                   250ms
    Set Screenshot Directory                /Results/Mobile/Prepaid_Screenshots/JioLink/
    Take Page Screenshot                    JioLink_PageLoaded

Validate UI and Content of JioLink Plans Page           
    Plan Page UI Verification               JioLink
    
Filter button functionality of JioLink Plans Page       
    Redirection to JioLink Plans Page
    Filter Button Verification
# Select all options   
Select All Filters JioLink
    #clicking filter button
    Wait For And Click Element              xpath=//section[contains(@class,'desktop')]//div[contains(@class, 'filterBtn')]//Button[2]
    ${checkboxes}=    Get WebElements       xpath=//div[@class="j-modal j-modal-visible j-modal-closable j-modal-size-m j-modal-kind-dialog"]//div[@class="FilterPopup_checkbox__10y7P"]
    ${len}=    Get Length                   ${checkboxes}
    Log To Console                          ${len}
    FOR     ${i}    IN RANGE   1  ${len}+1

        # selecting checkbox
        Wait For And Click Element          xpath=//div[contains(@class,' j-modal-visible j-modal-closable')]//div[@class="FilterPopup_checkbox__10y7P"][${i}]//span[2]
    
    END

    #click on show plans button
    Wait For And Click Element              xpath=//button//div[contains(text(),'Show plans')]

Verify and Validate Plan Cards of JioLink Page          
    Redirection to JioLink Plans Page
    Select All Filters JioLink
    
    #Loop to verify and validate Plan cards of JioLink page
    ${elements}=    Get WebElements         xpath=//section[contains(@class,'desktop')]//div[contains(@class,"PlanName_planText")]
    ${j}       Set Variable        1
    FOR  ${element}  IN  @{elements}
        #Sleep    100ms
        Scroll To                           xpath=(//button//div[contains(text(),'Recharge')])[${j}] 

        # Verifying Plan Card
        Plan Card Verification      Mobile_Prepaid     ${element}       xpath=(//section[contains(@class,'desktop')]//div[@class="Details_planCont__1xVvf"]//div[@class="j-grid"])[${j}]        xpath=(//button//div[contains(text(),'Recharge')])[${j}]        xpath=(//button//div[contains(text(),'View details')])[${j}]        JioLink
        
        # Verifying View Details Pop-up
        View Details Popup Verification     Mobile_Prepaid              xpath=(//button//div[contains(text(),'View details')])[${j}]    xpath=//div[contains(@class,'visible')]//div[contains(@class,'PlanName_planText')]    xpath=//div[contains(@class,'j-modal-visible j-modal-closable')]//div[@class="customScroll_scroll__1lZUu"]      xpath=//div[contains(@class, 'visible')]//div[@class="Subscriptions_subscription__2l1MD"]     xpath=//div[contains(@class,'j-modal j-modal-visible j-modal-closable')]//i         JioLink
        ${j}=   Evaluate     ${j} + 1

    END


Verify Redirection of More Information section on JioLink Plans Page        
    More Information Section Redirection    xpath=//section[contains(@class,'desktop')]//div[contains(@class,'MoreInformation')]//button[contains(@class,'j-button-size__medium secondary')]   https://jep-asset.akamaized.net/jio/plan/Mobility-Prepaid-Plan-Vouchers.pdf     JioLink   
