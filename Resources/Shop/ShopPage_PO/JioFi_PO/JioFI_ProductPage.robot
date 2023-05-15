*** Settings ***
Library                           SeleniumLibrary
Resource                          ../../../Common.robot
Variables                         ../../../../Tests/Shop/JioFi_Variables.yaml
Resource                          ../../../../Resources/Local_Keywords.robot


*** Keywords ***
UI and Content of 'JioFi' Tile
    
    # Clicking Jiofi Product Tile
    Wait For And Click Element     xpath=(//div[contains(@class,"product-container")])

    #Verifying The Jio Fi Image & Checking Functionality Of Slideshow
    Image & Slideshow Verification 

    # Verifying Device Heading
    Wait For And Verify Content    xpath=//h2[@itemprop="name"]    JioFi M2S

    # Verifying Sale Price 
    Wait For And Verify Element    xpath=//span[@class="product-price"]

    # Verifying Amount
    Wait For And Verify Element    xpath=//div[@class='discount-block']

    # Verifying Bullet Description
    Wait For And Verify Element    xpath=//div[@class='description-content']

    # Verifying Bank By Clicking 'View Details' Button
    Bank Verification Button

    #  View All Specificatin Hyperlink
    Wait For And Verify Element    xpath=//span[normalize-space()='View all specifications']

    # Verifying 'Click Here' Hyperlink
    Click Here Hyperlink Verification
    
    #Checking If Button Is Disabled Or Not
    Element Should Be Disabled     ${Button}


    # Entering Pincode & Checking Functionality
    # Entering Invalid PinCode
    Wait For And Input Text        id:address.postcode    422224

    #Button CLick
    Wait For And Click Element     id:pincode-button
    Wait For And Verify Element    //div[contains(@class,"pin-code-input-error")]

    #Entering Valid Pincode
    Pincode Functionality

    # Verifying Stock Availability
    Stock Availability Verification

   # Verifying Check Button 
    Wait For And Verify Element    xpath=//div[@class="pin-code-txt-btn"]
    Element Should Be Enabled      xpath=//button[@id="AddToCartBTN"] 

    # Check Quantity Functionality
    Quantity Functionality
    
    # 'Add To Cart' Button
    Wait For And Verify Content    xpath=//button[@id="AddToCartBTN"]    Add to Cart  
    #Clicking On 'Add To Cart' Button
    Wait For And Click Element     xpath=//button[@id="AddToCartBTN"]
            
    # Verifying Popup
    Popup Verification

    # Verifyng 'Sale & Distribution By Reliance Retail Ltd.'
    Wait For And Verify Content    xpath=//div[@class='sales-distribution-block']    Sale & distribution by Reliance Retail Ltd.
                    
    
    #Verifying 'For Our Return Policy'
    Wait For And Verify Content    xpath=//div[@class="prod-return-policy-text"]    For our return policy

    #Verifying JioFi Description
    Description Verification

    # Verifying Footer Section
    Scroll To                      xpath=//div[@id="sites-footer-container"]   
    Wait For And Verify Element    xpath=//div[@id="sites-footer-container"]
    Take Page Screenshot           Footer Section  



#---------------------------------------------- 
Image & Slideshow Verification 
    
    # Check Jiofi Image On Left Side
    Image Verification            xpath=//img[@id="492337991"]
    CSS Verification              xpath=//img[@id="492337991"]    width    530.688px

    
    # Clicking Each Image Present In Slideshow And Verifying It
        ${Count}=    Get Element Count            xpath=//img[@alt="JioFi M2S"]
        FOR  ${i}  IN RANGE    0     ${Count-1}    
        
    # Clicking Slideshow Image
        Wait For And Click Element                xpath=//img[@data-galleryposition="${i}"]
        Wait For And Verify Element               xpath=(//img[@alt="JioFi M2S"])[${i+1}]
    
    #  Clicking Up Arrow And Check Its Functinality
        Wait For And Verify Element               xpath=//div[@class="jcarousel-prev jcarousel-prev-vertical"]
        Wait For And Click Element                xpath=//div[@class="jcarousel-prev jcarousel-prev-vertical"]
        Take Page Screenshot                      JioFiImage[${i+1}]
    END

    # Clicking Down Arrow And Check Its Functionality
    Scroll To                      xpath=//div[@class="panel panel-default"]//a[@href="#tab-details"]    
    Wait For And Verify Element                   xpath=//div[@class="jcarousel-next jcarousel-next-vertical"]
    Wait For And Click Element                    xpath=//div[@class="jcarousel-next jcarousel-next-vertical"]
# ----------------------------------------------


# ----------------------------------------------
Bank Verification Button
        
        # Click View Details Button
        Wait For And Click Element                xpath=//div[@class='view-emi-button']
        
        # Select Bank Dropdown
        Wait For And Verify Element               xpath=//select[@class='floating-select']
        Wait For And Click Element                xpath=//select[@class='floating-select']
        
        # Selecting Any Bank(Selected Axis Bank) 
        Wait For And Click Element                //option[@value='9']        
        Log To Console                            Successful
        Wait For And Click Element                xpath=//span[normalize-space()='EMI options']
        
        # Emi Details
        Wait For And Verify Element               xpath=//div[@id="bank-9-emi-table"]
        
        # Clicking Cross Button
        Wait For And Click Element                xpath=//button[@class="close"]//*[local-name()='svg']
#---------------------------------------------------

#---------------------------------------------------
Click Here Hyperlink Verification
    # Clicking & Verifying 'Click Here' Hyperlink
    Page Should Contain Link                      xpath=//div[@class="prod-return-policy-link"]//a
    Wait For And Click Element                    xpath=//div[@class="prod-return-policy-link"]//a
    Change Tab                                    Reliance Retail Limited (RRL) Policy - Reliance Jio
    # Verifying The Privacy Policy Page Url
    URL Validation                                ${Privacy_Policy}
    Take Page Screenshot                          Privacy_Policy_Page
    Change Tab                                    Buy JioFi M2S - Portable WiFi Router Online at ₹2800 | Jio
# ------------------------------------------------------

#-------------------------------------------------------
Pincode Functionality

    # Pincode Input Field
    Wait For And Verify Element                   xpath=//input[@id='address.postcode']
    Wait For And Input Text                       xpath=//input[@id='address.postcode']    ${PIN_Code}    
    
    # Check Button
    Wait For And Verify Content                   xpath=//button[@id="pincode-button"]    Check
    Wait For And Click Element                    xpath=//button[@id="pincode-button"]
#-----------------------------------------------------------

#------------------------------------------------------------
Stock Availability Verification
    # Verifying The Content When Stock Is Available
    Wait For And Verify Element               xpath=//div[@id='stock-availaible-message']
    Text Verification                         xpath=//div[@id='stock-availaible-message']    Stock available for ${PIN_Code} 
        
    # Verifying Color Of Stock Status  
    CSS Verification                          xpath=//div[@id='stock-availaible-message']/p        color    rgba(37, 171, 33, 1)
        
    # Verifying The Svg Tick Mark
    Wait For And Verify Element               xpath=(//div[@class="localityAdditionalInfo"]//*[local-name()='svg'])[4]
        
    # Verifying The Color Of Svg Tick Mark
    CSS Verification                          xpath=//div[@class='servicability-message message-container width-100pc pad-0']/div[@class='allLocalitesDetails clearfix']/div[@id='nonExpressDelInfo']/div[@class='center-align']/div[1]//*[name()='svg']//*[name()='path' and contains(@d,'M12 2a10 1')]    fill    rgb(37, 171, 33)
        
    # Verifying The Content Of Subtext 'Standard Delivery By'
    Wait For And Verify Element               xpath=//div[contains(text(),"Standard Delivery by")]
    
    ${presence}=    Run Keyword And Return Status    Wait Until Element is visible   xpath=//div[@class='digital-cod-message jio-pdp-cod-available']//div[@id='expressMsgText']
    IF  ${presence} == True

        # Stock Available & Cash On Delivery Possible
        Text Verification                     xpath=//div[@class='digital-cod-message jio-pdp-cod-available']//div[@id='expressMsgText']     Cash on Delivery is available for this pincode 
        Wait For And Verify Element           xpath=(//div[@class="localityAdditionalInfo"]//*[local-name()='svg'])[5]

        #Stock Available & Cash On Delivery Possible Color Verification
        CSS Verification                      xpath=(//div[@class="localityAdditionalInfo"]//*[local-name()='svg'])[5]    color    rgba(26, 135, 60, 1)

    ELSE

        # Stock Available but Cash on Delivery not possible
        Text Verification                     xpath=//div[@class='digital-cod-message jio-pdp-cod-unavailable']//div[@id='expressMsgText']     Cash on Delivery is not available for this pincode 
        Wait For And Verify Element           xpath=(//div[@class="localityAdditionalInfo"]//*[local-name()='svg'])[5]
        
        # Stock Available But Cash On Delivery Not Possible Color Verification
        CSS Verification                      xpath=(//div[@class="localityAdditionalInfo"]//*[local-name()='svg'])[5]    color    rgba(82, 85, 94, 1) 
    END
#---------------------------------------------------------------


#---------------------------------------------------------------
Quantity Functionality
    #  Verifying Quantity
    Wait For And Verify Element               xpath=//div[@class="qty-text"]//span
        
    # Quantity By Default Value Is 1
    Wait For And Verify Content               xpath=//div[@class="current-quantity-text"]//span    1
    Page Should Contain Element               xpath=//div[@class="quantity-incre-box"]//input[@value="1"]
        
    # Click On + Icon To Increase The Value
    Sleep    100ms
    Wait For And Click Element                xpath=//button[@class="qty-increment"]
    Wait For And Verify Content               xpath=//div[@class="current-quantity-text"]//span    2
    Page Should Contain Element               xpath=//div[@class="quantity-incre-box"]//input[@value="2"]
        
    # Click On - Icon To Decrease The Value
    Sleep    100ms
    Wait For And Click Element                xpath=//button[@class="qty-decrement"]
    Wait For And Verify Content               xpath=//div[@class="current-quantity-text"]//span    1
    Page Should Contain Element               xpath=//div[@class="quantity-incre-box"]//input[@value="1"]
#----------------------------------------------------


#-----------------------------------------------------
Popup Verification
    # Cross Icon At The Top Right Side
    Wait For And Verify Element               xpath=//div[@class="plp-brandpoupclosebt"]//*[local-name()='svg']
    
    # Cross Icon At The Top Right Side Alignment Verification
    CSS Verification                          xpath=//div[@class="digi-popup-closebtn digi-stj-headmarg"]    float    right 
        
    # Popup Heading
    Sleep                                     100ms
    Text Verification                         xpath=//div[contains(@class,"digi-cartpopup-title")]    Product has been added to your cart!
        
    # Popup Subheading
    Text Verification                         xpath=//div[@class="digi-cartpopup-content"]    Would you like to explore more products or go to cart?
        
    # Verifying Continue Shopping Button
    Wait For And Verify Content               xpath=//div[@id="digi-cartpopup-ContinueShopping"]    Continue Shopping
    
    # Checking Redirection After Clicking 'Continue Shopping Button'
    Redirection On Clicking             xpath=//div[@id="digi-cartpopup-ContinueShopping"]    ${NavBar_URL}[1]   Redirection_Shopping_Button
       
    # Verifying Go to Cart Button
    
    #Clicking On Add To Cart Button
    Wait For And Click Element                xpath=//button[@id="AddToCartBTN"]
    
    # Verifying Go To Cart Content
    Wait For And Verify Content               xpath=//div[@id="digi-cartpopup-GotoCart"]    Go to Cart
    
    # Checking Redirection After Clicking 'Go To Cart ' Button 
    Redirection On Clicking             xpath=//div[@id="digi-cartpopup-GotoCart"]    ${GoToCart_Url}    ShoppingCart_Page
#-------------------------------------------


#--------------------------------------------
Description Verification
    # Verifying Each Jiofi Description (Key Feature, Technical Specs , Shipping & Delivery, Offer & Information)
    Scroll To                                xpath=//div[normalize-space()='TRUE 4G SPEED'] 
    
    # Clicking Key Feature Accordion
    Wait For And Click Element               xpath=//a[@class="tab_01 accordion-toggle"]
    Sleep    3s
    ${Counts}=    Get Element Count          xpath=//h2[@class="panel-title"]
    FOR  ${i}  IN RANGE    0    ${Counts}

        # Verifying Each Title Description
        Wait For And Verify Content          xpath=(//h2[@class="panel-title"])[${i+1}]    ${JioFi_description}[${i}]
        
        # Scroll To To Each Title Description
        Scroll To                            xpath=(//h2[@class="panel-title"])[${i+1}]    
        
        # Clicking On Each Description Accordion
        Wait For And Click Element           xpath=//a[@class="tab_0${i+1} accordion-toggle collapsed"]
        
        # Taking Screenshot Of Each Accordion
        Take Page Screenshot                 ${JioFi_description}[${i}] 
        
        # Verifying Description Of Each Title  
        Wait For And Verify Element          xpath=//div[@id="${JioFi_description_Id}[${i}]"]
    END
#--------------------------------------------------

        
        
        