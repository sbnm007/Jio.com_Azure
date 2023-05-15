*** Settings ***
Library    SeleniumLibrary
Resource    ../../../Common.robot
Variables    ../../../../Tests/Fiber/FPostpaid_Variables.yaml
Resource     ../Postpaid_PO/RedirectionToPostpaid.robot
Resource         ../../../Excel_Activity.robot
Resource        ../../../Local_Keywords.robot

*** Keywords ***
Verify Incredible Fiber plans section is visible and verify the UI elements and content
    
    # It Will Scroll To Till The Mentioned Keywords Appears.
    Scroll To  xpath: //div[@class="Category_heading__2AMfm j-text j-text-heading-m"]
    Sleep  200ms
    Plan Card Verification-2   cards=(//div[@class="Details_detailsCont__iCgow"])  sheet_name=Fiber_Postpaid  row_num=57

    # It Will Get The Count Of All The Elements Matching The Xpath Provided
    ${btns_cnt} =  Get Element Count  xpath://div[contains(@class,"planDetailsCard")]//button[2]
    
    
    # It Will Click The Button Present Over Card
    Wait For And Click Element    xpath://div[contains(@class,"planDetailsCard")][1]//button[1]
    Wait Until Element Is Visible          ${Get_JioFiber}    timeout=10s
    Go Back
    
Verify UI And redirection of Book Now button present in 'View Details' popup
    # It Will Scroll To To The Button Present On Plan Card.
    Scroll To  xpath=//div[contains(@class,"planDetailsCard")][1]//button[2]

    # It Will Get All The Plan Cards Present
    ${cards_cnt} =  Get Element Count  xpath://div[contains(@class,"planDetailsCard")]
    
    FOR  ${m}  IN RANGE   1     ${cards_cnt}+1
        View Details Pop up Verification 2    xpath:(//button[@class='j-button j-button-size__medium tertiary'])[${m}]  xpath:(//*[contains(@class,"planDetailsPopup")])[${m}]   Fiber_Postpaid   55   ${m}  xpath:(//div[@class='j-modal j-modal-visible j-modal-closable j-modal-size-s planDetailsPopup j-modal-kind-dialog']//div[@class='j-modal-container']//div//header[@class='j-modal-header']//button[@aria-label='button'])
        Sleep        200ms
    END
    
    
