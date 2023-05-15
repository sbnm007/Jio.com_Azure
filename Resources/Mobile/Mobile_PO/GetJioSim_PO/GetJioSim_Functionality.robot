*** Settings ***
Library                              SeleniumLibrary
Library                              RequestsLibrary
Resource                            ../../../../Resources/Local_keywords.robot


*** Keywords ***
Get JioSim Page Verification
    
    #UI & Content & Functionality Verification
    Get JioSim Page UI and Functionality Verification
    
    #Redirection To Verify Mob No Page
    Wait For And Input Text                 xpath=//div[contains(@class,'input-text')]//input  ${Name}
    Enter Number and Proceed                xpath=//div[contains(@class,'input-tel')]//input   ${COCP_OR_Postpaid_Number}  xpath=//button[@aria-label='button Generate OTP']
    
    #Verifying toast
    Wait For And Verify Element             xpath=//div[text()='OTP sent successfully']
    Text Verification                       xpath=//div[text()='OTP sent successfully']    OTP sent successfully
    Verify MobileNo Page UI and Functionality Verification

Get JioSim Page UI and Functionality Verification
    #Title
    Text Verification                       xpath=//h1[@class='j-text j-text-heading-xs']  Get a Jio SIM
    
    #Name Textfield
    Wait For And Verify Element             xpath=//div[contains(@class,'input-text')]//input
    
    #Mobile No Textfield
    Wait For And Verify Element             xpath=//div[contains(@class,'input-tel')]//input
    
    #Get SIM Button
    Wait For And Verify Element             xpath=//button[@aria-label='button Generate OTP']
    Element Should Be Disabled              xpath=//button[@aria-label='button Generate OTP']
    
    #Get SIM FAQs
    Wait For And Verify Element             xpath=//Section[@class='faqSection_faqContainer__UiWC1 j-container']
    
    #Checking Button is Enabled or not
    Check Buttons Enabled                   xpath=//div[contains(@class,'input-text')]//input  ${Name}  xpath=//div[contains(@class,'input-tel')]//input  ${Incorrect_No2}  xpath=//button[@aria-label='button Generate OTP']
    
    #Cross Icon Functionality
    ${CrossIcons}=     Get WebElements      xpath=//span[@class='input-icon input-icon-suffix clickable']
    Log To Console    ${CrossIcons}
    FOR  ${CrossIcon}  IN  @{CrossIcons}
        Cross Button Functionality         ${CrossIcon}
        
    END
    
    #Check Inactive button status
    Wait For And Input Text                 xpath=//div[contains(@class,'input-text')]//input  ${Name}
    Element Should Be Disabled              xpath=//button[@aria-label='button Generate OTP'] 

Verify MobileNo Page UI and Functionality Verification
    
    #Title
    Text Verification                       xpath=//div[@class='j-text j-text-heading-xs']      Verify your mobile number
    
    #OTP Field
    Wait For And Verify Element             xpath=//fieldset[@id='basic-input']  
    
    #Resend Link
    Wait For And Verify Element             xpath=//div[contains(text(),'Resend OTP')]
    
    #Verify Button
    Wait For And Verify Element             xpath=//button[@aria-label='button Verify']
    Element Should Be Disabled              xpath=//button[@aria-label='button Verify']
    
    #Get SIM Poster
    Background Image Verification           xpath://div[@class="SubContainer_App__3BhWw"]    background-image     url("https://jep-asset.akamaized.net/jiocom/static/images/SimLeadDesktop.png")

    #Entering Invalid OTP
    FOR  ${i}   IN RANGE  0  6
        Wait For And Input Text             xpath=//input[@id='basic-input-testInput-code-block-${i}']          ${i+1}  
    END 
    Take Page Screenshot                 GetJioSim_OTP
    Element Should Be Enabled               xpath=//button[@aria-label='button Verify']
    Wait For And Click Element              xpath=//button[@aria-label='button Verify']
    Sleep   150ms

    #Verifying incorrect OTP toast
    Wait For And Verify Element             xpath=//div[@class='j-text j-text-body-s-bold']
    Text Verification                       xpath=//div[@class='j-text j-text-body-s-bold']    That's not the OTP we sent. Please re-enter and try again
    Sleep   150ms

    #Verifying resent OTP tpast
    Wait For And Click Element          xpath=//div[contains(text(),'Resend OTP')]
    Wait For And Verify Element         xpath=//div[text()='OTP resent successfully']
    Text Verification                   xpath=//div[text()='OTP resent successfully']    OTP resent successfully
    Sleep   150ms
    Take Page Screenshot     GetJioSim_Resend_${i}
    
    #Verifying maximum attempts exceeded toast
    Wait For And Click Element          xpath=//div[contains(text(),'Resend OTP')]
    Wait Until Keyword Succeeds    15sec    0    Page Should Contain    You have exceeded the maximum attempts allowed to send OTP. Please try again after some time

    #Entering valid OTP
    ${OTP}    Get Value From User    Enter OTP
    Wait For And Input Text    xpath=//input[@id='basic-input-testInput-code-block-0']    ${OTP}
    Element Should Be Enabled               xpath=//button[@aria-label='button Verify']
    Wait For And Click Element              xpath=//button[@aria-label='button Verify']
    Sleep    150ms
    
    # UI and content verification 
    Verify the UI elements & content of 'Get a Jio connection' page

Verify the UI elements & content of 'Get a Jio connection' page
    #Title
    Text Verification                       xpath=//div[@class='txt-align--center j-text j-text-heading-xs']  Get a Jio connection
    
    # Verifying 'Get a new number' tab
    Wait For And Verify Element             xpath=//div[normalize-space()='Get a new number']

    # Verifying 'Port to Jio' tab
    Wait For And Verify Element             xpath=//div[@class='switcher-text j-text j-text-body-s'][normalize-space()='Port to Jio']

    # Verifying 'Prepaid' and 'Postpaid' radio buttons
    Wait For And Verify Element             xpath=//span[@aria-label='Prepaid']
    Wait For And Verify Element             xpath=//span[@aria-label='Postpaid']

    # Verifying 'Continue' button
    Wait For And Verify Element             xpath=//div[@aria-label='button Continue']
    Verify Switching Between Tabs


Verify Switching Between Tabs
    # Verify element is enabled
    Element Should Be Enabled               xpath=//div[normalize-space()='Get a new number']

    # Clicking 'Port to Jio' tab
    Wait For And Click Element              xpath=//div[@class='switcher-text j-text j-text-body-s'][normalize-space()='Port to Jio']
    Element Should Be Enabled               xpath=//div[@class='switcher-text j-text j-text-body-s'][normalize-space()='Port to Jio']

    # Verifying 'Prepaid' and 'Postpaid' buttons
    Wait For And Verify Element             xpath=//span[@aria-label='Prepaid']
    Wait For And Verify Element             xpath=//span[@aria-label='Postpaid']
    Sleep    150ms

    # Radio buttons
    Radio Button Should Be Set To    testInput    true  
    Sleep    150ms
    Select Radio Button    testInput    false 

    # Clicking button
    Wait For And Click Element              xpath=//div[contains(text(),'Continue')] 
    Sleep    150ms

    # Title
    Text Verification                       xpath=//div[@class='j-text j-text-heading-xs']    Delivery address

    # Address field
    Wait For And Verify Element             xpath=//textarea[@name='Address']

    # PIN code field
    Wait For And Verify Element             xpath=//input[@type='tel']

    # Flat number field
    Wait For And Verify Element             xpath=//div[@class='j-field input-text']//input[@type='text']

    # Checking button
    Wait For And Verify Element             xpath=//div[contains(text(),'Book SIM Delivery')] 

    # Verify text
    Text Verification                       xpath=//div[@class='j-text j-text-heading-l']        Not just a SIM, it's your digital lifeline

    # Address and PIN code field text
    ${Address}=         Get Text            xpath=//textarea[@name='Address']
    Text Verification                       xpath=//textarea[@name='Address']        ${Address}

    ${Pin_code_GetText}=        Get Text    xpath=//input[@type='tel']
    Text Verification                       xpath=//input[@type='tel']               ${Pin_code_GetText}

    # Verify button
    Element Should Be Visible               xpath=//div[contains(text(),'Book SIM Delivery')]

    Wait For And Input Text    xpath://div[@class='j-field input-text']//input[@type='text']        9/2
    Sleep    150ms
    Element Should Be Enabled               xpath=//div[contains(text(),'Book SIM Delivery')]
    Sleep    150ms

    # Clearing address field and manually entering address
    Clear Element Text                      xpath=//textarea[@name='Address']
    Wait For And Input Text                 xpath=//textarea[@name='Address']    aa
    Wait Until Keyword Succeeds    15 sec  0                Wait For And Click Element     xpath=(//div[@class='addressSuggest_suggestion__15t_- j-text j-text-body-s-bold'])[1]
    ${Address1}=        Get Text            xpath=//textarea[@name='Address']
    Text Verification                       xpath=//textarea[@name='Address']        ${Address1}

    ${Pin_code1}=        Get Text           xpath=//input[@type='tel']
    Text Verification                       xpath=//input[@type='tel']               ${Pin_code1}

    Scroll To                               xpath=//label[normalize-space()='Flat/House no., Floor, Company']
    Sleep    150ms

    # Verifying all 3 cross icons
    Wait For And Verify Element             xpath=//div[@class='addressTextArea j-field input-textarea input-has-suffix']//span[@class='j-icon']//*[name()='svg']
    Wait For And Verify Element             xpath=//div[@class='j-field input-tel input-has-suffix']//span[@class='j-icon']//*[name()='svg']
    Wait For And Verify Element             xpath=//div[@class='j-field input-text input-has-suffix']//span[@class='j-icon']//*[name()='svg']

    # Clicking all 3 cross icons
    Wait For And Click Element              xpath=//div[@class='addressTextArea j-field input-textarea input-has-suffix']//span[@class='j-icon']//*[name()='svg']
    Wait For And Click Element              xpath=//div[@class='j-field input-text input-has-suffix']//span[@class='j-icon']//*[name()='svg']
    Sleep    150ms

    # Verifying only numerical values can be entered in pincode field
    Wait For And Input Text                 xpath=//input[@type='tel']    aaaa
    Wait For And Input Text                 xpath=//input[@type='tel']    400075
    Clear Element Text                      xpath=//input[@type='tel']
    Wait For And Input Text                 xpath=//input[@type='tel']    400
    Sleep    150ms

Background Image Verification
    [Arguments]            ${locator}    ${attribute name}  ${attribute_value}
    Wait Until Element Is Visible               ${locator}
    ${css}=         Get WebElement    ${locator}
    ${prop_val}=    Call Method       ${css}    value_of_css_property    ${attribute name}
    ${src}=    Get Substring    ${prop_val}    5    -2
    Create Session      img     ${src}
    ${resp_google}=   GET On Session  img  ${src}     expected_status=200
