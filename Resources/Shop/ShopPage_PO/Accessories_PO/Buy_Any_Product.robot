*** Settings ***
Library                                            SeleniumLibrary
Resource                                           ../../../Common.robot
Resource                                           ../../../Excel_Activity.robot
Resource                                           ../../../Local_Keywords.robot

*** Keywords ***
Add To Cart Game Controller To Payment Page
    Reading Data of Add to Cart Personal Details
    # Click on Bluetooth Controller Product
    Take Page Screenshot                           Accessories_Page
    Wait For And Click Element                     xpath=(//div[contains(@class,"most-pop-cont")])[2]
    
    # Entering Pincode Where Product Is Available
    Wait For And Input Text                        xpath=//input[@id="address.postcode"]    ${PIN_Code}
    
    # Click on Check Button
    Wait For And Click Element                     xpath=//button[@id="pincode-button"]
    Take Page Screenshot                           Pincode_Verified
    
    # Click On Add To Cart Button
    Wait For And Click Element                     xpath=//button[@id="AddToCartBTN"]
    
    #Verifying Content Of Popup After Clicking Add to Cart Button
    Verifying Content & Redirection Of Popup Functionality

    #Personal Details Page (Entering Personal Details)
    Personal Details Page Functionality
    
    # Delivery Address Page (Entering Address Information)
    Delivery Address Page Functionality

    # Verifying Payment method Page
    Payment Method Page Functionality
