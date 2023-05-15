*** Settings ***
Library                             SeleniumLibrary
Resource                            ../../../Local_keywords.robot
Library                             Dialogs

*** Keywords ***
Thrilled about Jio benefits Section Validation
    #Content Verification
    Banner Content Verification                 xpath=//h3[contains(text(),'Thrilled')]  Thrilled about Jio benefits?    xpath=//div[contains(@class,'desktop')]//img[@alt='Join our network']  xpath=//div[@class='j-card size--s p-0 bg--primary-20']//div[@class='j-button-group align-items-baseline flex-row card-button-group']//button  Thrilled_About
    
    #Opening get jio sim button
    Open Popup                                  xpath=//button[@id='sim']
    Wait For And Verify Element                 xpath=//h5[text()='Get a Jio SIM'] 
    Take Page Screenshot                        Get JioSIM
    Get Jio SIM PopUp Content Validate
    Close Popup                                 xpath=//button[@data-popup-close="modal-getsim"]
    
    #Port to jio redirection
    Redirection On Clicking                     xpath=//button[contains(@onclick,'Port to Jio')]    https://www.jio.com/port-to-jio-mnp   PortToJio
    
Get Jio SIM PopUp Content Validate
    #Close button
    Wait For And Verify Element                 xpath=//button[@data-popup-close='modal-getsim']//i[@class='j-button-icon']//*[name()='svg']    
    
    #Sim Icon
    Wait For And Verify Element                 xpath=//*[name()='path' and contains(@d,'M15.3333')]
    
    #Get SIM Title
    Text Verification                           xpath=//h5[contains(text(),'SIM')]                                  Get a Jio SIM
    
    #Enter Name
    Text Verification                           xpath=//label[@for='fname']                                         Name
    
    #Enter Mobile Number
    Text Verification                           xpath=//label[@class='field-label' and contains(text(),'Mobile')]   Mobile Number
    
    #Text below Mobile Number Placeholder 
    Text Verification                           xpath=//div[contains(@class,'j-field input-field-wrapper input-text input-has-suffix input-has-label-left')]//span[contains(@class,'field-description')][normalize-space()='You will receive an OTP on your number.']        You will receive an OTP on your number.      

    #Get SIM Button
    Wait For And Verify Element                 xpath=//button[@id='generateOTP-btn']
    
    #Check Get SIM Button enabled or not
    Check Buttons Enabled                       xpath=//input[@id='user-name']      ${Name}     xpath=//input[@id='user-number']    ${COCP_OR_Postpaid_Number}  xpath=//button[@id='generateOTP-btn']
    Sleep  100ms
    Wait For And Verify Element                 xpath=(//div[@id='modal-getsim-container']//div[@class="input-info-wrapper"]//span[@class='input-icon input-icon-suffix clickable clear-btn'])[1]
    Wait For And Click Element                  xpath=//input[@id='user-name'] 
    Sleep  100ms
    Wait For And Click Element                  xpath=//input[@id='user-number']
    Wait For And Click Element                  xpath=(//div[@id='modal-getsim-container']//div[@class="input-info-wrapper"]//span[@class='input-icon input-icon-suffix clickable clear-btn'])[2]
    Sleep  100ms
    Check Buttons Enabled                       xpath=//input[@id='user-name']      ${Name}     xpath=//input[@id='user-number']    ${COCP_OR_Postpaid_Number}  xpath=//button[@id='generateOTP-btn']

    #Clicking get jio sim button
    Wait For And Click Element                  xpath=//button[@id="generateOTP-btn"]
    
    #Verify phone number popup
    Wait For And Verify Content                 xpath=//h5[contains(text(),'Verify')]           Verify phone number
    Take Page Screenshot                        verify_phone_number
    Verify phone number popup content validate

Verify phone number popup content validate
    #Close button
    Wait For And Verify Element                 xpath=//button[@data-popup-close='modal-getsim']//i[@class='j-button-icon']//*[name()='svg']    
    
    # ** icon
    Wait For And Verify Element                 xpath=//*[name()='path' and contains(@d,"M-10 6C-10")]
    
    #Verify phone number title
    Text Verification                           xpath=//h5[contains(text(),'Verify phone number')]           Verify phone number
    
    #Subtext
    Text Verification                           xpath=//div[@id='maskedMob']        Enter the OTP sent to your mobile number ${COCP_OR_Postpaid_Number}

    #Enter the OTP 
    Text Verification                           xpath=//div[@id='maskedMob']        Enter the OTP sent to your mobile number ${COCP_OR_Postpaid_Number}

    #Otp area
    Wait For And Verify Element                 xpath=//fieldset[@id="type-id-3"]
    
    #Verify resend code
    Text Verification                           xpath=//span[contains(text(),'Resend')]           Resend code
    
    #Verify button
    Element Should Be Disabled                  xpath=//button[@id='validate-otp-btn']
    
    #Entering otp
    FOR  ${i}   IN RANGE  1  7
        Wait For And Input Text                 xpath=//input[@id='otpnumberinput-${i}']           ${i}
    END  
    
    #Checking verify button is enabled or not
    Element Should Be Enabled                   xpath=//button[@id='validate-otp-btn']
    Wait For And Click Element                  xpath=//button[@id='validate-otp-btn']
    
    #Checking error on wrong otp
    Wait For And Verify Element                 xpath=//div[@id='resend-number-invalid']
    Wait For And Click Element                  xpath=//div[@id='modal-getsim-container']//a[contains(@onclick,'resend')]
 
    #Entering Valid OTP
    FOR    ${i}    IN RANGE    0    1
        ${OTP}    Get Value From User           Enter OTP
        Input Text                              xpath=//*[@id="otpnumberinput-1"]    ${OTP}
    END
    Element Should Be Enabled                   xpath=//*[@id="validate-otp-btn"]
    Wait For And Click Element                  xpath=//*[@id="validate-otp-btn"]
    Sleep    100ms
   
    #Verify Cross Icon
    Wait For And Verify Element                 xpath=//button[@data-popup-close='modal-getsim']
    
    #Verify Jio Sim Logo
    Wait For And Verify Element                 xpath=//div[@class='choose-connection-wrapper']//span[@class='j-icon j-icon__bg']
    
    #Choose connection heading in bold below an icon
    Text Verification                           xpath=//h5[normalize-space()='Choose connection']        Choose connection
    
    #Verifying text below heading
    Text Verification                           xpath=//div[@class='choose-connection-wrapper']//div[@class='j-contentBlock__content']//div[@class="j-contentBlock__description j-text j-text-body-xs"]       Choose your preferred plan and number
    
    #Verify 'Port to Jio'
    Wait For And Verify Element                 xpath=//a[contains(text(),'Port to Jio')]
    
    #Verify 'Get a new Number'
    Wait For And Verify Element                 xpath=//a[normalize-space()='Get new number']
    
    #Verifying Text 'Choose your preferred connection type'
    Text Verification                           xpath=//div[@id='porttojio']//div[@class='j-text j-text-body-s-bold'][normalize-space()='Choose your preferred connection type']    Choose your preferred connection type    
    
    #Verifying Prepaid and Postpaid radio button
    Wait For And Verify Element                 xpath=//div[@id='porttojio']//span[contains(@aria-label,'Radio')][normalize-space()='Prepaid']
    Wait For And Verify Element                 xpath=//div[@id='porttojio']//span[contains(@aria-label,'Radio')][normalize-space()='Postpaid']
    
    #Verifying Continue Button
    Wait For And Verify Element                 xpath=//button[contains(@class,'j-button j-button-size__medium primary continue-btn btn-disabled')]

    
    #Clicked on Continue - User is redirected to 'Delivery address' popup
    Wait For And Click Element                  xpath=//button[contains(@class,'j-button j-button-size__medium primary continue-btn btn-disabled')]
    Sleep    100ms
    
    #Cross icon - Verify the UI and content of 'Delivery address'
    Wait For And Verify Element                 xpath=//button[contains(@data-popup-close,'modal-getsim')]
    
    #Delivery address icon
    Wait For And Verify Element                 xpath=//div[contains(@class,'address-wrapper')]//span[contains(@class,'j-icon j-icon__bg')]
    
    #Heading
    Text Verification                           xpath=//div[contains(@class,'address-wrapper')]//h5[contains(@class,'j-contentBlock__title j-heading j-text-heading-xs')][normalize-space()='Delivery address']    Delivery address
    
    #Text below heading
    Text Verification                           xpath=//div[normalize-space()='Where do you want your new Jio SIM to be delivered?']    Where do you want your new Jio SIM to be delivered?
    
    #Address field
    Wait For And Verify Element                 xpath=//textarea[@id='itAutocomplete']
   
    #PIN code field
    Wait For And Verify Element                 xpath=//input[@id='pincode']
    
    #Verify 'Book Sim Delivery' button
    Wait For And Verify Element                 xpath=//div[@id='modal-getsim-container']//div[@class='j-modal-buttons']
    Sleep    100ms

    #Address Field
    ${Address1}=    Get Text                    xpath=//textarea[@id='itAutocomplete']
    Text Verification                           xpath=//textarea[@id='itAutocomplete']    ${Address1}
    ${Pin_code1}=    Get Text                   xpath=//input[@id='pincode']
    Text Verification                           xpath=//input[@id='pincode']    ${Pin_code1}
    Wait For And Input Text                     xpath=//input[@id='pincode']    400709
    Wait For And Input Text                     xpath=//input[@id='addrl1']    205
    Element Should Be Enabled                   xpath=//div[@id='modal-getsim-container']//div[@class='j-modal-buttons']

   #Error toast arises
    Wait For And Click Element                  xpath=(//div[@class='address-wrapper']//span[@class='input-icon input-icon-suffix clickable clear-btn'])[2]
    Wait For And Input Text                     xpath=//input[@id='pincode']    400788
    Text Verification                           xpath=//span[normalize-space()='Please enter valid pincode']    Please enter valid pincode
    Sleep    100ms
    
    


