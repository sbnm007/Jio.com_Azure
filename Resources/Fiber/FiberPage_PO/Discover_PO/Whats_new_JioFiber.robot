*** Settings ***
Library    SeleniumLibrary
Resource    ../../../Common.robot

*** Keywords ***
#TC ID:91911-91914
Whats new in JioFiber Validation
    #Scrolling to Whats new in JioFiber section
    Scroll To                          xpath://h2[contains(text(),'${whatsNew_text}[0]')] 

    #To Verify What's new section visibility
    Section Verification               xpath=//section[@class='j-container l-layout--max-width-narrow theme--jiocinema']        What'sNewInJioFiber
    
    #Verifying heading   
    Text Verification                  xpath://h2[contains(text(),'${whatsNew_text}[0]')]         ${whatsNew_text}[0] 
    
    #Verifying text below heading    
    Text Verification                  xpath://div[normalize-space()='${whatsNew_text}[1]']       ${whatsNew_text}[1]  
    
    #Visibility of 3 tiles
    ${elements}=    Get WebElements    xpath:(//div[@class="overflow-scroll-max-width j-content-layout l-layout--max-width j-content-layout__layout-3-col-even carousel-card-wrap common_card_row_carousel_function equal_height_card grid-j-card"])[1]
    FOR  ${element}  IN  @{elements}
        Wait For And Verify Element  ${element}
    END

    #For checking Images, headings, texts and buttons of the tiles
    FOR     ${in}    IN RANGE    0    3
        Image Verification             xpath://img[@src='${img_src}[${in}]']
        
        #Verifying heading
        Text Verification              xpath://h4[normalize-space()='${tiles_heading}[${in}]']     ${tiles_heading}[${in}]
        
        #Verifying text below heading
        Text Verification              xpath://div[normalize-space()='${tiles_subtext}[${in}]']    ${tiles_subtext}[${in}]
        
        #Verifying buttons
        Wait For And Verify Element    xpath://div[contains(text(),"${tiles_button}[${in}]")]                          
     
        ${in}=    Evaluate    ${in} + 1
    END

    #To Verify Explore JioTV+ button redirection
    Redirection On Clicking            xpath=//div[contains(text(),'Explore JioTV+')]        ${URLs_WhatsNew}[0]        JioFiberTV+
   
    #To Verify Get JioJoin,it's FREE button redirection
    Redirection On Clicking            xpath=//button[@onclick="GANewHomepagesDS('Get JioJoin, its FREE-Enjoy TV video calling','Promo banner','revamped_jiocom');gotoURLGeneric('/jiofiber-services-tv-video-calling','')"]        ${URLs_WhatsNew}[1]        JioJoin
   
    #To Verify Learn about JioPhotos button redirection
    Redirection On Clicking            xpath=//div[contains(text(),'Learn about JioPhotos')]        ${URLs_WhatsNew}[2]        JioPhotos
    