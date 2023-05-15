*** Settings ***
Library               SeleniumLibrary
Library               Dialogs
Resource              ../../../Common.robot
Resource              ../Services_PO/RedirectionToSevices.robot
Resource              ../../../Excel_Activity.robot
Resource              ../../../Local_Keywords.robot
Variables             ../../../Common_Variables.yaml
Variables             ../../../../Tests/Fiber_page/FServices_Variables.yaml

*** Keywords ***
High speed internet & Free Voice page
    Landing on High speed internet & Free Voice page
    Banner section of High speed internet & Free Voice page
    High Speed Internet and Free HD Voice section
    Distinguished features of High-Speed Internet & Free Voice section
    Watch more about High Speed Internet Section
    Best Selling JioFiber Accessories section 
    More from Jio section

Landing on High speed internet & Free Voice page

    # Scrolling down to Extraordinary Experiences section
    Scroll To                         xpath://h3[text()="Extraordinary experiences"]

    # Clicking on Learn more button of "High speed internet & Free Voice" tile
    Redirect and continue             xpath://div[contains(@aria-label,"High speed internet & Free Voice")]//button[@class="j-button j-button-size__medium tertiary"]    https://www.jio.com/jcms/jiofiber/services/high-speed-internet/    SC_Highspeedinternet


Banner section of High speed internet & Free Voice page
    Verify Presence of Banner
    Verify Banner redirection

High Speed Internet and Free HD Voice section
    Verify UI and content of High Speed Internet and Free HD Voice section
    Verify Get JioFiber button redirection

Distinguished features of High-Speed Internet & Free Voice section
    Verify Presence of "Distinguished features of High Speed Internet" section
    Scroll To                         xpath://section[contains(@aria-label,"Distinguished features of High-Speed Internet & Free Voice")]
    Verify Tiles are present under Distinguished features    5

Watch more about High Speed Internet Section
    Scroll To                         xpath://section[@aria-label="Watch more about High Speed Internet"]
    Verify Presence of Watch more about High Speed Internet section
    Verify Functionality of Video cards    7



Verify UI and content of High Speed Internet and Free HD Voice section

    # Verifying if section is visible
    Section Verification              xpath://section[@data-testid="get-now-top-header"]/parent::section    High Speed Internet and Free HD Voice

    # Verifying Title of the section
    Text Verification                 xpath://h5[contains(text(),"High Speed Internet and Free HD Voice")]    High Speed Internet and Free HD Voice

    #HSI- High Speed Internet
    Text Verification                 xpath://h3[@class="j-heading j-text-heading-l"]  ${HSI_heading}
    Text Verification                 xpath://p[@class="j-text j-text-body-m"]  ${HSI_Subheading}

    # Verifying if Get JiFiber button is Visible
    Wait For And Verify Element       xpath://button[@aria-label="Get JioFiber"]


Verify Presence of "Distinguished features of High Speed Internet" section

    # Verifying if section is Visible
    Section Verification              xpath://section[@aria-label='Distinguished features of High-Speed Internet & Free Voice​']    Distinguished features of High-Speed Internet & Free Voice

    # Verifying title of the section
    Text Verification                 xpath://h3[contains(text(),"Distinguished features of High-Speed Internet & Free Voice")]    Distinguished features of High-Speed Internet & Free Voice


Verify Presence of Watch more about High Speed Internet section

    # Verifying if section is Visible
    Section Verification              xpath://section[@aria-label="Watch more about High Speed Internet"]    Watch more about High Speed Internet

    # Verifying Title of the section
    Text Verification                 xpath://h3[contains(text(),"Watch more about High Speed Internet")]    Watch more about High Speed Internet
