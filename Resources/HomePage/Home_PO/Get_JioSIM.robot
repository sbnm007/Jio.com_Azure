***Settings***
Library                                     SeleniumLibrary
Resource                                    ../../Local_Keywords.robot

***Keywords***
Get Jio SIM Popup Validation
    #Get Jio SIM
    Text Verification                                   xpath=//div[@class='j-text j-text-body-xs j-relative'][normalize-space()='Get Jio SIM']   Get Jio SIM
    Open Popup                                          xpath=//a[@id="sim"]
    Take Page Screenshot                                GetJioSim_Popup
    
    #Close button
    Wait For And Verify Element                         xpath=//button[@data-popup-close='modal-getsim']
   
    #Sim Icon
    Wait For And Verify Element                         xpath=//*[name()='path' and contains(@d,'M15.3333')]
   
    #Get a Jio SIM Title
    Text Verification                                   xpath=//h5[contains(text(),'SIM')]                                  Get a Jio SIM
    CSS Verification 	                                xpath=//h5[contains(text(),'SIM')]        font-weight	 900
   
    #Sub Text
    Text Verification                                   xpath=//div[@id='modal-getsim-container']//div[@class='j-contentBlock__description j-text j-text-body-xs'][contains(text(),'Just validate your number, share your address, and')]    Just validate your number, share your address, and we'll deliver it to your doorstep for FREE
   
    #Enter Name
    Text Verification                                   xpath=//label[@for='fname']                                         Name
    
    #Enter Mobile Number
    Text Verification                                   xpath=//label[@class='field-label' and contains(text(),'Mobile')]   Mobile Number
   
    #Genrate OTP
    Button Verification                                 xpath=//button[@id='generateOTP-btn']
   
    #Check Get SIM Button enabled or not
    Check Buttons Enabled                               xpath=//input[@id='user-name']      ${Name}     xpath=//input[@id='user-number']    ${Incorrect_No1}  xpath=//button[@id='generateOTP-btn'] 
    
    ${CrossIcons}=     Get WebElements                  xpath=//div[@id='modal-getsim-container']//div[@class="input-info-wrapper"]//span[@class='input-icon input-icon-suffix clickable clear-btn']
    FOR  ${CrossIcon}  IN  @{CrossIcons}
        Cross Button Functionality         ${CrossIcon}
    END
    
    #Invalid Number
    Wait For And Input Text                             xpath=//input[@id='user-name']      ${Name}
    Wait For And Input Text                             xpath=//input[@id='user-number']    ${Incorrect_No1}
    Wait For And Click Element                          xpath=//button[@id='generateOTP-btn']
    Text Verification                                   xpath=//div[@id='user-number-invalid']  Please enter a valid mobile number
    
    #Incorrect Otp
    Wait For And Input Text                             xpath=//input[@id='user-name']      ${Name}
    Wait For And Input Text                             xpath=//input[@id='user-number']    ${Incorrect_No2}
    Wait For And Click Element                          xpath=//button[@id='generateOTP-btn']
    
    ${presense}=    Run Keyword And Return Status       Wait Until Element Is Visible       xpath=//div[@id='maxattemptreached']
    IF  ${presense} == True
        Text Verification                               xpath=//div[@id='maxattemptreached']     You have exceeded the maximum attempts to resend OTP. Please try again after some time.
    ELSE
        #Close button
        Wait For And Verify Element                     xpath=//button[@data-popup-close='modal-getsim']
        
        # ** icon
        Wait For And Verify Element                     xpath=//*[name()='path' and contains(@d,"M-10 6C-10")]
        
        #verify phone number title
        Text Verification                               xpath=//h5[contains(text(),'Verify')]           Verify phone number
        CSS Verification                                xpath=//h5[contains(text(),'Verify')]    font-weight    900
        
        #otp area
        Wait For And Verify Element                     xpath=//fieldset[@id="type-id-3"]
        
        #verify resend code
        Text Verification                               xpath=//div[@id='modal-getsim-container']//a[contains(@onclick,'resend')]           Resend code
        
        #verify button
        Wait For And Verify Element                     xpath=//button[@id='validate-otp-btn']
        
        #entering otp
        FOR  ${Enter_OTP}   IN RANGE  1  7
            Wait For And Input Text                     xpath=//input[@id='otpnumberinput-${Enter_OTP}']           ${Enter_OTP}  
        END  
        
        #checking verify button is enabled or not
        Element Should Be Enabled                       xpath=//button[@id='validate-otp-btn']
        Wait For And Click Element                      xpath=//button[@id='validate-otp-btn']
        
        #checking error on wrong otp
        Wait For And Verify Element                     xpath=//div[@id='resend-number-invalid']
        Text Verification                               xpath=//div[@id='resend-number-invalid']  Please enter valid OTP
        Wait For And Click Element                      xpath=//div[@id='modal-getsim-container']//a[contains(@onclick,'resend')]
        #Sleep   200ms 
    END
   
    #Close Popup
    Close Popup                                         xpath=//button[@data-popup-close='modal-getsim']
    



