*** Settings ***
Library                              SeleniumLibrary
Resource                            ../../../../Resources/Local_Keywords.robot

***Keywords***

Redirection to Main Plan Page       
    #Clicking on Main Plan button
    Wait For And Click Element                      xpath=//button[normalize-space()='Main Plan']
    #Setting and Taking Screenshot
    Set Screenshot Directory                       /Results/Mobile/Postpaid_Screenshots/MainPlan/
    Take Page Screenshot                           MainPlan-PageLoaded
    
Filter button functionality of Main Plans Page
    #Reload Page
    Reloading Page
    Check Filter Button

Validate UI and Content of Main Plans Page
    
    Plan Page UI Verification                      Main Plan

Redirection of View all JioPostPaidPlus plans button 
    Scroll To                      xpath=//section[contains(@class,"desktop")]//button[@class='j-button j-button-size__medium secondary']
    Wait For And Click Element                    xpath=//section[contains(@class,"desktop")]//button[@class='j-button j-button-size__medium secondary']
    Take Page Screenshot                          Redirection to View JioPostpaid Plus plans
    Plan Page UI Verification                     Main Plan

Validate UI and content of all plan cards in Main plan section 
    Plan Card Verification-2                      xpath==//*[contains(@class,"desktop")]//div[contains(@class,"planDetailsCard")]    sheet_name=Mobile_Postpaid  row_num=14

Validate Redirection of Get Now button and View details of all plans card
    ${card_count}=    Get Element Count           xpath=//section[@class='j-container l-breakpoint--desktop']//section[@class='j-container bg--primary-20 l-radius--xl']     
    FOR  ${m}  IN RANGE  1  ${card_count}+1
        Click Element                             xpath:(//button[@class='j-button j-button-size__medium primary'])[${m}]
        Wait For And Verify Element               xpath:(//section[@class='j-container l-layout--centered'])   
        Go Back
        Sleep        3s
        View Details Pop up Verification 2        xpath:(//section[contains(@class,"desktop")]//button[@class='j-button j-button-size__medium tertiary'])[${m}]  xpath:(//*[contains(@class,"planDetailsPopup")])[${m}]   Mobile_Postpaid   16   ${m}  xpath:(//div[@class='j-modal j-modal-visible j-modal-closable j-modal-size-s planDetailsPopup j-modal-kind-dialog']//div[@class='j-modal-container']//div//header[@class='j-modal-header']//button[@aria-label='button'])
    END
    
    FOR  ${m}  IN RANGE  1  ${card_count}+1
        Scroll To                  xpath:(//section[contains(@class,"desktop")]//button[@class='j-button j-button-size__medium tertiary'])[${m}]
        Sleep    2s
        Click Element                             xpath:(//section[contains(@class,"desktop")]//button[@class='j-button j-button-size__medium tertiary'])[${m}]
        Take Page Screenshot                      View details
        Wait For And Click Element                xpath=(//div[contains(@class,'j-modal-visible j-modal-closable')]//button[normalize-space()='Get Now'])
        Wait For And Verify Element               xpath:(//section[@class='j-container l-layout--centered'])
        Go Back
        Sleep    5s
    END


Validate redirection of links present in Notes section of View details
    ${card_count}=    Get Element Count          xpath=//section[@class='j-container l-breakpoint--desktop']//section[@class='j-container bg--primary-20 l-radius--xl']     
    FOR  ${m}  IN RANGE  1  ${card_count}+1
        Sleep        3s
        Click Element                            xpath:(//section[contains(@class,"desktop")]//button[@class='j-button j-button-size__medium tertiary'])[${m}]
        ${Hyperlink_presence}=    Run Keyword And Return Status   Element Should Be Visible   ${Hyperlink}//a    
        IF  ${Hyperlink_presence} == True
            ${V-URL}=   Get Element Attribute    ${Hyperlink}//a   href
            ${Link_Name}=   Take Element Text    ${Hyperlink}//a
            Wait For And Click Element           ${Hyperlink}//a
            Sleep  2s
            Check Window count and Validation    ${V-URL}      ${Link_Name}
            Sleep    3s
        ELSE
            Click Element                        xpath=(//div[@class='j-modal j-modal-visible j-modal-closable j-modal-size-s planDetailsPopup j-modal-kind-dialog']//div[@class='j-modal-container']//div//header[@class='j-modal-header']//button[@aria-label='button'])
        END  
    END   

Verify Redirection of More Information section Main Page    
    More Information Section Redirection         xpath=//section[contains(@class,'desktop')]//div[contains(@class,'MoreInformation')]//button[contains(@class,'j-button-size__medium secondary')]   https://jep-asset.akamaized.net/jio/plan/Postpaid-Plans-Oct-2022.pdf     MainPlans  
