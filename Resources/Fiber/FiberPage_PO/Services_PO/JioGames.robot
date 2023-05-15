*** Settings ***
Library                        SeleniumLibrary
Library                        Dialogs
Resource                       ../../../Common.robot
Resource                       ../Services_PO/RedirectionToSevices.robot
Resource                       ../../../Excel_Activity.robot
Resource                       ../../../Local_Keywords.robot
Variables                      ../../../../Tests/Fiber/FServices_Variables.yaml


*** Keywords ***

JioGames page
    Verify the UI & Content Of JioGames Page Which Appears After Clicking 'Learn More' Button
    Banner section of JioGames page
    JioGames section
    Distinguished features of Jio 4K Set Top Box section
    Watch more about TV Video calling section JioGames
    Best Selling JioFiber Accessories section JioGames
    More from Jio section JioGames

Verify the UI & Content Of JioGames Page Which Appears After Clicking 'Learn More' Button

    # Scroll To till JioGames+ is visible 
    Scroll To                                  xpath://section[@class='j-container l-layout--max-width']//div[@aria-label='JioGames']
    
    # Waits until Learn More button of JioGames is visible 
    Wait For And Verify Element                xpath://div[@aria-label='JioGames']//div[contains(text(),'Learn more')]   

    # Clicks on Learn More button of JioGames tile is visible  
    Redirect and continue                      xpath://div[@aria-label='JioGames']//div[contains(text(),'Learn more')]    https://www.jio.com/jcms/jiofiber/services/apps/jiogames/    SC_JioGamesLearnMore

Banner section of JioGames page
    # Banner verification
    Verify Presence of Banner

    #Banner Redirection 
    Verify Banner redirection

    # Waits until banner is visible
    Wait For And Verify Element                xpath://section[@aria-label='Superfast home internet with the same upload and download speed']   

    # Get JioFiber Button Verification
    Button Verification                        xpath://button[contains(.,'Get JioFiber')]     

    # Clicks on Get JioFiber button
    Redirection On Clicking                    xpath://button[contains(.,'Get JioFiber')]    https://www.jio.com/selfcare/interest/fiber/    Get JioFiber Button    

JioGames section
    # Scroll Till JioGames tile is visible
    Scroll To                                  xpath://section[@class='css-dv60i5 j-container l-layout--flex']

    # Logo of JioGames
    Wait For And Verify Element                xpath://img[@class='l-radius--large']

    # JioGames as text
    Text Verification                          xpath://h5[@class='j-heading j-text-heading-xs']    JioGames   

    # Heading present below the JioGames banner
    Wait For And Verify Content                xpath://h3[@class='j-heading j-text-heading-l']    ${G_heading}
    CSS Verification                           xpath=//h3[@class='j-heading j-text-heading-l']    font-weight     900

    # Scroll Till SubHeading is visible 
    Scroll To                                  xpath://p[@class='j-text j-text-body-m']

    # SubHeading text verification
    Wait For And Verify Content                xpath://p[@class='j-text j-text-body-m']    ${G_Subheading}

Distinguished features of Jio 4K Set Top Box section 
    # Verfies the card present under Distinguished features of Gaming section
    Scroll To                                  xpath://section[@aria-label='Distinguished features of Gaming']//div[@class='j-grid']
    Verify Tiles are present under Distinguished features    4 

Watch more about TV Video calling section JioGames   
    # 'Watch more about Gaming' section is visible
    Section Verification                       xpath://section[@aria-label='Watch more about Gaming']//div[@class='j-grid']     Watch more about Gaming 
    Verify Functionality of Video cards    3

Best Selling JioFiber Accessories section JioGames   
    # Redirection and UI of Best Selling JioFiber Accessories
    Best Selling JioFiber Accessories section

More from Jio section JioGames   
    # Redirection of cards of More from Jio section 
    More from Jio section
    
