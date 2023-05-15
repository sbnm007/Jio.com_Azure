***Settings***
Library                             SeleniumLibrary

***Keywords***
QR Code Validation                  #akshaansh.h
    Scroll To                       xpath=//div[@class='sp--base pd--top']  

    #Verify MyJio logo
    Wait For And Verify Element     xpath=//section[@class="j-container bg--secondary-20"]//div[@class="j-listBlock align-middle"] 
   
    #Text and CSS Verification of MyJio heading
    Text Verification               xpath=//div[contains(@class,'j-contentBlock__title j-heading j-text-heading-xs')][normalize-space()='MyJio']    ${Myjio_text[0]}
    CSS Verification                xpath=//div[contains(@class,'j-contentBlock__title j-heading j-text-heading-xs')][normalize-space()='MyJio']    font-weight    900
    
    #Verify heading in bold
    Wait For And Verify Content     xpath=//section[@class="j-container bg--secondary-20"]//h2      ${Myjio_text[1]}
    Wait For And Verify Content     xpath=//section[@class="j-container bg--secondary-20"]//h2      ${Myjio_text[2]}
    CSS Verification                xpath=//section[@class="j-container bg--secondary-20"]//h2     font-weight    900
   
    #Sub-heading
    Wait For And Verify Content     xpath=//div[@class="j-color-primary-grey-80 j-contentBlock__description j-text-body-m l-breakpoint--desktop"]    ${Myjio_text[3]}

    #QR Code
    Image Verification              xpath=//span[@class="l-radius--large overflow-initial sp--s pd--all d-inline-flex"]//img 
    Take Element Screenshot         xpath=//section[@class="j-container bg--secondary-20"]    QR_section  
