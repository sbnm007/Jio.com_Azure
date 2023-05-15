*** Settings ***
Library    SeleniumLibrary
Resource    ../../../Common.robot
Variables   ../../../../Tests/Fiber/FPrepaid_Variables.yaml 

*** Keywords ***
Validating the FAQ Section and confirming the redirections
    Scrolling on FAQ Section and confirming the redirection of Links in each FAQ and Content
    

Scrolling on FAQ Section and confirming the redirection of Links in each FAQ and Content
    Scroll To                                          xpath=${Accordian_Locator}
    Confirming the redirection of Links in each FAQ

Confirm that accordians collaspse and expand
    Scroll To                                          xpath=${Accordian_Locator}
    
    #Getting the count of accordians in FAQ Section
    ${Accordian_Count}=    Get Element Count           xpath=${Accordian_Container}
    Log To Console    ${Accordian_Count}
    #Clicking Each Accordian
    FOR  ${i}  IN RANGE    1    ${Accordian_Count}+1
        Wait For And Click Element                     xpath=${Accordian_Container} [${i}]
        Element Attribute Value Should Be              xpath=(//div[@aria-hidden='false'])[1]    aria-hidden    false
        Wait For And Click Element                     xpath=${Accordian_Container} [${i}]
    END

Confirming the redirection of Links in each FAQ
    #Getting Accordian in view
    Scroll To                                          xpath=${Accordian_Locator}
    
    #Getting the Accordian Count
    ${Accordian_Count}=    Get Element Count           xpath=${Accordian_Container}
    Log To Console    ${Accordian_Count}
    ${j}    Set Variable    0 
    #Loop used to expand every accordian and verify the redirections
    FOR  ${i}  IN RANGE    1    ${Accordian_Count}+1

            Scroll To                                  xpath=${Accordian_Container} [${i}]
            Wait For And Click Element                 xpath=${Accordian_Container} [${i}]

            #To get the displayed Text
            Scroll To                                      xpath=(//div[@class='j-accordion-panel-content j-text-body-xs'])[${i}]
            ${FAQ_Text_Displayed}=    Get Text             xpath=(//div[@class='j-accordion-panel-content j-text-body-xs'])[${i}]
        
            #Comparing the displayed text with the excel data
            Element Attribute Value Should Be              xpath=(//div[@aria-hidden='false'])[1]    aria-hidden    false
            Should Be Equal    ${FAQ_Text_Displayed}    ${FAQ_Answers}[${i-1}]
        
            ${hyper_count}=    Get Element Count       xpath=//div[@class='j-accordion-panel active']//a
            Log To Console    ${hyper_count}
            FOR    ${counter}    IN RANGE    1    ${hyper_count+1}
                
                Redirection On Clicking                    xpath=(//div[@class='j-accordion-panel active']//a)[${counter}]        ${FAQ_Data_URL}[${j}]    ${FAQ_LINK_SS}[${i}]
                Wait For And Click Element                 xpath=${Accordian_Container} [${i}]
                ${j}=    Evaluate    ${j}+1
            END
            
        END  
