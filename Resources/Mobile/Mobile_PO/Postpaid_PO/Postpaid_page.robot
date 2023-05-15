*** Settings ***
Library                              SeleniumLibrary
Variables                           ../../../../Tests/Mobile/MPrepaid_Variables.yaml
Resource                            ../../../../Resources/Excel_activity.robot
Resource                            ../../../../Resources/Local_Keywords.robot

*** Keywords ***

Verifying options selected on header on postpaid page
    
    #Verify the options selected on Top navigation bar
    CSS Verification                                             xpath:(//a[normalize-space()='Mobile'])    text-decoration-line    underline
    #Element Attribute Value Should Be                            xpath://li[@onclick="window.location.href='/selfcare/plans/mobility/postpaid-plans-home/'"]    class    cursor-pointer  

Verify Redirection of Top Banner of Postpaid Page
    
    #Banner Verification
    Banner Content Verification                                  xpath=//div[@class="Banner_header__sq7Ie j-text j-text-heading-l"]      Now experience postpaid like never before                                   xpath=//div[@class="Banner_imageCss__59oo6"]//img                                 xpath=//div[normalize-space()='View plans']     MobPrepaid_TopBanner
    
    #Banner Redirection
    Redirection On Clicking                                      xpath=//div[normalize-space()='Explore JioPlus']            https://www.jio.com/jioplus        TopBanner_Redirection
    
Verify of Top selling postpaid plans section of Postpaid Page
    Scroll To                                                    xpath://div[@class='Details_detailsCont__iCgow'] 
    ${card_count}=    Get Element Count                          xpath://section[@class='j-container bg--primary-20 l-radius--xl']    
    IF  ${card_count} != 3
      Fail    msg=Images are more or less
    END

Verify of Already a Jio Postpaid section of Postpaid Page
    Scroll To                                                    xpath=(//ul[@class='react-multi-carousel-track '])[1]
    Wait For And Verify Element                                  xpath=(//ul[@class='react-multi-carousel-track '])[1]



Verify Infographics section of Postpaid Page

    #Scrolls till The ist image is visible
    Scroll To                                                    xpath=(//div[contains(@class,"no-bottom-padding j-card__shadow")])[1]
    
    #Verifies the 1st image
    Wait For And Verify Element                                  xpath=(//div[contains(@class,"no-bottom-padding j-card__shadow")])[1]  
    
    #Scrolls till the 2ndimage is visible
    Scroll To                                                    xpath=(//div[contains(@class,"no-bottom-padding j-card__shadow")])[2]                        
    
    #Verifies the 1st image
    Wait For And Verify Element                                  xpath=(//div[contains(@class,"no-bottom-padding j-card__shadow")])[2]  
    
    #Text Verification
    Text Verification                                            xpath=//div[normalize-space()='Non-stop entertainment']    Non-stop entertainment
    Text Verification                                            xpath=//div[normalize-space()='Share data with family']    Share data with family
    
    #Scrolls Till ZERO Security section
    Scroll To                                                    xpath=(//div[@class="Carousel_carouselCss__36KmD"]//ul[@class="react-multi-carousel-track "])[1]
    
    #Verifies the card present    
    Wait For And Verify Element                                  xpath=(//div[@class="Carousel_carouselCss__36KmD"]//ul[@class="react-multi-carousel-track "])[1]

Verify One plan ,many benefits section
    Scroll To                                                    xpath=//div[@class='PrepaidBenefits_grid__1WNur j-grid']
    Wait For And Verify Element                                  xpath=//div[@class='PrepaidBenefits_grid__1WNur j-grid']

Verify and Validate Discover more possibilities Section of Postpaid Page

    #Discover More With Jio Main Heading
    Scroll To                                                         xpath=//section[@class='plans_carouselContainer__2OiMK j-container']
    Text verification                                                 xpath=//div[contains(@class,'j-text j-text-heading-m') and contains(text(),"Discover more possibilities")]    Discover more possibilities

    #Banner Text Varification
    ${elements}=    Get WebElements                                   xpath=//div[@class="j-promo-card__content"]//div[@class="j-text j-text-heading-s"]
    ${i}  Set Variable  0
    ${j}  Set Variable  1 
    FOR  ${element}  IN  @{elements}
        Banner Content Verification  ${element}   ${DJ_Title}[${i}]   xpath=(//section[@class="promoCards_promoCardStyle__1KLDk j-container"]//div[@class="j-promo-card__image ratio-landscape"]//img)[${j}]   xpath=//div[@class="j-button-group"]//div[normalize-space()="${DJ_Button}[${i}]"]     ${DJ_Button}[${i}]
        ${i}=   Evaluate     ${i} + 1
        ${j}=   Evaluate     ${j} + 1
    END

Verify FAQ section is visible
    Scroll To                                                         xpath=//section[@class='faqSection_faqContainer__3KZiU j-container']
    Wait For And Verify Element                                       xpath=//section[@class='faqSection_faqContainer__3KZiU j-container']
    
    Scroll To                                                         xpath=//div[@class='j-text j-text-heading-m'][normalize-space()='Unlimited calls & SMS, International Roaming, and more with Jio Postpaid']
    Text Verification                                                 xpath=(//div[@class='j-text j-text-body-s'])[2]   ${Subtext}[0]
    Text Verification                                                 xpath=(//div[@class='j-text j-text-body-s'])[3]   ${Subtext}[1]

Verifying View All Plans Button Redirection on Postpaid Page

    ${elements}=    Get WebElements                                   xpath=//div[@class="plans_buttonMobile__1bWl_"]
    ${length}=                          Get Length     ${elements}
    FOR     ${i}    IN RANGE   1  ${length}+1
        ${Pack_Name}=       Take Element Text                         xpath=(//div[@class="plans_buttonMobile__1bWl_"])[${i}]
        Wait For And Click Element                                    xpath=//button[@aria-label="button ${Pack_Name}"]
        
        IF  "${Pack_Name}" == "ISD"
            Wait For And Verify Content                               xpath=//div[@class="j-text j-text-heading-l"]         ${Pack_Name} mobile plans
        
        ELSE IF     "${Pack_Name}" == "International Roaming"
            Wait For And Verify Element                               xpath=//div[contains(text(),'Get the best plans ever')]

        ELSE IF     "${Pack_Name}" == "JioPhone"
            Wait For And Verify Content                               xpath=(//div[@class="Filter_header__EkHAT"]//h1)[1]         ${Pack_Name} Recharge Plans

        ELSE
            Wait For And Verify Content                               xpath=(//div[@class="Filter_header__EkHAT"]//h1)[1]         ${Pack_Name}
        END
        Take Page Screenshot                       ${i}_${Pack_Name}_Redirection
        Log To Console                             ${Pack_Name}_Verified
        Go Back
        Sleep                               100ms
    END

