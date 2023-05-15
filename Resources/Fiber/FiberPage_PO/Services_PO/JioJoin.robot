*** Settings ***
Library                 SeleniumLibrary
Library                 Dialogs
Resource                ../../../Common.robot
Resource                ../Services_PO/RedirectionToSevices.robot
Resource                ../../../Excel_Activity.robot
Resource                ../../../Local_Keywords.robot
Variables               ../../../../Tests/Fiber/FServices_Variables.yaml




*** Keywords ***

JioJoin page
    Verify the UI & Content Of JioJoin Page Which Appears After Clicking 'Learn More' Button
    Banner section of JioJoin page
    JioJoin section
    Distinguished features of Jio 4K Set Top Box section
    Watch more about TV Video calling section JioJoin
    Best Selling JioFiber Accessories section JioJoin
    More from Jio section JioJoin

Verify the UI & Content Of JioJoin Page Which Appears After Clicking 'Learn More' Button

    # Scroll To till JioJoin tile is visible
    Scroll To                                  xpath://section[@class='j-container l-layout--max-width']//div[@aria-label='JioJoin']

    # Waits until Learn More button of JioJoin is visible  
    Wait For And Verify Element                xpath://div[@aria-label='JioJoin']//div[contains(text(),'Learn more')]    
    
    # Clicks on the Learn More button of JioJoin  
    Redirect and continue                      xpath://div[@aria-label='JioJoin']//div[contains(text(),'Learn more')]    https://www.jio.com/jcms/jiofiber/services/apps/jiojoin/    SC_JioJoinLearnMore 

Banner section of JioJoin page
    
    # Banner verification
    Verify Presence of Banner

    #Banner Redirection 
    Verify Banner redirection

JioJoin section

    # Scroll Till GetJio Fiber button is visible
    Scroll To                                  xpath://button[@aria-label='Get JioFiber']

    # Waits until banner is visible
    Wait For And Verify Element                xpath://button[@aria-label='Get JioFiber']     
    
    # Get JioFiber Button Verification
    Button Verification                        xpath://button[contains(.,'Get JioFiber')]     

    # Click on the GetJio Fiber button
    Redirection On Clicking                    xpath://button[@aria-label='Get JioFiber']    https://www.jio.com/selfcare/interest/fiber/    GetJio Fiber 
    
    # Scroll Till JioJoin tile is visible
    Scroll To                                  xpath://section[@class='css-dv60i5 j-container l-layout--flex']

    # Logo of JioJoin
    Wait For And Verify Element                xpath://img[@class='l-radius--large']

    # Heading Text verification
    Wait For And Verify Content                xpath://h3[@class='j-heading j-text-heading-l']    ${J_heading}
    CSS Verification                           xpath://h3[@class='j-heading j-text-heading-l']    font-weight     900

    # Scroll Till Subtext is visible
    Scroll To                                  xpath://p[@class='j-text j-text-body-m']

    # Subtext verification
    Wait For And Verify Content                xpath://p[@class='j-text j-text-body-m']     ${J_Subheading}         

Distinguished features of Jio 4K Set Top Box section                      
    Verify Tiles are present under Distinguished features    4

Watch more about TV Video calling section JioJoin  
    # Scroll Till Watch more about TV Video Calling section is visible
    Section Verification                       xpath://section[@aria-label='Watch more about TV Video Calling']//div[@class='j-grid']   Watch more about TV Video Calling
    Verify Functionality of Video cards    3

Best Selling JioFiber Accessories section JioJoin
    # Redirection and UI of Best Selling JioFiber Accessories
    Best Selling JioFiber Accessories section  

More from Jio section JioJoin
   # Redirection of cards of More from Jio section 
    More from Jio section                    

