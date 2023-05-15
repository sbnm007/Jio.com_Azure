*** Settings ***
Library    SeleniumLibrary
Resource    ../../../Common.robot
Resource    ../../../Local_Keywords.robot
Resource    ../../../Excel_Activity.robot
Variables    ../../../Common_Variables.yaml
Variables    ../../../../Tests/Fiber/Get_JioFiber_Variables.yaml

*** Keywords ***
Get JioFiber Main page
    Confirm the UI elements and Content of 'Get JioFiber' page
    Verify functionality of Get JioFiber page
    Verify accoridion Functionality and Link redirection of FAQ section

Confirm the UI elements and Content of 'Get JioFiber' page
    
    #Verifying the presence of underline below GetJioFiber Tab
    Wait Until Keyword Succeeds    30 sec    0 sec    CSS Verification    xpath://li[@onclick="window.location.href='/selfcare/interest/fiber?nav=g'"]    border-bottom-color    rgba(229, 247, 238, 1)

    
    # To Check The Presence Of Cross Icon.
    Wait For And Verify Element           xpath://span[@class="j-icon j-icon__bg"]//*[local-name()='path' and contains(@d,"M8.41")]

    # To Check The Presence Of Heading 'Get JioFiber'
    Wait For And Verify Element           xpath://h1[@class="j-text j-text-heading-xs"]

    # Text Verification of Heading
    Text Verification                     xpath://h1[@class="j-text j-text-heading-xs"]    Get JioFiber

    # To Verify presence of The Subtext Below Heading
    Wait For And Verify Element           xpath://h2[@class="j-text j-text-body-xs"]

    # Text Verification of sub-heading
    Text Verification                     xpath://h2[@class="j-text j-text-body-xs"]              Just verify your number, share your address, and we’ll install JioFiber at your place soon.

    # To Check The Input Field For Entering name.
    Wait For And Verify Element           xpath://input[@id="submitNumber"]

    # Verify if label is present for name field
    Wait For And Verify Element            xpath://label[@for="submitNumber"]  

    # Verifying the text of the label above name field.
    Text Verification                      xpath://label[@for="submitNumber"]    Name

    # To Check The Input Field For Entering Number.
    Wait For And Verify Element            xpath://input[@id="submitMobile"]

    # Verify if label is present for name field
    Wait For And Verify Element            xpath://label[@for="submitMobile"]  

    # Verifying the text of the label above name field.
    Text Verification                      xpath://label[@for="submitMobile"]    Mobile Number

    # To Check Whether Guideline Will Be There Or Not.
    Wait For And Verify Element            xpath://span[@class="field-description"]

    # To Check That Page Contains 'Generate OTP' Button Or Not
    Wait For And Verify Element            xpath://button[@aria-label="button Generate OTP"]   
.
    # Verifying text of Button
    Text Verification                     -xpath://button[@aria-label="button Generate OTP"]    Generate OTP

    # Verifying 'You will receive an OTP on your number.' text  above Generate Button
    Wait For And Verify Content            xpath=//span[@class="field-description"]     You will receive an OTP on your number.


    # Verifying that background Image is visible
    Wait For And Verify Element             xpath://div[contains(@style,'background-image')]

    # Verifying that Heading on Image is Visible
    Wait For And Verify Element             xpath://div[@class="j-text j-text-heading-l"]

    # Verifying text of Heading on Image
    Text Verification                       xpath://div[@class="j-text j-text-heading-l"]    Incredibly fast home internet

    # Verifying that Sub-text on is Visible
    Wait For And Verify Element             xpath://div[@class="j-text j-text-body-l"]

    # Verifying text of Sub-text on Image
    Text Verification                       xpath://div[@class="j-text j-text-body-l"]    Fuels multiple devices with unlimited data.

    # Verifying FAQ Section
    Wait For And Verify Element             xpath=//section[@class="faqSection_faqContainer__UiWC1 j-container"]

Verify functionality of Get JioFiber page
    
    # Verfiying that cross icon is not visible on name field    
    Element Should Not Be Visible            xpath=//div[contains(@class,"input-text")]//span[@class="input-icon input-icon-suffix clickable"]

    # Verfiying that cross icon is not visible on number field
    Element Should Not Be Visible            xpath://div[contains(@class,"input-tel")]//span[@class="input-icon input-icon-suffix clickable"]

    # Entering name in Name field
    Wait For And Input Text                  xpath://input[@id="submitNumber"]    ${Name}

    # Entering Number in mobile number field
    Wait For And Input Text                  xpath://input[@id="submitMobile"]    ${COCP_OR_Postpaid_Number}

    # Waiting for cross icons to appear
    Sleep    150ms

    # Verfying if Generate OTP button is Visible
    Element Should Be Enabled                 xpath://button[@aria-label="button Generate OTP"]

    # Verfiying that cross icon is visible on name field  
    Element Should Be Visible                 xpath://div[contains(@class,"input-text")]//span[@class="input-icon input-icon-suffix clickable"]
    CSS Verification                          xpath://div[@class="j-field input-text input-has-suffix"]//span[@class="input-icon input-icon-suffix clickable"]   right     0px

    # Verfiying that cross icon is  visible on number field
    Element Should Be Visible                 xpath://div[contains(@class,"input-tel")]//span[@class="input-icon input-icon-suffix clickable"]
    CSS Verification                          xpath://div[@class="j-field input-tel input-has-suffix"]//span[@class="input-icon input-icon-suffix clickable"]    right     0px

    # Clicking on cross icon on name field
    Cross Button Functionality                xpath://div[contains(@class,"input-text")]//span[@class="input-icon input-icon-suffix clickable"]

    # Verifying that text is cleared from name field
    Textfield Value Should Be                 xpath://input[@id="submitNumber"]    ${EMPTY}

    # Verifying that Generate OTP button is disabled
    Element Should Be Disabled                xpath://button[@aria-label="button Generate OTP"]  

    # Clicking on cross icon on number field
    Cross Button Functionality                xpath://div[contains(@class,"input-tel")]//span[@class="input-icon input-icon-suffix clickable"]

    # Verifying that text is cleared from number field
    Textfield Value Should Be                 xpath://input[@id="submitMobile"]    ${EMPTY}

    # Verifying that Generate OTP button is disabled
    Element Should Be Disabled                xpath://button[@aria-label="button Generate OTP"]


Verify accoridion Functionality and Link redirection of FAQ section
    # Used To Scroll Upto Specific Section          #NOTE: For FAQ link redirection verification, the following code is verifying the first FAQ link redirection Only.
    Scroll To                                                       xpath://div[contains(text(),"What is the applicable security deposit")]
    Sleep  150ms

    # Used to get the accordions count
    ${accordions} =  Get Element Count                              xpath:(//div[@class='j-accordion-panel__header j-text-list-title j-listBlock align-middle'])

    # It Will Set The Index Variable To 0
    ${index} =  Set Variable  0

    # Variable Declared To Track The Status Of HyperLink Click
    ${click_status} =  Set Variable  1

    # Variable Declared To Manipulate The Status Of Hyperlink Click.
    ${status} =  Set Variable  False

    # Loop To Iterate For Every Accordion That Is Present On Page
    FOR  ${i}  IN RANGE    0    ${accordions}
    
        # It Will Click The Accordion
        wait for and Click Element                                  xpath:(//div[@class='j-accordion-panel__header j-text-list-title j-listBlock align-middle'])[${i+1}]

        # Used To Check The Body Section, Which Gets Activated.
        Element Attribute Value Should Be                           xpath:(//section[contains(@class,"faqSection")]//div[@class="j-accordion-panel__inner"])[${i+1}]    aria-hidden    false

        # The Above Xpath Will Ensure That accordion icon is in upwards direction
        Wait For And Verify Element                                 xpath://span[@class='j-accordion-panel-icn active j-button j-button-size__medium tertiary icon-primary icon-only as-span']
        # To Check The Status Of HyperLink Click
        IF  ${click_status} > 0

            # To Alter The Status On Successfull Click Of Mentioned Link
            Scroll To                                               xpath://div[@aria-hidden="false"]//a
            ${status} =  Run Keyword And Return Status  Click Link  xpath://div[@aria-hidden="false"]//a    
        END

        # Checks The Value Of Status And Executes The Enclosed Body
        IF  ${status} 
            
            # Modifies The Value Of Vaiable click_status
            ${click_status} =  Evaluate  ${click_status} - 1

        END

        # Runs The Keywod If The Condition Is True
        Run Keyword If  ${click_status} == 0  Change Tab  title=Track Order Status of Your New Jio Sim & JioFiber   
        Take Page Screenshot    ConfirmedSwitch

        # Used To Switch The Window Matching The Title Provided
        Switch Window  Get Jio Fiber Connection - New WiFi Connection For Home

        # Minimize accordion by clicking (-) icon
        Wait For And Click Element                                 xpath://span[@class='j-accordion-panel-icn active j-button j-button-size__medium tertiary icon-primary icon-only as-span']
        # Verifying Accordion
        Wait For And Verify Element                                xpath:(//div[@class='j-accordion-panel__header j-text-list-title j-listBlock align-middle'])[${i+1}]

        # Used To Check The Body Section, Which Gets Activated.
        Element Attribute Value Should Be                          xpath:(//section[contains(@class,"faqSection")]//div[@class="j-accordion-panel__inner"])[${i+1}]    aria-hidden    true

        # Used To Alter The Value Of Index Variable
        ${index} =  Evaluate  ${index} + 1
    END

Enter form fields
    
    # Check If The Page Contains Input Field Of Mentioned Xpath
    Wait For And Input Text                     xpath://input[@id="submitNumber"]  ${Name}

    # Check If The Page Contains Input Field Of Mentioned Xpath
    Wait For And Input Text                     xpath://input[@id="submitMobile"]  ${Prepaid_Number}

Verify if Maximum attempts toast appears on Generating OTP for the third time
    
    # User Defined Keyword To Enter Form Fields.
    Enter form fields
    Sleep  150ms

    # Click The Button Of Matching Xpath
    Wait For And Click Element                  xpath://button[@aria-label="button Generate OTP"]

    # Used To Reload The Page
    Reload Page

    # User Defined Keyword To Enter Form Fields.
    Enter form fields

    # Click The Button Of Matching Xpath
    Wait For And Click Element                  xpath://button[@aria-label="button Generate OTP"]

    # Used To Reload The Page
    Reload Page

    # User Defined Keyword To Enter Form Fields.
    Enter form fields

    # Used For Clicking Button Of Matching Xpath
    Wait For And Click Element                  xpath://button[@aria-label="button Generate OTP"]

    # Verifying if Maximum attempt toast is visible
    Wait for and Verify element                 xpath://div[@class='ErrorToast_notificationErrorStyle__KAzDY j-notification j-notification__kind-semantic j-notification__duration-short j-notification__visible']
    
    # Verifying text of the Maximum attempt toast
    Text Verification                           xpath://div[@class='ErrorToast_notificationErrorStyle__KAzDY j-notification j-notification__kind-semantic j-notification__duration-short j-notification__visible']    You have exceeded the maximum attempts allowed to send OTP. Please try again after some time
