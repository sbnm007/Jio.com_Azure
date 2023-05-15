*** Settings ***
Resource                     ../../../Common.robot
Variables                    ../../../../Tests/Support/TrackOrder_Variables.yaml
Resource                     ../../../Excel_Activity.robot
Resource                     ../../../Local_Keywords.robot

*** Keywords ***
Confirm user is redirected to Track eSIM request page
    # Testcase : 92616
    #Confirm eSIM request option is visible.
    Text Verification               xpath://div[contains(text(),'eSIM request')]    eSIM request
    # TestCase : 92617
    #Click on eSIM request page
    Redirect and continue           ${Esim_button}    https://www.jio.com/selfcare/track-orders/esim/    Sc_RedirectionToESIMPage

UI of 'Esim Request' Page Verifcation
    Confirm user is redirected to Track eSIM request page
    # Testcase : 92618
    # Verify heading of esim request
    Wait For And Verify Content     xpath://h1[normalize-space()='Track eSIM request']                        ${Esim_Heading}
    # Verify subheading of esim request
    Text Verification               xpath://h2[normalize-space()='Check status of your eSIM request.']        ${Esim_Subheading}
    # input box with placeholder
    Page Should Contain Element     ${trackingdetails_placeholder}                                            ${Placeholder_Trackingdetails}
    # Text of order refrence number 
    Text Verification               xpath://div[@class='esim_esimDetailsText__2Tkcp j-text j-text-body-s']    ${Reference_No_Text}
    # proceed button
    Scroll To                       ${proceedButton}
    # Image on right side
    Image Verification              xpath://img[@alt='Track Order Status of Esim']
    # ORN less tha 12 digit
    # Enter less than 12 digit aplhanumeric text
    # Testcase : 92621
    Wait For And Input Text         ${orderTrackingDetails}                                                    A12010101
    Scroll To                       ${proceedButton}
    Element Should Be Disabled      ${proceedButton}
    # Chechking Invalid reference number
    Invalid Refernce Number
    # cross icon validation
    Cross Icon Validation
    
Invalid Refernce Number
    # Testcase : 92619
    # Enter 12 digit aplhanumeric text
    Wait For And Input Text         ${orderTrackingDetails}    A12456789000
    Scroll To                       ${proceedButton}
    # clicking on proceed button
    Wait For And Click Element      ${proceedButton}
    Wait For And Verify Element     xpath://div[@class="j-text j-text-body-s-bold"]
    #Error toast
    Wait For And Verify Element     xpath://div[contains(@class,'ErrorToast')]
    Text Verification               xpath://div[contains(text(),'Please enter a valid ORN')]    Please enter a valid ORN
  
Cross Icon Validation
    # Testcase : 92620
    # cross icon
    Wait For And Click Element      xpath://a[@class="j-link suffix-close"]