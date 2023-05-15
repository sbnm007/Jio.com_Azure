***Settings***
Library                                 SeleniumLibrary
Resource                                ../../Local_Keywords.robot

***Variables***
${Clear_Cross_Button}                                   xpath=//span[@class='input-icon input-icon-suffix clickable clear-btn']


***Keywords***
Quick Recharge Popup Validation
    Text Verification                                   xpath=//a[@id="quick-recharge"]//div[@class="j-text j-text-body-xs j-relative"]    Recharge
    CSS Verification 	                                xpath=//a[@id="quick-recharge"]//div[@class="j-text j-text-body-xs j-relative"]    font-weight	 500
    Open Popup                                          xpath=//a[@id='quick-recharge']
    Take Page Screenshot                                QuickReacharge_Pop-up
    ${title}=   Get Text                                xpath=//h5[contains(normalize-space(),'Quick')]
    Pop-Up Verification Home                            ${title}                
    Take Page Screenshot                                ${title}
   
    #mobile tab
    Quick Recharge Tab Validation
    
    #Fiber Tab
    Wait For And Click Element                          xpath=//a[@aria-controls="fiber"][@aria-selected="false"]
    Quick Recharge Tab Validation
    Wait For And Click Element                          xpath=//a[@aria-controls="mobile"][@aria-selected="false"] 
    Choose Plan Mobile Tab Validation
    Go To                                               ${URL}
    Open Popup                                          xpath=//a[@id="quick-recharge"]
    Choose Plan Fiber Tab Validation


Choose Plan Mobile Tab Validation
    Enter Number and Proceed                            ${Text_Locator}  ${COCP_OR_Postpaid_Number}   ${Continue_Button}
   
    #Clicking Edit Icon
    Wait For And Click Element                          xpath=//a[@class='edit_function sp--xxs pd--left']//span[@class='j-icon']
    Wait For And Click Element                          xpath=//button[contains(@class,'btn-disabled')]
    
    #Choose plan Text verification
    Text Verification                                   xpath=//h5[normalize-space()='Choose plan']    Choose plan
    
    #Plans For Mobile No
    Text Verification                                   xpath=//div[@class='j-contentBlock__description j-text-body-xs-bold']    Recharge plans for ${COCP_OR_Postpaid_Number} 
   
    #View all plans button
    Wait For And Verify Element                         xpath=//button[normalize-space()='View all plans'] 
    Wait For And Verify Element                         xpath=//div[contains(@class,'j-modal-visible')]//ul[@class="slick-dots"]
    ${inc}  Set Variable   0
    ${cnt}  Set Variable   1
    Take Page Screenshot                                ChoosePlan_Mobile
   
    #Content Verification
    WHILE  ${inc} < 3
        #Cross icon verification
        Wait For And Verify Element                     xpath=//button[contains(@data-popup-close,'modal-quickrecharge')]
        
        #Price Verification
        Text Verification                               xpath=//div[contains(@class,'slick-active') and @aria-describedby='slick-slide1${inc}']//h3[contains(@class,'j-text-heading-m')]     ${MPrice}[${inc}]
        
        #Description Verification                       
        Text Verification                               xpath=//div[contains(@class,'slick-active') and @aria-describedby='slick-slide1${inc}']//div[@class='j-contentBlock__description j-text j-text-body-s-bold']     ${Desc}[${inc}]
        
        #Validity Verification
        Text Verification                               xpath=//div[contains(@class,'slick-active') and @aria-describedby='slick-slide1${inc}']//div[contains(text(),'Days')]     ${Validaty}[${inc}]
        
        #Benefits Verification
        Text Verification                               xpath=//div[contains(@class,'slick-active') and @aria-describedby='slick-slide1${inc}']//div[contains(text(),'GB')]     ${MBenefits}[${inc}]
        
        #Contine with plan Button
        Text Verification                               xpath=//button[normalize-space()='Continue with ${MPrice}[${inc}]']         Continue with ${MPrice}[${inc}]
        
        #Carousel indicator Verification 
        Element Attribute Value Should Be               xpath=//div[contains(@class,' slick-dotted')]//li[${cnt}]       aria-hidden       false
        
        #slick-dots    slick-dotted
        ${inc}=   Evaluate     ${inc} + 1
        ${cnt}=   Evaluate     ${cnt} + 1
        
        #Changing cards
        IF  ${cnt} == 3     BREAK
        Sleep    500ms
        Wait For And Click Element                      xpath=//div[contains(@class,' slick-dotted')]//li[${cnt}]
    END 
   
    #View Plan Redirection
    Wait For And Click Element                          xpath=//button[normalize-space()='View all plans'] 
    Take Page Screenshot                                ViewPlan_Mobile 
    Go To                                               ${URL}
    Scroll To                                           //a[@id='quick-recharge']
    Open Popup                                          xpath=//a[@class="txt-align--center icon-circle-transition secondary"][1]
    Enter Number and Proceed                            ${Text_Locator}  ${COCP_OR_Postpaid_Number}   ${Continue_Button}
    Sleep    1s
   
    #Swiping right to left 
    Drag And Drop By Offset                             xpath=//div[contains(@class, 'slick-active') and @aria-describedby="slick-slide10"]//div[normalize-space()='Benefits']       -100  0
    Sleep      500ms
    ${attribute_value}=    Execute Javascript           return window.getComputedStyle(document.querySelector('#slick-slide11 > button'),':before').getPropertyValue('background-color');
    Should Be Equal As Strings              ${attribute_value}        rgb(15, 60, 201) 
    
   
    #Swiping left to right
    Drag And Drop By Offset                             xpath=//div[contains(@class, 'slick-active') and @aria-describedby="slick-slide11"]//div[normalize-space()='Benefits']       100  0
    Sleep      500ms
    ${attribute_value}=    Execute Javascript           return window.getComputedStyle(document.querySelector('#slick-slide10 > button'),':before').getPropertyValue('background-color');
    Should Be Equal As Strings              ${attribute_value}        rgb(15, 60, 201) 
   
    #Payment Page Redirection
    CSS Verification                                    xpath=//button[normalize-space()='Continue with ${MPrice}[0]']    background-color    rgba(15, 60, 201, 1)
    Wait For And Click Element                          xpath=//button[normalize-space()='Continue with ${MPrice}[0]']
    Take Page Screenshot                                Payment_Mobile
    

Choose Plan Fiber Tab Validation
    Wait For And Click Element                          xpath=//a[@aria-controls="fiber"][@aria-selected="false"]    
    Enter Number and Proceed                            ${Text_Locator}    ${Fiber_No}    ${Continue_Button}   

    #Clicking Edit Icon
    Wait For And Click Element                          xpath=//a[@class='edit_function sp--xxs pd--left']
    Wait For And Click Element                          xpath=//button[contains(@class,'btn-disabled')]
    Take Page Screenshot                                ChoosePlan_Fiber

    #Choose plan Text verification
    Text Verification                                   xpath=//h5[normalize-space()='Choose plan']    Choose plan
  
    #View all plans button
    Wait For And Verify Element                         xpath=//button[contains(@url,'serviceType=fiber')]
    Wait For And Verify Element                         xpath=//div[contains(@class,'j-modal-visible')]//ul[@class="slick-dots"]
    ${inc}  Set Variable   0
    ${cnt}  Set Variable   1
    WHILE  ${inc} < 3
        #Cross icon verification
        Wait For And Verify Element                     xpath=//button[contains(@data-popup-close,'modal-quickrecharge')]

        #Price Verification
        Text Verification                               xpath=//div[contains(@class,'slick-active') and @aria-describedby='slick-slide1${inc}']//h3[contains(@class,'j-text-heading-m')]     ${FPrice}[${inc}]
        
        #Description Verification
        Text Verification                               xpath=//div[contains(@class,'slick-active') and @aria-describedby='slick-slide1${inc}']//div[@class='j-contentBlock__description j-text j-text-body-s-bold']     Unlimited voice
        
        #Validity Verification
        Text Verification                               xpath=//div[contains(@class,'slick-active') and @aria-describedby='slick-slide1${inc}']//div[contains(text(),'Days')]     30 Days
        
        #Benefits Verification
        Text Verification                               xpath=//div[contains(@class,'slick-active') and @aria-describedby='slick-slide1${inc}']//div[contains(text(),'Mbps')]     Unlimited @${FBenefits}[${inc}] Mbps
        
        #Contine with plan Button
        Text Verification                               xpath=//button[normalize-space()='Continue with ${FPrice}[${inc}]']         Continue with ${FPrice}[${inc}]
        
        #Carousel indicator Verification
        Element Attribute Value Should Be               xpath=//div[contains(@class,' slick-dotted')]//li[${cnt}]       aria-hidden       false
        ${inc}=   Evaluate     ${inc} + 1
        ${cnt}=   Evaluate     ${cnt} + 1
        
        #Changing cards
        IF  ${cnt} == 4     BREAK
        Sleep    500ms
        Wait For And Click Element                      xpath=//div[contains(@class,' slick-dotted')]//li[${cnt}]
    END
    Wait For And Click Element                          xpath=//button[contains(@url,'serviceType=fiber')] 
    Take Page Screenshot                                ViewPlan_Fiber  
    Go To                                               ${URL}
    Wait For And Click Element                          xpath=//a[@class="txt-align--center icon-circle-transition secondary"][1]
    Wait For And Click Element                          xpath=//a[@aria-controls="fiber"][@aria-selected="false"]
    Enter Number and Proceed                            ${Text_Locator}    ${Fiber_No}    ${Continue_Button}      
    Wait Until Element Is Visible                       xpath=//h5[normalize-space()='Choose plan']
    FOR     ${Carousel_Banner1}    IN RANGE    0   2 
        Drag And Drop By Offset                         xpath=//div[contains(@class, 'slick-active') and @aria-describedby="slick-slide1${Carousel_Banner1}"]//div[normalize-space()='Benefits']       -100  0
        Sleep        500ms
        ${attribute_value} =                            Execute Javascript  return window.getComputedStyle(document.querySelector("#slick-slide1${Carousel_Banner1} > button"),':before').getPropertyValue('background-color');
        Should Be Equal As Strings                      ${attribute_value}        rgb(15, 60, 201)                                                    
    END
    Sleep   50ms
    ${Carousel_Banner2}  Set Variable   2
    WHILE   ${Carousel_Banner2} !=0
        Drag And Drop By Offset                        xpath=//div[contains(@class, 'slick-active') and @aria-describedby="slick-slide1${Carousel_Banner2}"]//div[normalize-space()='Benefits']       100  0
        Sleep        500ms
        ${attribute_value} =                           Execute Javascript  return window.getComputedStyle(document.querySelector("#slick-slide1${Carousel_Banner2} > button"),':before').getPropertyValue('background-color');
        Log To Console    ${attribute_value}
        Should Be Equal As Strings                     ${attribute_value}        rgb(15, 60, 201)
        Sleep   100ms
        ${Carousel_Banner2}     Evaluate    ${Carousel_Banner2} - 1
    END
    Wait For And Click Element                         xpath=//button[normalize-space()='Continue with ${FPrice}[0]']
    Take Page Screenshot                               Payment_Fiber
    Go To                                              ${URL}
    Wait For And Click Element                         xpath=//a[@id='quick-recharge']
   
    #Close Popup
    Close Popup                                        xpath=//button[@data-popup-close='modal-quickrecharge']
    
Quick Recharge Tab Validation
    #Check Cross Button is not visible
    Wait Until Element Is Not Visible                  ${Clear_Cross_Button}
   
    #Check Continue Button Enabled or not
    Check Continue Button Enabled                      xpath=//input[@id='quick-recharge-user-number']         xpath=//button[contains(@class,'btn-disabled')]        ${Incorrect_No1}
  
    #Invalid Number Verification
    Wait For And Click Element                         xpath=//button[contains(@class,'btn-disabled')]
    Text Verification                                  xpath=//div[@id='dyn-user-num-invalid']                  Please enter an active Jio number.  
    Cross Button Functionality                         ${Clear_Cross_Button}

