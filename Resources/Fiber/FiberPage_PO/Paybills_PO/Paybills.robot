*** Settings ***
Library    SeleniumLibrary
Resource    ../../../Common.robot
Resource    ../../../Local_Keywords.robot
Variables    ../../../Common_Variables.yaml

*** Keywords ***
Confirm UI of 'i',valid & invalid Prepaid JioFiber number or Amount Toast/popup validation
    Confirming the UI of Pay Bills Page
    Confirm UI of 'i' Popup of JioFiber tab
    Confirm user is getting toast on entering wrong/invalid and Prepaid JioFiber number or Amount
    
Confirm user is getting toast on entering Non-jio/COCP/Prepaid number in Mobile Tab
    #Switch to Mobile tab
    Redirection On Clicking                  xpath: //span[@class="j-selectors__item"][1]      ${Paybills_MobileTabURL}    Mobile_Tab_Sc
    Wait For And Click Element               xpath: //span[@class="j-selectors__item"][1] 
    #92247-92251
    FOR    ${i}    IN RANGE    0    3
        #Enter number in Mobile Number field
        Wait For And Input Text              xpath: //input[@id="submitNumber"]    ${Paybills_MobileNumbers}[${i}]
        #Enter number in Amount field
        Wait For And Input Text              xpath: //input[@id="amount"]    ${Amount}
        #Click on View Bill Summury
        Wait For And Click Element           xpath: //button[@aria-label="button View Bill Summary"]
        #Validate toast
        Toast Capture and Data Validation    COCPMobileTabTost_SC    ${ToastLocator}    ${MobileTabToast}[${i}]
        #Clear Mobile number field 
        Wait For And Click Element           xpath://span[@class="input-icon input-icon-suffix"]
        #clear amount field
        Wait For And Click Element           xpath://span[@class="input-icon input-icon-suffix clickable"]
    END

Confirming the UI of Pay Bills Page
    #92244
    Wait Until Keyword Succeeds    30 sec    0 sec    CSS Verification    xpath://li[@onclick="window.location.href='/selfcare/paybill/fiber/'"]    border-bottom-color    rgba(229, 247, 238, 1)
    Fiber tab is selected by default in Paybills
    #92246
    #Verifying the Pay Bill Bold Header with image
    Text Verification                        xpath:(//h1[normalize-space()='Pay Bill'])[1]     Pay Bill
    Element Attribute Value Should Be        xpath:(//h1[normalize-space()='Pay Bill'])[1]    style    --color-text:var(--color-black);  
    Image Verification                       xpath://img[@alt='Broadband Online Payment']
    
    #Veriyfying the Sub Heading
    Text Verification                        xpath://h2[contains(text(),'Enjoy the convenience of paying your postpaid bill')]    Enjoy the convenience of paying your postpaid bills online.
    
    #Verifying the Mobile and Fiber Tab
    ${Number_of_Tabs}=    Get Element Count    xpath://div[@class='j-selectors stretch']//span[@class='content']
    ${Tab_Name}=    Create List    Mobile    Fiber
    FOR  ${i}  IN RANGE    ${Number_of_Tabs}
        Wait For And Verify Content          xpath:(//div[@class='j-selectors stretch']//span[@class='content'])[${i}+1]    ${Tab_Name}[${i}]
    END
    
    #Verfiying the Postpaid JioFiber Field with 'i' button
    Wait For And Verify Element              xpath://input[@id='submitNumber']
    Wait For And Verify Element              xpath://span[@class='input-icon input-icon-suffix']

    #Verfiying the Amount Field 
    Wait For And Verify Element              xpath://input[@id='amount']

    #Verifying Note
    Wait For And Verify Content              xpath://div[contains(text(),'Note: This payment will be credited in your postpa')]    Note: This payment will be credited in your postpaid account and cannot be used for recharge or considered as your security deposit.

    #Verifying Disabled View Bill Summery
    Element Should Be Disabled               xpath://button[@aria-label='button View Bill Summary']  
    Element Should Be Disabled               xpath://button[@aria-label='button Continue']

    #Verifying Pay bills of inactive text
    Wait For And Verify Content              xpath://div[@class='pay-bill_pdcCont__1Z-uI j-text j-text-body-s-bold']    Pay bills of inactive accounts here

Confirm UI of 'i' Popup of JioFiber tab
    #92254
#Click on 'i' Besides Postpaid JioFiber Number Input
    Open Popup                               xpath://span[@class="input-icon input-icon-suffix"]
#Verify Postpaid JioFiber Number Heading is Present
    Wait For And Verify Content              xpath://h5[contains(text(),'Postpaid JioFiber Number')]  Postpaid JioFiber Number
#Verify Sub Text is Present 
    Wait For And Verify Content              xpath://div[contains(text(),'You may enter any of the following details:')]  You may enter any of the following details:
#For Loop To Verify Bullet Points
    FOR  ${i}  IN  @{i_popup}
        Wait For And Verify Content          xpath://li[contains(text(),'${i}')]    ${i}
    END
#Veify Cross Icon is Present
    Wait For And Verify Element              xpath://button[@class="j-button j-button-size__medium tertiary icon-primary icon-only"]
#Click Cross Icon to Close Pop up
    #92255
    Click on Cross button
    URL Validation    ${PayBillFiberTabURL}

Confirm user is getting toast on entering wrong/invalid and Prepaid JioFiber number or Amount
    #92256
    FOR    ${i}    IN RANGE    0    2
       #Input Prepaid Fiber Number
        Wait For And Input Text              xpath://input[@id='submitNumber']  ${PayBillFiberNos}[${i}]
    #Input Amount 
        Wait For And Input Text              xpath://input[@id='amount']  ${Amount}
    #Click on View Bill Summary Button
        Wait For And Click Element           xpath://button[@aria-label='button View Bill Summary']
    #Verify Error Toast is Present
        Wait For And Verify Element          xpath://div[@class="j-text j-text-body-s-bold"]
    #Verify Text of Error Toast
        Text Verification                    xpath://div[@class="j-text j-text-body-s-bold"]  ${PayBill_FiberToasts}[${i}]
    END

Confirm redirection,UI of Pay for inactive account page on clicking 'here'
    #92258-92261
    Fiber tab is selected by default in Paybills
#Click on 'Here' hyperlink
   Wait For And Click Element                xpath://button[contains(text(),'here')]
   URL Validation    ${InactiveAccFiberTabURL}
#Verify Pay for inactive account Header is Present
   Wait For And Verify Content               xpath://h1[contains(text(),'Pay for inactive account')]  Pay for inactive account

#Verify Subtext
   Wait For And Verify Content               xpath://h2[contains(text(),'No need to visit store. Settle the pending bills o')]  No need to visit store. Settle the pending bills of an inactive postpaid account right here.

#Verify Jio Number/Service ID Input is Present
   Wait For And Verify Element               xpath://div[@class="j-field input-tel"]

#Verify Jio Number/Service ID Placeholder is Present
   Wait For And Verify Content               xpath://label[contains(text(),'Jio Number/Service ID')]  Jio Number/Service ID

#Verify Account Number Input is Present
   Wait For And Verify Element               xpath://div[@class="j-field input-tel input-has-suffix"]

#Verify Account Number Placeholder is Present
   Wait For And Verify Content               xpath://label[contains(text(),'Account number')]  Account number

#Continue Button Should Be Disabled    
   Element Should Be Disabled                xpath://button[contains(text(),'Continue')]

#Verify 'Here' Hyperlink is Visible
   Wait For And Verify Element               xpath://div[@class="j-text j-text-body-s-link"]

#Verify 'i' icon is Present Besides Account Number
   Wait For And Verify Element               xpath://span[@class="input-icon input-icon-suffix clickable"]
#Click on 'i' inactive account bills        
    #NOTE: Not able to click using single click element. Hence 'Double Click Element' keyword is used
    Double Click Element                     xpath: //span[@class="input-icon input-icon-suffix clickable"]//span[@class="j-icon"]
    #Checks visibility of Pop-Up
    Wait For And Verify Element              xpath: //div[@class="j-modal-body"]
    #Confirm 'what is account number?' pop up message appears
    Text Verification                        xpath: //h5[@class="j-modal-heading j-heading j-text-heading-xs"]    What is account number?
    #Verify Subtext is Present
    Wait For And Verify Content              xpath://div[contains(text(),'Check your bill statement to view your account num')]  Check your bill statement to view your account number
    #Verify 'how to check account number?'' Image is present
    Wait For And Verify Element              xpath://img[@alt="how to check account number?"]
    Image Verification                       xpath://img[@alt="how to check account number?"]  
    Click on Cross button
    URL Validation    ${InactiveAccFiberTabURL}
    #Click on 'here' from 'Pay your postpaid bills here'
    Wait For And Click Element               xpath: //div[@class="j-text j-text-body-s-link"]
    URL Validation    ${PayBillFiberTabURL}

Click on Cross button
    Close Popup                              xpath: //header[@class="j-modal-header"]//button[@aria-label="button"]//i[@class="j-button-icon"]
Fiber tab is selected by default in Paybills
    #92245
    Wait Until Element Is Enabled            xpath: //input[@aria-label="Fiber"]
    #Verify background color of tab is Blue
    CSS Verification                         xpath: //span[@class="switcher"]    background-color     rgba(15, 60, 201, 1)
