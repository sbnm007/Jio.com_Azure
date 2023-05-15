*** Settings ***
Library    SeleniumLibrary
Library    Dialogs
Resource    ../../../Common.robot
Resource    ../Services_PO/RedirectionToSevices.robot
Resource    ../../../Excel_Activity.robot
Resource    ../../../Local_Keywords.robot
Variables       ../../../../Tests/Fiber/FServices_Variables.yaml

*** Keywords ***
Services Page
    Confirm the UI elements and content of 'Services' page
    Confirm redirection of banner at the top of service page
    Scroll to "Extraordinary Services" and check content

Confirm the UI elements and content of 'Services' page
    Wait Until Keyword Succeeds    30 sec    0 sec    CSS Verification    xpath://li[@onclick="window.location.href='/jcms/jiofiber/services/'"]    border-bottom-color    rgba(232, 232, 252, 1)
    
    #Banner Section Verification
    Section Verification                         xpath://section[@class="h-100 css-fhrios j-container"]  Services Banner

    # Text Verification of Giga-fast fun time section
    Text Verification                            xpath=//h3[normalize-space()='Giga-fast fun time']    Giga-fast fun time
    
    #Section Verification of Giga-fast fun time
    Section Verification                         xpath:(//section[@class='j-container l-layout--max-width']//div[@class="j-grid" and @style='--grid-template: 1fr 1fr 1fr; --grid-template-tablet: 1fr 1fr; --grid-template-mobile: 1fr; --grid-gap: var(--spacing-base); --grid-align: center;'])  Giga Fast Fun Time Cards
    
    # Section Verification of Extraordinary experiences
    Section Verification                         xpath:(//section[@class='j-container l-layout--max-width']//div[@class="j-grid" and @style='--grid-template: repeat(3, 1fr); --grid-template-tablet: repeat(2, 1fr); --grid-template-mobile: 1fr; --grid-gap: var(--spacing-base); --grid-align: center;'])  Extraordinary Experiences Cards
    
Confirm redirection of banner at the top of service page
    Banner Redirection                           xpath://div[@class="j-promo-card__content-body"]   NULL   Services

Scroll to "Extraordinary Services" and check content
    
    # Click On The Link Present In Sub Nav Bar
    Wait For And Click Element                   xpath://a[text()="Services"]
    
    # To Verify Heading And Sub Heading Present On The Respective Page
    Verify Heading & Sub-Heading                 xpath://h3[text()="Extraordinary experiences"]    xpath://p[text()="Next-level home solutions enabled by giga-fast JioFiber."]
    
    # Loop To Iterate Present Under ExtraOrdniary Services Section(EOS)

    ${Number_of_cards} =	Get Element Count    xpath=//div//a[@aria-label='[object Object]']
    
    Should Be Equal As Integers	${Number_of_cards}	4  #As there are 4 buttons
    
    FOR  ${EOS_Heading}  IN  @{EOS}            
        Wait For And Verify Element              xpath=//div[@aria-label="${EOS_Heading}"]//div[contains(text(),'Learn more')]  
    END
    
    # Capture Element Screenshot Of Mentioned Section
    Take Element Screenshot                      xpath://*[text()="Extraordinary experiences"]//ancestor::section[@class="j-container"]  C:\\JioFiber\\Results\\FiberPage\\Services\\Screenshots\\GetJioFiber\\VerifiedUI.png
    
