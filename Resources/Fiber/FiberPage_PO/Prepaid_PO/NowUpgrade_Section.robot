*** Settings ***
Library            SeleniumLibrary

*** Keywords ***
Now upgrade your JioFiber plan anytime UI & Content Validation 
    #To Verify Now Upgrade Visibilty 
    Section Verification              xpath=//div[@class='Banner_bannerOuter__8Gq6B']        NowUpgrade
    
    #To Verify Now upgrade your JioFiber plan anytime Text 
    Text Verification                 xpath=//div[@class='Banner_leftInner__25rzS']//div[@class="Banner_header__sq7Ie j-text j-text-heading-l"]       Now upgrade your JioFiber plan anytime        
    
    #To Verify Sub Text
    Text Verification                 xpath=//div[@class='Banner_leftInner__25rzS']//div[@class="j-text j-text-body-l"]        Easily upgrade your JioFiber plan by just paying the balance amount.
    
    #To Verify How to upgrade button
    Button Verification               xpath=//button[@class="Banner_btn__1m9ub j-button j-button-size__medium primary"]
    Text Verification                 xpath=//button[@class="Banner_btn__1m9ub j-button j-button-size__medium primary"]        How to upgrade
   
    #To Verify Steps To Upgrade Pop-Up by clicking on banner
    Wait For And Click Element        xpath=//div[@class='Banner_bannerOuter__8Gq6B']
    Take Element Screenshot           xpath=//div[@class='j-modal j-modal-visible j-modal-closable j-modal-size-m j-modal-kind-dialog']//div[@class='j-modal-container']        HowToUpgradePopUp
   
#Additional Verification
    #To Verify Cross Button 
    Button Verification               xpath=//div[@class='j-modal j-modal-visible j-modal-closable j-modal-size-m j-modal-kind-dialog']//header[@class='j-modal-header']//button[@aria-label='button']
   
    #To Verify Upgrade Now Button redirection
    Button Verification               xpath=//div[@class='detailsTable_offer__1XuhT']//button
    Redirection On Clicking           xpath=//div[@class='detailsTable_offer__1XuhT']//button        ${UrlsPrepaid}[0]        LoginPage
    
    
          
