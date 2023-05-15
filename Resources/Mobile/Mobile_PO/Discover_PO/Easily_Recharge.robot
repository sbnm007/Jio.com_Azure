*** Settings ***
Library                             SeleniumLibrary
Resource                          ../../../Common.robot
Resource                          ../../../Local_keywords.robot

*** Keywords ***
Easily recharge or pay bills online Section Validation
    Recharge Popup Validation
    Reload Page
    PayBill Popup Validation
      
Recharge Popup Validation 
    #Banner Verification   
    Banner Content Verification                 xpath=//div[@class='j-card size--s j-card__shadow p-0 bg--primary-background']//h3      Easily recharge or pay bills online             xpath=//div[@class='order_lg-2']//img  xpath=//div[@class='j-card size--s j-card__shadow p-0 bg--primary-background']//button   Disc_Recharge
    
    #Opening recharge pop up
    Open Popup                                  xpath=//button[@id="quick-recharge"]  

    #Taking ScreenShot
    Take Page Screenshot                        Disc_Recharge_popup 

    #CSS Verification
    CSS Verification                            xpath=//h5[contains(normalize-space(),'Quick')]         font-weight    900
    
    #Pop-up Verification
    ${PopUp_Title}=   Take Element Text         xpath=//h5[contains(normalize-space(),'Quick')]
    # Sleep  100ms
    Pop-Up Verification                         ${PopUp_Title}
    
    #Mobile Tab
    Recharge Tab Validation
    
    #Fiber Tab
    Wait For And Click Element                  xpath=//a[@aria-controls="fiber"][@aria-selected="false"]
    Recharge Tab Validation
    
    #Plans Pop-up For Mobile
    Wait For And Click Element                  xpath=//a[@aria-controls="mobile"][@aria-selected="false"]        
    Confirm UI & Content of Choose plans pop-up for Mobile
    Go To                                       https://www.jio.com/mobile.html
    Open Popup                                  xpath=//button[@id="quick-recharge"]
    
    #Plans Pop-up For Fiber
    Confirm UI & Content of Choose plans pop-up for Fiber     
    Go To                                       https://www.jio.com/mobile.html
    Open Popup                                  xpath=//button[@id="quick-recharge"]
    Close Popup                                 xpath=//button[@class='j-button j-button-size__medium tertiary icon-primary icon-only']//i[@class='j-button-icon']//*[name()='svg']                 

Recharge Tab Validation
    #Check Cross Button is not visible
    Wait Until Element Is Not Visible           xpath=//div[contains(@class," input-has-label-left")]//span[contains(@class,"clear-btn")]
    
    #Check Continue Button Enabled or not
    Check Continue Button Enabled               xpath=//input[@id='quick-recharge-user-number']         xpath=//button[contains(@class,'btn-disabled')]        ${Incorrect_No1}
    
    #Invalid Number Verification
    Wait For And Click Element                  xpath=//button[contains(@class,'btn-disabled')]
    
    #Error toast verification
    Text Verification                           xpath=//div[@id='dyn-user-num-invalid']                  Please enter an active Jio number.  
    
    #Clear Button 
    Cross Button Functionality                  xpath=//div[contains(@class," input-has-label-left")]//span[contains(@class,"clear-btn")]

Confirm UI & Content of Choose plans pop-up for Mobile
    #Enter number and continue
    Enter Number and Proceed                    xpath=//input[@id='quick-recharge-user-number']      ${COCP_OR_Postpaid_Number}    xpath=//button[contains(@class,'btn-disabled')] 
    
    #Icon Verification
    Wait For And Verify Element                 xpath=//div[@class='choose-plan-wrapper']//span[@class='j-icon j-icon__bg']

    #Choose plan (Heading)
    Text Verification                           xpath=//h5[normalize-space()='Choose plan']        Choose plan

    #Recharge plans for... (Subheading)
    Text Verification                           xpath=//div[@class='j-contentBlock__description j-text-body-xs-bold']    Recharge plans for ${COCP_OR_Postpaid_Number}

    #Edit Icon 
    Wait For And Click Element                  xpath=//a[@class='edit_function sp--xxs pd--left']
    Sleep  100ms
    Wait For And Click Element                  xpath=//button[contains(@class,'btn-disabled')]
    Take Page Screenshot                        PlanChoose_Mobile 
    
    #Focusing on Plan cards (Required)
    Wait Until Keyword Succeeds                 10sec    3sec    Wait Until Element Is Visible           xpath=//div[@class="txt-align--left mobility"]//ul[@class="slick-dots"]
    Double Click Element                        xpath=//div[@class="txt-align--left mobility"]//ul[@class="slick-dots"]//li[1]
    
    #View all plans button
    Wait For And Verify Element                 xpath=//button[normalize-space()='View all plans']
    Sleep                                       100ms
    
    #Plan Cards
    ${cnt}  Set Variable   1
    FOR     ${i}    IN RANGE    0   2
        Wait For And Verify Element             xpath=//div[@data-popup="modal-quickrecharge"]//li[@class="slick-active"]
        Wait Until Keyword Succeeds             10sec    3sec    Double Click Element       xpath=//li[@id="slick-slide2${i}"]//button[@role='button']
        
        #Content Verification of Plan Cards
        Text Verification                       xpath=//div[contains(@class,'slick-active') and @aria-describedby='slick-slide2${i}']//h3[contains(@class,'j-text-heading-m')]                                        ${Plan_Amount}[${i}]
        Text Verification                       xpath=//div[contains(@class,'slick-active') and @aria-describedby='slick-slide2${i}']//div[@class='j-contentBlock__description j-text j-text-body-s-bold']            ${Plan_Description}[${i}]
        Text Verification                       xpath=//div[contains(@class,'slick-active') and @aria-describedby='slick-slide2${i}']//div[contains(text(),'Days')]                                                   ${Validity}[${i}]
        Text Verification                       xpath=//div[contains(@class,'slick-active') and @aria-describedby='slick-slide2${i}']//div[contains(text(),'GB')]                                                     ${Benefits}[${i}]
        Text Verification                       xpath=//button[normalize-space()='Continue with ${Plan_Amount}[${i}]']         Continue with ${Plan_Amount}[${i}]
        
        #Carousel indicator Verification 
        Element Attribute Verification          xpath=//div[contains(@class,' slick-dotted')]//li[${cnt}]       aria-hidden       false
        ${cnt}=   Evaluate     ${cnt} + 1
        
        #Changing cards
        IF  ${cnt} == 4     BREAK
        Log To Console                          ${Plan_Amount}[${i}] Plan UI Verified
        Sleep                                   100ms
    END
    
    #View Plan Redirection
    Wait For And Click Element                  xpath=//button[normalize-space()='View all plans'] 
    Take Page Screenshot                        ViewPlan_Mobile  
    Go To                                       https://www.jio.com/mobile.html
    Open Popup                                  xpath=//button[@id="quick-recharge"]
    Enter Number and Proceed                    xpath=//input[@id='quick-recharge-user-number']      ${COCP_OR_Postpaid_Number}    xpath=//button[contains(@class,'btn-disabled')]
    Sleep    200ms
    
    #Swiping right to left
    FOR     ${i}    IN RANGE    0   2
        ${attribute_value} =                    Execute Javascript     return window.getComputedStyle(document.querySelector("body > div.modal_overflow_slick.j-modal.j-modal-closable.j-modal-size-s.j-modal-kind-dialog.quick-recharge-wrapper.j-modal-visible > div > div > div.choose-plan-wrapper > div.txt-align--left.mobility > div > ul > li.slick-active > button"),':before').getPropertyValue('background-color'); 
        Log To Console                          ${attribute_value} 
        Should Be Equal As Strings              ${attribute_value}    rgb(15, 60, 201)
        Double Click Element                    xpath=//div[contains(@class, 'slick-active')]//div[normalize-space()='Benefits']
        Drag And Drop By Offset                 xpath=//div[contains(@class, 'slick-active') and @aria-describedby="slick-slide2${i}"]//div[normalize-space()='Benefits']       -100  0
        Sleep    500ms
    END
    
    #Swiping left to right
    ${i}  Set Variable   0
    WHILE   ${i} !=2
        Drag And Drop By Offset                 xpath=//div[contains(@class, 'slick-active') and @aria-describedby="slick-slide2${i}"]//div[normalize-space()='Benefits']       100  0
        ${i}   Evaluate    ${i} + 1
        Sleep    500ms
    END
    
    #Payment Page Redirection
    Wait For And Click Element                  xpath=//button[normalize-space()='Continue with ${Plan_Amount}[0]']
    Take Page Screenshot                        Payment_Mobile

Confirm UI & Content of Choose plans pop-up for Fiber
    Wait For And Click Element                  xpath=//a[@aria-controls="fiber"][@aria-selected="false"]
    Enter Number and Proceed                    xpath=//input[@id='quick-recharge-user-number']      ${Fiber_No}   xpath=//button[contains(@class,'btn-disabled')] 
    
    #Icon Verification
    Wait For And Verify Element                 xpath=//div[@class='choose-plan-wrapper']//span[@class='j-icon j-icon__bg']

    #Choose plan (Heading)
    Text Verification                           xpath=//h5[normalize-space()='Choose plan']        Choose plan

    #Recharge plans for... (Subheading)
    Text Verification                           xpath=//div[@class='j-contentBlock__description j-text-body-xs-bold']    Recharge plans for ${Fiber_No} 
    
    #Edit Icon
    Wait For And Click Element                  xpath=//a[@class='edit_function sp--xxs pd--left']
    Wait For And Click Element                  xpath=//button[contains(@class,'btn-disabled')]
    Take Page Screenshot                        ChoosePlan_Fiber
   
    #Focusing on Plan cards (Required)
    Wait Until Keyword Succeeds                 10sec    3sec    Wait Until Element Is Visible           xpath=//div[@class="txt-align--left fiber"]//ul[@class="slick-dots"]
    Double Click Element                        xpath=//div[@class="txt-align--left fiber"]//li
    
    #View all plans button
    Wait For And Verify Element                 xpath=//button[contains(@url,'serviceType=fiber')]
    Sleep                                       500ms
    
    #Plan Cards
    ${cnt}  Set Variable   1
    FOR     ${i}    IN RANGE    0   3
        Double Click Element                    xpath=//li[@id="slick-slide2${i}"]//button
        
        #Price Verification
        Text Verification                       xpath=//div[contains(@class,'slick-active') and @aria-describedby='slick-slide2${i}']//h3[contains(@class,'j-text-heading-m')]     ${FPrice}[${i}]
       
        #Description Verification
        Text Verification                       xpath=//div[contains(@class,'slick-active') and @aria-describedby='slick-slide2${i}']//div[@class='j-contentBlock__description j-text j-text-body-s-bold']     Unlimited voice
        
        #Validity Verification
        Text Verification                       xpath=//div[contains(@class,'slick-active') and @aria-describedby='slick-slide2${i}']//div[contains(text(),'Days')]     30 Days
        
        #Benefits Verification
        Text Verification                       xpath=//div[contains(@class,'slick-active') and @aria-describedby='slick-slide2${i}']//div[contains(text(),'Mbps')]     Unlimited @${FBenefits}[${i}] Mbps
        
        #Contine with plan Button
        Text Verification                       xpath=//button[normalize-space()='Continue with ${FPrice}[${i}]']         Continue with ${FPrice}[${i}]
        
        #Carousel indicator Verification
        Element Attribute Verification          xpath=//div[contains(@class,' slick-dotted')]//li[${cnt}]       aria-hidden       false
        ${cnt}=   Evaluate     ${cnt} + 1
        
        #Changing cards
        IF  ${cnt} == 4     BREAK
        Log To Console                          ${FPrice}[${i}] Plan UI Verified
        Sleep                                   100ms
    END
    
    #View Plan Redirection
    Wait For And Click Element                  xpath=//button[contains(@url,'serviceType=fiber')] 
    Take Page Screenshot                        ViewPlan_Fiber  
    Go To                                       https://www.jio.com/mobile.html
    Wait For And Click Element                  xpath=//button[@id="quick-recharge"]
    Wait For And Click Element                  xpath=//a[@aria-controls="fiber"][@aria-selected="false"]
    Enter Number and Proceed                    xpath=//input[@id='quick-recharge-user-number']      ${Fiber_No}   xpath=//button[contains(@class,'btn-disabled')] 
    Sleep   500ms
    
    #Swiping right to left
    FOR     ${i}    IN RANGE    0   2
        ${attribute_value}=                     Execute Javascript     return window.getComputedStyle(document.querySelector("body > div.modal_overflow_slick.j-modal.j-modal-closable.j-modal-size-s.j-modal-kind-dialog.quick-recharge-wrapper.j-modal-visible > div > div > div.choose-plan-wrapper > div.txt-align--left.fiber > div > ul > li.slick-active > button"),':before').getPropertyValue('background-color'); 
        Log To Console                          ${attribute_value} 
        Should Be Equal As Strings              ${attribute_value}    rgb(15, 60, 201)
        Drag And Drop By Offset                 xpath=//div[contains(@class, 'slick-active') and @aria-describedby="slick-slide2${i}"]//div[normalize-space()='Benefits']       -100  0
        Sleep    500ms
    END
    
    #Swiping left to right
    ${i}  Set Variable   2
    WHILE   ${i} !=0
        Drag And Drop By Offset                 xpath=//div[contains(@class, 'slick-active') and @aria-describedby="slick-slide2${i}"]//div[normalize-space()='Benefits']       100  0
        ${i}   Evaluate    ${i} - 1
        Sleep    500ms 
    END
    
    #Payment Page Redirection
    Wait For And Click Element                  xpath=//button[normalize-space()='Continue with ${FPrice}[0]']
    Take Page Screenshot                        Payment_Fiber   
    
      
PayBill Popup Validation
    #Recharge and paybill buttons on banner   
    Banner Content Verification                 xpath=//div[@class='j-card size--s j-card__shadow p-0 bg--primary-background']//h3  Easily recharge or pay bills online      xpath=//div[@class='order_lg-2']//img      xpath=//div[@class='j-card size--s j-card__shadow p-0 bg--primary-background']//button   Disc_Paybills
    
    #Opening paybill pop up
    Open Popup                                  xpath=//button[@id="paybill"]  
    Take Page Screenshot                        Disc_Paybill_Popup
    ${PopUp_title}=   Take Element Text         xpath=//h5[normalize-space()='Pay Bill']
    Sleep  100ms
    Pop-Up Verification                         ${PopUp_title}
    
    #Mobile Tab
    Paybill Tab Validation-Mobile               ${COCP_OR_Postpaid_Number}
    
    #Fiber Tab
    Wait For And Click Element                  xpath=//a[@aria-controls="fiber1"][@aria-selected="false"]
    Paybill Tab Validation-Fiber                ${Fiber_No}
    Sleep    100ms
    
    #Close Popup
    Close Popup                                 xpath=//button[@class='j-button j-button-size__medium tertiary icon-primary icon-only']//i[@class='j-button-icon']//*[name()='svg']
