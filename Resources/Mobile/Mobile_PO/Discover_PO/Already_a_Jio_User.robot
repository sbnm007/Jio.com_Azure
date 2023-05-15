*** Settings ***
Library                             SeleniumLibrary
Resource                          ../../../Local_keywords.robot


***Keywords***
Already a Jio User Section Validation

#Heading Already a Jio User Main Heading 
    Text Verification                               xpath=//div[@class="position-relative z-index-1"]//h2[@class="j-contentBlock__title j-heading j-text-heading-l"]                                  Already a Jio user?

#SubHeading Already a Jio user
    Text Verification                               xpath=//div[@class="position-relative z-index-1"]//div[@class="j-color-primary-grey-80 j-contentBlock__description j-text-body-m"]                Here are a few things you might find helpful.

#Banner Text Verification
    ${VB}  Set Variable   1
    FOR  ${i}  IN RANGE  0  3
        IF  ${i} == 1
            Text Verification                       xpath=//div[contains(@class,'bg--primary-background w-100 h-100')][${VB}]//h3  ${AJ_Title}[${i}]
            Wait For And Verify Element             xpath=//div[contains(@class,'bg--primary-background w-100 h-100')][${VB}]//img
            Wait For And Verify Element             xpath=//div[contains(@class,'bg--primary-background w-100 h-100')][${VB}]//button
        ELSE
            Banner Content Verification             xpath=//div[contains(@class,'bg--primary-background w-100 h-100')][${VB}]//h3  ${AJ_Title}[${i}]           xpath=//div[contains(@class,'bg--primary-background w-100 h-100')][${VB}]//img           xpath=//div[contains(@class,'bg--primary-background w-100 h-100')][${VB}]//button   AlreadyJio_${VB}
        END
        ${VB}=   Evaluate     ${VB} + 1
    END

#Checking Redirection of buttons of Already a Jio User section to their respective web page
   ${VB}  Set Variable   0
   WHILE  ${VB} < 3
      Redirection On Clicking                       xpath=//button[normalize-space()="${AJ_Button_Name}[${VB}]"]     ${AJ_UrlList}[${VB}]      ${AJ_Button_Name}[${VB}]  
      ${VB}=   Evaluate     ${VB} + 1
   END
