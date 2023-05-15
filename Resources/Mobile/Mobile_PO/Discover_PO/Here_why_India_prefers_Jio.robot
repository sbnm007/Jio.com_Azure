*** Settings ***
Library                             SeleniumLibrary
Resource                          ../../../Local_keywords.robot
*** Keywords ***

Here why India prefers Jio Section Validation
    #Here why India prefers Jio (Heading)
    Text Verification                                xpath=//h2[contains(@class,'j-text-heading-l') and contains(text(),"Here’s why India prefers Jio")]        Here’s why India prefers Jio
    
    #CSS Verification
    CSS Verification                                 xpath=//h2[contains(@class,'j-text-heading-l') and contains(text(),"Here’s why India prefers Jio")]        font-weight     900   
    
    #Takes Page Screenshot
    Take Page Screenshot                             HeresWhyIndia

    #Logo's of Here why India prefers Jio  
    ${LOGOs}=  Get WebElements                       xpath=//section[@class="j-container"]//div[@class="l-layout--max-width overflow-scroll-max-width"]
    ${Count}=  Set Variable  0
    FOR  ${LOGO}  IN  @{LOGOs}
        Wait For And Verify Element                  ${LOGO}
        ${Count}=  Evaluate    ${Count} + 1
    END
    Log To Console                                   ${Count} Logo's of Here why India prefers Jio Verified


    #Title below Logo 
    ${Mainelements}=  Get WebElements                xpath=//h3[@class='j-contentBlock__title j-heading j-text-body-s-bold']
    ${count}=     Set Variable  0
    FOR  ${Mainelement}  IN  @{Mainelements}
        Text Verification                            ${Mainelement}       ${Maintext}[${count}] 
        ${count}=   Evaluate     ${count} + 1  
    END
    Log To Console                                   ${count} Title Below Logo's Verified

    #Subtittle below Logo  
    ${Subcount}=     Set Variable  0
    ${SubElements}=  Get WebElements                 xpath=//div[@class='j-color-primary-grey-80 j-contentBlock__description j-text-body-s']
    FOR  ${Subelement}  IN  @{Subelements}
        Text Verification                            ${Subelement}       ${Subtext}[${Subcount}] 
        ${Subcount}=   Evaluate   ${Subcount} + 1  
    END
    Log To Console                                   ${Subcount} Subtittle below Logo's Verified 
