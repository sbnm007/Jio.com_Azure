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
Scroll Down to Giga-fast fun time-JioTV+

    # Scroll To till JioTV+ is visible 
    Scroll To                                          xpath://div[@aria-label='JioTV+']//a[@aria-label='false']  

    # Waits until Learn More button of JioTV+ is visible  
    Wait For And Verify Element                      xpath://div[@aria-label='JioTV+']//div[contains(text(),'Learn more')]   

    # Clicks on Learn More button of JioTV+m tile is visible    
    Wait For And Click Element                         xpath://div[@aria-label='JioTV+']//div[contains(text(),'Learn more')]   
    

    #Verifying the Banner
    Banner Content Verification                        xpath://h4[contains(text(),'Superfast home internet with the same upload and d')]    Superfast home internet with the same upload and download speed    //img[@src='https://jep-asset.akamaized.net/cms/assets/jiofiber/apps/jiotvplus/homenet-banner.png']    (//div[contains(text(),'Get JioFiber')])[3]    JioTV+_Banner
    #Jiotv+ICon
    Wait For And Verify Element                        xpath://div[@class='l-layout--centered j-listBlock align-middle']//div[@class='j-listBlock__prefix'] 
    # Verifyfing TV Plus title with subtext
    Text Verification                                  xpath:(//h5[normalize-space()='TV Plus'])[1]                                         TV Plus
    Text Verification                                  xpath:(//h3[normalize-space()='Every TV will now be SMART!'])[1]                     Every TV will now be SMART!
    
    #Verifying the JioFIber Button
    Button Verification                                 xpath:(//button[@aria-label='Get JioFiber'])[1] 
    
    # Verifying 'Distinguished features of JioTV Plus' Section
    Section Verification                                xpath:(//section[@aria-label='Distinguished features of JioTV Plus'])[1]             'Distinguished features of JioTV Plus'_Section 
    
    # Verfying 'See How Jio Set-top box works' Section
    Section Verification                                xpath:(//section[@aria-label='See how Jio Set-top Box works'])[1]                    'See how Jio Set-top Box works'_Section
    
    # Verifying 'Bestselling JioFiber Accessories' Section
    Section Verification                                xpath:(//section[@aria-label='jioaccessories'])[1]                                   'Best Selling JioFiber Accessories'_Section
    
    #Loop to verify the cards in 'Bestselling JioFiber Accessories' Section
    ${Card_Count}=    Get Element Count                 xpath:(//section[@aria-label='jioaccessories'][1])//div[@class='h-100']
    Log To Console    ${Card_Count}    
    FOR  ${i}  IN RANGE    1    ${Card_Count}+1
        Wait For And Verify Element                 xpath:(//section[@aria-label='jioaccessories'][1])//div[@class='h-100'][${i}] 
    END
    
    # Verifying 'View all accessories' Button
    Button Verification                                 xpath:(//button[@aria-label='View all accessories'])[1]
    
    # Verifying 'More from Jio' Section
    Section Verification                                xpath:(//section[@aria-label='More from Jio'])[1]                                    'More from Jio'_Section
    # Clicks on the Banner
    Banner Redirection                                  xpath://section[@aria-label='Superfast home internet with the same upload and download speed']    NULL   JioTV+_banner
    
    # Waits until banner is visible
    Wait For And Verify Element                         xpath://section[@aria-label='Superfast home internet with the same upload and download speed']    
    

    # Clicks on Get JioFiber button
    Verify Get JioFiber button redirection    

    # Wait until banner is visible
    Wait For And Verify Element                         xpath://section[@aria-label='Superfast home internet with the same upload and download speed']    

    # Verifies the card present in Distinguished features of JioTV Plus section 
    Scroll To                                           xpath://section[@aria-label='Distinguished features of JioTV Plus'] 
    ${card_count}=    Get Element Count                 xpath://div[@class="j-card h-100 css-1x6are8 size--xs card-vertical no-top-padding"]     
    Log To Console    ${card_count}    
    IF  ${card_count} != 5
      Fail    msg=Images are more or less
    END
    
    Scroll To                                           xpath://section[@aria-label='See how Jio Set-top Box works']//a
    ${video}=    Get Element Count                      xpath://section[@aria-label='See how Jio Set-top Box works']//a
    Log To Console    ${video}
    ${video_count}=   Get Element Count                 xpath://*[@aria-label="See how Jio Set-top Box works"]//a[@class="j-link j-card__hidden-cta"]
    Log To Console    ${video_count}
    # Plays Video present under Jio Set-top Box works section 
    FOR  ${i}  IN RANGE    ${video_count}
        Wait For And Click Element                      xpath:(//*[@aria-label="See how Jio Set-top Box works"]//a[@class="j-link j-card__hidden-cta"])[${i+1}]

        # Waits till cross icon is visible
        Wait For And Verify Element                     xpath://button[@class='j-button j-button-size__medium tertiary icon-primary icon-only'] 

        # Selects the frame of the video   
        Select Frame                                    xpath://iframe[contains(@allow,'autoplay; fullscreen;')] 

        # Waits until the title is visible while playing the video 
        Wait Until Element Is Enabled                   xpath://a[@class='ytp-title-link yt-uix-sessionlink']    timeout=15s

        # Verifies the title
        Wait For And Verify Element                     xpath://a[@class='ytp-title-link yt-uix-sessionlink'] 

        # Waits till the title disappears from the video
        Wait Until Element Is Not Visible               xpath://a[@class='ytp-title-link yt-uix-sessionlink']     timeout=10s
        
        # Unselects the frame
        Unselect Frame   

        # Clicks on cross icon which is present at top right corner                      
        Wait For And Click Element                      xpath:(//button[@aria-label='button'])[3]  

        Continue For Loop
    END
    #Sleep        2s

    # Clicks on the images present under Best Selling JioFiber accessories

    ${images} =  Get Element Count                      xpath://section[@aria-label="jioaccessories"]//a
    Log To Console    ${images}
    # Gets the count of images 
    ${card_count} =  Get Element Count                  xpath://*[@aria-label="jioaccessories"]//div[@class="h-100"]
    Log To Console    ${card_count}    
    @{URL} =  Set Variable  https://www.jio.com/shop/en-in/bluetooth-game-controller-jgc-100/p/491894897  https://www.jio.com/shop/en-in/jioextender6-mesh-wi-fi-system/p/491894637  https://www.jio.com/shop/en-in/usb-camera/p/491581400

    FOR  ${i}  IN RANGE    ${images}    
        Redirection On Clicking                          xpath://section[@aria-label="jioaccessories"]//div[@class="h-100"][${i+1}]  ${URL}[${i}]    Products 
        Continue For Loop
    END
    

    # Clicks on View all accessories button present below Best Selling JioFiber accessories section
    Redirection On Clicking                              xpath://button[@aria-label='View all accessories']    https://www.jio.com/shop/en-in/c/jioaccessories    View All Accessories     

    ${Banner}=    Get Element Count                      xpath://section[@aria-label="More from Jio"]//section[@role="promo-banner"]
    Log To Console    ${Banner}    
    # Clicks on Banner present under More from Jio section
    FOR  ${i}  IN RANGE  ${Banner}
        Redirection On Clicking                          xpath://section[@aria-label="More from Jio"]//section[contains(@class,"h-100")][${i+1}]//section[@role="promo-banner"]  https://www.jio.com/selfcare/interest/fiber/      More from Jio Banner
    END
    
    
