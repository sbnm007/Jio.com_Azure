*** Settings ***
Library    SeleniumLibrary
Resource    ../../../Common.robot
Resource    ../../../Local_Keywords.robot
Resource    ../../../Excel_Activity.robot
Variables    ../../../Common_Variables.yaml
Variables    ../../../../Tests/Fiber/Get_JioFiber_Variables.yaml

*** Keywords ***
Installation address map page
    Verify Redirection of Installation address map page
    Verify UI and Functionality of Installation address map page

Verify Redirection of Installation address map page
    Landing on Installation address page

    # Clicking on  Cross icon on PIN code field
    Wait For And Click Element           xpath://div[contains(@class,"addressTextArea")]/span[@class="input-icon input-icon-suffix clickable"]

    # Entering data in all three fields
    Wait For And Input Text              xpath://input[@type="tel"]    382340
    Wait For And Input Text              xpath://textarea[@type="textarea"]    asd
    Wait For And Input Text              xpath://div[@class="j-field input-text"]/input[@type="text"]    asd

    # Waiting for elements to load
    Sleep    150ms

    # Clicking on Book Installation Button
    Wait For And Click Element           xpath://button[@aria-label="button Book Installation"]

    # Verifying that Map is visible
    Wait For And Verify Element          xpath://div[@class="customAddress_desktopMapStyle__BIXkb"]//div[@aria-label="Map"]

Verify UI and Functionality of Installation address map page

    # Verifying Location Icon in the Installation address page
    Wait For And Verify Element           xpath://span[@class='j-icon j-icon__bg']

    # Verifying that Continue button is disabled
    Element Should Be Disabled           xpath://button[@aria-label="button Continue"]

    # Clicking at coordinates in map
    Click Element At Coordinates         xpath://div[@class="gm-style-moc"]    100    100

    # Verifying that Heading is visible
    Wait For And Verify Element          xpath://div[@class='j-text j-text-heading-xs']

    # Verifying text of the heading
    Text Verification                    xpath://div[@class='j-text j-text-heading-xs']    Installation address

    # Verifying that sub-text is visible
    Wait For And Verify Element          xpath://div[@class='txt-align--center j-text j-text-body-xs']

    # Verifying text of sub-text
    Text Verification                    xpath://div[@class='txt-align--center j-text j-text-body-xs']    Where do you want your new JioFiber connection?

    # Verifying that search bar is visible
    Wait For And Verify Element          xpath://input[@aria-label="Start typing your locality here"]

    # Verifying that type of the bar is search bar
    Element Attribute Value Should Be    xpath://input[@aria-label="Start typing your locality here"]    type    search
    
    # Verifying the text in placeholder of search bar
    Element Attribute Value Should Be    xpath://input[@aria-label="Start typing your locality here"]    placeholder    Start typing your locality here

    # Entering text in Search bar
    Wait For And Input Text              xpath://input[@type="search"]    Ahmedabad

    # Selecting first suggestion from the list
    Wait For And Click Element           xpath:(//div[@class="addressSuggest_suggestion__15t_- j-text j-text-body-s-bold"])[1]
    
    # Verifying that selected address section is visible
    Wait For And Verify Element          xpath://div[@class="customAddress_desktopMapStyle__BIXkb"]

    # Veriying that continue button is visible
    Wait For And Verify Element          xpath://button[@aria-label="button Continue"]

    # Verifying text of the button
    Text Verification                    xpath://button[@aria-label="button Continue"]    Continue
    
    # Verifying that Button is enabled
    Element Should Be Enabled            xpath://button[@aria-label="button Continue"]
