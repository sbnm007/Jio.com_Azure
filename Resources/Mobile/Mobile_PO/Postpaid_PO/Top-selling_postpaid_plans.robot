*** Settings ***
Library                              SeleniumLibrary
Library                              Collections
Library                              Dialogs
Resource                            ../../../../Resources/Local_Keywords.robot


***Keywords***

Scroll To "Top-selling postpaid plans" section

    # Scrolls to Top-selling postpaid plans
    Scroll To                                     xpath=//div[@class='Details_detailsCont__iCgow']
Validate the UI elements and content of "Top-selling postpaid plans" section

    # Plan Card Verification of cards
    Plan Card Verification-2                      //section[@class='j-container bg--primary-20 l-radius--xl']    Mobile_Postpaid    24
    
Verify the Redirection of Get Now button of 'Top-selling postpaid plans' cards
     
     # Gets the card count
     ${card_count}=    Get Element Count          xpath=//section[@class='j-container bg--primary-20 l-radius--xl']
     Log To Console    ${card_count}
     FOR  ${m}  IN RANGE  1  ${card_count}+1

        # Click on the Get Now button of each card present 
        Wait For And Click Element                xpath=(//button[contains(.,'Get Now')])[${m}]
        # Verifies the Redirection of Get Now button
        Wait For And Verify Element               xpath:(//section[@class='j-container l-layout--centered'])   
        Go Back
        Sleep    150ms

        # View Details Verification of card present
        View Details Pop up Verification 2        xpath:(//section//button[@class='j-button j-button-size__medium tertiary'])[${m}]  xpath://div[@class='j-modal j-modal-visible j-modal-closable j-modal-size-s planDetailsPopup j-modal-kind-dialog']//div[@class='j-modal-container']//div//div[@class='j-modal-body']   Mobile_Postpaid   27   ${m}  xpath:(//div[@class='j-modal j-modal-visible j-modal-closable j-modal-size-s planDetailsPopup j-modal-kind-dialog']//div[@class='j-modal-container']//div//header[@class='j-modal-header']//button[@aria-label='button'])
     END

     FOR  ${m}  IN RANGE  1  ${card_count}+1
        Scroll To                                 xpath:(//section//button[@class='j-button j-button-size__medium tertiary'])[${m}]
        Sleep    150ms

        # Clicks on View details of each card
        Wait For And Click Element                xpath:(//section//button[@class='j-button j-button-size__medium tertiary'])[${m}]
        Take Page Screenshot    View details

        #Clicks on Recharge button present after clicking on View details button
        Wait Until Keyword Succeeds    15sec    0sec    Wait For And Click Element                xpath=(//div[contains(@class,'j-modal-visible j-modal-closable')]//button[normalize-space()='Recharge'])
        Sleep    150ms

        #Closes the popup of the Recharge button    
        Wait For And Click Element                xpath=//div[@aria-label='Modal ']//div[@class='j-modal-container']//div//i[@class='j-button-icon']//*[name()='svg']
        Sleep    150ms

        #Clicks on the View details button of each card
        Wait For And Click Element                xpath=(//section//button[@class='j-button j-button-size__medium tertiary'])[${m}]
        ${Hyperlink_presence}=    Run Keyword And Return Status   Element Should Be Visible   ${Hyperlink}//a    
        IF  ${Hyperlink_presence} == True
            ${V-URL}=   Get Element Attribute    ${Hyperlink}//a   href
            ${Link_Name}=   Take Element Text    ${Hyperlink}//a
            Wait For And Click Element           ${Hyperlink}//a
            Sleep    150ms
            Check Window count and Validation    ${V-URL}      ${Link_Name}
            Sleep    150ms
        ELSE
            Wait For And Click Element            xpath=(//div[@class='j-modal j-modal-visible j-modal-closable j-modal-size-s planDetailsPopup j-modal-kind-dialog']//div[@class='j-modal-container']//div//header[@class='j-modal-header']//button[@aria-label='button'])
        END
    END
