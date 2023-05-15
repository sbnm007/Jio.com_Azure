*** Settings ***
Resource                                      ../../../../Local_Keywords.robot

*** Keywords ***
Checking UI of Accessories Cards
    #Scrolling products into view
    Scroll To                                 xpath=(//div[contains(@class, "product-container")]//div[@class="pop-prod-title"])[${i}]
    Image Verification                        xpath=(//div[contains(@class, "product-container")]//img[@class="product__image"])[${i}]
    Checking Product Name
    Checking Product Specs
    Checking Product Price
    Checking Redirection on Product