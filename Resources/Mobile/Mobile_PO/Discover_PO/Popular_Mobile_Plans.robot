*** Settings ***
Library                             SeleniumLibrary
Resource                            ../../../../Resources/Local_keywords.robot

***Keywords***
Popular Mobile Plans Section Validation
    Popular Mobile Plans Prepaid Section validation
    Reload Page
    Popular Mobile Plans Postpaid Section validation 

Popular Mobile Plans Prepaid Section validation
    Scroll To                                        xpath=//section[@class="j-container bg--primary-20"]
    
    #Heading popular Mobile Plans
    Text Verification                                xpath=//section[@class="j-container bg--primary-20"]//div[@class="j-contentBlock__content"]//h2     Popular mobile plans
    
    #SubHeading of popular Mobile Plans
    Text Verification                                xpath=//section[@class="j-container bg--primary-20"]//div[@class="j-contentBlock__content"]//div[contains(text(),"Choose your connection")]     Choose your connection type to find a plan as per your digital needs.
    
    #Checking Predaid section Allready Selected
    Wait For And Verify Element                      xpath=//a[@class="tab-link j-text j-text-body-s j-color-secondary-60"][@aria-controls="jio-prepaid"][@aria-selected="true"]
    
    #Checking Postpaid section Not Allready Selected
    Wait For And Verify Element                      xpath=//a[@class="tab-link j-text j-text-body-s j-color-secondary-60"][@aria-controls="jio-postpaid"][@aria-selected="false"]
    
    #Verifing Three Tiles are present in Prepaid section
    Verifing Plans Buttons and Tags                  xpath=//div[@id="jio-prepaid"]//div[@class="j-card__flex"]
    
    #View all Prepaid plans button
    Wait For And Verify Element                      xpath=//div[@id="jio-prepaid"]//button[normalize-space()="View all prepaid plans"]
    Take Page Screenshot                             Disc_Prepaid_Section
    
    #Clicking view all Prepaid plans button
    Redirection On Clicking                          xpath=//div[@id="jio-prepaid"]//button[contains(text(),'all')]  https://www.jio.com/selfcare/plans/mobility/prepaid-plans-home/  Disc_Prepaid_Plans  
    Reload Page
    Prepaid plans Tiles section validation

  
Popular Mobile Plans Postpaid Section validation   
    #Clicking PostPaid Button
    Scroll To                                        xpath=//div[@id="jio-prepaid"]//button[normalize-space()="View all prepaid plans"]
    Wait For And Click Element                       xpath=//a[@aria-controls="jio-postpaid"]
   
    #Checking Postpaid section get Selected
    Wait For And Verify Element                      xpath=//a[@class="tab-link j-text j-text-body-s j-color-secondary-60"][@aria-controls="jio-postpaid"][@aria-selected="true"]
    
    #Checking Prepaid section get unselected
    Wait For And Verify Element                      xpath=//a[@class="tab-link j-text j-text-body-s j-color-secondary-60"][@aria-controls="jio-prepaid"][@aria-selected="false"]
    
    #Verifing Three Tiles are present in postpaid section
    Verifing Plans Buttons and Tags                  xpath=//div[@id="jio-postpaid"]//div[@class="j-card__flex"]
    
    #View all Postpaid plans button
    Wait For And Verify Element                      xpath=//div[@id="jio-postpaid"]//button[normalize-space()="View all postpaid plans"]
    Take Page Screenshot                             Disc_Postpaid_Section
    
    #Clicking view all Postpaid plans button
    Redirection On Clicking                          xpath=//div[@id="jio-postpaid"]//button[contains(text(),'all')]  https://www.jio.com/selfcare/plans/mobility/postpaid-plans-home/  Disc_Postpaid_Plans  
    Postpaid plans Tiles section validation

Prepaid plans Tiles section validation
    Scroll To                                        xpath=//div[@id="jio-prepaid"]//button[@class="j-button j-button-state__default j-button-size__medium secondary"]
    
    #Plan Ammount Verification
    Verifing Recharge banner text                    xpath=//div[@id="jio-prepaid"]//h3     ${PlanPrices}
    
    #Plan validity verification
    Verifing Recharge banner text                    xpath=//div[@id="jio-prepaid"]//div[contains(text(),"days")]                       ${PlanValidity} 
    
    #Plan Data Verification
    Verifing Recharge banner text                    xpath=//div[@id="jio-prepaid"]//div[contains(text(),"GB/")]                        ${PlanData}
    
    #Plan tags verification
    Verifing Plans Buttons and Tags                  xpath=//div[@id="jio-prepaid"]//div[@class="j-contentBlock__caption"]
    
    #Recharge Button verification
    Verifing Plans Buttons and Tags                  xpath=//div[@id="jio-prepaid"]//button[contains(text(),"Recharge")]
    
    #View Details Button Verification
    Verifing Plans Buttons and Tags                  xpath=//div[@id="jio-prepaid"]//button[contains(text(),"View details")]
    
    #OTT Apps Verification
    Verifing Plans Buttons and Tags                  xpath=//div[@id="jio-prepaid"]//div[@class="app-icon-list d-flex align-items-center"]
    
    #Prepaid plans PopUp Validation

    #Clicking on View Details Buttons for Every Recharge Tile
    ${count}  Set Variable   0
     FOR  ${PlanPrice}  IN  @{PlanPrices}
        LOG   ${PlanPrice}
        ${Ammount}=  String.Split String             ${PlanPrice}   ₹ 
        
        #Clicking View Details Button
        Wait For And Click Element                   xpath=//button[@class="j-button j-button-size__medium tertiary" and contains(@onclick,"${Ammount}[1]")]
        Sleep    500ms
        
        #Verifing Plan Tag
        Wait For And Verify Element                  xpath=//div[@class="j-listBlock__block-text"]//div[@class="j-badge j-badge-size__small"]
        
        #Verifing Cross Button 
        Wait For And Verify Element                  xpath=//button[@class="j-button j-button-size__medium tertiary icon-primary icon-only"]
        
        #Verifing Plan Ammount of Pop-up.
        Text Verification                            xpath=//div[@id="plan-detail-modal"]//h3[@class="j-contentBlock__title j-heading j-text-heading-m"]     ${PlanPrice} 
        
        #Details Heading Verification
        Text Verification                            xpath=//div[@class="details"]//div[@class="j-contentBlock__description j-text j-text-heading-xxs"]      Details
        
        #Pack Validity
        Text Verification                            xpath=//table[@aria-label="j-table"]//td[contains(text(),"days")]                                       ${PlanValidity}[${count}]
        
        #GB/day Vreification
        Text Verification                            xpath=//table[@aria-label="j-table"]//td[contains(text(),"GB/")]                                    ${PlanData}[${count}]
        
        #Total Data Vreification
        Text Verification                            xpath=//table[@aria-label="j-table"]//td[contains(text(),"GB")]                                         ${TotalData}[${count}]
        
        #Verifing Unlimited calls 
        Text Verification                            xpath=//table[@aria-label="j-table"]//td[contains(text(),"Unlimited")]                                  Unlimited
        
        #100 SMS/day verification
        Text Verification                            xpath=//table[@aria-label="j-table"]//td[contains(text(),"100 SMS/day")]                                100 SMS/day
        
        #Checking ScrollBar
        CSS Verification                             xpath=//div[@class="j-modal-body j-modal-content-scrollable j-rich-text"]     overflow-y                auto
        Take Page Screenshot                         ${PlanPrice} Details of plan popup 
        
        #Checking List Of OTT Apps
        Scroll To                                    xpath=//div[@class="txt-align--center"]
        ${LOGOs}=  Get WebElements                   xpath=//div[@class="txt-align--center"]
        FOR  ${LOGO}  IN  @{LOGOs}
                Wait For And Verify Element          ${LOGO}
        END
        
        #Checking Recharge Button
        Wait For And Verify Element                  xpath=//div[@class="j-modal-buttons"]//button[@class="j-button j-button-size__medium primary modal-quickrechargewithplan" and contains(@onclick,"${Ammount}[1]")]
        
        #Text Below OTT Apps
        Wait For And Verify Element                  xpath=//div[@class="j-contentBlock__description j-text j-text-body-xxs"]             
        
        #Clicking on Cross Button of  View Details Pop-up
        Take Page Screenshot                         ${PlanPrice} View Details OTT popup
        Wait For And Click Element                   xpath=//button[@class="j-button j-button-size__medium tertiary icon-primary icon-only"]
        
        #Clicking Recharge Button Present on the Prepaid tile
        Wait For And Click Element                   xpath=//button[@class="j-button j-button-size__medium primary modal-quickrechargewithplan" and contains(@onclick,"${Ammount}[1]")]
        
        #Cheacking Quick recharge popup
        Wait For And Verify Element                  xpath=//div[@data-popup="modal-quickrechargewithplan"]
        
        #Clicking cross Button of Recharge PopUp 
        Wait For And Click Element                   xpath=//button[@data-popup-close="modal-quickrechargewithplan"]
        ${count}=   Evaluate                         ${count} + 1
    END

Postpaid plans Tiles section validation
    Scroll To                                        xpath=//div[@id="jio-prepaid"]//button[normalize-space()="View all prepaid plans"]
    Wait For And Click Element                       xpath=//a[@aria-controls="jio-postpaid"]
    
    #Plan Ammount Verification
    Verifing Recharge banner text                    xpath=//div[@id="jio-postpaid"]//h3     ${PostpaidPlanPrices}
    
    #Plan validity verification
    ${elements}=    Get WebElements                  xpath=//div[@id="jio-postpaid"]//div[contains(text(),'Bill')]                        
    FOR  ${element}  IN  @{elements}
        Text Verification                            ${element}      Bill cycle 
    END
    
    #Plan Data Verification
    Verifing Recharge banner text                    xpath=//div[@id="jio-postpaid"]//div[contains(text(),"GB")]                        ${PostpaidPlanData}
    
    #Plan tags verification
    Verifing Plans Buttons and Tags                  xpath=//div[@id="jio-postpaid"]//div[@class="j-contentBlock__caption"]
    
    #Recharge Button verification
    Verifing Plans Buttons and Tags                  xpath=//div[@id="jio-postpaid"]//button[contains(text(),"Get Now")]
    
    #View Details Button Verification
    Verifing Plans Buttons and Tags                  xpath=//div[@id="jio-postpaid"]//button[contains(text(),"View details")]
    
    #OTT Apps Verification
    Verifing Plans Buttons and Tags                  xpath=//div[@id="jio-postpaid"]//div[@class="app-icon-list d-flex align-items-center"]
    
    ${i}   Set Variable    1 
    FOR  ${m}  IN RANGE  4    7
        Sleep        500ms
        View Details Pop up Verification 2           xpath=(//button[@class="j-button j-button-size__medium tertiary"])[${m}]    //div[contains(@class,'j-modal-container')]    Mobile_Discover    15    ${i}    //button[@class='j-button j-button-size__medium tertiary icon-primary icon-only']//i[@class='j-button-icon']//*[name()='svg'] 
        Sleep    500ms
        ${i}=   Evaluate     ${i} + 1
    END

    ${k}    Set Variable    0
    FOR  ${j}  IN RANGE  1    4
        Wait For And Click Element                   xpath=//button[@aria-label='Get now ${PostpaidPlanPrices}[${k}] Jio Postpaid Mobile plan']
        Sleep    500ms
        Go Back
        Sleep    500ms
        Wait For And Click Element                   xpath=//a[@aria-controls="jio-postpaid"]
    END

Verifing Plans Buttons and Tags
    [Arguments]       ${locator}          
    ${elements}=    Get WebElements       ${locator}
    ${Length}=      Get Length            ${elements}
    Should Be Equal As Integers           ${Length}      3 
    FOR  ${element}  IN  @{elements}
        Wait For And Verify Element       ${locator}
    END

Verifing Recharge banner text
    [Arguments]       ${locator}          ${text}
    ${elements}=    Get WebElements       ${locator}
    ${Length}=      Get Length            ${elements}
    #Should Be Equal As Integers           ${Length}      3 
    ${count}=     Set Variable  0
    FOR  ${element}  IN  @{elements}
        Text Verification                          ${element}      ${text}[${count}] 
        ${count}=   Evaluate     ${count} + 1  
    END
