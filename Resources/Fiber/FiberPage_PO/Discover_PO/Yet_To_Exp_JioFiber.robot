*** Settings ***
Library     SeleniumLibrary
Resource    ../../../Common.robot
Resource    ../../../Local_Keywords.robot

*** Keywords ***
#TC ID:91886-91891
Yet to experience JioFiber Validation
    #Scrolling to Yet to experience JioFiber section 
    Scroll To                        xpath://h3[@class="j-contentBlock__title j-heading j-text-heading-l" and contains(text( ),"Yet")]
    
    #Yet to experience JioFiber Section Verification
    Section Verification             xpath://section[@class="j-container"]//div[@class="j-card size--s p-0 bg--primary-20"]    Yet to experience JioFiber
    
    #Verifying Heading
    Text Verification                xpath://h3[@class="j-contentBlock__title j-heading j-text-heading-l" and contains(text( ),"Yet")]    Yet to experience JioFiber?
    
    #Verifying text below heading
    Text Verification                xpath://div[@class="j-color-primary-grey-80 j-contentBlock__description j-text-body-m" and contains(text( ),"Wait")]    Wait no more! Get a new connection now.    
    
    #Verifying Book JioFiber online button
    Button Verification              xpath://button[normalize-space()='Book JioFiber Online']
    
    #Clicking on Book JioFiber online button 
    Wait For And Click Element       xpath://button[normalize-space()='Book JioFiber Online']
    
    #Verifying visibility of Get JioFiber pop up
    Wait For And Verify Element      xpath://div[@id='modal-get-fiber-container']
    
    #Verifying cross button
    Wait For And Verify Element      xpath://button[@data-popup-close='modal-get-fiber'] 
    
    #Verifying Wifi icon    
    Wait For And Verify Element      xpath://div[@id='generate-number-wrapper-id']//span[@class='j-icon j-icon__bg']
    
    #Verifying Heading
    Text Verification                xpath://h5[contains(text(),'Get JioFiber')]    Get JioFiber 
    
    #Verifying text below heading   
    Text Verification                xpath://div[@id='generate-number-wrapper-id']//div[@class='j-contentBlock__content']//div[1]   Just verify your number, share your address, and we’ll install JioFiber at your place soon.   
    
    #Verifying Name input box
    Wait For And Verify Element      xpath://input[@id='user-name-fiber']

    #Verifying Phone Number input box
    Wait For And Verify Element      xpath://input[@id='user-number-fiber']
    
    #Verifying Generate OTP button
    Wait For And Verify Element      xpath://button[@id='generateOTP-btn-fiber']
    
    #Verifying Text above Generate OTP button
    Text Verification                xpath://div[@id='generate-number-wrapper-id']//div[@class='txt-align--left']//span[contains(text(),'You will')]    You will receive an OTP on your number.
     
    #Entering name in Name input box      
    Wait For And Input Text          xpath://input[@id='user-name-fiber']    Tester
     
    #Entering Number in Phone Number input box
    Wait For And Input Text          xpath://input[@id='user-number-fiber']    ${COCP_OR_Postpaid_Number} 

    #Clicking cross button that appears on Name field input box 
    #Relative xpath found but it's not verfying and clicking (xpath://span[@class="input-icon input-icon-suffix clickable clear-btn"]//img[@xpath=1])
    Wait For And Click Element       xpath:(//span[contains(@class,'input-icon input-icon-suffix clickable clear-btn')])[6]    

    #Clicking cross button that appears on Phone Number input box
    Wait For And Click Element       xpath:(//span[contains(@class,'input-icon input-icon-suffix clickable clear-btn')])[7]

    #Entering Name and Phone Number for continue button to get enabled
    Wait For And Input Text          xpath://input[@id='user-name-fiber']    Tester123
    Wait For And Input Text          xpath://input[@id='user-number-fiber']    ${COCP_OR_Postpaid_Number}

    #Verifying Continue button is enabled
    Wait Until Element Is Enabled    xpath://button[@id='generateOTP-btn-fiber']
    