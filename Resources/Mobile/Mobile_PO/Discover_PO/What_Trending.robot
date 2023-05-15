*** Settings ***
Library                             SeleniumLibrary
Resource                            ../../../../Resources/Local_keywords.robot

*** Keywords ***
What Trending Section Validation
#What's Trending Main Heading
    Scroll To                                  xpath=//h2[contains(text(),"What's trending")] 
    Text verification                          xpath=//h2[contains(text(),"What's trending")]    What's trending

#SubHeading of What's Trending 
    Text Verification                          xpath=//div[contains(text(),"updated on ongoing offers, latest products, and more.")]    Get updated on ongoing offers, latest products, and more.

#Banner Text Varification
    Scroll To                                  xpath=//button[@aria-label='Get MyJio app']
    ${elements}=    Get WebElements            xpath=//h4[contains(@class,'j-promo-card__content-title j-heading j-text-heading-s')]
    ${i}  Set Variable   0
    FOR  ${element}  IN  @{elements}
        Banner Content Verification            ${element}   ${WT_Title}[${i}]   xpath=(//section[@class='j-container']//div[@class='j-promo-card__image ratio-landscape']//img)[${i}+1]   xpath=//button//div[normalize-space()="${WT_Button_Name}[${i}]"]  ${WT_Button_Name}[${i}]
        ${i}=   Evaluate     ${i} + 1
    END
    Log To Console    ${i} What's Trending Crads

#What Trending Redirection
#Checking Redirection of buttons of what trending section to their respective web page
   ${VB}  Set Variable   0
   WHILE  ${VB} < 3
      Redirection On Clicking                  xpath=//button//div[normalize-space()="${WT_Button_Name}[${VB}]"]     ${WT_UrlList}[${VB}]      ${WT_Button_Name}[${VB}]_RD  
      ${VB}=   Evaluate     ${VB} + 1
   END
