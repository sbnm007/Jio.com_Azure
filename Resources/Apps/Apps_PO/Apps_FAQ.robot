*** Settings ***
Library                             SeleniumLibrary
Library                             String
Resource                            ../../Common.robot
Resource                            ../../Local_Keywords.robot
Resource                            ../Apps_PO/Redirection_to_Apps.robot

***Variables***

${count}=               1

***Keywords***
  
App Validate FAQ 
    ${count}        Set Variable    0
    ${question}            Set Variable    1
    FOR  ${question}  IN RANGE    1  6     
        Scroll To                                            xpath=(//div[@class="j-accordion"]//div[@class="j-accordion-panel"])[${question}]
        #Click on the question
        Click on FAQ                                         xpath=(//div[@class="j-accordion"]//div[@class="j-accordion-panel"])[${question}]
        #Check whether there is any link present or not
        ${presense}=    Run Keyword And Return Status        Element Should Be Visible           ${parent element}   
        IF  ${presense} == True 
            ${elements}=    Get WebElements                  xpath=//div[@aria-hidden="false"]//div[@class="j-rich-text j-text"]//a
            #Gets the no of links
            ${length}=      Get Length                       ${elements}
            FOR  ${element}  IN RANGE    1  ${length} + 1 
                Wait For And Click Element                   xpath=(//div[@aria-hidden="false"]//div[@class="j-rich-text j-text"]//a)[${element}]
                Sleep  20ms
                IF  "${App_name}" == "JioMeet"
                        Verify Page Loaded                   ${App_name}
                ELSE
                    #Check if redirection is in the same tab or multiple tab
                    Check Window count and Validation        ${FAQ_URL}[${count}]            ${App_name}_FAQ_Hyperlink_${count}
                    #Go Back Doesnt Work so go to the previous app information page where it was
                    Go To                                    ${App_URL}
                    #It should not click if it had reached the last question
                    IF     "${element}" != "${length}"
                        Wait For And Click Element           xpath=(//div[@class="j-accordion"]//div[@class="j-accordion-panel"])[${question}]
                    END
                END
                ${count}=                                    Evaluate             ${count} + 1
            END
            Go To                                            ${App_URL}
        ELSE
            #If no link is present , it closes the accordian
            Wait For And Click Element                       xpath://div[@class="j-accordion"]//div[@class="j-accordion-panel active"]//span
        END
    END    

Check Accordian 
    [Arguments]                                              ${locator}           ${sign}
    Sleep                                                    2s
    #Verifies whether the accordian is plus sign or minus sign
    Run Keyword And Continue On Failure                      Element Attribute Value Should Be            ${locator}//span                class               ${sign}

Click on FAQ
    [Arguments]                                              ${locator}
    Sleep                                                    0.5s
    #Plus Sign here is present in variables file. It is the class attribute of the Plus Sign
    Check Accordian                                          ${locator}       ${Plus_sign}
    #Clicks the question
    Wait For And Click Element                               ${locator}
    Sleep                                                    0.5s
    #Minus Sign here is present in variables file. It is the class attribute of the Minus Sign
    Check Accordian                                          xpath=//div[@class="j-accordion"]//div[@class="j-accordion-panel active"]               ${Minus_sign}
    Sleep                                                    20ms

#This Keyword is only for JioGames and JioHome as there exist multiple tabs in faq
FAQ Section 
    [Arguments]                                              ${current_tab}                ${current_accordion}
    #current tab is set as 0
    #current according is set as 1
    Scroll To                                                xpath=//section[@aria-label="faqs by category section"]
    #Gets the no of tabs in FAQ section
    ${FAQ}=    Get Element Count                             xpath=//div[@class="faqs-by-category"]//div[@class="j-tabs-list j-tabs-list--overflow-fit"]//button
   WHILE   ${current_tab} < ${FAQ}
        #Clicks on the Tab
        Wait For And Click Element                           xpath=//div[@class="faqs-by-category"]//div[@class="j-tabs-list j-tabs-list--overflow-fit"]//button[@aria-controls="panel-${current_tab}"]
        #Gets the no of questions present in the current tab
        ${Length of FAQ_question}=    Get Element Count      xpath=//div[@class="j-accordion"]//div[@class='j-accordion-panel' and @role='tablist']
        #Following Loop runs for the questions 
        WHILE     ${current_accordion} < ${Length of FAQ_question+1} 
            Scroll To                                        xpath=//div[@class="j-accordion"]//div[@class='j-accordion-panel' and @role='tablist'][${current_accordion}]
            #clicks the question
            Wait For And Click Element                       xpath=//div[@class="j-accordion"]//div[@class='j-accordion-panel' and @role='tablist'][${current_accordion}]
            #Checks whether there is any links in the FAQ question
            ${presense}=    Run Keyword And Return Status    Wait Until Element Is Visible   xpath=//div[@class="j-accordion-panel active"]//a
            IF  ${presense} == True 
                #Counts the no of links present
                ${elements_count}=                           Get Element Count  xpath=//div[@class="j-accordion-panel active"]//a
                    FOR    ${k}    IN RANGE    1    ${elements_count+1}
                        Scroll To                            xpath=(//div[@aria-hidden='false']//a)[${k}]
                        #Click the link
                        Wait For And Click Element           xpath=(//div[@aria-hidden='false']//a)[${k}]
                        Take Page Screenshot                 ${App_name}_FAQ_Hyperlink_
                        Go Back
                        IF    ${elements_count} > 1 and ${k} < ${elements_count}
                            #This condition is for again clicking the FAQ question if there is more than 1 link and its not the last link in order to click the next link
                            Scroll To                        xpath=//diV[@class="faqs-by-category"]//div[@class="j-tabs-list j-tabs-list--overflow-fit"]//button[@aria-controls="panel-${current_tab}"]
                            Wait For And Click Element       xpath=//diV[@class="faqs-by-category"]//div[@class="j-tabs-list j-tabs-list--overflow-fit"]//button[@aria-controls="panel-${current_tab}"]
                        ELSE
                            #Increment the question
                            ${current_accordion}=            Evaluate            ${current_accordion}+1
                            Scroll To                        xpath=//div[@class="faqs-by-category"]//div[@class="j-tabs-list j-tabs-list--overflow-fit"]//button[@aria-controls="panel-${current_tab}"]
                            #Click Next Tab
                            Wait For And Click Element       xpath=//div[@class="faqs-by-category"]//div[@class="j-tabs-list j-tabs-list--overflow-fit"]//button[@aria-controls="panel-${current_tab}"]
                            IF  ${current_accordion} == ${Length of FAQ_question}+1
                                BREAK
                            END
                        END    
                    END
            END   
            IF  ${presense} == False
                #increments question
                ${current_accordion}=                        Evaluate            ${current_accordion}+1
                #Close the accordian
                Wait For And Click Element                   xpath=//span[@class="j-accordion-panel-icn active j-button j-button-size__medium tertiary icon-primary icon-only as-span"]
            END       
        END 
        # sets question no back to 1 for new iteration
        ${current_accordion}=                                Evaluate            1
        # tab no is incremented
        ${current_tab}=                                      Evaluate            ${current_tab}+1
    END 