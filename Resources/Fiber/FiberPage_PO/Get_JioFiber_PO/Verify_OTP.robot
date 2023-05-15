*** Settings ***
Library    SeleniumLibrary
Resource    ../../../Common.robot
Resource    ../../../Local_Keywords.robot
Variables    ../../../Common_Variables.yaml
Variables    ../../../../Tests/Fiber/Get_JioFiber_Variables.yaml

*** Keywords ***
Verify OTP page
    Verify Redirection of Verify OTP page
    Verify UI of Verify OTP page
    Verify Functionality of Verify OTP page

Verify Redirection of Verify OTP page

    # Entering Name in name field
    Wait For And Input Text               xpath://input[@id="submitNumber"]    ${Name}

    # Entering Mobile number in number field
    Wait For And Input Text               xpath://input[@id="submitMobile"]    ${COCP_OR_Postpaid_Number}

    # Clicking on Generate OTP button
    Wait For And Click Element            xpath://button[@aria-label="button Generate OTP"]

    # Verifying that Verify OTP page heading is visible
    Wait For And Verify Element           xpath://div[text()="Verify your mobile number"]

Verify UI of Verify OTP page

    # Verifying if icon is visible
    Wait For And Verify Element           xpath://span[@class="j-icon j-icon__bg"]

    # Verifying if heading is visible
    Wait For And Verify Element           xpath://div[@class='j-text j-text-heading-xs']

    # Verifying the text of the heading
    Text Verification                     xpath://div[@class='j-text j-text-heading-xs']    Verify your mobile number

    # Verifying if subtext is visible
    Wait For And Verify Element           xpath:(//span//div[@class='verifyOTP_txt__3JLPe j-text j-text-body-xs'][1])

    # Verifying text of the subtext section
    Text Verification                     xpath:(//span//div[@class='verifyOTP_txt__3JLPe j-text j-text-body-xs'][1])     The OTP has been sent to

    # Verifying that mobile number is present
    Wait For And Verify Element           xpath://div[text()="${COCP_OR_Postpaid_Number}"]
    
    # Verifying if the number is same as number entered
    Text Verification                     xpath://div[text()="${COCP_OR_Postpaid_Number}"]        ${COCP_OR_Postpaid_Number}

    # Verifying if edit icon is visible
    Wait For And Verify Element           xpath://span[@class="verifyOTP_editIcon__1GTfy j-icon"]

    # Verifying if field is visible to enter OTP
    Wait For And Verify Element           xpath://div[@class="input-code__group"]

    # Verifying if the Resend OTP button is visible
    Wait For And Verify Element           xpath://button[@class='l-align-left txt-align--left j-button j-button-state__default j-button-size__small tertiary']

    # Verifying text of Resend OTP button
    Text Verification                     xpath://button[@class='l-align-left txt-align--left j-button j-button-state__default j-button-size__small tertiary']    Resend OTP

    # Verifying if button is visible
    Wait For And Verify Element           xpath://button[@aria-label="button Verify"]

    # Verifying the text of button
    Text Verification                     xpath://button[@aria-label="button Verify"]/div[text()="Verify"]    Verify

Verify Functionality of Verify OTP page

    # Verifying that OTP sent successfully pop up is visible
    Wait For And Verify Element           xpath://div[@class='ErrorToast_notificationSuccessServiceStyle__1Vl2f j-notification j-notification__kind-service j-notification__duration-short j-notification__visible']
    CSS Verification                      xpath://div[@class="ErrorToast_notificationSuccessServiceStyle__1Vl2f j-notification j-notification__kind-service j-notification__duration-short j-notification__visible"]    right    24px
    # Verifying text of Toast
    Text Verification                     xpath://div[@class='ErrorToast_notificationSuccessServiceStyle__1Vl2f j-notification j-notification__kind-service j-notification__duration-short j-notification__visible']     OTP sent successfully

    # Verfying that Verify OTP button is disabled
    Element Should Be Disabled            xpath://button[@aria-label="button Verify"]

    # Clicking on resend OTP button
    Wait For And Click Element            xpath://button[@aria-label="button Resend OTP"]

    # Verifying that OTP resent successfully toast is visible
    Wait For And Verify Element           xpath://div[text()='OTP resent successfully']

    # Verifying text of Toast
    Text Verification                     xpath://div[text()='OTP resent successfully']     OTP resent successfully
    CSS Verification                      xpath://div[text()='OTP resent successfully']     right    auto

    # Entering incorrect OTP
    Wait For And Input Text               xpath://input[@id="basic-input-testInput-code-block-0"]    ${Incorrect_OTP}

    # Verifying that Verify OTP button is enabled
    Element Should Be Enabled             xpath://button[@aria-label="button Verify"]

    # Clicking on Verify OTP button
    Wait For And Click Element            xpath://button[@aria-label="button Verify"]

    # Verifying that Toast for Incorrect OTP is visible
    Wait For And Verify Element           xpath://div[@class='ErrorToast_notificationErrorStyle__KAzDY j-notification j-notification__kind-semantic j-notification__duration-short j-notification__visible']

    # Verifying text of Toast
    Text Verification                     xpath://div[@class='ErrorToast_notificationErrorStyle__KAzDY j-notification j-notification__kind-semantic j-notification__duration-short j-notification__visible']     That's not the OTP we sent. Please re-enter and try again
