*** Settings ***
Library    SeleniumLibrary
Resource    ../../../Common.robot
Resource    ../../../Local_Keywords.robot
Resource    ../../../Excel_Activity.robot
Variables    ../../../Common_Variables.yaml
Variables    ../../../../Tests/Fiber/Get_JioFiber_Variables.yaml

*** Keywords ***
Installation Address page
    Verify Redirection of Installation address page
    Verify UI of Installation address page
    Verify Functionality of Installation address page

Verify Redirection of Installation address page
    Landing on Installation address page

    # Verifying Url of Installation address page
    #URL Validation                        https://www.jio.com/selfcare/interest/fiber/location/?nav=g*

Verify UI of Installation address page
    # Required Sleep
    Sleep    250ms

    # Verifying Location Icon above heading
    Wait For And Verify Element           xpath://*[name()='path' and contains(@d,'M12 2a7.82')]

    # Verifying that Installation address heading is Visible
    Wait For And Verify Element           xpath://div[@class='j-text j-text-heading-xs']

    # Verifying text of Installation address Heading
    Text Verification                     xpath://div[@class='j-text j-text-heading-xs']    Installation address

    # Verifying that Sub-text is Visible
    Wait For And Verify Element           xpath://div[@class='txt-align--center j-text j-text-body-xs']

    # Verifying text of Sub-text
    Text Verification                     xpath://div[@class='txt-align--center j-text j-text-body-xs']    Where do you want your new JioFiber connection?
    
    # Clicking Cross icon on PIN code field
    Wait For And Click Element            xpath://div[contains(@class,"input-tel")]//span[@class="input-icon input-icon-suffix clickable"]

    # Verifying that PIN code field is visible
    Wait For And Verify Element           xpath://input[@type="tel"]

    # Verifying that PIN code field Label is Visible
    Wait For And Verify Element           xpath://div[@class="j-field input-tel"]/label[@class="field-label"]

    # Verifying text of PIN code field label
    Text Verification                     xpath://div[@class="j-field input-tel"]/label[@class="field-label"]    PIN Code

    # Verifying that Building name... field is visible
    Wait For And Verify Element           xpath://div[contains(@class,"j-field input-textarea")]

    # Verifying that Label for Building name... field is Visible
    Wait For And Verify Element           xpath://div[contains(@class,"j-field input-textarea")]//label[@class="field-label"]

    # Verifying text of Building name... field label
    Text Verification                     xpath://div[contains(@class,"j-field input-textarea")]//label[@class="field-label"]    Building name, Locality, Area

    # Verifying that Flat/House no... field is visible
    Wait For And Verify Element           xpath://div[@class="j-field input-text"]

    # Verifying that Label for Flat/House no... field is Visible
    Wait For And Verify Element           xpath://div[@class="j-field input-text"]/label[@class="field-label"]

    # Verifying text of Flat/House no... field label
    Text Verification                     xpath://div[@class="j-field input-text"]/label[@class="field-label"]    Flat/House no., Floor, Company

    # Verifying that book installation Button is Visible
    Wait For And Verify Element           xpath://button[@aria-label="button Book Installation"]

    # Verifying text of Button
    Text Verification                     xpath://button[@aria-label="button Book Installation"]    Book Installation

    # Verifying that background Image is visible
    Wait For And Verify Element           xpath://div[contains(@style,'background-image')]

    # Verifying that Heading on Image is Visible
    Wait For And Verify Element           xpath://div[@class="j-text j-text-heading-l"]

    # Verifying text of Heading on Image
    Text Verification                     xpath://div[@class="j-text j-text-heading-l"]    Incredibly fast home internet

    # Verifying that Sub-text on is Visible
    Wait For And Verify Element           xpath://div[@class="j-text j-text-body-l"]

    # Verifying text of Sub-text on Image
    Text Verification                     xpath://div[@class="j-text j-text-body-l"]    Fuels multiple devices with unlimited data.

Verify Functionality of Installation address page

    # Entering Incorrect PIN code
    Wait For And Input Text               xpath://input[@type="tel"]    382008

    # Verifying that error below PIN code field is visible
    Wait For And Verify Element           xpath://div[@class="field-error"]

    # Verifying text of Error
    Text Verification                     xpath://div[@class="field-error"]    Invalid pincode

    URL Validation                        https://www.jio.com/selfcare/interest/fiber/location/?nav=g

    # Verifying Functionality cross icon on PIN code Field
    # Verifying that Cross icons are not visible on all three fields
    FOR  ${i}  IN RANGE    1    4
        Element Should Not Be Visible         xpath:(//span[@class="input-icon input-icon-suffix clickable"])[${i}]
    END
    
    # Entering data in PIN code field
    Wait For And Input Text               xpath://input[@type="tel"]    382340
    
    # Verifying if location suggestion is present

    Wait For And Verify Element           xpath://span[@class="field-description"]
    Wait For And Input Text               xpath://textarea[@type="textarea"]    Mines Colony
    Wait For And Input Text               xpath://div[@class="j-field input-text"]/input[@type="text"]    d-30,rivera

    # Waiting for elements to load
    Sleep    250ms


    # Verifying that cross icon appears after entering data in all three fields
    # Clicking Cross icon on all three fields
    FOR  ${i}  IN RANGE    1    3
        Element Should Be Visible        xpath:(//span[@class="input-icon input-icon-suffix clickable"])[${i}]
        Wait For And Click Element       xpath:(//span[@class="input-icon input-icon-suffix clickable"])[${i}]
    END
    # Verifying that all three field values are empty
    Textfield Value Should Be            xpath://input[@type="tel"]    ${EMPTY}
    Textarea Value Should Be             xpath://textarea[@type="textarea"]   ${EMPTY}
    Textfield Value Should Be            xpath://div[@class="j-field input-text"]/input[@type="text"]    ${EMPTY}

    # Verifying that PIN code field doesn't take letters
    Wait For And Input Text              xpath://input[@type="tel"]    abcd
    Textfield Value Should Be            xpath://input[@type="tel"]    ${EMPTY}

    # Entering text in PIN code field
    Wait For And Input Text              xpath://input[@type="tel"]    382340

    # Entering text in Building name... field
    Wait For And Input Text              xpath://textarea[@type="textarea"]    Kotarpur

    # Verifying that button is disabled
    Element Should Be Disabled           xpath://button[@aria-label="button Book Installation"]

    # Entering data in third field
    Wait For And Input Text              xpath://div[@class="j-field input-text"]/input[@type="text"]    d-30,rivera

    # Verifying that button is enabled
    Element Should Be Enabled            xpath://button[@aria-label="button Book Installation"]
