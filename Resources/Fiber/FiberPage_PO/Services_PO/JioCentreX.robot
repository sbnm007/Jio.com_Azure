*** Settings ***
Library    SeleniumLibrary
Library    Dialogs
Resource    ../../../Common.robot
Resource    ../Services_PO/RedirectionToSevices.robot
Resource    ../../../Excel_Activity.robot
Resource    ../../../Local_Keywords.robot
Variables    ../../../Common_Variables.yaml
Variables    ../../../../Tests/Fiber/FServices_Variables.yaml


*** Keywords ***
JioCentrex Page
    Go To JioCentreX
    Banner section of JioCentrex page
    JioCentrex section
    Distinguished features of JioCentrex section
    Check plans for Society Section
    What you need to do Section
    Watch more about JioCentrex Section
    FAQ Section
    Cross Icon Verification
    Submit Button Validation
    Verify Phone Number Page Verification
    Delivery Address Page Verification


Go To JioCentreX
    #Scroll Down to Extraordinary experiences
    Scroll To                                  xpath://h3[text()="Extraordinary experiences"]

    #Click Learn More Button of JioCentreX    
    Wait For and Click Element                 xpath://div[@aria-label='JioCentrex']//button[@aria-label='Learn more']

    #Check redirection to Jiocentrex page
    URL Validation                             https://www.jio.com/jiofiber-services-jiocentrex

Banner section of JioCentrex page
    Verify Presence of Banner

    #Click on Banner
    Wait For And Click Element                 xpath://div[@class="j-card__flex j-flex-column-reverse"]

    #Verify Get JioCentreX Pop Up Opens
    Wait For And Verify Element                xpath://h5[contains(text(),'Get JioCentrex')]

    #Close Get JioCentreX Pop Up
    Close Popup                                xpath://button[@id='centrex-popup-close-id']

JioCentrex section    
    Verify UI and content of JioCentrex section
    Verify UI of Get It Now button functionality

Distinguished features of JioCentrex section
    Verify Presence of "Distinguished features of JioCentrex" section
    Scroll To                                xpath://div[contains(@style,"--grid-template:repeat(5, 1fr)")]
    Verify Tiles are present under Distinguished features    5
    Verify Get Now button functionality


Check plans for Society Section
    Verify Presence of "Check plans for Society" section
    Scroll To                                xpath://div[contains(@class,"grid-j-card")]
    Verify Book Now and View Details Button Functionality
    Verify Slider Functionality
    Verify Terms & Conditions Hyperlink
 

What you need to do Section
    Verify Presence of "What you need to do" section
    Verify Get JioFiber redirection


Watch more about JioCentrex Section
    Verify Presence of Watch more about JioCentrex section
    Scroll To                                xpath://div[contains(@style,"--grid-template:repeat(2, 1fr); --grid-template-tablet:1fr;")]
    Verify Functionality of JioCentrex Video card        
    Verify Get JioCentrex and Contact center Button functionality


FAQ Section
    #FAQ Section Verification
    Section Verification                       xpath:(//section[@class='j-container l-layout--max-width'])[2]  FAQ 

Cross Icon Verification
    Wait For And Click Element                 xpath: //button[normalize-space()='Get JioCentrex']
    #Click on Name Input
    Wait For And Click Element                 xpath://input[@id='user-name-centrex']

    #Input Name
    Wait For And Input Text                    xpath://input[@id='user-name-centrex']  ${Name}

    #Verify Cross Icon is Visible Besides Name Input
    Wait For And Verify Element                xpath:(//span[@class="input-icon input-icon-suffix clickable clear-btn"])[1]

    #Click on Cross Icon
    Wait For And Click Element                 xpath:(//span[@class="input-icon input-icon-suffix clickable clear-btn"])[1]

    #Check Name Disappears after Clicking Cross Icon
    Wait Until Page Does Not Contain Element   xpath://input[@value='${Name}']

    #Input Number
    Wait For And Input Text                    xpath://input[@id='user-number-centrex']  ${Incorrect_No1}

    #Verify Cross Icon is Visible Besides Number Input
    Wait For And Verify Element                xpath:(//span[@class="input-icon input-icon-suffix clickable clear-btn"])[2]

    #Click on Cross Icon
    Wait For And Click Element                 xpath:(//span[@class="input-icon input-icon-suffix clickable clear-btn"])[2]

    #Check Number Disappears after Clicking Cross Icon
    Wait Until Page Does Not Contain Element   xpath://input[@value='${Incorrect_No1}']

    #Submit Button Should be Disabled when both Inputs are Empty
    Element Should Be Disabled                 xpath://button[@id='generateOTP-btn-centrex']


Submit Button Validation

    #Check Submit Button is Enabled When Both Inputs are Filled
    Element Should Be Disabled                  xpath://button[@id='generateOTP-btn-centrex']

    #Click on Name Input
    Wait For And Click Element                 xpath://input[@id='user-name-centrex']

    #Input Name
    Wait For And Input Text                    xpath://input[@id='user-name-centrex']  ${Name}

    #Check Submit Button is Disabled When only Name input is Filled
    Element Should Be Disabled                 xpath://button[@id='generateOTP-btn-centrex']

    #Input Number
    Wait For And Input Text                    xpath://input[@id='user-number-centrex']  ${Incorrect_No1}

    #Check Submit Button is Enabled When Both Inputs are Filled
    Element Should Be Enabled                  xpath://button[@id='generateOTP-btn-centrex']

    #Click on Cross Icon
    Wait For And Click Element                 xpath:(//span[@class="input-icon input-icon-suffix clickable clear-btn"])[2]

    #Input Valid Number
    Wait For And Input Text                    xpath://input[@id='user-number-centrex']  ${COCP_OR_Postpaid_Number}

    #Click Submit Button
    Wait For And Click Element                 xpath://button[@id='generateOTP-btn-centrex']

    #Verify Phone Number Pop Up Opens
    Wait For And Verify Element                xpath://h5[contains(text(),'Verify phone number')]


Verify Phone Number Page Verification
    #Verify Phone Number Pop Up Opens
    Wait For And Verify Element                xpath://h5[contains(text(),'Verify phone number')]

    #Verify OTP sent successfully Toast is Visible
    Wait For And Verify Element                xpath://div[contains(text(),'OTP sent successfully')]
    Text Verification                          xpath://div[contains(text(),'OTP sent successfully')]  OTP sent successfully

    #Verify OTP Input is Visible
    Wait For And Verify Element                xpath://fieldset[@id='otpcontainer-id']

    #Verify Resend Code Button is Present
    Wait For And Verify Element                xpath://span[contains(text(),'Resend code')]

    #Verify Button Should Be Disabled
    Element Should Be Disabled                 xpath://button[@id='validateOTP-btn-centrex']

    #Click Resend Code Button
    Wait For And Click Element                 xpath://span[contains(text(),'Resend code')]

    #Verify OTP sent successfully Toast is Visible
    Wait For And Verify Element                xpath://div[contains(text(),'OTP sent successfully')]
    Text Verification                          xpath://div[contains(text(),'OTP sent successfully')]  OTP sent successfully

    #Input Invalid OTP
    Wait For And Input Text                    xpath://input[@id='otpnumberinputcentrex-1']  000000

    #Click Verify Button
    Wait For And Click Element                 xpath://button[@id='validateOTP-btn-centrex']

    #Please enter valid OTP Error should be Visible
    Wait For And Verify Element                xpath://span[contains(text(),'Please enter valid OTP')]
    Text Verification                          xpath://span[contains(text(),'Please enter valid OTP')]  Please enter valid OTP

    #Get Valid OTP from User
    ${val_otp}=  Get Value From User           Enter Valid OTP

    #FOR Loop to Backspace Invalid OTP
    FOR    ${i}    IN RANGE    1    7
         Press Keys                            xpath://input[@id='otpnumberinputcentrex-${i}']  BACKSPACE
    END

    #Input Valid OTP
    Wait For And Input Text                    xpath://input[@id='otpnumberinputcentrex-1']  ${val_otp}

    #Click Verify Button
    Wait For And Click Element                 xpath://button[@id='validateOTP-btn-centrex']

    #Delivery Address Pop Up Opens
    Wait For And Verify Element                xpath://div[@id="location-wrapper-id"]//h5[@class="j-contentBlock__title j-heading j-text-heading-xs"]
    Text Verification                          xpath://div[@id="location-wrapper-id"]//h5[@class="j-contentBlock__title j-heading j-text-heading-xs"]  Delivery address

Delivery Address Page Verification
    #Delivery Address Pop Up Opens
    Text Verification                          xpath=//div[@id="location-wrapper-id"]//h5[@class="j-contentBlock__title j-heading j-text-heading-xs"]    Delivery address
    
    #Delivery Address Text Verification
    Text Verification                          xpath://div[contains(text(),'Where do you want your new JioCentrex connection?')]  Where do you want your new JioCentrex connection?

    #Verify Pincode Input
    Wait For And Verify Element                xpath://input[@id='pincode-centrex']

    #Verify Address Input
    Wait For And Verify Element                xpath://textarea[@id='buildingName']

    #Verify Flat No Input
    Wait For And Verify Element                xpath://input[@id='flatNo']

    #Verify Radio Button text
    Wait For And Verify Element                xpath://div[contains(text(),'I am submitting this information as a:')]
    Text Verification                          xpath://div[contains(text(),'I am submitting this information as a:')]  I am submitting this information as a:

    #Verify Resident Radio Button is Present
    Page Should Contain Radio Button           xpath://input[@value="Resident"]

    #Verify Society committee member Radio Button is Present
    Page Should Contain Radio Button           xpath://input[@value="Society committee member"]

    #Verify Email ID Input
    Wait For And Verify Element                xpath://*[@id="user-emailid"]

    #Continue Button Should Be Disabled
    Element Should Be Disabled                 xpath://button[@id='submitDetails']

    #Check Pincode and Address are Auto fetched 
    Should Not Be Empty                        xpath://input[@id='pincode-centrex']  
    Should Not Be Empty                        xpath://textarea[@id='buildingName']

    #Continue Button Should Be Disabled
    Element Should Be Disabled                 xpath://button[@id='submitDetails']

    #Input Flat No
    Wait For And Input Text                    xpath://input[@id='flatNo']  123

    #Continue Button Should Be Disabled
    Element Should Be Disabled                 xpath://button[@id='submitDetails']

    #Select Society committee member Radio Button
    Wait For And Click Element                 xpath://span[contains(text(),'Society committee member')]

    #Continue Button Should Be Disabled
    Element Should Be Disabled                 xpath://button[@id='submitDetails']

    #Input Invalid Email ID
    Wait For And Input Text                    xpath://*[@id="user-emailid"]  abc

    #Continue Button Should Be Disabled   
    Element Should Be Disabled                 xpath://button[@id='submitDetails']

    #Input Invalid Email ID   
    Wait For And Input Text                    xpath://*[@id="user-emailid"]  abc@

    #Continue Button Should Be Disabled 
    Element Should Be Disabled                 xpath://button[@id='submitDetails']

    #Input Invalid Email ID
    Wait For And Input Text                    xpath://*[@id="user-emailid"]  abc@gmail

    #Continue Button Should Be Disabled    
    Element Should Be Disabled                 xpath://button[@id='submitDetails']

    #Input valid Email ID
    Wait For And Input Text                    xpath://*[@id="user-emailid"]  abc@gmail.com

    #Continue Button Should Be Enabled     
    Element Should Be Enabled                  xpath://button[@id='submitDetails']

    #Input Invalid OTP 
    Wait For And Input Text                    xpath://input[@id='pincode-centrex']  000000

    #No results found should be visible and Pincode should disappear
    Wait For And Verify Element                xpath://li[@data-value="No results found"]
    Text Verification                          xpath://li[@data-value="No results found"]  No results found
    Wait For And Click Element                 xpath://li[@data-value="No results found"]
    #Wait Until Page Does Not Contain Element  xpath://input[@value='${PIN_Code}']



Verify UI and content of JioCentrex section

    # Verifying if section is visible
    Section Verification                       xpath://section[@class="j-container l-layout--max-width-narrow "]  JioCentrex

    # Verifying Title of the section
    Text Verification                          xpath://div[contains(@class,'l-layout--centered sm-layout--left')]   JioCentrex

    # Verifying if subtext is visible
    Text Verification                          xpath://h3[contains(text(),'Building a digitally connected community')]    Building a digitally connected community
    Text Verification                          xpath://p[contains(text(),'JioCentrex is an easy-to-use, zero-cost, and maint')]    JioCentrex is an easy-to-use, zero-cost, and maintenance-free intercom solution for your society and residents.
    
    # Verifying if Get It Now button is Visible
    Button Verification                        xpath://button[contains(text(),'Get It Now')]

Verify UI of Get It Now button functionality
    #Click Get It Now Buttn
    Wait For And Click Element                 xpath://button[contains(text(),'Get It Now')]

    #Verify Get JioCentreX Pop Up
    Wait For And Verify Element                xpath://h5[contains(text(),'Get JioCentrex')]
    
    #Verify Cross Button Of JioCentreX Pop Up
    Wait For And Verify Element                xpath://button[@id='centrex-popup-close-id']

    #Jio Logo Verification Of JioCentreX Pop Up
    Logo Verification                          xpath://div[@id="generate-number-wrapper-id"]//span[@class="j-icon j-icon__bg"]

    #Verify Text Of JioCentreX Pop Up
    Wait For And Verify Element                xpath://div[contains(text(),'We need your name and phone number.')]
    Text Verification                          xpath://div[contains(text(),'We need your name and phone number.')]  We need your name and phone number.

    #Verify Name Input Of JioCentreX Pop Up
    Wait For And Verify Element                xpath://input[@id='user-name-centrex']

    #Verify Number Input Of JioCentreX Pop Up
    Wait For And Verify Element                xpath://input[@id='user-number-centrex']

    #Verify Submit Button is Disabled
    Element Should Be Disabled                 xpath://button[@id='generateOTP-btn-centrex']

    #Close Get JioCentreX Pop Up
    Close Popup                                xpath://button[@id='centrex-popup-close-id']

Verify Presence of "Distinguished features of JioCentrex" section

   # Verifying if section is Visible
    Section Verification                       xpath://div[contains(@style,"--grid-template:repeat(5, 1fr)")]    Distinguished Features JioCentrex Cards
    Section Verification                       xpath://div[@class="main_container full_width jds-container btn-revamp "]//section[@id="whyTrigger"]  Distinguished Features Jiocentrex Infographic 

    # Verifying title of the section
    Wait For And Verify Element                xpath://h2[contains(text(),'Distinguished features of JioCentrex')]
    Text Verification                          xpath://h2[contains(text(),'Distinguished features of JioCentrex')]  Distinguished features of JioCentrex

    #Get Now Button Verification
    Button Verification                        xpath://button[contains(text(),'Get Now')]

Verify Get Now button functionality
    #Click Get Now Button
    Wait For And Click Element                 xpath://button[contains(text(),'Get Now')]

    #Verify Get JioCentreX Pop Up Opens
    Wait For And Verify Element                xpath://h5[contains(text(),'Get JioCentrex')]

    #Close Get JioCentreX Pop Up
    Close Popup                                xpath://button[@id='centrex-popup-close-id']

Verify Presence of "Check plans for Society" section
    #Check plans for Society Section Verification
    Section Verification                       xpath://div[contains(@class,"grid-j-card")]  Plans Section

    #Check plans for Society Text Verification
    Text Verification                          xpath://h2[contains(text(),'Check plans for Society')]  Check plans for Society

    #Check Plans Personal Details Section Verification
    Section Verification                       xpath://div[contains(@style,"--grid-template:1fr 1fr")]  Plans Personal Details

Verify Book Now and View Details Button Functionality
    #For Loop to Verify Book Now Buttons of All Plans under Check plans for Society Section
    FOR  ${i}  IN RANGE  1  3
        Button Verification                    xpath:(//button[contains(text(),'Book Now')])[${i}]
        Wait For And Click Element             xpath:(//button[contains(text(),'Book Now')])[${i}]
        Wait For And Verify Element            xpath://h5[contains(text(),'Get JioCentrex')]
        Close Popup                            xpath://button[@id='centrex-popup-close-id']
        Button Verification                    xpath:(//button[contains(text(),'View details')])[${i}]
    END

    #Verify View Details Buttons of All Plans under Check plans for Society Section
    View Details Popup Verification 2          xpath://button[contains(@onclick,'View More-1500')]  xpath:(//div[@class="j-card bg--primary-20 size--s card-vertical w-100"])[1]  Fiber_Services  22  1  xpath:(//button[@data-popup-close="plan-detail-modal"])[1]
    View Details Popup Verification 2          xpath://button[contains(@onclick,'View More-1200')]  xpath:(//div[@class="j-card bg--primary-20 size--s card-vertical w-100"])[2]  Fiber_Services  23  1  xpath:(//button[@data-popup-close="plan-detail-modal"])[1]


Verify Slider Functionality
    #Verify Slider 1 is Present
    Wait For And Verify Element                xpath://input[@id='totalnumber33']

    #For Loop to Verify Slider 1 and Generated Amount
    FOR  ${i}  ${j}  IN  &{Slider1}
        Wait For And Input Text                xpath://input[@id='totalnumber3']  ${i}
        Wait For And Verify Element            xpath://span[contains(text(),'${j}')]
    END

    #Verify Slider 2 is Present
    Wait For And Verify Element                xpath://input[@id='totalnumber44']

    #For Loop to Verify Slider 2 and Generated Amount
    FOR  ${i}  ${j}  IN  &{Slider2}
        Wait For And Input Text                xpath://input[@id='totalnumber4']  ${i}
        Wait For And Verify Element            xpath://span[contains(text(),'${j}')]
    END

Verify Terms & Conditions Hyperlink
    #Click Terms & Conditions under Slider
    Wait For And Verify Element                xpath://span[contains(text(),'Terms & Conditions')]    
    Wait For And Click Element                 xpath://span[contains(text(),'Terms & Conditions')]

    #Verify Terms & Conditions Pop Up Opens
    Wait For And Verify Element                xpath://h5[contains(text(),'Terms and Conditions')]

    #Close Terms & Conditions Pop Up
    Wait For And Click Element                 xpath://button[contains(text(),'Close')]

Verify Presence of "What you need to do" section
    #What you need to do Text Verification                             
    Wait For And Verify Element                xpath://h3[contains(text(),'What you need to do:')]
    Text Verification                          xpath://h3[contains(text(),'What you need to do:')]   What you need to do:

    #What you need to do-Infographic Section Verification
    Section Verification                       xpath:(//section[@id="whyTrigger"])[2]  "What you need to do-Infographic section"

    #Get JioFiber Button Verification
    Button Verification                        xpath://button[contains(text(),'Get JioFiber')]

Verify Get JioFiber redirection
    #Redirection of GetJiofiber Button
    Redirection On Clicking                    xpath://button[contains(text(),'Get JioFiber')]  https://www.jio.com/selfcare/interest/fiber/  GetJioFiber-JioCentrex 

Verify Presence of Watch more about JioCentrex section
    #Verify if section is visible
    Section Verification                       xpath://div[contains(@style,"--grid-template:repeat(2, 1fr); --grid-template-tablet:1fr;")]  Watch more about JioCentrex
    #Watch more about JioCentrex Text Verification
    Wait For And Verify Element                xpath://h3[contains(text(),'Watch more about JioCentrex')]
    Text Verification                          xpath://h3[contains(text(),'Watch more about JioCentrex')]  Watch more about JioCentrex

Verify Functionality of JioCentrex Video card

    # Scrolling Video cards into View
    Scroll To                                  xpath://div[@class="order_lg-2 video-btn-custom cursor-pointer"]
        
    # Clicking on Video card
    Click Element                              xpath://div[@class="order_lg-2 video-btn-custom cursor-pointer"]

    # Verifying that the title of Video matches with title of Video card
    Wait For And Verify Content                xpath://h5[@class="j-modal-heading j-heading j-text-heading-xs"]    JioCentrex

    # Waiting till the iframe is visible
      Wait Until Element Is Visible            xpath://video[@id='video']    20s     #Updated

    # Waiting for iframe to load
    Sleep    2s

    # Verifying if video is playing or not
    Element Attribute Value Should Be          xpath://video[@id='video']  allow width height autoplay controls controlsList  ${None} 

    # Clicking on cross button
    Wait For And Click Element                 xpath://button[@data-popup-close="modal-video"]   

Verify Get JioCentrex and Contact center Button functionality
    #Get JioCentreX Button Verification
    Button Verification                        xpath://button[contains(text(),'Get JioCentrex')]

    #Click JioCentreX Button
    Wait For And Click Element                 xpath://button[contains(text(),'Get JioCentrex')]

    #Verify Get JioCentreX Pop Up
    Wait For And Verify Element                xpath://h5[contains(text(),'Get JioCentrex')]

    #Close Get JioCentreX Pop Up
    Close Popup                                xpath://button[@id='centrex-popup-close-id']

    #Contact Center Button Verification
    Button Verification                        xpath://button[contains(text(),'Contact Center')]

    #Redirection of Contact Center Button
    Redirection On Clicking                    xpath://button[contains(text(),'Contact Center')]  https://www.jio.com/help/contact-us#/  Contact Center
