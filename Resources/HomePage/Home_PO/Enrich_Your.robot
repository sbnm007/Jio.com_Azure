***Settings***
Library                             SeleniumLibrary
Resource                            ../../Local_Keywords.robot

***Keywords***
Enrich Your Section Validation

    #Scrolls Till Banner is visible of Enrich Your Section 
    Scroll To                                               xpath=//section[@class='j-grid video__custom_grid ']
    
    Enrich Your Section Content Validation
    # Sleep   200ms
    Walking Carousel Validation 

Enrich Your Section Content Validation  
    
    Take Page Screenshot                                    DigitalLife_Section
    
    #Title Verification
    Text Verification                                       xpath=//div[@class='j-contentBlock__content']//h2[contains(text(),'Enrich')]      ${Enrich_text[0]}
    CSS Verification                                        xpath=//div[@class='j-contentBlock__content']//h2[contains(text(),'Enrich')]      font-weight	 900

    #Subtitle Verification
    Text Verification                                       xpath=//div[@class='j-contentBlock__content']//div[contains(text(),'Stream')]     ${Enrich_text[1]}
    
    #Checking Video playing or not
    Element Attribute Value Should Be                       xpath=//div[@class="video__custom embed-responsive embed-responsive-16by9"]//video   autoplay    true
   
    #Animation
    Wait For And Verify Element                             xpath=//div[@class="content__wrap_custom"]  
    
    #Jiocinema
    Wait For And Verify Element                             xpath=//div[@class='j-badge j-badge-kind__service img-fluid']
    Text Verification                                       xpath=//div[@class='j-contentBlock__content ']//h3[@class='j-contentBlock__title j-heading j-text-heading-m']      ${Enrich_banner_text} 
    CSS Verification 	                                    xpath=//div[@class='j-contentBlock__content ']//h3[@class='j-contentBlock__title j-heading j-text-heading-m']    font-weight	 900
   
    #Start Watching Button
    Wait For And Verify Element                             xpath=//button[normalize-space()='Watch Now'] 
   
    #Click watch Now button and Redirection to Jiocinema Page
    Wait For And Click Element                              xpath=//button[normalize-space()='Watch Now']
  

Walking Carousel Validation    
    
    #Scrolls Till Walking Carousel is visible
    Scroll To                                               xpath=//section[@class='j-container max-width-container'] 
    Wait For And Verify Element                             xpath=//section[@class='j-container max-width-container']
    
    #Gets the count of Walking Carousel
    ${Walking_Carousel_Count}=    Get WebElements                         xpath=//section[@class='j-container max-width-container'] 

    # Gets the length of the walking carousel present
    ${len}=     Get Length  ${Walking_Carousel_Count}
    
    FOR  ${element}  IN  @{Walking_Carousel_Count}

        #Verifies the walking carousel present
        Wait For And Verify Element  ${element}
    END
   
    #Walking Carousel Redirection
    Mouse Over                                              xpath=//button[normalize-space()='Find out more']  
    ${Walking_Carousel}  Set Variable   1
    WHILE  ${Walking_Carousel} != ${len}

        #Clicks on the buttons present in walking carousel
        Wait For and Click Element                          xpath=//button//div[contains(text(),'${Enrich_Walkingcarousel_button}[${Walking_Carousel}]')] 
        # Sleep   200ms   

        #Changes the tab according to the button clicked 
        Change Tab                                          ${Enrich_Walkingcarousel_title}[${Walking_Carousel}]
        
        #Validates URL after the redirection of each button
        URL Validation                                      ${Enrich_Walkingcarousel_urls}[${Walking_Carousel}]
        Take Page Screenshot                                ${Enrich_Walkingcarousel_button}[${Walking_Carousel}]
        Change Tab                                          Jio - Best Prepaid, Postpaid Plans, WiFi Connection & Mobile Apps          
        ${Walking_Carousel}=   Evaluate    ${Walking_Carousel} + 1
    END
   
    # Clicking JioCloud Card
    Redirection On Clicking  xpath=(//div[@class="theme--jiocloud large-card-item marquee-item"])[2]  https://www.jio.com/jcms/apps/jiocloud/  JioCloud Card Redirection
    
    #Hovering on Walking Carousel
    Mouse Over                                              xpath=//section[@class='j-container max-width-container'] 
   
    #Clicking View all button
    Redirection On Clicking                                 xpath=//button[@aria-label="View all apps"]     https://www.jio.com/jcms/apps/      WCApps_page
