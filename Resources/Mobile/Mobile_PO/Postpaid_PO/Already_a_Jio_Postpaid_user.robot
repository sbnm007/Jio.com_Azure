*** Settings ***
Library                              SeleniumLibrary
Library                              Collections
Library                              Dialogs
Resource                            ../../../../Resources/Local_Keywords.robot


***Keywords***

Scroll To 'Already a Jio Postpaid user?' section 
    # Scrolls Till Already a Jio Postpaid user section
    Scroll To                               xpath=(//ul[@class='react-multi-carousel-track '])[1]

Validate the UI elements and content of "Already a Jio Postpaid user" section
    
    FOR  ${i}  IN RANGE  5    8
        # Verifies the title of the card present
        Wait For And Verify Element         xpath=(//section[@class='plans_bottomContainer__3GEg- j-container l-radius--xl'])[${i}]
    END
    #verification of card buttons
    Wait For And Verify Content             xpath=//div[contains(text(),'Learn more')]       Learn more
    Wait For And Verify Content             xpath=//div[contains(text(),'Find out more')]    Find out more
    Wait For And Verify Content             xpath=(//div[contains(text(),'Know more')])[1]   Know more
    
    # Redirects to Learn more button
    Redirection On Clicking                 xpath=//div[contains(text(),'Learn more')]         https://www.jio.com/selfcare/login/mobile/?utm_source=Plans%20page&utm_medium=postpaid-4g-plans&utm_campaign=Increase_now_click    Learn more button of Increase your credit limit
    
    # Redirects to Find out more button
    Redirection On Clicking                 xpath=//div[contains(text(),'Find out more')]      https://www.jio.com/selfcare/login/mobile/?utm_source=Plans%2520page&utm_medium=postpaid-4g-plans&utm_campaign=Activate_now_click    Find out more button of Active International Roaming
    
    # Redirects to know more button
    Redirection On Clicking                 xpath=(//div[contains(text(),'Know more')])[1]     https://www.jio.com/selfcare/autopay/    Know more button of AutoPay
