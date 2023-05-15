***Settings***
Library                                 SeleniumLibrary
Library                                 RequestsLibrary
Resource                                ../../Local_Keywords.robot

***Keywords***
Get Jio Fiber Popup Validation
    #Redirection to JioFiber Popup
    Wait For And Click Element              xpath=//a[@id="fiber"]
    Take Page Screenshot                    GetJioFiber_Popup

    #Close button
    Wait For And Verify Element             xpath=//button[@id='fiber-popup-close-id']//i[@class='j-button-icon']//*[name()='svg']
   
    #Wifi Icon
    Wait For And Verify Element             xpath=//*[name()='path' and contains(@d,'M8.21335 ')]
    
    #Get Fiber Title
    Text Verification                       xpath=//h5[contains(text(),'Fiber')]             Get JioFiber
    CSS Verification                        xpath=//h5[contains(text(),'Fiber')]             font-weight      900
    
    #Sub Text Verification Below Get Jio Fiber 
    Text Verification                       xpath=//*[@id="generate-number-wrapper-id"]//div[@class="j-contentBlock__description j-text j-text-body-xs"]    Just verify your number, share your address, and we’ll install JioFiber at your place soon.
   
    #Enter Name
    Text Verification                       xpath=//label[@for='user-name-fiber']                           Name
   
    #Enter Mobile Number
    Text Verification                       xpath=//label[@class='field-label' and contains(text(),'Ph')]   Phone number
   
    #Get Fiber Button
    Button Verification                     xpath=//button[@id='generateOTP-btn-fiber']
    CSS Verification 	                    xpath=//button[@id='generateOTP-btn-fiber']    font-weight	   700
   
    #Toast of Verification of You will receive an OTP on your number.
    Text Verification                       xpath= //*[@id="generate-number-wrapper-id"]//div[@class="field-underinfo"]//span[@class="field-description"]   You will receive an OTP on your number.
    
    #Cross Icon Verification
    Wait For And Input Text                 xpath=//input[@id='user-name-fiber']            ${Name} 
    Wait For And Input Text                 xpath=//input[@id='user-number-fiber']          ${Incorrect_No2}       
    ${CrossIcons}=     Get WebElements      xpath=//div[@id="generate-number-wrapper-id"]//span[@class='input-icon input-icon-suffix clickable clear-btn']
    FOR  ${CrossIcon}  IN  @{CrossIcons}
        Cross Button Functionality          ${CrossIcon}
    END
    
    #Inputs Name in the name field
    Wait For And Input Text                 xpath=//input[@id='user-name-fiber']            ${Name}
    
    #Inputs incorrect number in the Phone number field 
    Wait For And Input Text                 xpath=//input[@id='user-number-fiber']          ${Incorrect_No2}
    
    #Clicks on Generate OTP button
    Wait For And Click Element              xpath=//button[@id='generateOTP-btn-fiber']
    
    ${presense}=    Run Keyword And Return Status       Wait Until Element Is Visible       xpath=//div[@id='maxattemptreached-fiber']
    IF  ${presense} == True
        Text Verification                   xpath=//div[@id='maxattemptreached-fiber']     You have exceeded the maximum attempts to resend OTP. Please try again after some time.
    ELSE
        
        #Close button
        Wait For And Verify Element         xpath=//button[@id='fiber-popup-close-id']    
        
        # ** icon
        Wait For And Verify Element         xpath=//div[@id='modal-get-fiber-container']//*[name()='path' and contains(@d,"M-10 6C-10")]
        
        #verify phone number title
        Text Verification                   xpath=//div[@id='modal-get-fiber-container']//h5[contains(text(),'Verify')]           Verify phone number
        
        #otp area
        Wait For And Verify Element         xpath=//fieldset[@id="otpcontainer-id"]
        
        #verify resend code
        Text Verification                   xpath=//div[@id='modal-get-fiber-container']//span[contains(text(),'Resend')]           Resend code
        
        #verify button
        Wait For And Verify Element         xpath=//button[@id='validateOTP-btn-fiber']
        
        #OTP Sent Successfully toast
        Wait Until Page Contains            OTP sent successfully
        
        #Before Entering OTP check verify button is enabled or not
        Element Should Be Disabled          xpath=//button[@id='validateOTP-btn-fiber']
        
        #entering otp
        FOR  ${Enter_OTP}   IN RANGE  1  7
            Wait For And Input Text         xpath=//input[@id='otpnumberinputfiber-${Enter_OTP}']           ${Enter_OTP}
        END  
        
        #checking verify button is enabled or not
        Element Should Be Enabled           xpath=//button[@id='validateOTP-btn-fiber']
        
        #Clicks on the Verify button
        Wait For And Click Element          xpath=//button[@id='validateOTP-btn-fiber']
        
        #checking error on wrong otp
        Wait For And Verify Element         xpath=//div[@id='otp-screen-error-message']
        Text Verification                   xpath=//div[@id='resend-number-invalid-fiber']  Please enter valid OTP
        
        #Clicks on Resend code 
        Wait For And Click Element          xpath=//div[@id='verify-number-wrapper-id']//span[normalize-space()='Resend code']
        
        #OTP Resend Successfully Toast
        Wait Until Page Contains            OTP sent successfully
        # Sleep   200ms  
    END
        #Close Popup
        Wait For And Click Element          xpath=//button[@id='fiber-popup-close-id']//i[@class='j-button-icon']//*[name()='svg']
