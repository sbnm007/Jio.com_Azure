*** Settings ***
Library                        SeleniumLibrary
Library                        Dialogs
Resource                       ../../../Common.robot
Resource                       ../Services_PO/RedirectionToSevices.robot
Resource                       ../../../Excel_Activity.robot
Resource                       ../../../Local_Keywords.robot
Variables                      ../../../../Tests/Fiber/FServices_Variables.yaml



*** Keywords ***
Jio set top box page
    Landing on Jio setup box page
    Verify the UI & Content Of Set Top Box Page Which Appears After Clicking 'Learn More' Button
    Banner section of Jio Setup box page
    Jio setup box section
    Jio_Set_Top_Box.Distinguished features of Jio 4K Set Top Box section
    See how Jio HD Set-top Box works Section
    Best Selling JioFiber Accessories section
    More from Jio section
    FAQs section

Verify the UI & Content Of Set Top Box Page Which Appears After Clicking 'Learn More' Button 
    
    # Verify Whether Banner Is Present On The Redirected Page Or Not.
    Wait For And Verify Element         xpath://section[contains(@aria-label,"India’s first-ever Set-top Box with OTT") and @role="promo-banner"]
    
    # Veriy Whether Heading 'Jio Set Top Box' Is Present Or Not.
    Text Verification                  xpath://h5[@class="j-heading j-text-heading-xs"]           Jio Set Top Box
    
    # Verify Whether SubText Under Heading Is Present Or Not.
    Text Verification                   xpath://h3[@class="j-heading j-text-heading-l"]  ${STB_heading}
    Text Verification                   xpath://p[@class="j-text j-text-body-m"]  ${STB_Subheading}
   
    # Verify GetJio Fiber is present or not.
    Wait For And Verify Element         xpath://button[normalize-space()="Get JioFiber"]
    
    # Verify Whether Section With Heading 'Distinguished features of Jio 4K Set Top Box​' Is Present Or Not.  
    Wait For And Verify Element         xpath://*[@aria-label="Distinguished features of Jio 4K Set Top Box​"]
    
    # Verify Whether Section With Heading 'See how Jio HD Set-top Box works​' Is Present Or Not.  
    Wait For And Verify Element         xpath://section[@aria-label="See how Jio HD Set-top Box works"]
    
    # Verify Whether Section With Heading 'Best Selling JioFiber accessories' Is Present Or Not.
    Wait For And Verify Element         xpath://*[@aria-label="jioaccessories"]
    
    # Get The Cards Present Under 'Best Selling JioFiber accessories' Section
    ${card_count} =  Get Element Count  xpath://*[@aria-label="jioaccessories"]//div[@class="h-100"]

    # Match The Number Of Cards Present To Exact Of 3.
    Should Be Equal As Integers    ${card_count}    3        
    #Verifying card elements 
    FOR    ${i}    IN RANGE    1    4
        Wait For And Verify Element    xpath://div[@class="j-card h-100 css-1ct4ytz size--xxs card-vertical j-card__has-fullCardCTA j-card__shadow"]['${i}']    
    END
    # Verify The Presence Of Button Just Below 'Best Selling JioFiber accessories' Section
    Wait For And Verify Element         xpath://*[@aria-label="jioaccessories"]//div[text()="View all accessories"]
    
    # Verify The Presence Of 'More From Jio' Section
    Wait For And Verify Element         xpath://section[@aria-label="More from Jio"]
    
    # Verify The Presence Of 'FAQs' Section
    Wait For And Verify Element         xpath://section[@aria-label="faqs section"]

Landing on Jio setup box page

    # Scrolling down to Extraordinary Experiences section
    Scroll To                           xpath://h3[text()="Extraordinary experiences"]

    # Clicking on Learn more button of "With Jio setup box....." tile
    Redirect and continue               xpath://div[contains(@aria-label,"Jio Set Top Box")]//button[@class="j-button j-button-size__medium tertiary"]    https://www.jio.com/jcms/jiofiber/services/jio-set-top-box/    SC_SetupboxURL


Banner section of Jio Setup box page
    Verify Banner redirection

Jio setup box section
    Verify Get JioFiber button redirection

Distinguished features of Jio 4K Set Top Box section
    Scroll To                           xpath://section[contains(@aria-label,"Distinguished features of Jio 4K Set Top Box")]
    Verify Tiles are present under Distinguished features    5

See how Jio HD Set-top Box works Section
    Scroll To                           xpath://section[@aria-label="See how Jio HD Set-top Box works"]
    Verify Functionality of Video cards    4

FAQs section
    Verify Functionality of accordians of FAQs section    5
    
