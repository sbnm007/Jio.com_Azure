*** Settings ***
Library    SeleniumLibrary
Resource   ../../../Excel_Activity.robot
Resource   ../../../Common.robot

*** Keywords ***
#TC ID: 91871-91881
Easy recharge and Pay bills section Validation
    #Scrolling to Easy Recharge and Paybill banner
    Scroll To                                     xpath://div[@class="j-card size--s j-card__shadow p-0 bg--primary-background"]
    
    #Confirming visibility of Easy Recharge and Paybill banner
    Wait For And Verify Element                   xpath://div[@class="j-card size--s j-card__shadow p-0 bg--primary-background"]
    
    #Verifying Banner content
    Banner Content Verification                   xpath://h3[@class="j-contentBlock__title j-heading j-text-heading-l" and contains(text(),"Easily recharge or pay bills online")]    Easily recharge or pay bills online    //img[@alt='Easily recharge or pay bills online']    //div[@class='j-card size--s j-card__shadow p-0 bg--primary-background']//div[@class='j-button-group align-items-baseline flex-row card-button-group']    EasyRechargeandPaybill       

    #Clicking on Recharge button
    Wait For and Click Element                    xpath://button[@id='quick-recharge']
   
    UI Verification of Quick Recharge popup  
    UI Verification of Paybills popup   
    

UI Verification of Quick Recharge popup  
    #Confirming visibility of Quick Recharge pop up  
    Wait For And Verify Element                   xpath://div[@data-popup="modal-quickrecharge"]
    
    #Verifying cross button
    Wait For And Verify Element                   xpath://button[@data-popup-close='modal-quickrecharge']    
    
    #Verifying rupee icon
    Wait For And Verify Element                   xpath://div[@class='input-info-wrapper']//span[@class='j-icon j-icon__bg']  
    
    #Verifying heading
    Text Verification                             xpath://h5[normalize-space()='Quick Recharge']    ${Quick_Recharge}[0]       
    
    #Verifying text below heading
    Text Verification                             xpath://div[@class='j-contentBlock__description j-text-body-xs j-color-primary-grey-80']    ${Quick_Recharge}[1]              
    
    #Verifying switch bar between mobile and fiber tab
    Wait For And Verify Element                   xpath://ul[@data-mode='light']
    
    #Verifying Fiber is selected by default
    Css Verification                              xpath://a[normalize-space()='Fiber']                  background-color    rgba(15, 60, 201, 1)
    
    #Verifying Disabled Continue button
    Element Should Be Disabled                    xpath://button[@class="j-button j-button-size__medium primary continue-btn btn-disabled"]

    #Verifying presence of Fiber Input box
    Wait For And Verify Element                   xpath://*[@id="quick-recharge-user-number"]    
    
    #Verifying placeholders
    Text Verification                             xpath://label[normalize-space()='JioFiber Number']      JioFiber Number
    Input Text                                    xpath://*[@id="quick-recharge-user-number"]             9876543210 
    
    #Verifying if continue button is enabled
    Element Should Be Enabled                     xpath://button[normalize-space()='Continue']          
    Css Verification                              xpath://button[normalize-space()='Continue']          background-color    rgba(15, 60, 201, 1)
    
    #Clicking on clear button
    Wait For And Verify Element                   xpath://span[@class='input-icon input-icon-suffix clickable clear-btn']//img   
    Wait For And Click Element                    xpath://span[@class='input-icon input-icon-suffix clickable clear-btn']//img
    
    #Verifying after clearing the input box placeholder appears
    Text Verification                             xpath://label[normalize-space()='JioFiber Number']          JioFiber Number  
    
    # ibutton popup functionality
    #Verfying i button on number filed
    Wait For And Verify Element                   xpath://span[@data-popup-open='modal-info'] 
    
    #Clicking on i button
    Wait For And Click Element                    xpath://span[@data-popup-open='modal-info']
    
    #Verifying JioFiber Number pop up  
    Wait For And Verify Element                   xpath://div[@aria-label=' ']    
    
    #Clicking on back 
    Wait For And Click Element                    xpath://button[@aria-label="close"]//i[@class="j-button-icon icon-left"]   
    
    # Mobile tab
    #Clicking on Mobile tab
    Wait For And Click Element                    xpath://a[@aria-controls="mobile"]
    
    #Verifying Mobile number input field
    Wait For And Verify Element                   xpath://*[@id="quick-recharge-user-number"]  
    
    #Verifying placeholder
    Text Verification                             xpath://label[normalize-space()='Mobile Number']    Mobile Number
    
    #Verifying presence of Continue button
    Wait For And Verify Element                   xpath://button[@class="j-button j-button-size__medium primary continue-btn btn-disabled"]
    
    #Clicking on cross button of Quick recharge popup
    Wait For And Click Element                    xpath://button[@data-popup-close="modal-quickrecharge"]
    Wait Until Element Is Not Visible             xpath://div[@data-popup="modal-quickrecharge"]

UI Verification of Paybills popup 
    #Clicking on Pay Bills button  
    Wait For And Click Element                    xpath://*[@id="paybill"]
    
    #Verifying Pay Bills pop up
    Wait For And Verify Element                   xpath://div[@data-popup="modal-paybill"] 
    
    #Verifying cross button
    Wait For And Verify Element                   xpath://button[@data-popup-close="modal-paybill"]    
    
    #Verfying rupee icon
    Wait For And Verify Element                   xpath:(//span[@class='j-icon j-icon__bg'])[3]    
    
    #Verifying position of rupee icon
    Css Verification                              xpath:(//span[@class='j-icon j-icon__bg'])[3]    justify-content    center
    
    #Verifying Heading
    Text Verification                             xpath://h5[@class="j-contentBlock__title j-heading j-text-heading-xs" and contains(text( ),"Pay bill")]    Pay bill
    
    #Verifying if Heading is bold
    Css Verification                              xpath://h5[@class="j-contentBlock__title j-heading j-text-heading-xs" and contains(text( ),"Pay bill")]    font-weight    900
    
    #Verifying text below Heading
    Text Verification                             xpath://div[@class="j-contentBlock__description j-text j-text-body-xs" and contains(text( ),"Paying bills")]    Paying bills was never this easy
    
    #Verifying switch bar between mobile and fiber
    Wait For And Verify Element                   xpath://ul[@class='tab-list bg--primary-grey-20 d-inline-flex']
    
    #Verifying ruppee symbol in amount field
    Wait For And Verify Element                   xpath://span[@class='input-icon input-icon-prefix clickable']
    
    #Verifying fiber tab is selected by default
    Css Verification                              xpath://a[@aria-controls="fiber1"]    background-color    rgba(15, 60, 201, 1) 
    
    #Clicking on mobile tab
    Wait For And Click Element                    xpath://a[@aria-controls="mobile1"]         
    
    #Verifying placeholders
    Text Verification                             xpath://label[normalize-space()='Postpaid Mobile Number']    Postpaid Mobile Number
    Text Verification                             xpath://label[normalize-space()='Amount']    Amount
    
    #Clicking on Fiber tab
    Wait For And Click Element                    xpath://a[@aria-controls="fiber1"]
    
    #Verifying placeholder
    Text Verification                             xpath://label[normalize-space()='Postpaid JioFiber Number']    Postpaid JioFiber Number
    
    #Verifying i button 
    Wait For And Verify Element                   xpath://span[@data-popup-open='modal-pb-info']    
    
    #Verifying placeholder
    Text Verification                             xpath://label[normalize-space()='Amount']    Amount 
    
    # Verifying Notes section     
    Text Verification                             xpath://div[@class='j-text j-text-body-xxs j-color-primary-grey-80']    ${notes} 

    #Scrolling to Continue button  
    Scroll To                                     xpath://button[@onclick="payBillContinueWithAmt(this)"]     
    
    #Verifying View bill summary button
    Wait For And Verify Element                   xpath://button[normalize-space()='View bill summary']
    
    #Verifying Continue button
    Wait For And Verify Element                   xpath://button[@onclick="payBillContinueWithAmt(this)"]
    