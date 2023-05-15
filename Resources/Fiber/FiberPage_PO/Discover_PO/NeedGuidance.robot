*** Settings ***
Library        SeleniumLibrary

*** Keywords ***
#TC ID:91919-91921
Need guidance section Validations
   #To Verify Need Guidance Section
   Scroll To                              xpath=//section[@class='j-container bg--primary-background']
   Section Verification                   xpath=//section[@class='j-container bg--primary-background']           NeedGuidance
   
   #To Verify Need Guidance text 
   Text verification                      xpath=//h2[normalize-space()='Need guidance?']        ${NeedGuide_text}[0]
  
   #To Verify Sub Text 
   Text verification                      xpath=//div[contains(text(),'We’d love to help you.')]        ${NeedGuide_text}[1]
  
   #To Verify Support,Call us and Find a Store button text 
   ${Inc}  Set Variable   0
   ${Buttons}=      Get Element Count     xpath=//button[@class="j-button j-button-size__medium secondary icon-primary icon-primary-inline j-button-flex "]
   FOR    ${i}   IN RANGE    1  ${Buttons}+1
      Text verification                   xpath=//button[@class="j-button j-button-size__medium secondary icon-primary icon-primary-inline j-button-flex "][${i}]      ${Buttons_Name}[${Inc}]
      ${Inc}=   Evaluate       ${Inc} + 1   
   END
   
   #To Verify Support,Call us and Find a Store button redirection
   ${VB}  Set Variable   0
   WHILE  ${VB} < 3
      Redirection On Clicking             xpath=//div[@class='j-button-group btn_fullwidth_icon']//button[contains(@aria-label,'${Buttons_Name}[${VB}]')]   ${Guidance_UrlList}[${VB}]    ${Buttons_Name}[${VB}]  
      ${VB}=   Evaluate     ${VB} + 1
   END
