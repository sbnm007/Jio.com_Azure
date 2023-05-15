*** Settings ***
Library                                    SeleniumLibrary
Resource                                   ShopPage_PO/Smartphone_PO/RedirectionToSmartphone.robot
Resource                                   ShopPage_PO/Smartphone_PO/SmartphonePagePO/MostPop_MostVal.robot
Resource                                   ../../Resources/Shop/ShopPage_PO/Smartphone_PO/SmartphonePagePO/AllProducts.robot
Resource                                   ../../Resources/Shop/ShopPage_PO/Smartphone_PO/SmartphonePagePO/FilterButton.robot
Resource                                   ../../Resources/Shop/ShopPage_PO/Smartphone_PO/SmartphoneProductPagePO/Product_Details.robot
Resource                                   ../Local_Keywords.robot

*** Keywords ***

Visiting Smartphone Page
    Landing on Smartphone Page

Check 'Most Popular' and 'Most Value' sections UI and Functionality
    Landing on Smartphone Page
    Checking UI of Smartphone Most Popular and Most Value Section

Check Each Smart Devices Product UI and Functionality
    Visiting Smartphone Page
    Checking UI and Functionality Of Smart Devices Product

Checking UI and Functionality Of Smart Devices Product
    ${names} =    Get Element Count         xpath=//div[contains(@class, "product-container")]
    FOR  ${i}  IN RANGE    1    ${names+1}
        Set Test Variable    ${i}
        Checking UI of Smartphone Cards
        Checking UI of Smartphone Product Page
        Checking UI and functionality of Pincode and Delivery Section
        Checking Accordion Functionality
        Delete All Cookies
        Go Back
    END
     Scroll To                              xpath=//div[@class='footer-wrapper']
    Wait For And Verify Element             xpath=//div[@class='footer-wrapper']

Check Show Filter UI and Functionality
    Landing on Smartphone Page
    Checking Filter UI
    Checking PriceRange Filter UI
    Checking Filter Brand UI
