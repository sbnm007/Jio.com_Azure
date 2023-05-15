***Settings***
Library                                    SeleniumLibrary
Resource    ../../Common.robot

***Keywords***
Home Page UI Elements Validation
    #TopNav
    Section Verification                   xpath=//div[@class='j-header__grid']     Top_Nav

    #Carousel Banners
    Section Verification                   xpath=//section[@class='j-container max-width-container masthead-slick fullscreen-slick-dots slick-initialized slick-slider slick-dotted']     Carousel_Banner

    #Quick Action Buttons
    Section Verification                   xpath=//section//div[contains(@class,'j-container card-thumbnail-container')]//div[@class='d-flex flex-wrap justify-content-center icon-wrapper']    Quick_Action

    #Title Verification
    ${True5G_Banner}=    Get WebElements        xpath=//h2[@class='j-contentBlock__title j-heading j-text-heading-l']
    FOR  ${Banner}  IN  @{True5G_Banner}
        Wait For And Verify Element        ${Banner}
    END
    
    #Select your state dropdown
    Wait For And Verify Element            xpath=//span[@id='select2-select__trigger1-container']

    #Explore Now button verification
    Wait For And Verify Element            xpath=//button[@class='j-button j-button-state__default j-button-size__medium primary w-auto']
    
    #Mobile, JioFiber and Business
    Section Verification                   xpath=//div[@class='l-layout--max-width']//div[@class='j-grid']    Mobile_JioFiber_Business

    #Enrich your digital life
    Section Verification                   xpath=//section[@class='j-grid video__custom_grid ']        Enrich_Your_Digital_Life
    
    #Walking Carousel
    Section Verification                   xpath=//section[@class="j-container max-width-container"]      Walking_Carousel

    #Spotlight Section
    Section Verification                   xpath=//div[@class='j-card size--s j-card__shadow p-0 bg--primary-background']  Spot_Light

    #Three Shopping Sections
    ${Shopping_cards}=    Get WebElements        xpath=//div[contains(@class,"j-promo-card__has-CTA no-children h-100 theme--jiomart")]
    ${Shopping_CardCount}  Set Variable   0
    FOR  ${Cards}  IN  @{Shopping_cards}
        #Wheel Down      1
        Section Verification               ${Cards}      Shopping_${Shopping_CardCount}
        ${Shopping_CardCount}=   Evaluate       ${Shopping_CardCount} + 1
    END

    #Three product cards
    ${Products_Cards}=    Get WebElements        xpath=//div[@style="justify-content: flex-end"]
    ${Products_Count}  Set Variable   0                      
    FOR  ${Products_Section}  IN  @{Products_Cards}
        #Wheel Down      1
        Section Verification               ${Products_Section}     Products_${Products_Count}
        ${Products_Count}=   Evaluate       ${Products_Count} + 1
    END

    #Career Banner
    Section Verification                   xpath=((//div[@class='j-card j-fullwidth-banner p-0'])[1])       Job_Openings 

    #Making a diiference
    Section Verification                   xpath=//section[@class='j-container bg--primary-grey-20']        Success_Stories
  
    #Business Banner
    Section Verification                   xpath=((//div[@class='j-card j-fullwidth-banner p-0'])[2])       Jio_Business
    
    #One App For Everything Jio
    Section Verification                   xpath=//section[@class='j-container bg--secondary-20']//div[@class='l-layout--max-width']        QR_Code

    #Need Guidance?
    Section Verification                   xpath=//section[@class='j-container bg--primary-background']        Need_Guidance

#Validating Text and their respective logos from Quick Action Section
Quick Action Section Verification
    ${buttonlist}=    Get WebElements      xpath=//a[@class='txt-align--center icon-circle-transition secondary']
    ${QuickAction_Buttons}  Set Variable   0
    FOR  ${button}  IN  @{buttonlist}
        Wait For And Verify Element       ${button}
        Text Verification       ${button}      ${Quick_Action}[${QuickAction_Buttons}]
        ${QuickAction_Buttons}=   Evaluate       ${QuickAction_Buttons} + 1
    END




