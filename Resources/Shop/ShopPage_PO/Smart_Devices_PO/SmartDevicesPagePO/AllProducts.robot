*** Settings ***
Resource                        ../../../../Local_Keywords.robot
Resource                       ../SmartDevicesProductPagePO/ProductDetails.robot

*** Keywords ***
Checking UI of SmartDevices Cards
    #Scroll to Product Title
    Scroll To                   xpath=(//div[contains(@class, "product-container")]//div[@class="pop-prod-title"])[${i}]

    #Verify Product Image
    Image Verification          xpath=(//div[contains(@class, "product-container")]//img[@class="product__image"])[${i}]

    #Verify Product Name
    Checking Product Name

    #Verify Product Specifications
    Checking Product Specs

    #Verify Product Price
    Checking Product Price

    #Verify Redirection on clicking on Product
    Checking Redirection on Product

Full UI Smart Devices
    #Get Element Count of products listed under All Products
    ${names} =    Get Element Count     xpath=//div[contains(@class, "product-container")]

    #FOR Loop to Check UI of products listed under All Products
    FOR  ${i}  IN RANGE    1    ${names+1}
        Set Test Variable    ${i}
        Checking UI of SmartDevices Cards
        Checking UI of SmartDevices Product Page
        Checking UI and functionality of Pincode and Delivery Section
        Checking Accordion Functionality
        Delete All Cookies
        Go Back
    END

    #Scroll down and Verify Footer Section 
    Scroll To                          xpath=//div[@class='footer-wrapper']
    Wait For And Verify Element         xpath=//div[@class='footer-wrapper']