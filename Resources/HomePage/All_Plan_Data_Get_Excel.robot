*** Settings ***
Library                              SeleniumLibrary
Library                              String
Library                              ExcelLibrary


*** Keywords ***

Get All Data
    Go To                                               https://www.jio.com/selfcare/plans/mobility/prepaid-plans-home/
    ${Skip}=  Create List       ISD     International Roaming 

    #${Filter}=      Set Variable        //section[contains(@class,'desktop')]//div[contains(@class, 'filterBtn')]//Button[2]     
    ${row}=     set Variable     1 
    Create Excel Document	            doc_id=1
    
    FOR     ${i}  IN RANGE  1   4
        ${Pack_Name}=       Get Text        xpath=(//div[@class="plans_buttonMobile__1bWl_"])[${i}]
        IF  ('${Pack_Name}' in ${Skip})     

            Log      ${Pack_Name}_Skipped

        ELSE
            
            Wait For And Click Element          xpath=//button[@aria-label="button ${Pack_Name}"]
            Sleep       1s
            
            ${present}=  Run Keyword And Return Status    Element Should Be Visible   xpath=//section[contains(@class,'desktop')]//div[contains(@class, 'filterBtn')]//Button[2]
            
            Run Keyword If    ${present}    Select All Filters

            @{Plan cards}=                      Get WebElements         xpath=//section[contains(@class,'desktop')]//div[@class="planDetailsCard_container__1gH8d"]
            ${Plan card len}=                   Get Length      ${Plan cards}
            Log To Console                      ${Plan card len}_Page
            
                FOR  ${i}  IN RANGE  1  ${Plan card len}+1

                    ${Plan_Amount}=                 Get Text     xpath=(//section[contains(@class,'desktop')]//div[@class="PlanName_planText__26L0a j-text j-text-heading-m"])[${i}]
                    ${Plan_Amount}=                         Replace String    ${Plan_Amount}    \n    ${EMPTY}
                    Write Excel Cell	    ${row}	    1	    value=${Plan_Amount}
                    Save Excel Document	    filename=plandata.xlsx	
                    #${E_Amt}=   Read Excel Cell          row_num=${i}      col_num=1  sheet_name=Sheet
                    #Log             ${E_Amt}


                    ${Plan_Details}=                 Get Text    xpath=(//section[contains(@class,'desktop')]//div[@class="Details_planCont__1xVvf"]//div[@class="j-grid"])[${i}]
                    Write Excel Cell	    ${row}	    2	    value=${Plan_Details}
                    Save Excel Document	    filename=plandata.xlsx	
                    #${E_PlanDetails}=   Read Excel Cell          row_num=${i}      col_num=2  sheet_name=Sheet
                    #Log             ${E_PlanDetails}
                    #Should Be Equal     ${Plan_Details}     ${E_PlanDetails}


                    #---------------------------------------- VIEW DETAILS POP-UP-------------------------------------------------------#

                    Wait For And Click Element                  xpath=(//section[contains(@class,'desktop')]//button[contains(text(),'View details')])[${i}]
                    ${View Details Popup}=          Get Text    xpath=(//div[@class="j-modal j-modal-visible j-modal-closable j-modal-size-s j-modal-kind-dialog"]//div[@class="customScroll_scroll__1lZUu"])
                    Write Excel Cell	    ${row}	    3       value=${View Details Popup}
                    Save Excel Document	    filename=plandata.xlsx	
                    Close Popup                                 xpath=//div[@class='j-modal j-modal-visible j-modal-closable j-modal-size-s j-modal-kind-dialog']//header[@class='j-modal-header']//button[@aria-label='button']

                    ${row}=   Evaluate        ${row} + 1
                END

                Save Excel Document	    filename=plandata.xlsx	
                Close Current Excel Document 

            Go To                                               https://www.jio.com/selfcare/plans/mobility/prepaid-plans-home/
            Sleep       1s

        END

    END




Select All Filters
    Wait For And Click Element          xpath=//section[contains(@class,'desktop')]//div[contains(@class, 'filterBtn')]//Button[2]
    ${checkboxes}=                      Get WebElements     xpath=//div[@class="j-modal j-modal-visible j-modal-closable j-modal-size-m j-modal-kind-dialog"]//div[@class="FilterPopup_checkbox__10y7P"]
    ${len}=                             Get Length      ${checkboxes}
    FOR     ${i}    IN RANGE   1  ${len}+1

        Wait For And Click Element          xpath=(//section[contains(@class,'desktop')]//div[@class="FilterPopup_checkbox__10y7P"]//span[@aria-label])[${i}]
    
    END
    Wait For And Click Element          xpath=//section[contains(@class,'desktop')]//button[@aria-label='button'][normalize-space()='Show plans']




Get Plan data excel       
    @{Plan cards}=                      Get WebElements         xpath=//section[contains(@class,'desktop')]//div[@class="planDetailsCard_container__1gH8d"]
    ${Plan card len}=                   Get Length      ${Plan cards}
    Log To Console                      ${Plan card len}_Page
    Create Excel Document	            doc_id=docname2

    FOR  ${i}  IN RANGE  1  ${Plan card len}+1

        ${Plan_Amount}=                 Get Text     xpath=(//section[contains(@class,'desktop')]//div[@class="PlanName_planText__26L0a j-text j-text-heading-m"])[${i}]
        ${Plan_Amount}=                         Replace String    ${Plan_Amount}    \n    ${EMPTY}
        Write Excel Cell	    ${i}	    1	    value=${Plan_Amount}
        Save Excel Document	    filename=All Plan Details.xlsx	
        ${E_Amt}=   Read Excel Cell          row_num=${i}      col_num=1  sheet_name=Sheet
        Log             ${E_Amt}


        ${Plan_Details}=                 Get Text    xpath=(//section[contains(@class,'desktop')]//div[@class="Details_planCont__1xVvf"]//div[@class="j-grid"])[${i}]
        Write Excel Cell	    ${i}	    2	    value=${Plan_Details}
        Save Excel Document	    filename=All Plan Details.xlsx	
        ${E_PlanDetails}=   Read Excel Cell          row_num=${i}      col_num=2  sheet_name=Sheet
        Log             ${E_PlanDetails}
        Should Be Equal     ${Plan_Details}     ${E_PlanDetails}


#---------------------------------------- VIEW DETAILS POP-UP-------------------------------------------------------#

        Wait For And Click Element                  xpath=(//section[contains(@class,'desktop')]//button[contains(text(),'View details')])[${i}]
        ${View Details Popup}=          Get Text    xpath=(//div[@class="j-modal j-modal-visible j-modal-closable j-modal-size-s j-modal-kind-dialog"]//div[@class="customScroll_scroll__1lZUu"])
        Write Excel Cell	    ${i}	    3       value=${View Details Popup}
        Close Popup                                 xpath=//div[@class='j-modal j-modal-visible j-modal-closable j-modal-size-s j-modal-kind-dialog']//header[@class='j-modal-header']//button[@aria-label='button']

    END

    Save Excel Document	    filename=All Plan Details.xlsx	
    Close Current Excel Document