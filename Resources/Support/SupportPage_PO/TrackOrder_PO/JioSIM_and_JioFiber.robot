*** Settings ***
Library                        Dialogs
Resource                       ../../../Common.robot
Variables                      ../../../../Tests/Support/TrackOrder_Variables.yaml
Resource                       ../../../Excel_activity.robot
Resource                       ../../../Local_Keywords.robot

*** Keywords ***
Functionality of 'Track order' Page Verification
    UI elements of Jio SIM and JioFiber page verification
    Input and Cross Button Functionality
    Entering Invalid Details and 'Enter valid order tracking details received' Error Verification 

UI elements of Jio SIM and JioFiber page verification
    # Testcase : 92625
    # Redirection to jiosim jiofiber page
    # Click on JioSIM and JioFiber
    Redirect and continue              xpath://a[@aria-label='Jio SIM and JioFiber']//div[@class='j-listBlock__block-text']    ${URLs}[0]    Sc_RedirectionTojioSim_and_jiofiber
    # Testcase : 95626
    #cube icon
    Wait For And Verify Element        xpath://span[@class='submitDetails_orderIcon__Nn14l j-icon']
    #image in right side
    Image Verification                 xpath://img[@alt='Track Order Status of Jio Sim or JioFiber']   
    #heading
    Text Verification                  xpath://h1[normalize-space()='Track order']                                          ${JioSim_JioFiber_heading}
    #subheading
    Text Verification                  xpath://h2[contains(text(),'Find the status of your Jio SIM and JioFiber order')]    ${JioSim_JioFiber_Subheading}
    #Enter tracking details placeholder
    Page Should Contain Element        xpath://label[normalize-space()='Enter order tracking details']                      ${Placeholder_order}
    #Text below field in numbered list
    Text Verification                  xpath://div[normalize-space()='You may enter any of the following details:']         ${Order_Details_Text}
    FOR    ${i}    IN RANGE    1  5
        Text Verification              ${numbered_text}\[text()='${i}']                                                     ${Trackingdetails_format}[${i-1}]
    END
    #Hyperlink verification
    Wait For And Verify Element        ${hyperlink_text}
    #proceed button
    Scroll To                          ${proceedButton}
    Element Should Be Disabled         ${proceedButton}
    #checking hyperlink functionality
    Hyperlink Popup
    Hyperlink Popup UI Elements
    Hyperlink cross button validation
    Input text field validation

Hyperlink Popup
    # Testcase : 92627
    #clicking on hyperlink
    Wait For And Click Element         ${hyperlink_text}
    Wait For And Verify Element        ${hyperlink_popup}    

Hyperlink Popup UI Elements
    # Testcase : 92628
    #checking UI elements of popup
    Text Verification                  xpath://h5[normalize-space()='How to find order tracking details?']     ${Hyperlink_popup_heading}
    Wait For And Verify Content        ${hyperlink_popup}                                                      ${Hyperlink_content}    
    #checking cross icon of the popup    
    Wait For And Verify Element        ${ErrorCrossIcon}

Hyperlink cross button validation
    # Testcase : 92629
    #clicking on cross icon
    Wait For And Click Element         ${ErrorCrossIcon}
    
Input text field validation
    # Testcase : 92630
    # Clicking on Input field
    Wait For And Click Element         ${orderTrackingDetails}
    Wait For And Input Text            ${orderTrackingDetails}           SACXDSC
    # Testcase : 92631
    #Proceed button becomes active
    Scroll To                          ${proceedButton}
    Wait Until Element Is Enabled      ${proceedButton}

Input and Cross Button Functionality
    Wait For And Verify Element        ${crossButton1}
    # Clicking on cross button
    Wait For And Click Element         ${crossButton1}
    # Verifying if the input field is empty
    ${emptyString} =    Get Text       ${orderTrackingDetails}
    Wait For And Verify Content        ${orderTrackingDetails}           ${emptyString}    

Entering Invalid Details and 'Enter valid order tracking details received' Error Verification
    # Testcase : 92633 
    # Entering invalid order details in the input field
    Wait For And Input Text            ${orderTrackingDetails}           QWERTY
    Scroll To           ${proceedButton}
    # Verifying if Proceed Button is enabled 
    Element Should Be Enabled          ${proceedButton}
    Wait For And Click Element         ${proceedButton}
    # Verifying if the user gets error toast
    Text Verification                  xpath://div[@class='j-text j-text-body-s-bold']    ${ErrorMessage[0]}    
    Enter details and Proceed
    # Testcase : 92634
    URL Validation                     ${URLs}[0]    
    Take Page Screenshot                    sc_RedirectionToNoOrderPage

UI of 'No Orders to Track' Page Verification
    # Testcase : 92635
    # No Orders to Track icon
    Wait For And Verify Element        xpath://span[@class='noOrders_orderIcon__2vNyO j-icon']//*[name()='svg'] 
    # Heading
    Wait For And Verify Content        xpath://h1[normalize-space()='No orders to track']                                   ${Headings[0]}
    # Sub Heading
    Text Verification                  xpath://h2[contains(text(),'There is no order pending for your number. Please ')]    ${SubHeadings[0]}
    Scroll To           ${GetJioSIMButton}
    # Image 
    Image Verification                 xpath://img[@alt='Track Order Status of Jio Sim or JioFiber']
    #Text under Check Another Order button
    Text Verification                  ${NoOrder}                                                                           ${NoOrderText}
    # Verifying if Get Jio SIM button is present 
    Wait For And Verify Element        ${GetJioSIMButton}    
    Text Verification                  ${GetJioSIMButton}                                                                   ${NoOrderPageButtons[0]}
    # Verifying if Get JioFiber button is present 
    Wait For And Verify Element        ${GetJioFiberButton}
    Text Verification                  ${GetJioFiberButton}                                                                 ${NoOrderPageButtons[1]}
    # Verifying if Check Another button is present     
    Wait For And Verify Element        ${checkAnotherOrderButton1}
    Text Verification                  ${checkAnotherOrderButton1}                                                          ${NoOrderPageButtons[2]}
    Redirection to 'Check Another Order' Page
    Redirection to 'Get Jio SIM' Page
    Redirection to 'Get Jio Fiber' Page 

Redirection to 'Check Another Order' Page     
    # Testcase : 92636   
    Redirect and continue              ${checkAnotherOrderButton1}    ${URLs}[0]            sc_RedirectionToCheckAnotherOrder   

Redirection to 'Get Jio SIM' Page
    # Testcase : 92637
    Wait For And Click Element         ${orderTrackingDetails}
    Enter details and Proceed
    #wait until is used as the page takes time to load
    Wait Until Keyword Succeeds    1 min    5 sec     Redirection On Clicking            ${GetJioSIMButton}             ${URLs}[1]            GetJioSIM

Redirection to 'Get Jio Fiber' Page
    # Testcase : 92638
    Wait For And Click Element         ${orderTrackingDetails}
    Enter details and Proceed
    Wait Until Element Is Visible      ${GetJioFiberButton} 
    Redirection On Clicking            ${GetJioFiberButton}           ${URLs}[2]            GetJioFiber    

#-------------- To be discussed with UAT team -------------------
UI and Functionality of OTP Page Verification
    # Testcase : 92639
    # Using Valid Jio Number and Redirection to OTP page
    Wait For And Click Element         ${orderTrackingDetails}
    Wait For And Input Text            ${orderTrackingDetails}        ${ValidJioNumber}
    Redirect and continue              ${proceedButton}               ${URLs}[3]             sc_RedirectionToOtpPage
    # Testcase : 92640
    # OTP received successfully pop up
    Wait For And Verify Element        xpath://div[@class="ErrorToast_notificationSuccessServiceStyle__1Vl2f j-notification j-notification__kind-service j-notification__duration-short"]    
    # Testcase : 92641    
    # Verify Identity icon
    Wait For And Verify Element        xpath://span[@class="j-icon j-icon__bg"]   
    # Heading
    Text Verification                  xpath://div[@class='j-text j-text-heading-xs']        ${Headings[1]}
    # Sub Heading
    ${OTP_SENT}=    Get Text           ${OTPSubHeading}
    Text Verification                  ${OTPSubHeading}                                      ${OTP_SENT}
    # 6 digit Input Field
    Wait For And Verify Element        xpath://div[@class='input-code__group']
    # Verifying if Resend Code button is present     
    Wait For And Verify Element        ${ResendButton}
    # Verifying if Verify button is present     
    Wait For And Verify Element        ${VerifyButton}
    # Image
    Image Verification                 xpath://img[@alt='Track Order Status of Jio Sim or JioFiber']
    # Testcase : 92642
    # Resending code/OTP
    Wait For And Click Element         ${ResendButton}
    Scroll To           ${VerifyButton}
    # Verifying if Verify button is disabled
    Element Should Be Disabled         ${VerifyButton}
    Wait For And Click Element         ${InputField_1}
    # Entering data into first 3 blanks of input field
    Wait For And Input Text            ${InputField_1}                                        123
    # Verifying if Verify button is disabled
    Element Should Be Disabled         ${VerifyButton}
    Wait For And Click Element         ${InputField_4}    
    # Entering data into last 3 blanks of input field
    Wait for And Input Text            ${InputField_4}                                        456
    # Testcase : 92643
    # Verifying if Verify button is enabled    
    Element Should Be Enabled          ${VerifyButton}
    Wait for And Click Element         ${VerifyButton}   
    # Testcase : 92644
    # Verifying if we receive error toast    
    Wait Until Element Is Visible      ${ErrorToast}
    Text Verification                  ${ErrorToast}                                          ${ErrorMessage[1]}   
    # Testcase : 92645
    # Entering valid OTP
    Wait for And Click Element         ${InputField_1}
    ${OTP} =                           GET Value From User                                    Enter OTP 
    Wait for And Input Text            ${InputField_1}                                        ${OTP}
    Redirect and continue              ${VerifyButton}            ${URLs}[4]            sc_RedirectionToMyOrders 

UI of My orders Page Verification
    # Testcase : 92646
    # Heading
    Text Verification                 xpath://h1[normalize-space()='My orders']                  ${Headings[2]} 
    # Sub Heading
    Text Verification                 xpath://h2[normalize-space()='Find your recent orders']    ${SubHeadings[1]}
    # Verifying Order Ticon
    ${Ordericon} =       Get WebElements     ${OrderTile}
    FOR    ${OrderIcon}    IN                @{OrderIcon}
        Wait For And Verify Element          ${OrderIcon}
    END  
    # Verifying if arrows are present in each tile
     ${arrow} =    Get WebElements     ${OrderTile}
    FOR    ${arrow}    IN              @{arrow}    
        Wait For And Verify Element    ${arrow}
    END
    # Verifying if Order title , status , Date and time is present
    ${TileContent} =    Get Text       ${OrderTile}        
    FOR    ${OrderContent}    IN       ${OrderTile}    
        Wait For And Verify Content    xpath://div[@class='j-card size--xl card-horizontal j-card__shadow']    ${TileContent}
    END
    # Verifying if Check Another Order button is present     
    Wait For And Verify Element        ${checkAnotherOrderButton2}
    # Image Verification
    Image Verification                 xpath://img[@src="https://jep-asset.akamaized.net/jiocom/static/images/track_order_delivery.png"]
    Redirection to Track Order Page of Jio SIM and JioFiber Orders
    Redirection to Product Order Page
    UI and Content of Product Order Verification  
    Redirection to My Orders Page
    Confirm if pop-up appears on clicking on Need help with your order? hyperlink
    Pop-up Verification
    Redirection to Relevant Page 
    Redirection to Cashback Offer Page 
    
Redirection to Track Order Page of Jio SIM and JioFiber Orders
    # Testcase : 92647
    # Clicking on Another Order button
    Wait For And Click Element         ${checkAnotherOrderButton2}
    # Fetching URL
    ${currentURL} =                    Get Location
    URL Validation                     ${currentURL}
    Take Page Screenshot               sc_RedirectionToTrackOrderPage
    Go Back

Redirection to Product Order Page 
    # Testcase : 92648
    # Clicking on any tile 
    Wait For And Click Element         xpath://div[@class='j-card size--xl card-horizontal j-card__shadow']
    # Fetching URL    
    ${currentURL} =                    Get Location
    URL Validation                     ${currentURL}
    Take Page Screenshot               sc_RedirectionToProductOrderPage

UI and Content of Product Order Verification  
    # Testcase : 92649
    #Verify product name, use excel
    ${OrderTitle} =    Get Text        ${ProductTitle}   
    Text Verification                  ${ProductTitle}    JioSIM     
    #Verify Order Id, use excel
    ${OrderID} =    Get Text           ${ProductID}
    Wait For And Verify Content        ${ProductID}    ${OrderID}
    #Verify date and time, use excel
    ${dateandTime} =    Get Text       ${ProductDate}    
    Wait For And Verify Content        ${ProductDate}    ${dateandTime}
    #Graphic depicting order journey
    ${Count} =    Get Count            xpath://section[@class="j-container"]    xpath://section[@class="j-container"]//span[@class="j-icon"]
    Log To Console    ${Count-1}
    #Verify order placed
    Wait For And Verify Content        xpath:(//div[@class="j-text j-text-body-m-bold"])[1]    Order placed
    #Verify delivery
    Wait For And Verify Content        xpath://section[@class="deliveryDetails_deliveryDetailsContainer__1oq_A j-container"]   Delivery Details
    #Delivery details icon
    Wait For And Click Element         xpath://div[@class="deliveryDetails_deliveryIcon__MXUpR"]
    #Delivery Address
    ${Deliverydetails} =    Get Text   ${DeliveryDetails}
    Text Verification                  ${DeliveryDetails}    ${Deliverydetails}
    #Verify Need help with your order Hyperlink
    Wait For And Verify Element        xpath://span[@class='orderstatus_textButton__1dJmq j-text j-text-body-s-link']
    #Verify More from Jio Section
    Section Verification               xpath://section[@class="orderstatus_moreFromJioContainer__3iCjw j-container"]    More from Jio
    #Verify More from Jio Title
    Wait For And Verify Content        xpath:(//div[@class="j-text j-text-heading-m"])[2]    More from Jio
    #Verify poster
    FOR  ${i}  IN RANGE    1     3  
        Wait For And Verify Element    xpath://div[@class="j-promo-card__content-body"][${i}]
        Image Verification             xpath://div[@class="j-promo-card__image ratio-wide"][${i}] 
        Wait For And Verify Element    xpath://button[@class="j-button j-button-size__large primary"]//div[@class="j-text j-text-body-s"][${i}]
    END
    #Verify Explore partner offer button
    Wait For And Verify Element        xpath://button[@class="orderstatus_partnerOffersBtn__2Lhvg j-button j-button-size__medium secondary"] 
    #Verify back button
    Wait For And Verify Element        ${BackButton}
    # Clicking on back button
    Wait For And Click Element         ${BackButton}
    
Redirection to My Orders Page
    # Testcase : 92650
    URL Validation                     ${URLs}[5]
    Take Page Screenshot               sc_RedirectionToMyOrdersPage

Confirm if pop-up appears on clicking on Need help with your order? hyperlink
    # Testcase : 92651
    # Clicking on Order Cancelled tile
    Wait For And Click Element         xpath://div[@class="j-card__flex"][1]
    # Clicking on Need help with your order? hyperlink
    Wait For And Click Element         ${NeedHelpLink}
    # Confirm if Pop up appears
    Wait For And Verify Element        xpath://div[@class="j-modal-container"]

Pop-up Verification
    # Testcase : 92652
    #Click on Need help on your Order
    Wait For And Verify Content        ${NeedHelpLink}    Need help on your order?
    Wait For And Click Element         ${NeedHelpLink}
    Take Page Screenshot    SC_Popup
    #Verify the heading on the pop up
    Wait For And Verify Content        xpath://div[@class="j-text j-text-heading-xs"]    Need help on your order?Contact us
    #Verify call button
    Wait For And Verify Element        ${CallButton}
    #Verify call button text 
    Wait For And Verify Content        ${CallButton}        Call
    #Verify Email button
    Wait For And Verify Element        ${EmailButton}
    #Verify Email button text
    Wait For And Verify Content        ${EmailButton}       Email
    #Verify Cross button
    Wait For And Verify Element        ${crossButton2}
    Wait For And Click Element         ${crossButton2}

Redirection to Relevant Page 
    # Testcase : 92653
    # Clicking on any tile
    Wait for And Click Element         ${crossButton2}
    Scroll To                          xpath://ul[@class="react-multi-carousel-track "]
    Redirection On Clicking            xpath:(//div[@class="j-text j-text-heading-s"])[1]    ${URLs}[6]    sc_RedirectionToRelevantPage   

Redirection to Cashback Offer Page 
    # Testcase : 92654    
    # Click on Explore partner offers button
    Redirect and continue              xpath://button[@aria-label='button Explore partner offers']    ${URLs}[7]    sc_RedirectionToCashbackOfferPage

# ---------- Common keywords for Track Order Section ----------
Enter details and Proceed    
    Wait For And Input Text            ${orderTrackingDetails}          ${MobileNumber}
    Wait For And Click Element         ${proceedButton} 