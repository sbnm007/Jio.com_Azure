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
Home Networking & Smart Security page
    Landing on Home Networking & Smart Security page
    Banner section of Home Networking & Smart Security page
    Home Networking & Smart Security section
    Distinguished features of Home Networking & Smart Security section
    Watch more about Security & Surveillance Section
    Best Selling JioFiber Accessories section 
    More from Jio section

Landing on Home Networking & Smart Security page

    # Scrolling down to Extraordinary Experiences section
    Scroll To                        xpath://h3[text()="Extraordinary experiences"]

    # Clicking on Learn more button of "Home Networking & Smart Security" tile
    Redirect and continue            xpath://div[contains(@aria-label,"Home Networking & Smart Security")]//button[@class="j-button j-button-size__medium tertiary"]    https://www.jio.com/jcms/jiofiber/services/home-networking/    SC_Homenet

Banner section of Home Networking & Smart Security page
    Verify Presence of Banner
    Verify Banner redirection

Home Networking & Smart Security section    
    Verify UI and content of Home Networking & Smart Security section
    Verify Get JioFiber button redirection

Distinguished features of Home Networking & Smart Security section
    Verify Presence of "Distinguished features of Home Networking" section
    Scroll To                         xpath://section[contains(@aria-label,"Distinguished features of Home Networking & Smart Security")]
    Verify Tiles are present under Distinguished features    5

Watch more about Security & Surveillance Section
    Verify Presence of Watch more about Security & Surveillance section
    Scroll To                         xpath://section[@aria-label="Watch more about Security & Surveillance"]
    Verify Functionality of Video cards    7

Verify UI and content of Home Networking & Smart Security section

    # Verifying if section is visible
    Section Verification              xpath://section[@data-testid="get-now-top-header"]/parent::section   Home Networking & Smart Security

    # Verifying Title of the section
    Text Verification                 xpath://h5[contains(text(),"Home Networking & Smart Security")]   Home Networking & Smart Security

    # Verifying if subtext is visible
    Wait For And Verify Element       xpath://h3[@class="j-heading j-text-heading-l"]
    #HN- Home Network
    Text Verification                 xpath://h3[@class="j-heading j-text-heading-l"]  ${HN_heading}
    Wait For And Verify Element       xpath://p[@class="j-text j-text-body-m"]
    Text Verification                 xpath://p[@class="j-text j-text-body-m"]  ${HN_Subheading}

    # Verifying if Get JiFiber button is Visible
    Wait For And Verify Element       xpath://button[@aria-label="Get JioFiber"]


Verify Presence of "Distinguished features of Home Networking" section

   # Verifying if section is Visible
    Section Verification              xpath://section[contains(@aria-label,"Distinguished features of Home Networking & Smart Security")]    Distinguished features of Home Networking & Smart Security

    # Verifying title of the section
    Text Verification                 xpath://h3[contains(text(),"Distinguished features of Home Networking & Smart Security")]    Distinguished features of Home Networking & Smart Security


Verify Presence of Watch more about Security & Surveillance section

    # Verifying if section is Visible
    Section Verification              xpath://section[@aria-label="Watch more about Security & Surveillance"]    Watch more about Security & Surveillance

    # Verifying Title of the section
    Text Verification                 xpath://h3[contains(text(),"Watch more about Security & Surveillance")]    Watch more about Security & Surveillance
