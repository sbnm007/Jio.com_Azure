*** Settings ***
Resource                            ../../../../Local_Keywords.robot

*** Keywords ***
Checking UI of Smartphone Cards
    
    #Scroll down to specific smartphone cards
    Scroll To                       xpath=(//div[contains(@class, "product-container")]//div[@class="pop-prod-title"])[${i}]
    #Verifying Image is present on Smartphone cards
    Image Verification              xpath=(//div[contains(@class, "product-container")]//img[@class="product__image"])[${i}]
    Checking Product Name
    Checking Product Specs
    Checking Product Price
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