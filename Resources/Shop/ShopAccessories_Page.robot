*** Settings ***
Library                                    SeleniumLibrary
Resource                                   ../Local_Keywords.robot
Resource                                   ShopPage_PO/Accessories_PO/Redirection_To_Accessories.robot
Resource                                   ShopPage_PO/Accessories_PO/Buy_Any_Product.robot
Resource                                   ShopPage_PO/Accessories_PO/AccessoriesPagePO/MostPop_MostVal.robot
Resource                                   ../../Resources/Shop/ShopPage_PO/Accessories_PO/AccessoriesPagePO/All_Products.robot
Resource                                   ../../Resources/Shop/ShopPage_PO/Accessories_PO/AccessoriesPagePO/Filter_Button.robot
Resource                                   ../../Resources/Shop/ShopPage_PO/Accessories_PO/AccessoriesProductPagePO/Product_Details.robot

*** Keywords ***
Check functionality to Payment Method page
    Landing on Accessories Page
    Add To Cart Game Controller To Payment Page

Check 'Most Popular' and 'Most Value' sections UI and Functionality
    Landing on Accessories Page
    Checking UI of Accessories Most Popular and Most Value Section

Check Each Accessories Product UI and Functionality
    Landing on Accessories Page
    Full UI Accessories

Check Show Filter UI and Functionality
    Landing on Accessories Page
    Checking Filter UI
    Checking PriceRange Filter UI
    Checking Filter Brand UI
    Checking Filter Category UI

Full UI Accessories
    Scroll To                                 xpath://div[@class='col-lg-12 prod-title-wrap']
    Wait For And Verify Content               xpath://div[@class='col-lg-12 prod-title-wrap']    All Products
    ${names} =    Get Element Count           xpath://div[contains(@class, "product-container")]
    FOR  ${i}  IN RANGE    1    ${names+1}
        Set Test Variable    ${i}
        Checking UI of Accessories Cards
        Checking UI of Accessories Product Page
        Checking UI and functionality of Pincode and Delivery Section
        Checking Accordion Functionality
        Delete All Cookies
        Go Back
    END
    Scroll To                                  xpath://div[@class='footer-wrapper']
    Wait For And Verify Element                xpath://div[@class='footer-wrapper']

