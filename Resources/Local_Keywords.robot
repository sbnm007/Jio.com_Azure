*** Settings ***
Library                             SeleniumLibrary
Library                             ExcelLibrary
Library                             Dialogs
Library                             RequestsLibrary
Library                             String
Library                             Collections
Resource                            ../Resources/Common.robot
Resource                            Excel_Activity.robot
Variables                           Common_Variables.yaml
Variables                           ../Tests/Shop/AddtoCart_Variables.yaml                        
Variables                           ../Tests/Support/LocateUs_Variables.yaml
Variables                           ../Tests/Mobile/MDiscover_Variable.yaml


*** Keywords ***
#------------------------------------------------------------------------- Ak Local Keywords --------------------------------------------------------------------
Banner Content
    [Arguments]                     ${Txt_locator}      ${txt}  ${Sub_Txt_locator}      ${Sub_txt}         ${Img_locator}  ${Btn_locator}   ${Scn_Name}
    Text Verification               ${Txt_locator}      ${txt}
    Image Verification              ${Img_locator}
    Text Verification               ${Sub_Txt_locator}      ${Subtxt}
    ${Buttons}=      Get WebElements     ${Btn_locator}
    FOR  ${Button}  IN  @{Buttons}
        Mouse Over                      ${Button}
        Page Should Contain Button      ${Button}   
    END    
    Take Page Screenshot                 ${Scn_Name}
    Log To Console                  ${Scn_Name} Section Content Verified

#------------------------------------------------------------------------- Johann and Akash Local Keywords --------------------------------------------------------------------

Check Most Popular and Most Value section
    #Verifying Whether Most Popular and Most Value Title section are visible
    Wait For And Verify Content    (//span[@class='most-pop-title'])[1]    Most Popular
    Wait For And Verify Content   (//span[@class='most-pop-title'])[2]     Most Value

Check UI of Most Popular and Most Value section
    # Most Popular and Most Value section UI and Functionality Verification
    Check Most Popular and Most Value section
    #Send Approriate Sheet name as Arguement for Specific page
    Checking UI Element Most Popular and Most Value section

Checking UI Element Most Popular and Most Value section
    #Iteration through Most Popular and Most Value section Products
    FOR    ${counter}    IN RANGE    1    3    
        #Checking Whether product tile is visible 
        Wait For And Verify Element    (//div[@class='col-lg-12 pop-image-cont'])[${counter}]
        
        #Checking Whether product content is visible 
        Wait For And Verify Element    (//div[@class='col-lg-12 pop-content-contnr'])[${counter}]
        
        #Checking Whether product title is visible 
        Wait For And Verify Element    (//div[@class='col-lg-12 pop-content-contnr'])[${counter}]//div[@class='pop-prod-title']
        ${name}=    Get Text           (//div[@class='col-lg-12 pop-content-contnr'])[${counter}]//div[@class='pop-prod-title']
        
        #Checking Whether product description is visible 
        Wait For And Verify Element    ((//div[@class='col-lg-12 pop-content-contnr'])[${counter}]//div[@class='pop-prod-desc'])[1]
        ${desc}=    Get Text           ((//div[@class='col-lg-12 pop-content-contnr'])[${counter}]//div[@class='pop-prod-desc'])[1]
        Wait For And Verify Element    ((//div[@class='col-lg-12 pop-content-contnr'])[${counter}]//div[@class='pop-prod-desc'])[2]
        ${price}=    Get Text          ((//div[@class='col-lg-12 pop-content-contnr'])[${counter}]//div[@class='pop-prod-desc'])[2]

        Reading Most Popular/Value Data from Excel    ${counter+12}    ${sheet}

        Should Be Equal    ${name}    ${Prod_info}[0]
        Should Be Equal    ${desc}    ${Prod_info}[1]
        Should Be Equal    ${price}   ${Prod_info}[2]

        Wait For And Click Element     (//div[@class='col-lg-12 pop-image-cont'])[${counter}]
        
        #Confirming Redirection of Product Link
        ${name_page}=    Get Text      //h2[@itemprop='name']
        Should Contain    ${name}    ${name_page}
       
        Go Back

        
    END


Scrolling to All Products
    Scroll To    xpath://div[@class='col-lg-12 prod-title-wrap']
    Wait For And Verify Content    xpath://div[@class='col-lg-12 prod-title-wrap']    All Products

Checking Product Name
    #Verify smartphone name from Excel

    #Getting Value from Page
    ${value} =    Get Text    (//div[contains(@class, "container")]//div[@class="pop-prod-title"])[${i}]
    #Reading Value from Excel
    ${value1} =    Reading Data of Shops Page from Excel    ${i+18}    1    ${sheet}

    Should Be Equal As Strings    ${value}    ${value1}

Checking Product Specs
    #Verify smartphone specs from Excel

    #Getting Value from Page
    ${value} =    Get Text    (//div[contains(@class, "product-container")]//div[@class="pop-prod-desc mg-bt-8"])[${i}]
    #Reading Value from Excel
    ${value1} =    Reading Data of Shops Page from Excel    ${i+22}    2    ${sheet}
    #Checking Whether Value is Empty or not
    ${len} =    Get Length    ${value}
    IF    ${len} > 0
        Should Be Equal As Strings    ${value}    ${value1}
    END

Checking Product Price
    #Verify smartphone price from Excel

    #Getting Value from Page
    ${value} =    Get Text    (//div[contains(@class, "product-container")]//div[@class="pop-prod-desc mg-bt-0"])[${i}]
    #Removing Unnecessary characters
    ${value}=    Remove String    ${value}    ,
    ${value}=    Remove String    ${value}    ₹
    #Reading Value from Excel
    ${value1} =    Reading Data of Shops Page from Excel    ${i+22}    3    ${sheet}
    
    Should Be Equal As Strings    ${value}    ${value1}

Checking Redirection on Product
    #Verify smartphone url from Excel
    ${Vurl} =    Reading Data of Shops Page from Excel    ${i+22}    4    ${sheet}
    Wait For And Click Element    (//div[contains(@class, "product-container")]//div[@class="pop-prod-title"])[${i}]
    URL Validation    ${Vurl} 

Checking "View Details" UI
    #Verify popup UI after pressing View Details hyperlink
    Wait For And Click Element    //div[@class="view-emi-button"]

    #Verifying Buttons and content of EMI
    Wait For And Verify Element    //button[@class="close"]
    Wait For And Verify Content    //div[@class="popup-heading"]    EMI options
    Wait For And Verify Content    //div[@class="top-section"]    Choose your bank to view plans (Credit cards only)
    Wait For And Verify Element    //select[@id="selectFromBank"]

    #Functionality of EMI pop-up
    Wait For And Click Element    //select[@id="selectFromBank"]
    Wait For And Click Element    //option[@value='10']
    Wait For And Verify Element    //div[@id='bank-10-emi-table']
    Wait For And Click Element    //button[@class="close"]

Pincode Verification
    Scroll To    xpath://div[@class="desktop-heading-xs pin-code-input"]

    #Input wrong pincode and press check button
    Wait For And Input Text    //input[@id="address.postcode"]    40060
    Wait For And Click Element    //button[@id="pincode-button"]

    #Wrong & Invalid pincode verification
    Wait For And Verify Content    //div[@class="digital-pincode-validations error-text validation-msg pin-code-input-error"]    Please enter a valid 6 digit pincode
    # Entering Wrong Pincode
    Wait For And Input Text    //input[@id='address.postcode']    123456
    # Clicking Check Button
    Wait For And Click Element    //button[@id='pincode-button']

    # Invalid Pincode Error
    Text Verification    //div[@class='digital-pincode-validations error-text validation-msg pin-code-input-error']    Invalid Pincode
    
    #Input Right pincode and press check button
    Wait For And Input Text    //input[@id="address.postcode"]    400601
    Wait For And Click Element    //button[@id="pincode-button"]

    #Check for Stock Availability status
    TRY
        #If Stock is Unavailable
        Wait Until Page Contains    Stock unavailable
        Stock Unavailable For Pincode
    EXCEPT
        #If Stock is Available
        Wait Until Page Contains    Stock available
        Stock available For Pincode
        Confirm the functionality of Quantity's '+' and '-'
        
    END
    

Stock Unavailable For Pincode
    #Verify UI when a Product is unavailable
    Wait For And Verify Content    //div[@class="servicability-message-container"]/div/p    Stock unavailable for 400601
    
    #Color of Product unavailable Text
    CSS Verification    //div[@class="servicability-message-container"]/div/p    color    rgba(245, 0, 49, 1)

    # 'Product not available at this pincode'
    Wait For And Verify Element     //div[@class='desktop-body-m']
    
    #Cross Svg
    Wait For And Verify Element    //div[@id="ItemOutOfStock"]/div[@class="success-svg-container"]
    
    Wait For And Verify Element    //button[@class="change-pin-code-btn width-50pc"]
    Wait For And Verify Element    //button[@id="notifyyMe"]
    Run Keyword And Continue On Failure    Notify Me Button UI Verification     #possibly Site Issue
    Element Should Be Disabled    //button[@id="AddToCartBTN"]

Stock available For Pincode
    # Color of Product available Text
    
    Wait For And Verify Content    //div[@class="servicability-message-container"]/div/p    Stock available for 400601
    
    #Color of Product available Text
    CSS Verification    //div[@class="servicability-message-container"]/div/p    color    rgba(37, 171, 33, 1)
    
    #Tick Svg
    Wait For And Verify Element    (//div[@class="localityAdditionalInfo"]//div[@class="success-svg-container"])[4]
    
    # Checking text 'Standard Delivery by'
    Wait Until Page Contains      Standard Delivery by
    # Checking text 'Cash on Delivery'
    Wait Until Page Contains      Cash on Delivery
    # Checking Add To Cart Button Is Enabled Or Not
    Element Should Be Enabled     //button[@id="AddToCartBTN"]
    
    # Verifying Input Box
    Wait For And Verify Element   //div[@class="pin-code-txt-btn"]
    

Checking "Add To Cart" UI
    #Verify popup UI after Pressing Add To Cart button
    Sleep    200ms
    # Verifying Add to Cart Button
    Wait For And Verify Element    //button[@id="AddToCartBTN"]
    # Clicking Add to Cart Button
    Wait For And Click Element    //button[@id="AddToCartBTN"]
    # Verifying Cross Button 
    Wait For And Verify Element    //div[@class="digi-popup-closebtn digi-stj-headmarg"]
    # Verifying Heading
    Wait For And Verify Content    //div[@class="digi-cartpopup-title desktop-heading-xs"]    Product has been added to your cart!
    # Verifying Subheading
    Wait For And Verify Content    //div[@class="digi-cartpopup-confirm mg-bt-16 mobile-body-s"]    Would you like to explore more products or go to cart?
    # Verifying Go to Cart Button
    Wait For And Verify Element    //div[@id="digi-cartpopup-GotoCart"]
    # Verifying Continue Shopping Button
    Wait For And Verify Element    //div[@id="digi-cartpopup-ContinueShopping"]
    

Checking Image Carousel
    Wait For And Verify Element    //div[@id="primary_image"]//img
    Wait For And Verify Element    //div[@class=" jcarousel-skin"]


Checking Device Name
    Wait For And Verify Element    //h2[@itemprop="name"]
    Wait For And Verify Element    //div[@class="price-holder"]

    #Checking Whether Discount is Present 
    ${discount_price}=    Run Keyword And Return Status    Wait Until Page Contains Element   //span[@class="discount-price-holder"]    timeout=1s
    IF    ${discount_price} == True
        Wait For And Verify Element    //span[@class='discount-price-holder']/s
        Wait For And Verify Element    //div[@class='discount-teaser']
    END

    #Getting Value from page
    ${prod_price}=     Get Text     //span[@class='product-price']

    #Removing Unnecessary characters
    ${prod_price}=     Remove String     ${prod_price}    ,
    ${prod_price}=     Remove String    ${prod_price}    ₹    

    #Converting String to Integer
    ${prod_price}=    Convert To Integer    ${prod_price}

    #EMI is not present for product under 2499
    IF    ${prod_price}>2499
        Wait For And Verify Content    //div[@class="emi-description"]/span    EMI starts from
        Checking "View Details" UI
    END

Checking "About Item"
    Wait For And Verify Content    //div[@class="description-title"]/span    About this item
    Wait For And Verify Element    //div[@class="description-content"]
    Wait For And Verify Content    //div[@class="description-button-block"]/span    View all specifications

Checking Pincode
    Wait For And Verify Content    //div[@class="desktop-heading-xs pin-code-input"]    Eligible for delivery?
    Wait For And Verify Element    //input[@id="address.postcode"]
    Wait For And Verify Element    //button[@id="pincode-button"]

Checking Colour
    Wait For And Verify Element    //div[contains(@class, "colour-content")]
    Wait For And Verify Content    //div[@class="colour-div"]/span    Colour
    Wait For And Verify Element    //div[@class="colour-block"]

Checking Version
    Wait For And Verify Content    //div[contains(@class, "version-container")]    Version
    Wait For And Verify Element    //div[contains(@class, "version-list-block")]

Checking Storage
    Wait For And Verify Content    //div[contains(@class, "storage-container")]    Storage
    Wait For And Verify Element    //div[contains(@class, "storage-container")]/div

Checking Quantity
    Wait For And Verify Element    //button[contains(@class, "qty-decrement")]
    Wait For And Verify Element    //button[contains(@class, "qty-increment")]
    Wait For And Verify Element    //button[@id="AddToCartBTN"]

Checking Policy
    Wait For And Verify Content    //div[@class="prod-return-policy-text"]/span    For our return policy
    Wait For And Verify Content    //div[@class="prod-return-policy-link"]/a    Click here
    Wait For And Verify Content    //div[@class="sales-distribution-block"]/span    Sale & distribution by Reliance Retail Ltd.

Checking Accordion
    Wait For And Verify Element    //a[@title="Key Features"]
    ${expanded} =    Get Element Attribute    //a[@title="Key Features"]    aria-expanded
    IF  "${expanded}" != "true"
        Fail
    END
    Wait For And Verify Element    //a[@title="Shipping & Delivery"]
    Wait For And Verify Element    //a[@title="Offers & Information"]
    Wait For And Verify Element    //a[@id="tab-specification-link"]

SlideShow Gallery Verification
    #Get the name of the Product
    ${itemname} =    Get Text    //h2[@itemprop="name"]

    #Get the number of gallery pics
    ${gallerypics} =    Get Element Count    xpath://img[@data-primaryimagetitle="${itemname}"]

    #Loop for the number of gallery pics
    FOR  ${num}  IN RANGE    0   ${gallerypics} 
        IF  ${num} > 3 

            #Press the vertical down button
            Wait For And Click Element    //div[@class="jcarousel-next jcarousel-next-vertical"] 
                   
        END

        #Click on a gallery pic
        Wait For And Click Element    //img[@data-galleryposition="${num}"]
        Sleep    2s   #Site Issue Please do not remove
        #Verify that selected pic is on big image
        ${imgsrc1} =    Get Element Attribute    //img[@data-galleryposition="${num}"]    data-primaryimagesrc
        ${id} =    Get Location
        ${id1} =    Fetch From Right    ${id}    /
        ${imgsrc2} =    Get Element Attribute    xpath://img[@id="${id1}"]    src
        ${imgsrc2new} =    Remove String    ${imgsrc2}     https://www.jio.com
        Should Be Equal As Strings    ${imgsrc1}    ${imgsrc2new}
    END
    
Confirm redirection of the breadcrumbs hyperlinks
    #${count}=    Get Element Count    //span[@class='breadcrumb-value']//a
    IF    "${sheet}" == "Shop_Smartphone"
        Wait For And Verify Content    (//div[@class='j-breadcrumbs__item'])[2]   Smart Phones     
        ${z}    Set Variable    1
    ELSE IF    "${sheet}" == "Shop_SmartDevices"
        Wait For And Verify Content    (//div[@class='j-breadcrumbs__item'])[2]    Smart Devices  
        ${z}    Set Variable    2
    ELSE IF    "${sheet}" == "Shop_JioFi"
        Wait For And Verify Content    (//div[@class='j-breadcrumbs__item'])[2]    JioFi  
        ${z}    Set Variable    3
    ELSE IF    "${sheet}" == "Shop_Accessories"
        Wait For And Verify Content    (//div[@class='j-breadcrumbs__item'])[2]    Jio Accessories    
        ${z}    Set Variable    4
    END

    #Verifying Redirection of First Breadcrum
<<<<<<< Updated upstream
    Redirection On Clicking                                    xpath=//a[@aria-label='Breadcrumbs-1'][normalize-space()='Shop']    ${URL}    First_Breadcrum

    #Verifying Redirection of Third Breadcrum 
    Scroll To                                                  xpath=(//div[@class='j-breadcrumbs__item'])[2]
    Redirection on Clicking                                    xpath=(//div[@class='j-breadcrumbs__item'])[2]    ${NavBar_URL}[${z}]    Second_Breadcrum
=======
    FOR  ${i}  IN RANGE    0    4
    Redirection On Clicking       //a[@aria-label='Breadcrumbs-1'][normalize-space()='Shop']    ${NavBar_URL}[${i}]    First_Breadcrum    
    END

    #Verifying Redirection of Second Breadcrum
    Scroll To                   (//div[@class='j-breadcrumbs__item'])[1]
    Wait For And Click Element    (//div[@class='j-breadcrumbs__item'])[1]
    URL Validation    ${NavBar_URL}[0]
    Go Back

    #Verifying Redirection of Third Breadcrum
    Scroll To                   (//div[@class='j-breadcrumbs__item'])[2]
    Wait For And Click Element    (//div[@class='j-breadcrumbs__item'])[2]
    URL Validation    ${NavBar_URL}[${z}]
    Go Back
>>>>>>> Stashed changes

Checking "View All Specifications"
    #Checking UI of view all specifications
    Wait For And Verify Content                                xpath=//div[@class="description-button-block"]/span    View all specifications

    #Scrolling to Diescription
    Scroll To                                                  xpath=//div[@class="description-button-block"]

    #View all specifications 
    Wait For And Click Element                                 xpath=//div[@class="description-button-block"]
    Wait For And Verify Element                                xpath=//a[@id="tab-specification-link"]
    ${expanded} =    Get Element Attribute                     xpath=//a[@id="tab-specification-link"]    aria-expanded
    Wait For And Verify Element                                xpath=//table[@class="feature-class-table"]

Notify Me Button UI Verification

    Wait For And Click Element        xpath=//button[@id="notifyyMe"]
    #Verfying Notify Me Popup is Opened
    Page Should Contain            Notify me
    Page Should Contain            Enter your email and phone number

    #verfying Input Text Box
    Wait For And Verify Element        xpath=//input[@id='notifyEmail']
    Wait For And Verify Element        xpath=//input[@id='notifymobilenumber']
    Wait For And Verify Element        xpath=//button[@onclick="document.getElementById('notifypopup').style.display='none'"]
    Wait For And Verify Element        xpath=//button[@id='notifySubmit']
    Wait For And Verify Element        xpath=//div[@onclick="document.getElementById('notifypopup').style.display='none'"]//*[name()='svg']
    
    #Checking Notify Me Popup Functionality
    Input Text        xpath=//input[@id='notifyEmail']    123@gmail.com
    Input Text        xpath=//input[@id='notifymobilenumber']    1234567890

    Wait For And Click Element        xpath=//button[@id='notifySubmit']
    Wait For And Verify Content        xpath=//div[@class='success-message-popup']    You will be notified when the product will be available for delivery.
    Wait For And Click Element        xpath=//button[@id='notifyClose']
   
Confirm the functionality of Quantity's '+' and '-'
    Scroll To                        xpath=//button[@class="qty-increment"]
    
    #Checking Decrement Button Disabled
    Wait For And Verify Element        xpath=//button[@class='qty-decrement btnDisabled']

    #Increasing Product Quantity
    Wait For And Click Element        xpath=//button[@class="qty-increment"]

    #Checking Whether Product has reached its Quantity Limit
    ${q_limit}=    Run Keyword And Return Status    Wait For And Verify Element        xpath=//div[@class='max-limit-rchd']
    IF    ${q_limit}
        #Checking For Error Message
        Wait For And Verify Content        xpath=//div[@class='max-limit-rchd']    Maximum limit reached!
        
        #Checking Whether Increment button is disabled 
        Wait For And Verify Element       xpath=//button[@class="qty-increment btnDisabled"]

        Checking "Add To Cart" UI
        Redirection On Clicking     xpath=//div[@id="digi-cartpopup-GotoCart"]    https://www.jio.com/shop/cart    Shopping_cart
    ELSE
        #Verfying Product Quantity Increased
        Wait For And Verify Content        xpath=//div[@class='current-quantity-text']    2

        #Decreasing Product Quantity
        Wait For And Click Element        xpath=//button[@class="qty-decrement"]
        
        #Verfying Product Quantity Decreased
        Wait For And Verify Content    //div[@class='current-quantity-text']    1

        #Checking Decrement Button Disabled
        Wait For And Verify Element    //button[@class='qty-decrement btnDisabled']       
        
    END

   

Confirm the functionality of Click here text
    Sleep    1
    #Clicking on Click here
    Scroll To    //a[@href='http://www.jio.com/en-in/rrl-policy']
    Wait For and Click Element  //a[@href='http://www.jio.com/en-in/rrl-policy']
    
    #Switching to NEW Tab
    Switch Window    NEW

    #Validating Redirection
    Page Should Contain    Cancellation, Returns and Refunds Policy

    #Closing NEW Tab and Switching to MAIN tab
    Close Window
    Switch Window    MAIN   

Open All Accordions
    Checking Key features UI    ${i+22}
    Checking "Technical Specifications"
    Checking "Shipping & Delivery"
    Checking "Offers & Information"

Checking Key features UI
    [Arguments]    ${i}
    Scroll To    //a[@title="Key Features"]

    #Check whether accordion is expanded
    ${expanded} =    Get Element Attribute    //a[@title="Key Features"]    aria-expanded
    IF  "${expanded}" != "true"
        Wait For And Click Element    //a[@title="Key Features"]
    END

    #Verify Content of Accordion
    Wait For And Verify Element    //div[@class="jio-pdp-key-new"]
    ${keyfeat} =    Get Element Count    //div[@class="key-feature-title"]
    FOR  ${j}  IN RANGE    1    ${keyfeat+1}
        Scroll to       (//div[@class="key-feature-title"])[${j}]
        #Getting Value from Page
        ${value} =    Get Text    (//div[@class="key-feature-title"])[${j}]
        #Reading Value form Excel
        ${value1} =    Read Excel Cell    ${i}    ${j+4}    ${sheet}
        Should Be Equal As Strings    ${value}    ${value1}
    END

Checking "Technical Specifications"
    Scroll To    //a[@id="tab-specification-link"]

    #Check whether accordion is expanded
    ${expanded} =    Get Element Attribute    //a[@id="tab-specification-link"]    aria-expanded
    IF  "${expanded}" != "true"
        Wait For And Click Element    //a[@id="tab-specification-link"]
    END
    
    #Verify Content of Accordion
    Wait For And Verify Element    //table[@class="feature-class-table"]

Checking "Shipping & Delivery"
    Scroll To    //a[@href="#tab-shipping"]

    #Check whether accordion is expanded
    ${expanded} =    Get Element Attribute    //a[@href="#tab-shipping"]    aria-expanded
    IF  "${expanded}" != "true"
        Wait For And Click Element    //a[@href="#tab-shipping"]
    END

    #Verify Content of Accordion
    Wait For And Verify Content     //div[@id="tab-shipping"]     delivered within 3-5 business days     #//div[@id="tab-shipping"]//strong Standard Delivery

Checking "Offers & Information"
    Scroll To    //a[@title="Offers & Information"]

    #Check whether accordion is expanded
    ${expanded} =    Get Element Attribute    //a[@title="Offers & Information"]    aria-expanded
    IF  "${expanded}" != "true"
        Wait For And Click Element    //a[@title="Offers & Information"]
    END

    #Verify Content of Accordion
    Wait For And Verify Content    //div[@id="tab-guarantees"]//strong    Warranty Period :-    

Checking Filter UI
 
    Click Show Filter Option
    # Verifying Cross Icon At Right Side
    Wait For And Verify Element    xpath=//button[@class="close"]
    CSS Verification     xpath=//button[@class="close"]    Float    right  
    Wait For And Verify Content    //span[@class="modal-title"]    Filters

    # Verifying Cancel Button
    Wait For And Verify Element    xpath=//button[@class="btn btn-default"]
    Text Verification    xpath=//button[@class="btn btn-default"]    Cancel

    # Verifying Apply Button
    Wait For And Verify Element    xpath=//button[@class="btn btn-primary"]
    Text Verification    xpath=//button[@class="btn btn-primary"]    Apply
    
    #Clicking Show more 
    @{show_more} =    Get WebElements    //div[@class="show-more-less show-more"]
    FOR  ${i}    IN    @{show_more}
        Scroll To    ${i}
        Wait For And Click Element    ${i}
    END    
    #Get count of no  of filters
    ${titles} =    Get Element Count    //div[@class="filter-title"]
    FOR  ${i}  IN RANGE    1    ${titles+1}
        #Reading Value from Excel
        ${title} =    Reading Data of Shops Page from Excel    ${i+1}    1    ${sheet}
        #Getting Value from Page
        Scroll To    (//div[@class="filter-title"]/span)[${i}]
        ${title1} =    Get Text    (//div[@class="filter-title"]/span)[${i}]
        Should Be Equal As Strings    ${title}    ${title1}
        

        ${type} =    Run Keyword And Return Status    Wait Until Page Contains Element    (//div[@class="filter-section"])[${i}]//label
        IF    "${type}" != "True"
            #Verify Slider functionality
            Selecting Slider value    (//div[@class="filter-section"])[${i}]//input    RANDOM
            Selecting Slider value    (//div[@class="filter-section"])[${i}]//input    MAX
        ELSE
            #Verify checkbox functionality
            ${labels} =    Get Element Count    (//div[@class="filter-section"])[${i}]//label
            
            Reading Filter Option Data of Smart Devices Page from Excel    ${i+1}    ${sheet}
            FOR    ${element}    IN    @{Opts}
                Check Checkbox Filter Option    ${i}    ${element}   
            END
                                           
        END      
    END
    Wait For And Click Element    //button[normalize-space()='Cancel']

Selecting Slider value
    [Arguments]    ${loc}    ${value}
    #It selects the minimum value on the slider
    IF  "${value}" == "MIN"
        Drag And Drop By Offset    ${loc}    -300    0

    #It selects the maximum value on the slider
    ELSE IF    "${value}" == "MAX"
        Drag And Drop By Offset    ${loc}    300    0

    #It selects a value at random on the slider
    ELSE
        ${random} =    Evaluate    random.randint(-299, 300)   random
        Drag And Drop By Offset    ${loc}    0    0        
    END

Check Checkbox Filter Option
    [Arguments]    ${counter}    ${element}
    Scroll To            (//div[@class='filter-section'])[${counter}]//label[normalize-space()='${element}']//span
    #Verfying Checkbox UI and Functionality
    Check Checkbox    (//div[@class='filter-section'])[${counter}]//label[normalize-space()='${element}']//span
    Uncheck Checkbox    (//div[@class='filter-section'])[${counter}]//label[normalize-space()='${element}']//span

Click Show Filter Option
    #Verifying Whether Show Filter Option is visible
    Wait For And Verify Element    //div[@class='filter-container']
    CSS Verification    //div[@class="filter-container"]    float     right
    Wait For And Click Element     //div[@class='filter-container']

Confirm product list is modified as per "Price filter"
    #Getting Number of Product after Applying Filter
    ${count_prod}=    Get Element Count    //div[@class='col-lg-4 col-md-4 col-sm-6 col-xs-12 product-container']

    #Iterating through Products And Verifying Whether it is According to Filter Applied 
    FOR    ${counter}    IN RANGE    1    ${count_prod+1} 
        
        Scroll To                        (//div[@class='col-lg-4 col-md-4 col-sm-6 col-xs-12 product-container'])[${counter}]//div[@class="pop-prod-desc mg-bt-0"]
        Wait For And Verify Element        (//div[@class='col-lg-4 col-md-4 col-sm-6 col-xs-12 product-container'])[${counter}]//div[@class="pop-prod-desc mg-bt-0"]

        #Getting Product Price
        ${price_prod}=    Get Text         (//div[@class='col-lg-4 col-md-4 col-sm-6 col-xs-12 product-container'])[${counter}]//div[@class="pop-prod-desc mg-bt-0"]

        #Cleaning price Text
        ${price_prod}=    Remove String    ${price_prod}    ,
        ${price_prod}=    Remove String    ${price_prod}    ₹

        #Converting Price Text to Integer 
        ${price_prod}=    Convert To Integer    ${price_prod}

        #Comparing Product Price to Filter Price
        IF    ${min_val_int}>${price_prod} or ${price_prod}>${max_val_int}
            FAIL
        END
    END

Confirm product list is modified as per "Brand filter"
    [Arguments]    ${brand}
    @{names} =    Get WebElements    //div[@class='col-lg-4 col-md-4 col-sm-6 col-xs-12 product-container']//div[@class="pop-prod-title"]/span
    FOR    ${i}    IN    @{names}
        Scroll To    ${i}
        Element Should Contain    ${i}    ${brand}    ignore_case= True
    END


Applying Slider Filter
    [Arguments]    ${loc}    ${slider_name}
    #Click Show Filter Option

    #Genrating Random Number For Filter Price Option
    #${random} =     Evaluate     random.randint(-300, 301)      random  

    #Verify Slider UI and functionality
    Wait For And Verify Content    ${loc}//div[@class="filter-title"]/span    ${slider_name}
    Wait For And Verify Element    ${loc}//div[@class="slider-container"]/input
    Wait For And Click Element     ${loc}//div[@class="slider-container"]/input

    #Selecting random Slider value
    Selecting Slider value    ${loc}//div[@class="slider-container"]/input    RANDOM
    
    #Getting Max Value
    ${max_val}=    Get Text        ${loc}//div[@class="slider-value"]/span

    #Getting Min Value
    ${min_val}=    Get Element Attribute        ${loc}//div[@class="slider-container"]/input    min

    #Cleaning Max Min Values and Converting Price Text to Integer
    ${max_val}=    Remove String    ${max_val}    ,
    ${min_val}=    Remove String    ${min_val}    ,
    ${max_val_int}=    Convert To Integer    ${max_val}
    ${min_val_int}=    Convert To Integer    ${min_val}
    Set Global Variable    ${max_val_int}    ${max_val_int}
    Set Global Variable    ${min_val_int}    ${min_val_int}

    #Clicking on Apply Button
    Wait For And Click Element     //button[normalize-space()='Apply']

    #Verifying Tag is Present After Applying Filter
    Wait For And Verify Element    //a[@class='selected-filter-value']
    
    #Getting Text from Filter Tag
    ${filter_range}=    Get Text   //a[@class='selected-filter-value']//span

    #Comparing Tag Text with Applied Filter Values
    Should Contain     ${filter_range}    ${max_val}
    Should Contain     ${filter_range}    ${min_val}

Check Checkbox
    [Arguments]    ${loc}
    #Verify checkbox is selected 
    Wait For And Click Element    ${loc}
    CSS Verification    ${loc}    background-color    rgba(15, 60, 201, 1)
    
Uncheck Checkbox
    [Arguments]    ${loc}
    #Verify chcekbox is unselected    
    Wait For And Click Element    ${loc}
    CSS Verification    ${loc}    background-color    rgba(255, 255, 255, 1)


Verify Checkbox Filter
    [Arguments]    ${checkbox_value}
    #Verify brand filter is applied
    ${filter_value} =    Get Text    //a[@class="selected-filter-value"]
    #${filter_value} =     Convert To Lower Case    ${filter_value}
    Should Contain    ${filter_value}    ${checkbox_value}

Applying CheckBox Filter
    [Arguments]    ${loc}    ${filter_name}    ${checkbox_name}
    Wait For And Verify Content    ${loc}//div[@class="filter-title"]/span    ${filter_name}
    Scroll To    ${loc}//label[normalize-space()='${checkbox_name}']/span
    #${checkbox_value} =    Get Element Attribute    (//label[@class='checkbox-container']//input[@facetcode='${filter_name}'])[1]    value
    Check Checkbox    ${loc}//label[normalize-space()='${checkbox_name}']/span
    Wait For And Click Element    //button[@class="btn btn-primary"]


Remove Filter
    #verify removal of filters applied
    ${filters} =    Get Element Count    //a[@class="selected-filter-value"]
    FOR  ${filter}  IN RANGE    1    ${filters+1}
        Wait For And Click Element    //a[@class="selected-filter-value"]
    END
    #Wait Until Page Does Not Contain Element    //a[@class="selected-filter-value"]
    IF  '${sheet}' == 'Shop_Smartphone'
        URL Validation    https://www.jio.com/shop/en-in/c/smartphones?q=%3Arelevance
    ELSE IF    '${sheet}' == 'Shop_SmartDevices'
        URL Validation    https://www.jio.com/shop/en-in/c/smart-devices?q=%3Arelevance
    ELSE IF     '${sheet}' == 'Shop_Accessories'
        URL Validation    https://www.jio.com/shop/en-in/c/jioaccessories?q=%3Arelevance   
    ELSE
        URL Validation    https://www.jio.com/shop/en-in/c/jiofi?q=%3Arelevance   
    END

#------------------------------------------------------------------------- Tanmay Local Keywords --------------------------------------------------------------------

Element Verification
   [Arguments]       ${Button}          ${Sc_name}
    Scroll To                         ${Button}                 
    Wait For And Verify Element          ${Button}              
    Sleep     1s
    Take Page Screenshot                     ${Sc_name}
    #Go Back

Add to cart Button is disabled
    [Arguments]    ${Button}
    Scroll To    ${Button}
    Wait For And Verify Element    ${Button}
    Sleep     1s
    Element Should Be Disabled    ${Button}
    Log To Console    Button is Disabled

Enter Pin Code
    Scroll To    (//div[contains(@class,"product-container")])[1]
    Wait For And Click Element    (//div[contains(@class,"product-container")])[1]
    Scroll To    ${Button}
    
    #Checking if button is Disabled or not
    Element Should Be Disabled    ${Button}

    #Entering PinCode
    Wait For And Input Text    id:address.postcode    ${PIN_Code}

    #Button CLick
    Wait For And Click Element    id:pincode-button
    

Stock Available
    Scroll To    //div[@class="availablity-msg"]/p
    #Getting the text if stock available or not
    ${message}=    Get Text    xpath://div[@class="availablity-msg"]/p
    #Getting only status (Not PinCode)
    ${message}=    String.Split String    ${message}    for
    Log To Console    ${message}
    ${message}=    Set Variable    ${message[${0}]}
    # Log To Console    ${message[${0}]}
    IF  "${message}" == "Stock unavailable "
        Element Should Be Disabled    ${button}
        Log To Console    Button is Disabled
        ${status}=    Set Variable    ${False}
    ELSE
        Element Should Be Enabled    ${button}
        Log To Console    Button is Enabled
        ${status}=    Set Variable    ${True}
    END
    [Return]    ${status}

Cross Button Functionality
   [Arguments]      ${locator}
    Wait For And Verify Element      ${locator}
    Sleep    100ms
    Wait For And Click Element       ${locator}
    Sleep    100ms

All Products Add to Cart Button Validation with PinCode
    Scroll to All Products
    ${num}=    Get Element Count    //div[contains(@class,"product-container")]
    Log To Console    ${num}
    Enter Pin Code
    Go Back
    FOR  ${i}  IN RANGE    ${num}
        Log To Console    ${i}
        Scroll To    (//div[contains(@class,"product-container")])[${i+1}]
        ${prod_name}=    Get Text    (//div[@class="pop-prod-title"]/span)[${i+1}]
        Wait For And Click Element    (//div[contains(@class,"product-container")])[${i+1}]
        Page Should Contain    ${prod_name}
        Element Verification    ${button}    SmartDevices_${i} 
        Stock Available
        Go Back
    END

Pop-Up UI content verification
    [Arguments]    ${status}=${True}
    #Verify the Message
    Wait For And Verify Content    //div[contains(@class,'digi-cartpopup-title')]    ${Pop_up[${0}]}
    #Verify the sub message based on redirection
    Wait For And Verify Content    //div[contains(@class,'digi-cartpopup-confirm')]    ${Pop_up[${1}]}
    #Go to cart button verification
    Wait For And Verify Content    id:digi-cartpopup-GotoCart    ${Pop_up[${2}]}
    #Continue shopping button verification
    Wait For And Verify Content    id:digi-cartpopup-ContinueShopping    ${Pop_up[${3}]}
    #Cross button verification
    Run Keyword If    ${status}    Cross Button Functionality    //div[@class="plp-brandpoupclosebt"]/div[contains(@class,'close-icon')]

Scroll to All Products
    #Navigating to All products
    Scroll To    //div[contains(@class," prod-title-wrap")]/span
    #Heading Verification
    Wait For And Verify Content    //div[contains(@class," prod-title-wrap")]/span      All Products

Pop-up button Verification
    Scroll to All Products

    #Getting count of number of elements present
    ${num}=    Get Element Count    //div[contains(@class,"product-container")]
    Log To Console    ${num}

    #Entering pin code 
    Enter Pin Code
    Go Back

    #Itterating through each products available inside all products category
    FOR  ${i}  IN RANGE    ${num}
        Log To Console    ${i}
        Scroll To    (//div[contains(@class,"product-container")])[${i+1}]
        Wait For And Click Element    (//div[contains(@class,"product-container")])[${i+1}]

        #Checking if that product is available at that pin code
        ${Status}=   Stock Available
        IF  ${Status} == True
            #Checking if Pop-up has 2 buttons and they are redirecting properly
            Pop-up button Redirection Validation
            #Clicking on Continue Shopping button
            Continue Shopping button redirection and Validation
            Exit For Loop
        ELSE
            Go Back
            Log To Console    Product is unavailable
        END
        
    END


Pop-up button Redirection Validation
    # Adding element to cart and then validating UI of Pop-up
    Adding Element to Cart-Pop up

    #Since this site is unstable, this is the most common issue and hence the need to add this conditions
    ${status}=    Run Keyword And Return Status    Wait For And Verify Content    //div[contains(@class,'jio-empty-cart')]/div    Your shopping cart is empty.
    IF  ${status} == True
        Log To Console    Site error.
        Go Back
        Pop-up button Redirection Validation
    ELSE
        #Cart page UI validation
        Shopping Cart Page Validation
        # Go Back
        Scroll To    ${button}
        Wait For And Click Element    ${button}
    END

Continue Shopping button redirection and Validation
    Wait For And Click Element    id:digi-cartpopup-ContinueShopping    
    URL Validation    ${NavBar_URL[${1}]}    
    Take Page Screenshot    SmartPhones_page
    Wait Until Element Is Visible    //div[@id="cart_nav_desktop"]/button[contains(@class,'j-button')]
    Wait For And Click Element    //div[@id="cart_nav_desktop"]/button[contains(@class,'j-button')]
    Wait For And Verify Content    //div[contains(@class,'digi-cart-title')]    Shopping Cart 
    Update quantity to 0
    Click on Bin Button

Update quantity to 0   
    Log To Console    Updating item quantity to 0
    Wait For And Input Text    id:qty    0
    Wait For And Click Element     //a[contains(text(),'Update')]
    # Wait For And Verify Element    //div[@class="digi-popup"]
    Wait For And Verify Content    //div[contains(@class,'digi-cart-updatetext')]    Are you sure you want to remove the item from your cart?    
    Wait For And Click Element    //div[contains(@class,'digi-cart-cancelRemove')]

Click on Bin Button
    Sleep    1
    Log To Console    Clicking on Bin Icon
    Wait For And Click Element     //div[@class="j-listBlock__main txt-align--left l-breakpoint--desktop ml-auto cursor-pointer width-fit-content"]
    Wait For And Verify Content    //h2[@class="j-heading j-text-heading-s empty-cart-content line-height-1_25"]    Your shopping cart is empty
    
Promocode Validation 
    Log To Console    Operations on Promocode
    Wait For And Verify Element    //input[@placeholder="Have a promocode?"]
    Element Should Be Disabled    //button[@class="applycoupon-button promoApplyBtn"]
    Wait For And Input Text    //input[@placeholder="Have a promocode?"]    SDFasdf
    Element Should Be Enabled     //button[@class="applycoupon-button promoApplyBtn"]
    Wait For And Click Element     //button[@class="applycoupon-button promoApplyBtn"]
    Wait For And Verify Content    //div[@class="information_message negative"]/p    This voucher is invalid or has expired already.    


Product Details
    ${cost}    Get Text   xpath://span[@class="product-price"]
    ${value}    Replace String    ${cost[1:]}    ,    ${EMPTY}
    ${cost_int}    Convert To Integer    ${value}
    ${cost}=    Set Variable    ${cost[1:]}
    ${name}    Get Text    xpath://div[@class="header-emi-block"]/h2
    Log To Console    Name of Product us -${name}
    Log to console    Cost of Product is -${cost}

    ${product_details}=    Create List
    Append To List    ${product_details}    ${name}    ${cost}    ${cost_int}
    Log To Console    ${product_details}
    Set Global Variable    ${product_details}
    Scroll To    ${button}



Shopping Cart Page Validation
    #Title verification
    Wait For And Verify Content    //div[@class="j-text-heading-s"]    Shopping Cart   

    

    #Table column name verification
    FOR  ${i}  IN RANGE    1    5
        Wait For And Verify Content        (//tr[contains(@class,'cart-bundle-header')]/td)[${i}]    ${Table_Heading[${i-1}]}
        Log To Console    ${Table_Heading[${i-1}]} found
    END

    #Table row content verification
    ${prod_name}=    Get Text    (//div[contains(@class,'cart-productname')])[1]/a
    Log To Console    ${prod_name}
    IF  '${prod_name}' == '${product_details[${0}]}'
        Log To Console    Product Matched 
        Wait For And Click Element    (//div[contains(@class,'cart-productname')])[1]/a
        Page Should Contain    ${prod_name}
        Go Back
    END

    #Checking for Sub Total
    Log to Console    Sub Total: ₹ ${product_details[${1}]}.00
    Wait For And Verify Content    //tbody/tr[4]/td[4]    Sub Total: ₹ ${product_details[${1}]}.00
    
    #Checking for update button
    Wait For And Verify Element    //a[contains(text(),'Update')]
    Wait For And Input Text    id:qty    3
    Wait For And Click Element     //a[contains(text(),'Update')]
    Wait For And Verify Content    //div[@class="information_message positive"]/p    Product quantity has been updated.
    ${updated_value}=    Evaluate    ${product_details[${2}]}*${3}
    Log To Console    ${updated_value}
    # Wait For And Verify Content    //tbody/tr[4]/td[4]    Sub Total: ₹ ${product_details[${1}]*${3}}.00
    Page Should Contain    ${updated_value}


    #Checking for Cart Sumary heading
    Wait For And Verify Content    //div[contains(@class,'digi-cart-orderSummary')]/div[@class="title_holder clearfix"]/h2    Cart Summary
    #Product details
    Wait For And Verify Element    //div[contains(@class,'digi-cart-orderSummary')]/div[@class="item_container"]/table
    
    #Continue shopping button redirection
    Wait For And Click Element    //a[@id="shpHide"]
    URL Validation    ${NavBar_URL[${1}]} 
    Go Back
    #Checkout button redirection
    Wait For And Click Element    id:checkoutButtonBottom
    URL Validation    ${Checkout}
    Go Back

    #Promo code
    Promocode Validation
    #Continue shoping button
    Wait for and Verify Element    id:shpHide
    #Checkout button
    Wait for and Verify Element    id:checkoutButtonBottom

    #Text in green
    Wait For And Verify Content    //div[@class="safe-text"]    Safe and Secure Payments. 100% authentic products. 
    CSS Verification    //div[@class="safe-text"]    color    rgba(26, 135, 60, 1)
    Log To Console    Done with Verification 
    Wait For And Click Element    (//div[contains(@class,'cart-productname')])[1]/a
    Page Should Contain    ${prod_name}

    Confirm the functionality of Quantity's '+' and '-'

    Click on Bin Button

Filter on the bases of Price, Battery Capacity and Check "X" button functionality
    Filter Button    ${True}
    Filter Button    ${False}    ${True}
    Filter Button    ${False}    ${True}    ${True}


Filter Button
    [Arguments]    ${Price_Range_Filter}=${False}        ${Battery capacity_Filter}=${False}    ${Press_X_Button}=${False}

    #Checking if filter button is present or not
    Wait For And Verify Element    //div[contains(@class,"filter-container")]
    Log to Console    Filter button present

    #Clicking on Filter Button
    Wait For And Click Element    //div[contains(@class,"filter-container")]

    #Checking modal title
    Wait For And Verify Content    //span[@class="modal-title"]    Filters

    #Filter based on Price
    Run Keyword If    ${Price_Range_Filter}    Drag And Drop By Offset    id:priceRange    200    0
    Sleep    2

    #Filter based on battery Capcity
    Run Keyword If    ${Battery capacity_Filter}    Drag And Drop By Offset    id:batteryRange    -200    0
    Sleep    2
    
    #Cross Button functionality
    Run Keyword If    ${Press_X_Button}    Wait For And Click Element    //button[@class="close"]
    
    #Clicking Apply Buttton
    Run Keyword If    not ${Press_X_Button}     Wait For And Click Element    //button[contains(text(),'Apply')]
    

Personal Details Page
    Scroll to All Products
    #Getting count of number of elements present
    ${num}=    Get Element Count    //div[contains(@class,"product-container")]
    Log To Console    ${num}

    #Entering pin code 
    Enter Pin Code
    Go Back

    #Itterating through each products available inside all products category
    FOR  ${i}  IN RANGE    ${num}
        Log To Console    ${i}
        Scroll To    (//div[contains(@class,"product-container")])[${i+1}]
        Wait For And Click Element    (//div[contains(@class,"product-container")])[${i+1}]
        #Checking if that product is available at that pin code
        ${Status}=   Stock Available
        IF  ${Status} == True
            Adding Element to Cart-Pop up
            ${status}=    Run Keyword And Return Status    Wait For And Verify Content    //div[contains(@class,'jio-empty-cart')]/div    Your shopping cart is empty.
            IF  ${status} == True
                Log To Console    Site error.
                Go Back
                Pop-up button Redirection Validation
            ELSE
                Log to Console    Inside Else 
                Checkout
            END
            Exit For Loop
        ELSE
            Go Back
            Log To Console    Product is unavailable
        END
        
    END

Adding Element to Cart-Pop up
    #Checking Redirection to perticular product page and Product content
    Product Details

    #Clicking on add to cart button
    Wait For And Click Element    ${button}

    #Verify if pop-up is visible
    Wait For And Verify Element    //div[contains(@class,'digi-popup-subcontainer')]

    #Redirection to Go to cart
    Wait For And Click Element    id:digi-cartpopup-GotoCart 
    Sleep    200ms

Checkout
    #Waiting untill Checkout button loads
    Wait Until Page Contains Element    id:checkoutButtonBottom    
    Wait for And Click Element    id:checkoutButtonBottom
    
    Personal details
    
  

Personal details 
    URL Validation    ${Checkout}
    Personal Details Page Validation

Personal Details Page Validation
    [Arguments]    ${status}=${True}
    Wait For And Verify Content    (//div[contains(@class,"title")]/h2)[1]    Enter personal details
    FOR  ${i}  IN RANGE    1    4
        Wait For And Verify Element    (//div[@class="formwidth"])[${i}]  
        ${get_subText}=    Get Text    (//div[@class="formwidth"]/div)[${i}]
        Log to Console    ${get_subText}
    END

    #Button verification
    Wait For And Verify Content    personalDetailsContinueBtn    Continue
    CSS Verification    id:personalDetailsContinueBtn    background    rgb(0, 97, 195) none repeat scroll 0% 0% / auto padding-box border-box
    
    #Grey text verification
    ${count}=    Get Element Count    (//div[@class="item_container_holder"]/div)
    log to console    ${count}
    Scroll To    (//div[@class="item_container_holder"]/div)[${count-1}]
    Wait For And Verify Element    (//div[@class="item_container_holder"]/div)[${count-1}] 
    CSS Verification    (//div[@class="item_container_holder"]/div)[${count-1}]    color    rgba(202, 202, 202, 1)
    Wait For And Verify Element    (//div[@class="item_container_holder"]/div)[${count}]
    CSS Verification    (//div[@class="item_container_holder"]/div)[${count}]    color    rgba(202, 202, 202, 1)

    #Cart Summary 
    Run Keyword If    ${status}    Edit Button Redirection Checkout Page

    #Product details
    Wait For And Verify Element    //div[contains(@class,"digi-cart-orderSummary")]

Edit Button Redirection Checkout Page  
    Wait For And Verify Content    (//div[contains(@class,"title")]/h2)[2]    Cart Summary
    Wait For And Verify Content    id:editbtn    Edit
    Wait For And Click Element    id:editbtn
    URL Validation    ${Cart}
    Go Back
    Sleep    2

Product Checkout Functionality
    Scroll to All Products
    #Getting count of number of elements present
    ${num}=    Get Element Count    //div[contains(@class,"product-container")]
    Log To Console    ${num}
    #Entering pin code 
    Enter Pin Code
    Go Back

    #Itterating through each products available inside all products category
    FOR  ${i}  IN RANGE    ${num}
        Log To Console    ${i}
        Scroll To    (//div[contains(@class,"product-container")])[${i+1}]
        Wait For And Click Element    (//div[contains(@class,"product-container")])[${i+1}]
        #Checking if that product is available at that pin code
        ${Status}=   Stock Available
        IF  ${Status} == True
            Scroll To    //div[@class="prod-return-policy-text"]
            Wait For And Click Element    ${button}
            Verifying Content & Redirection Of Popup Functionality
            Personal Details Page Functionality
            Delivery Address Page Functionality
            Payment Method Page Functionality
            Exit For Loop
        ELSE
            Go Back
            Log To Console    Product is unavailable
        END
        
    END

# -----------------------
Verifying Content & Redirection Of Popup Functionality
    # Verifying Content of Popup  after Clicking Add to Cart Button
    Take Page Screenshot   ProductAdded_Popup 
    Wait For And Verify Content    xpath=//div[contains(@class,"cartpopup-title")]    Product has been added to your cart!
    
    # Clicking Go To Cart Button
    Wait For And Click Element     xpath=//div[@id="digi-cartpopup-GotoCart"]
    
    # Redirected to Shop Cart Page
    URL Validation    https://www.jio.com/shop/cart
    
    # Shopping Cart Button
    Wait For And Verify Content    xpath=//div[@class='j-text-heading-s']    Shopping Cart
    
    # Clicking Checkout Button
    Wait For And Click Element    xpath=//button[@class='j-button j-button-size__large primary primary-bg width-100pc']
# ----------------------

# ----------------------
Personal Details Page Functionality
    #UI validation of Pesonal Details Page
    Personal Details Page Validation

    #Error Validation
    Error message in Details Page
    # Checkout Page URL Validation
    URL Validation    https://www.jio.com/shop/checkout/multi/add-personal-details
    
    # Entering First Name
    Wait For And Input Text    xpath=//input[@id="personalDetail.firstName"]    MS
    # Entering Last Name
    Wait For And Input Text    xpath=//input[@id="personalDetail.lastName"]    Dhoni
    # Entering Email Address
    Wait For And Input Text    xpath=//input[@id="personalDetail.emailAddress"]    akcricketer@gmail.com
    # Entering Mobile Number
    Wait For And Input Text    xpath=//input[@id="personalDetail.mobileNumber"]   ${Incorrect_No2}
    # ${status}=    Run Keyword And Return Status    Wait For And Verify Content     xpath=//a[contains(text(),'WiFi Mesh Extender JCM0112')]     WiFi Mesh Extender JCM0112
    # IF    ${status}   
    #     Wifi Mesh Condition
    # END
    # Click Continue Button
    Wait For And Verify Element    xpath=//button[@id="personalDetailsContinueBtn"]
    Wait For And Click Element    xpath=//button[@id="personalDetailsContinueBtn"]
# -------------------------

Wifi Mesh Condition
    #Checking if Wifi Mesh is present or not 
    Wait For And Verify Content     xpath=//a[contains(text(),'WiFi Mesh Extender JCM0112')]     WiFi Mesh Extender JCM0112 
    Select From List By Index     id:personalDetail.extenderRouterModel     2

Error message in Details Page
    # Click Continue Button
    Wait For And Click Element    xpath=//button[@id="personalDetailsContinueBtn"]

    #Title verification
    Wait For And Verify Content    //div[@class="title_holder"]/h2    ${Error_Text[0]}    

    #UI validation of error message
    Wait For And Verify Content    //div[@class="information_message negative"]/p    ${Error_Message}
    CSS Verification    //div[@class="information_message negative"]    background-color     rgba(199, 23, 32, 1)
    
    #Text validation of each field
    FOR  ${i}  IN RANGE    1    5
        CSS Verification    (//div[@class="formwidth"]/span/p/span)[${i}]    color    rgba(217, 38, 42, 1)
        Wait For And Verify Content    (//div[@class="formwidth"]/span/p/span)[${i}]    ${Error_Text[${i}]}
    END
    Log to console    Error Messages validated
    
    
# -------------------------
Delivery Address Page Functionality
    # Redirected to Delivery Address Page
    URL Validation    https://www.jio.com/shop/checkout/multi/add-delivery-address

    UI Validation of Delivery Address Page
    
    # Entering
     # Address Line 1
    Wait For And Input Text    xpath=//input[@id="address.line1"]    House No.2
     #Address Line 2
     Wait For And Input Text    xpath=//input[@id="address.line2"]    Valmiki Building
     #Address Line 3
     Wait For And Input Text    xpath=//input[@id="address.area.locality"]    Pump House
    
    # Click Continue Button 
    Wait For And Click Element    xpath=//button[@class="positive"]
# ------------------------------


# ------------------------------
UI Validation of Delivery Address Page
    # Validating Content 
    Wait For And Verify Content                               xpath=//div[@class="title_holder"]/h2    ${Delivery_Data[${0}]}

    FOR  ${i}  IN RANGE    1    4
        #Validating Address lines
        Element Attribute Value Should Be                     xpath=(//div[@class="formwidth"]/dd/input)[${i}]    placeholder    ${Delivery_Data[${i}]}   
    END
    
    #Validating Pincode
    Wait For And Verify Element                               xpath=(//div[@class="formwidth"]/dd/input)[4]        
    ${Fetching_Pincode}=                                      Execute Javascript    return document.getElementById("address.postcode").value
    Log to Console    ${Fetching_Pincode}
    Should Be Equal As Strings    ${Fetching_Pincode}    ${PIN_Code}    Pincode Found    
    
    #Validating City, State and Country
    Wait For And Verify Element                               id:address.districtCity
    Wait For And Verify Element                               id:address.state      
    Wait Until Page Contains                                  India      
    Log to Console                                            UI validation of Address Page completed 
# ------------------------------




# -------------------------------
Payment Method Page Functionality

    #Clicking on Proceed to payment button without agreeing to terms 
    Wait For And Click Element                                xpath=//button[@id='upiButton']
    Wait For And Verify Content                               xpath=//div[@id='upiTerms']    Please agree with terms and conditions before proceeding the payment

    #Payment Method & Functionality
    ${Count}=     Get Element Count                           xpath=//a[@class="digi-payment-anchor"]
    FOR  ${i}  IN RANGE  1    ${Count+1}
    
        ${Terms}=    Run Keyword And Return Status            Wait For And Verify Element                    xpath=//div[contains(text(),"Select Payment Option")]
        #Clicking on each payment option
        Wait For And Click Element                            xpath=(//a[@class="digi-payment-anchor"])[${i}]
        # Verifying content of each payment method
        Wait For And Verify Element                           xpath=//div[contains(@class,"payment-detailsTab")]
        IF    ${Terms}== True
            # Terms & Conditions into view
            Scroll To                                         xpath=(//span[@class="digi-terms"])[${i}]
            # Clicking on Terms & Conditions
            Wait For And Click Element                        xpath=(//span[@class="digi-terms"])[${i}]
            Change Tab                                        Jio - Online Shopping Terms & Conditions
            # Verifying the URL of Terms & Conditions Page
            URL Validation                                    https://www.jio.com/en-in/online-terms
            # Changing tab to payment gatway tab
            Change Tab                                        Checkout | Buy Smart Watches, SmartPhones & Accessories Online at Best Price 
        END
    END
# ---------------------------
    









#---------------------------- Support Local_Keywords -------------------------------

video Verification
    Sleep    2s
    #check if video preview window is visible
    Wait Until Element Is Visible            xpath://video[@id='videoCustom']
    Element Attribute Value Should Be        xpath://video[@id='videoCustom']    autoplay    true    
    #click on close button
    Wait For And Click Element               xpath://button[@class="j-button j-button-size__small tertiary icon-primary icon-only video-btn-close-custom"]

verify 'still need to discuss something?' section
    Scroll To                                xpath://section[@class="j-container bg--primary-background"]
    Wait For And Verify Content              xpath://h2[contains(text(),'Still need to discuss something?')]    Still need to discuss something?
    #verify the buttons in the section
    ${buttons}=    Get WebElements           xpath://button[@class="j-button j-button-size__medium secondary icon-primary icon-primary-inline j-button-flex "]
    FOR    ${button}    IN    @{buttons}
        Wait For And Verify Element          ${button}
        ${text}=    Get Text                 ${button}
        Wait For And Verify Content          ${button}               ${text}
    END

Redirect and continue  
   [Arguments]                               ${Button}               ${WebPageURL}    ${Sc_name}
    Scroll To                                ${Button}                 
    Wait For And Click Element               ${Button}              
    Sleep     1s
    URL Validation                           ${WebPageURL}
    Take Page Screenshot                     ${Sc_name}
    Log To Console                           ${Sc_name}     Redirection Successful

Chat-bot verification
    #verify chat bot
    Wait For And Verify Element              xpath://div[@class="sticky_chat_wrap"]
    Wait For And Verify Content              xpath://section[@class="chatbot-header"]                        JioCare
    Take Page Screenshot                     Sc_chatBoxOpens
    #click on close button
    Wait For And Click Element               xpath://a[@class="close_chatbox"]

Tab Verification
    #Locate Us Heading
    Text Verification                         ${LocateUs}              ${locateus_text}[0]
    #Search Bar
    Wait For And Verify Element               ${input_placeholder}
    #Stores Tab
    Text Verification                         ${storestab}             ${tabtext}[0]
    #Service Centers Tab
    Text Verification                         ${servicecentersTab}     ${tabtext}[1]
    #Hotspots Tab
    Text Verification                         ${hotspotsTab}           ${tabtext}[2]

Verify Search Bar
    Wait For And Verify Element               ${LocateUs_Searchbar_xpath}





#-------------------------------------------------------------------- Home Page Local_Keywords -----------------------------------------------------------------------------#

# -------------------------------
Pop-Up Verification Home
    [Arguments]      ${Title}
    #Close Button
    Wait For And Verify Element               xpath=//button[contains(@onclick,'close')]
    #Rupees Symbol
    Wait For And Verify Element               xpath=//div[@class='input-info-wrapper']//span[@class='j-icon j-icon__bg']//*[name()='svg']
    #Toggle Button
    Wait For And Verify Element               xpath=//div[contains(@class,'jds-tabs jds-tabs-filled jds-tabs-radius jds-tabs-icon modal-jds-tabs')]
    #Onkar.Sarje
    IF  "${Title}" == "Quick Recharge"
        CSS Verification                      xpath=//h5[normalize-space()='Quick Recharge']	    font-weight	     900
        ${Status}=         Run Keyword And Return Status   Wait For And Verify Element       xpath=//a[@aria-controls="mobile"][@aria-selected="true"]
        #Mobile & Fiber Tab
        IF  ${Status} == True
        #Quick Recharge sub-title
            Text Verification                  xpath=//div[@class='j-contentBlock__description j-text-body-xs j-color-primary-grey-80']  Enter your Jio number
            #Enter Mobile Number
            Text Verification                  xpath=//label[@class='field-label' and @for='type-id-1' and contains(text(),'Mobile')]  Mobile Number
            Wait For And Click Element         xpath=//a[@aria-controls="fiber"][@aria-selected="false"]
            Text Verification                  xpath=//div[@class='j-contentBlock__description j-text-body-xs j-color-primary-grey-80']  Enter your JioFiber number
            #Enter JioFiber Number
            Text Verification                  xpath=//label[@class='field-label' and @for='type-id-1' and contains(text(),'JioFiber')]  JioFiber Number
            #i button
            Wait For And Click Element         xpath=//span[@data-popup-open='modal-info']
            #i button popup UI Verification
            Wait For And Verify Element        xpath=//div[@class="j-modal-container"]//button[@data-popup-close="modal-info"]
            Wait For And Verify Element        xpath=//div[@class="j-text-heading-xs"]
            Wait For And Verify Element        xpath=//div[@class="j-text-body-xxs "]
            #i button popup Text Verification
            Text Verification                  xpath=//div[@class="j-modal-container"]//button[@data-popup-close="modal-info"]    ${iButton}[0]
            Text Verification                  xpath=//div[@class="j-text-heading-xs"]    ${iButton}[1]
            Text Verification                  xpath=//div[contains(text(),'You may enter any of the following details:')]    ${iButton}[2]
            #i button     popup Text Verification subtext
            Text Verification                  xpath=//ul[@class="pd--left m-0"]//li[1]    ${iButton}[3]
            Text Verification                  xpath=//ul[@class="pd--left m-0"]//li[2]    ${iButton}[4]
            Text Verification                  xpath=//ul[@class="pd--left m-0"]//li[3]    ${iButton}[5]
            #Back button
            Wait For And Click Element         xpath=//div[@class="j-modal-container"]//button[@data-popup-close="modal-info"]
            Wait For And Click Element         xpath=//a[@aria-controls="mobile"][@aria-selected="false"]
        END 
   #Vaishnavi.Mantri
    ELSE IF  "${Title}" == "Pay Bill"
        CSS Verification                       xpath=//h5[normalize-space()='Pay Bill']	    font-weight	     900
        ${Status}=         Run Keyword And Return Status   Wait For And Verify Element     xpath=//a[@aria-controls="mobile1"][@aria-selected="true"]
        #Mobile & Fiber Tab
        IF  ${Status} == True
            #Quick Recharge sub-title
            Text Verification                   xpath=//div[@class="j-contentBlock__content"]//div[contains(normalize-space(),"Paying bills")]  Paying bills was never this easy
            #Enter Mobile Number
            Text Verification                   xpath=//label[@class='field-label' and @for='type-id-1' and contains(text(),'Mobile')]  Postpaid Mobile Number            
            Wait For And Click Element          xpath=//a[@aria-controls="fiber1"][@aria-selected="false"]
            #Enter JioFiber Number
            Text Verification                   xpath=//label[@class='field-label' and @for='type-id-1' and contains(text(),'JioFiber')]  Postpaid JioFiber Number
            #i button
            Wait For And Verify Element        xpath=//span[@data-popup-open='modal-pb-info']
        END
        #Rupaye symbol in Amount field  
        Wait For And Verify Element            xpath=//span[@class="input-icon input-icon-prefix clickable"]
        #Enter Amount
        Text Verification                      xpath=//label[@class='field-label' and contains(text(),'Am')]  Amount
        Wait For And Click Element             xpath=//a[@aria-controls="mobile1"][@aria-selected="false"]
        #Please Note Text Verification
        Text Verification                      xpath=//div[@class="j-text j-text-body-xxs j-color-primary-grey-80"]    ${PleaseNote}  
    ELSE 
        Log  Random Popup
    END
    #Continue,View Bill Summary button
    ${buttons}=     Get WebElements            xpath=//button[contains(@class,'btn-disabled')]
    FOR  ${button}  IN  @{buttons}
        Button Verification                    ${button}
    END

# -------------------------------


Check Buttons Enabled
    [Arguments]     ${name_locator}     ${name}   ${number_locator}     ${number}   ${Bt_locator}      
    Element Should Be Disabled          ${Bt_locator}
    Wait For And Click Element          ${name_locator}
    Wait For And Input Text             ${name_locator}         ${name}
    Sleep   200ms
    Wait For And Click Element          ${number_locator}
    Wait For And Input Text             ${number_locator}       ${number}
    Sleep   200ms
    Element Should Be Enabled           ${Bt_locator}

# -------------------------------

Paybill Mobile Tab Validation
    [Arguments]         ${Number}
    #Check Cross Button is not visible
    Wait Until Element Is Not Visible   xpath=//div[2]/div[1]//span[@class='input-icon input-icon-suffix clickable clear-btn']
    Wait Until Element Is Not Visible   xpath=//div[contains(@class,'input-has-prefix')]//span[@class='input-icon input-icon-suffix clickable clear-btn']
   
    #Blank Enteries Toast Verification for Mobile Page
    Wait For And Click Element          xpath=//button[contains(@class,'btn-disabled')][1]
    Text Verification                   xpath=//*[@id="gen-paybill-user-number-invalid"]/div/span    Please enter a valid Jio number
    Wait For And Click Element          xpath=//button[contains(@class,'btn-disabled')][2]   
    Text Verification                   xpath=//*[@id="gen-paybill-user-number-invalid"]/div/span    Please enter a valid Jio number
    Text Verification                   xpath=//*[@id="gen-paybill-user-amount-invalid"]/div/span    Please enter a valid bill amount       
   
    #Toast Verfication of Mobile Tab
    Wait For And Input Text             xpath=//input[@id='paybill-user-number']        1234567890
    Wait For And Click Element          xpath=//button[normalize-space()='View bill summary']
    Text Verification                   xpath=//*[@id="dyn-sendotp-paybill-geninvalid"]/div/span   Please enter a valid Jio number/Service ID
    Wait For And Click Element          xpath=//button[@onclick='payBillContinueWithAmt(this)']
    Text Verification                   xpath=//*[@id="gen-paybill-user-amount-invalid"]/div/span    Please enter a valid bill amount       
   
    #Clear Textfield
    #Cross Button Functionality of Mobile Tab
    Wait For And Input Text             xpath=//input[@id='paybill-user-number']        ${Number}                                                                
    Wait For And Input Text             xpath=//input[@id='paybill-user-amount']        100 
    Cross Button Functionality          xpath=//div[2]/div[1]//span[@class='input-icon input-icon-suffix clickable clear-btn']
    Cross Button Functionality          xpath=//div[contains(@class,'input-has-prefix')]//span[@class='input-icon input-icon-suffix clickable clear-btn']
    
    #Prepaid Number Verification Mobile Tab
    Wait For And Input Text             xpath=//input[@id='paybill-user-number']        ${Number}                                                                
    Wait For And Input Text             xpath=//input[@id='paybill-user-amount']        100 
    Cross Button Functionality          xpath=//div[2]/div[1]//span[@class='input-icon input-icon-suffix clickable clear-btn']
    Cross Button Functionality          xpath=//div[contains(@class,'input-has-prefix')]//span[@class='input-icon input-icon-suffix clickable clear-btn']
    Wait For And Input Text             xpath=//input[@id='paybill-user-number']        ${Number}                                                                
    Wait For And Input Text             xpath=//input[@id='paybill-user-amount']        100 
    Wait For And Click Element          xpath=//button[contains(@class,'btn-disabled')][2] 
    Text Verification                   xpath= //div[@id='dyn-submitamt-paybill-geninvalid']//div[@class='field-error']    Invalid Request
    Sleep    3s

# -------------------------------

Paybill Fiber Tab Validation 
   [Arguments]         ${Number}  
    #Check Cross Button is not visible
    Wait Until Element Is Not Visible   xpath=//div[2]/div[1]//span[@class='input-icon input-icon-suffix clickable clear-btn']
    Wait Until Element Is Not Visible   xpath=//div[contains(@class,'input-has-prefix')]//span[@class='input-icon input-icon-suffix clickable clear-btn']
    
    #i button
    Wait For And Click Element         xpath=//span[@data-popup-open='modal-pb-info']
    #i button popup UI Verification
    Wait For And Verify Element        xpath=//div[@class="j-modal-container"]//button[@data-popup-close="modal-pb-info"]
    Wait For And Verify Element        xpath=//div[@class="j-text-heading-xs"]
    Wait For And Verify Element        xpath=//div[@class="j-text-body-xxs "]
    #i button popup Text Verification
    Text Verification                  xpath=//div[@class="j-modal-container"]//button[@data-popup-close="modal-pb-info"]    ${iButton}[0]
    Text Verification                  xpath=//div[@class="j-text-heading-xs"]    ${iButton}[1]
    Text Verification                  xpath=//div[contains(text(),'You may enter any of the following details:')]    ${iButton}[2]
    #i button popup Text Verification subtext
    #Text Verification                  xpath=//ul[@class="pd--left m-0"]//li[1]    ${iButton}[3]
    Text Verification                  xpath=//ul[@class="pd--left m-0"]//li[1]    ${iButton}[4]
    Text Verification                  xpath=//ul[@class="pd--left m-0"]//li[2]    ${iButton}[5]
    #Back button
    Click Element                      xpath=//div[@class="j-modal-container"]//button[@data-popup-close="modal-pb-info"]
    
    #Blank Enteries Toast Verification for Fiber Page
    Wait For And Click Element          xpath=//button[contains(@class,'btn-disabled')][1]
    Text Verification                   xpath=//*[@id="gen-paybill-user-number-invalid"]/div/span    Please enter a valid JioFiber number
    Wait For And Click Element          xpath=//button[contains(@class,'btn-disabled')][2]   
    #Text Verification                  xpath=//*[@id="gen-paybill-user-number-invalid"]/div/span    Please enter a valid JioFiber number    
    Text Verification                   xpath=//*[@id="gen-paybill-user-amount-invalid"]/div/span    Please enter a valid bill amount       
    
    #Invalid Number Text Verification
    Wait For And Input Text             xpath=//input[@id='paybill-user-number']        1234567890
    Wait For And Click Element          xpath=//button[contains(@class,'btn-disabled')][1]
    Text Verification                   xpath=//div[@id='dyn-sendotp-paybill-geninvalid']    Please enter a valid Jio number/Service ID
    Wait For And Click Element          xpath=//button[contains(@class,'btn-disabled')][2]   
    Text Verification                   xpath=//div[@id='gen-paybill-user-amount-invalid']//div[contains(@class,'field-error')]    Please enter a valid bill amount
    #Text Verification                   xpath=//div[@id='dyn-sendotp-paybill-geninvalid']    Please enter a valid Jio number/Service ID     
    
    #Clear Textfield
    #Cross Button Functionality of Fiber Tab
    Wait For And Input Text             xpath=//input[@id='paybill-user-number']        ${Number}                                                                
    Wait For And Input Text             xpath=//input[@id='paybill-user-amount']        100 
    Cross Button Functionality          xpath=//div[2]/div[1]//span[@class='input-icon input-icon-suffix clickable clear-btn']
    Cross Button Functionality          xpath=//div[contains(@class,'input-has-prefix')]//span[@class='input-icon input-icon-suffix clickable clear-btn']
    
    #Prepaid Number Verification Fiber Tab
    Wait For And Input Text             xpath=//input[@id='paybill-user-number']        ${Number}                                                                
    Wait For And Input Text             xpath=//input[@id='paybill-user-amount']        100 
    Cross Button Functionality          xpath=//div[2]/div[1]//span[@class='input-icon input-icon-suffix clickable clear-btn']
    Cross Button Functionality          xpath=//div[contains(@class,'input-has-prefix')]//span[@class='input-icon input-icon-suffix clickable clear-btn']
    Wait For And Input Text             xpath=//input[@id='paybill-user-number']        ${Number}                                                                
    Wait For And Input Text             xpath=//input[@id='paybill-user-amount']        100 
    Wait For And Click Element          xpath=//button[contains(@class,'btn-disabled')][2] 
    Text Verification                   xpath=//div[@id='dyn-submitamt-paybill-geninvalid']//div[@class='field-error']    Invalid Request

# -------------------------------

Check Continue Button Enabled
    [Arguments]     ${text_locator}     ${locator}      ${text}
    Wait For And Click Element      ${text_locator}
    Sleep   200ms
    Wait For And Input Text         ${text_locator}     ${text}
    Sleep   200ms
    Element Should Be Enabled       ${locator}


---------------------------------
Need Guidance Section Validation                                            #akshaansh.h
   Scroll To                              xpath=//section[@class="j-container bg--primary-background"]
   Wait For And Verify Element               xpath=//section[@class="j-container bg--primary-background"]
   Take Element Screenshot                   xpath=//section[@class="j-container bg--primary-background"]            NeedGuidance
   ${Inc}    Set Variable    0
   # Need Guidance Text Verification
   Text verification             xpath=//section[@class="j-container bg--primary-background"]//h2[@class="j-contentBlock__title j-heading j-text-heading-l"]                      Need guidance?
   # Need Guidance CSS Verification
   CSS Verification            xpath=//section[@class="j-container bg--primary-background"]//h2[@class="j-contentBlock__title j-heading j-text-heading-l"]    font-weight    900
   #We’d love to help you. Text Verification
   Text verification             xpath=//section[@class="j-container bg--primary-background"]//div[@class="j-contentBlock__description j-text-body-m j-color-primary-grey-80"]    We’d love to help you.
   #Support Button Text Verification
   ${Buttons}=      Get WebElements      xpath=//button[@class="j-button j-button-size__medium secondary icon-primary icon-primary-inline j-button-flex "] 
   FOR  ${Button}  IN  @{Buttons}
      Text verification    ${Button}   ${Button_Name}[${Inc}]
      ${Inc}=   Evaluate       ${Inc} + 1   
   END
                            

   #Support Button Redirection Check
   ${VB}  Set Variable   0
   WHILE  ${VB} < 4
      Redirection On Clicking     xpath=//button[@class="j-button j-button-size__medium secondary icon-primary icon-primary-inline j-button-flex "]//div[contains(text(),'${Button_Name}[${VB}]')]   ${Guidance_UrlList}[${VB}]    ${Button_Name}[${VB}]  
      ${VB}=   Evaluate     ${VB} + 1
   END

#-------------------------------------------   
Banner Redirection with content verification
    [Arguments]     ${locator_id}   ${Sc_Name}
    ${visiblity}=   Run Keyword And Return Status   Wait Until Element Is Visible       xpath=//ul[@class='slick-dots']
    ${RURL}=    Get Location
    IF  ${visiblity} == True
        ${VB}  Set Variable   0
        WHILE  ${VB} < 3
            Wait For And Click Element      xpath=//li[@id='${locator_id}${VB}']
            Sleep  300ms
            Text Verification               xpath=(//h2[@class="j-color-primary-grey-100 j-text-heading-l"])[${VB}+1]   ${Banner_title}[${VB}]
            CSS Verification 	            xpath=(//h2[@class="j-color-primary-grey-100 j-text-heading-l"])[${VB}+1]    font-weight	 900
            Wait For And Click Element      xpath=//div[@class="j-fullwidth-banner slick-slide slick-current slick-active"][@aria-describedby="${locator_id}${VB}"]//button[contains(@class,'redirectButton')]
            Take Page Screenshot            ${Sc_Name}_BannerRedirection_${VB}
            Log To Console                  ${Sc_Name}_Banner_${VB} Redirection Successful
            Go To                           ${RURL}
            ${VB}=   Evaluate     ${VB} + 1
        END
    ELSE
        Wait For And Click Element      ${locator_id}
        Take Page Screenshot                 ${Sc_Name}_BannerRedirection
        Log To Console                  ${Sc_Name}_Banner_Redirection Successful
        Go Back
    END


#--------------------------Mobile and Fiber --------------------------

Pop-Up Verification
    [Arguments]      ${Title}
    # Cross Button
    Wait For And Verify Element             xpath=//button[contains(@onclick,'close')]
    # Rupees Symbol
    Wait For And Verify Element             xpath=//div[@class='input-info-wrapper']//span[@class='j-icon j-icon__bg']//*[name()='svg']
    # Toggle Button
    Wait For And Verify Element             xpath=//div[contains(@class,'jds-tabs jds-tabs-filled jds-tabs-radius jds-tabs-icon modal-jds-tabs')]
    # Checking title 'Quick recharge'
    IF  "${Title}" == "Quick Recharge"
        
        # Getting status whether Mobile tab is selected by default.
        ${Status}=         Run Keyword And Return Status   Wait For And Verify Element     xpath=//a[@aria-controls="mobile"][@aria-selected="true"]

        # Checking status whether tab is active.
        IF  ${Status} == True
            
            # Quick Recharge sub-title
            Text Verification                xpath=//div[@class='j-contentBlock__description j-text-body-xs j-color-primary-grey-80']       Enter your Jio number
            
            # Mobile Number Placeholder verification
            Text Verification                xpath=//label[@class='field-label' and @for='type-id-1' and contains(text(),'Mobile')]         Mobile Number
            
            # Clicking on fiber tab
            Wait For And Click Element       xpath=//a[@aria-controls="fiber"][@aria-selected="false"]
            
            # Quick Recharge sub-title
            Text Verification                xpath=//div[@class='j-contentBlock__description j-text-body-xs j-color-primary-grey-80']       Enter your JioFiber number
            
            # JioFiber Number Placeholder verification
            Text Verification                xpath=//label[@class='field-label' and @for='type-id-1' and contains(text(),'JioFiber')]       JioFiber Number
            
            # Input Box 'i' button verification
            Wait For And Verify Element     xpath=//span[@data-popup-open='modal-info']
            
            # Clicking on Mobile tab
            Wait For And Click Element       xpath=//a[@aria-controls="mobile"][@aria-selected="false"]
        END

    ELSE IF  "${Title}" == "Pay Bill"

        # Getting status whether Mobile tab is selected by default.
        ${Status}=         Run Keyword And Return Status   Wait For And Verify Element     xpath=//a[@aria-controls="mobile1"][@aria-selected="true"]
        
        IF  ${Status} == True

            # Quick Recharge sub-title
            Text Verification                xpath=//div[@class="j-contentBlock__content"]//div[contains(normalize-space(),"Paying bills")]     Paying bills was never this easy
           
            # Placeholder verification
            Text Verification                xpath=//label[@class='field-label' and @for='type-id-1' and contains(text(),'Mobile')]     Postpaid Mobile Number            
            
            # Clicking on fiber tab
            Wait For And Click Element       xpath=//a[@aria-controls="fiber1"][@aria-selected="false"]
            
            # Placeholder Verification
            Text Verification                xpath=//label[@class='field-label' and @for='type-id-1' and contains(text(),'JioFiber')]       Postpaid JioFiber Number
            
            # Input Box 'i' button verification
            Wait For And Verify Element     xpath=//span[@data-popup-open='modal-pb-info']
        END
        # Rupee symbol in Amount field  
        Wait For And Verify Element         xpath=//span[@class="input-icon input-icon-prefix clickable"]
        
        # Placeholder Text Verification
        Text Verification                   xpath=//label[@class='field-label' and contains(text(),'Am')]  Amount

        # Clicking on Mobile tab
        Wait For And Click Element          xpath=//a[@aria-controls="mobile1"][@aria-selected="false"]
    ELSE 
        Log  Random Popup
    END

    #Continue,View Bill Summary button Verification
    ${buttons}=     Get WebElements     xpath=//button[contains(@class,'btn-disabled')]
    FOR  ${button}  IN  @{buttons}
        Button Verification         ${button}
    END

Paybill Tab Validation-Mobile
    [Arguments]         ${Number}
    
    # Checking First Clear Button is not visible
    Wait Until Element Is Not Visible   xpath=//div[2]/div[1]//span[@class='input-icon input-icon-suffix clickable clear-btn']

    # Checking Second Clear Button is not visible
    Wait Until Element Is Not Visible   xpath=//div[contains(@class,'input-has-prefix')]//span[@class='input-icon input-icon-suffix clickable clear-btn']
    
    # Check Continue Button Enabled or not
    Run Keyword And Continue On Failure    Check Continue Button Enabled                xpath=//input[@id='paybill-user-number']                xpath=//button[contains(@class,'btn-disabled')][1]        ${Incorrect_No1}
        
    # Invalid Number Verification
    Wait For And Click Element          xpath=//button[contains(@class,'btn-disabled')][1]
    
    # Verifying the error text appear
    Text Verification                   xpath=//div[@id='dyn-sendotp-paybill-geninvalid']                  Please enter a valid Jio number/Service ID  
    
    # Clear Textfield
    Cross Button Functionality          xpath=//div[2]/div[1]//span[@class='input-icon input-icon-suffix clickable clear-btn']
    
    
    #Prepaid Number Verification
    Wait For And Input Text             xpath=//input[@id='paybill-user-number']        ${Number} 
    Wait For And Input Text             xpath=//input[@id='paybill-user-amount']        100 
    Wait For And Click Element          xpath=//button[contains(@class,'btn-disabled')][2] 
    Text Verification                   xpath=//div[@id='dyn-submitamt-paybill-geninvalid']    You are subscribed to a corporate plan. Payments are not allowed for this plan     

#----------------------------------------------------

Paybill Tab Validation-Fiber
    [Arguments]         ${Number}
    #Check Cross Button is not visible
    Wait Until Element Is Not Visible   xpath=//div[2]/div[1]//span[@class='input-icon input-icon-suffix clickable clear-btn']
    Wait Until Element Is Not Visible   xpath=//div[contains(@class,'input-has-prefix')]//span[@class='input-icon input-icon-suffix clickable clear-btn']
    
    #Check Continue Button Enabled or not
    Run Keyword And Continue On Failure    Check Continue Button Enabled                xpath=//input[@id='paybill-user-number']                xpath=//button[contains(@class,'btn-disabled')][1]        ${Incorrect_No1}
    #Run Keyword And Continue On Failure    Check Continue Button Enabled                xpath=//input[@id='paybill-user-amount']                xpath=//button[contains(@class,'btn-disabled')][2]        100 
    
    #Invalid Number Verification
    Wait For And Click Element          xpath=//button[contains(@class,'btn-disabled')][1]
    Text Verification                   xpath=//div[@id='dyn-sendotp-paybill-geninvalid']                  Please enter a valid Jio number/Service ID  
    #Clear Textfield
    Cross Button Functionality          xpath=//div[2]/div[1]//span[@class='input-icon input-icon-suffix clickable clear-btn']
    #Cross Button Functionality          xpath=//div[contains(@class,'input-has-prefix')]//span[@class='input-icon input-icon-suffix clickable clear-btn']
    
    #Prepaid Number Verification
    Wait For And Input Text             xpath=//input[@id='paybill-user-number']        ${Number} 
    Wait For And Input Text             xpath=//input[@id='paybill-user-amount']        100 
    Wait For And Click Element          xpath=//button[contains(@class,'btn-disabled')][2] 

#-------------------------------------------

Select All Filters 
    #clicking filter button
    Wait For And Click Element          xpath=//section[contains(@class,'desktop')]//div[contains(@class, 'filterBtn')]//Button[2]
    ${checkboxes}=                      Get WebElements     xpath=//div[contains(@class,"j-modal-visible j-modal-closable")]//div[@class="FilterPopup_checkbox__10y7P"]
    ${len}=                             Get Length      ${checkboxes}
    log to console  ${len}
    FOR     ${i}    IN RANGE   1   ${len}+1   
        # selecting checkbox
        Wait For And Click Element          xpath=(//div[contains(@class,"j-modal-visible")]//div[@class="FilterPopup_checkbox__10y7P"]//span[@aria-label])[${i}]
    END
    #click on show plans button
    Wait For And Click Element          xpath=//div[contains(@class, 'visible')]//button[@aria-label='button'][normalize-space()='Show plans']

#-------------------------------------------


View all Sub plans button Redirection
    ${elements}=    Get WebElements         xpath=(//section[contains(@class,'desktop')]//button[contains(normalize-space(),'View all')])
    ${length}=      Get Length              ${elements}
    FOR     ${i}    IN RANGE   1  ${length}+1
        #Scroll to sub-plan title
        Scroll To                         xpath=(//section[contains(@class,'desktop')]//button[contains(normalize-space(),'View all')])[${i}]
  
        # Take Element Text of sub-plan title
        ${Plan Title}=                      Take Element Text        xpath=(//section[contains(@class,'desktop')]//button[contains(normalize-space(),'View all')])[${i}]
        # Clicking view all sub-plans button
        Wait For And Click Element         xpath=(//section[contains(@class,'desktop')]//button[contains(normalize-space(),'View all')])[${i}]
        
        # Verifying plan title
        Wait For And Verify Element          xpath=//section[contains(@class,'desktop')]//button[@class='j-tag active clickable'] 
        
        Take Page Screenshot                     ${Plan Title}_Sub-Plan_loaded
        
        # clicking on cross button above showing results
        Wait For And Click Element          xpath=//section[contains(@class,'desktop')]//button[@class='j-tag active clickable']
    END

#-------------------------------------------


Read Data

    [Arguments]  ${card}  ${sheet_name}  ${row_num} 

    ${cards_text}  Create List    

    ${elements_cnt}  Get Element Count  ${card}

    FOR  ${i}  IN RANGE   1  ${elements_cnt}+1

        ${text} =  SeleniumLibrary.Get Text  (${card})[${i}]
        Append To List  ${cards_text}  ${text}  

        Write Excel Cell  row_num=${row_num}  col_num=${i}  value=${text}  sheet_name=${sheet_name}

        Save Excel Document  filename=Resources/JioWeb.xlsx    

    END  

    [Return]  ${cards_text}

#-------------------------------------------


Plan Card Verification-2

    [Arguments]  ${cards}  ${sheet_name}  ${row_num}
    
    #Uncomment IF part to the write the data in excel
    
    # ${choice} =  Get Selection From User  Want to write data to excel?  Yes  No  
    # IF  "${choice}" == "Yes"

    #     ${text}  Read Data  ${cards}  ${sheet_name}  ${row_num}

    # END

    ${elements_cnt}  Get Element Count  ${cards}

    FOR  ${i}  IN RANGE   1  ${elements_cnt}+1  

        ${text} =  SeleniumLibrary.Get Text  (${cards})[${i}]

        # ${text} =  Split String  ${text}  separator=\n

        # ${text} =  Evaluate             "".join(${text})

        
        ${gt_txt} =  Read Excel Cell  ${row_num}  col_num=${i}  sheet_name=${sheet_name}
        
        Should Be Equal  ${text}  ${gt_txt}  strip_spaces=True

    END

#-------------------------------------------


View Details Pop up Verification 2
    [Arguments]   ${View_Button}  ${section}  ${Sheet_name}  ${row_num}  ${col_num}  ${Cross}

    #Bring "View Details" button into view
    Scroll To     ${View_Button} 
    Sleep    200ms 

    #Opening Popup
    Wait Until Keyword Succeeds     5sec  2sec  Open Popup  ${View_Button}          

    #Waiting untill model loads
    Wait For And Verify Element    ${section} 

    #Getting Card details
    ${text} =  Get Text  ${section}

    #Uncomment IF part to write the data in excel
    #Write Excel Cell  row_num=${row_num}  col_num=${col_num}  value=${text}  sheet_name=${sheet_name}
    #Save Excel Document  filename=Resources/JioWeb.xlsx     

    #Fetching data from excel
    ${gt_txt} =  Read Excel Cell  row_num=${row_num}  col_num=${col_num}  sheet_name=${sheet_name}

    #Comparing data
    Should Be Equal  ${text}  ${gt_txt}  strip_spaces=True

    #Closing Pop-up
    Wait Until Keyword Succeeds     30sec  1sec    Close Popup     ${Cross}

#-------------------------------------------


Link Verification
    [Arguments]        ${Locator}
    Sleep  100ms
    Page Should Contain Link    ${Locator}

#-------------------------------------------


 # Get JioFiber
Landing on Installation address page                # Vishal Hassani

    # Entering name in name field
    Wait For And Input Text           xpath://input[@id="submitNumber"]    ${Name}

    # Entering number in number field
    Wait For And Input Text           xpath://input[@id="submitMobile"]    ${Prepaid_Number}

    # Clicking Generate OTP button
    Wait For And Click Element        xpath://button[@aria-label="button Generate OTP"]
    ${otp}=    Get Value From User    Enter OTP

    # Entering OTP
    Wait For And Input Text           xpath://input[@id="basic-input-testInput-code-block-0"]    ${otp}

    # Clicking on verify button
    Wait For And Click Element        xpath://button[@aria-label="button Verify"] 

#-------------------------------------------


Scroll To and click     [Arguments]  ${locator}
    Scroll To  ${locator}
    Click Element  ${locator}

#-------------------------------------------


Filter Button Verification

    #Open Filter popup
    Open Popup                      xpath=//section[contains(@class,'desktop')]//div[contains(@class, 'filterBtn')]//Button[2]

    #UI verification

    #Text as filter
    Text Verification               xpath=(//h4[(normalize-space()='Filter')])    Filter
    CSS Verification                xpath=(//h4[(normalize-space()='Filter')])    font-weight   900             

    #List of plans with checkbox
    ${checkboxes}=                  Get WebElements     xpath=//div[contains(@class,' j-modal-visible j-modal-closable')]//div[@class="FilterPopup_checkbox__10y7P"]

    FOR  ${checkbox}  IN  @{checkboxes}
        Wait For And Verify Element             ${checkbox}
        Checkbox Should Not Be Selected         ${checkbox}
    END
    #Show plans button
    Wait For And Verify Element         xpath=//button[@class="FilterPopup_showPlans__1eaSr j-button j-button-size__medium primary"]

    #Clear filter button
    Wait For And Verify Element         xpath=(//*[contains(@class,"j-modal-visible j-modal-closable")]//button[@class="j-button j-button-size__medium secondary"])

    #Cross icon which is present at top right corner
    Wait For And Verify Element         xpath=//div[contains(@class,"j-modal-visible")]//*[name()="svg"]

    #Filter pop-up Functionality
    ${length}=                          Get Length      ${checkboxes}
    @{Plan_List}=       Create List

    #All planfilter & Clear button
    FOR     ${i}    IN RANGE   1  ${length}+1
        Wait For And Click Element          xpath=//div[contains(@class,' j-modal-visible j-modal-closable')]//div[@class="FilterPopup_checkbox__10y7P"][${i}]//span[2]
        Checkbox Should Be Selected         xpath=//div[contains(@class,' j-modal-visible j-modal-closable')]//div[@class="FilterPopup_checkbox__10y7P"][${i}]//input
        ${Plan_Name}=       Get Text        xpath=//div[contains(@class,' j-modal-visible j-modal-closable')]//div[@class="FilterPopup_checkbox__10y7P"][${i}]
        Append To List      ${Plan_List}    ${Plan_Name}
    END

    #Clicks on cross icon 
    Wait For And Click Element          xpath=//div[contains(@class,"j-modal-visible")]//*[name()="svg"]

    #Open Filter popup
    Open Popup                              xpath=//section[contains(@class,'desktop')]//div[contains(@class, 'filterBtn')]//Button[2]

    #Checkbox should be selected
    Checkbox Should Be Selected            xpath=//div[contains(@class,' j-modal-visible j-modal-closable')]//div[@class="FilterPopup_checkbox__10y7P"][${i}]//input

    #Clicks on Show plans
    Wait For And Click Element             xpath=//button[@class="FilterPopup_showPlans__1eaSr j-button j-button-size__medium primary"]

    #Open Filter popup
    Open Popup                              xpath=//section[contains(@class,'desktop')]//div[contains(@class, 'filterBtn')]//Button[2]

    #Click on Clear filter
    Wait For And Click Element              xpath=//button[@class="j-button j-button-size__medium secondary"]

    #Clicks on Show plans
    Wait For And Click Element          xpath=//button[@class="FilterPopup_showPlans__1eaSr j-button j-button-size__medium primary"]

    #Open Filter popup
    Open Popup                      xpath=//section[contains(@class,'desktop')]//div[contains(@class, 'filterBtn')]//Button[2]
     @{Plan_List}=       Create List
    FOR     ${i}    IN RANGE   1  ${length}+1
        Wait For And Click Element          xpath=//div[contains(@class,' j-modal-visible j-modal-closable')]//div[@class="FilterPopup_checkbox__10y7P"][${i}]//span[2]
        Checkbox Should Be Selected         xpath=//div[contains(@class,' j-modal-visible j-modal-closable')]//div[@class="FilterPopup_checkbox__10y7P"][${i}]//input
        ${Plan_Name}=       Get Text        xpath=//div[contains(@class,' j-modal-visible j-modal-closable')]//div[@class="FilterPopup_checkbox__10y7P"][${i}]
        Append To List      ${Plan_List}    ${Plan_Name}
    END

    #Clicks on Show plans
    Wait For And Click Element             xpath=//button[@class="FilterPopup_showPlans__1eaSr j-button j-button-size__medium primary"]
    Log                                 ${Plan_List}
    ${cross_icon}=    Get Element Count     xpath=//section[contains(@class,"desktop")]//button[contains(@class,'j-tag active clickable')]
    FOR    ${i}      IN RANGE   1  ${cross_icon}+1
        Click Element                       xpath=(//i[@class='j-tag-icon'])[1]
        #Page Should Not Contain Element   //*[contains(@class,"desktop")]//i[@class='j-tag-icon']//preceding-sibling::*//*[normalize-space()="${Plan_List}[${i}]"]
    END

    #All the selected plans should not be visible
    Page Should Not Contain Element        xpath://*[contains(@class,"desktop")]//*[contains(text(),"Showing")]


#-------------------------------------------


Plan Page UI Verification-2
    [Arguments]                      ${title}
    #Title Verification  
    Text Verification                                            xpath:(//h1[@class="Filter_category__2vFb8 j-text j-text-heading-l"])[1]   ${title}

    #Verify Filter Button
    Wait For And Verify Element                                  xpath:(//div[contains(.,'Other Postpaid plans')])[6]

    #Getting the number of section based on Speed.
     ${length}=    Get Element Count                             xpath:(//section[contains(@class,'desktop')]//div[@class="Subcategory_gridCont__2F4Pm"])

     FOR     ${i}    IN RANGE   1  ${length}+1
        #Getting that element into view 
        Scroll To                                                xpath:(//section[contains(@class,'desktop')]//div[@class="Subcategory_gridCont__2F4Pm"])[${i}]

        #Getting the text of that pack
        ${packname}=  Get Text                                   xpath:(//section[contains(@class,'desktop')]//div[@class="Subcategory_gridCont__2F4Pm"]//div[contains(@class,"Subcategory_heading")])   

        #Verifying that element
        Wait For And Verify Element                              xpath:(//section[contains(@class,'desktop')]//div[@class="Subcategory_gridCont__2F4Pm"])[${i}]
        Take Page Screenshot     ${packname}
    END 

    #Other plans Title verification
    Wait For And Verify Element                                  xpath:(//section[@class="j-container l-breakpoint--desktop"]//*[contains(text(),'Other Postpaid plans')])[2] 

    #Verifying more information
    Wait For And Verify Element                                  xpath://section[contains(@class,'desktop')]//div[contains(@class,'MoreInformation_more')]

    #Fetching the buttons under more information section
    ${elements_count}=    Get Element Count                      xpath://section[contains(@class,'desktop')]//div[contains(@class,'MoreInformation')]//button[contains(@class,'secondary')]

    # Verifying every button
    FOR  ${element}  IN RANGE  1  ${elements_count}
         Wait For And Verify Element                             xpath:(//section[contains(@class,'desktop')]//div[contains(@class,'MoreInformation')]//button[contains(@class,'secondary')])[${element}]
    END

#-------------------------------------------


Best Selling JioFiber Accessories section
    Verify UI of Best Selling JioFiber Accessories section
    Scroll To                       xpath://section[@aria-label="jioaccessories"]
    Verify redirection of Best Selling JioFiber Accessories section    3

#-------------------------------------------


More from Jio section
    Verify Presence of More from Jio section
    Scroll To                       xpath://section[@aria-label="More from Jio"]
    Verify Redirection of More from Jio Promo cards    2

#-------------------------------------------

Verify Banner redirection
    
    # Clicking on banner and checking the redirection
    Redirection On Clicking           xpath:(//div[@class='j-promo-card bg--primary img--filled orientation--horizontal no-children']//div[@class='j-promo-card__content-body'])[1]     ${Services_URLs[0]}    Service_Banner_redirect   

#-------------------------------------------

Verify Presence of Banner
    
    # Verifying if banner is visible
    ${pb}=  Run Keyword And Return Status  Wait For And Verify Element  xpath://div[@class="j-card__flex j-flex-column-reverse"]
    Run Keyword If  ${pb}==False   Wait For And Verify Element          xpath://section[@class="j-container l-layout--max-width"]//section[@role="promo-banner"]
    

#-------------------------------------------

Verify Get JioFiber button redirection

    # Clicking on Get JioFiber button and checking the redirection
    Redirection On Clicking           xpath://button[@aria-label="Get JioFiber"]   ${Services_URLs[0]}    Get_JioFiber_redirect


#-------------------------------------------

Verify Tiles are present under Distinguished features
    [Arguments]    ${total_cards}
    
    # For loop to check visibility of cards.
    FOR  ${i}  IN RANGE    0    ${total_cards}

        # Verifying that card is present. 
        ${df}=  Run Keyword And Return Status  Wait For And Verify Element  xpath:(//section[contains(@aria-label,"Distinguished features")]//div[@class="j-card__flex"])[${i+1}]
        Run Keyword If  ${df}==False  Wait For And Verify Element           xpath:(//div[@class="j-card__flex"])[${i+1}]

    END


#-------------------------------------------

Verify Functionality of Video cards
    [Arguments]    ${total_videos}

    
    # For loop to Click on every video tile and checking functionality
    FOR  ${i}  IN RANGE    0    ${total_videos}

        # waiting for elements to load
        Sleep    6s

        # Storing Video card heading in the variable
        ${title}=    Get Text                    xpath:(//div[@class="j-card h-100 size--xs card-vertical j-card__has-fullCardCTA no-top-padding j-card__shadow"])[${i+1}]

        # Scrolling Video cards into View
        Scroll To                 xpath:(//div[@class="j-card h-100 size--xs card-vertical j-card__has-fullCardCTA no-top-padding j-card__shadow"])[${i+1}]
        
        # Clicking on Video card
        Click Element                            xpath:(//div[@class="j-card h-100 size--xs card-vertical j-card__has-fullCardCTA no-top-padding j-card__shadow"])[${i+1}]

        # Verifying that the title of Video matches with title of Video card
        Wait For And Verify Content              xpath:(//div[@class="j-card h-100 size--xs card-vertical j-card__has-fullCardCTA no-top-padding j-card__shadow"])[${i+1}]    ${title}

        # Waiting till the iframe(youtube window) is visible
        Wait Until Element Is Visible            xpath://iframe[contains(@src,'https://www.youtube.com/embed/')]    15s

        # Selecting iframe with youtube video
        Select Frame                             xpath://iframe[contains(@src,'https://www.youtube.com/embed/')]

        # Waiting for iframe to load
        Sleep    2s

        # Verifying if video is playing or not
        Wait Until Page Contains Element         xpath://div[contains(@class,'playing-mode')]    15s

        # Unselecting youtube iframe
        Unselect Frame

        # Clicking on cross button
        Wait For And Click Element               xpath://button[@class="j-button j-button-size__medium tertiary icon-primary icon-only"]
    END


#-------------------------------------------

Verify redirection of Best Selling JioFiber Accessories section
    [Arguments]    ${total_product}

    # For loop to check redirection of product cards
    FOR  ${i}  IN RANGE    0    3

        # Clicking product cards and checking redirection
        Redirection On Clicking                xpath://section[@aria-label="jioaccessories"]//div[@class="h-100"][${i+1}]    ${Services_URLs[${i+1}]}    accessories${i+1}
    END

    # Checking redirection of View all accessories button
    Sleep    3s
    Wait For And Verify Element                  xpath=//button[@aria-label="View all accessories"]
    Redirection On Clicking                      xpath://button[@aria-label="View all accessories"]    ${Services_URLs[4]}    Accessories_page


#-------------------------------------------

Verify UI of Best Selling JioFiber Accessories section

    # Verifying if section is Visible
    Section Verification                  xpath://section[@aria-label="jioaccessories"]    Best Selling JioFiber Accessories

    # Verifying Title of the section
    Text Verification                     xpath://h3[contains(text(),"Best Selling JioFiber accessories")]    Best Selling JioFiber accessories

    # Storing total count of shop cards in variable
    ${count}=    Get Element Count               xpath://div[@class="h-100"]//a[@class="j-link j-card__hidden-cta"]

    # Checking if count is matched to 3
    Should Be Equal As Integers       ${count}    3

    # Verifying if View all accessories button is visible
    Wait For And Verify Element                  xpath://button[@aria-label="View all accessories"]


#-------------------------------------------

Verify Presence of More from Jio section

    # Verifying if more from jio section is visible
    Section Verification                  xpath://section[@aria-label="More from Jio"]    More from Jio

    # Verifying Title of the section
    Text Verification                     xpath://h3[contains(text(),"More from Jio")]    More from Jio

#-------------------------------------------

Verify Redirection of More from Jio Promo cards
    [Arguments]    ${total_banners}

    # For loop to check the redirection of Promo cards
    FOR  ${i}  IN RANGE    0    ${total_banners}

        # Clicking on Promo cards and checking redirection
        Redirection On Clicking                  xpath://div[@class="j-promo-card__content-body"]//h4[@class="j-heading j-text-heading-s"]    ${Services_URLs[0]}    More_from_jio_redirect
    END

#-------------------------------------------


Verify Functionality of accordians of FAQs section
    [Arguments]    ${total_FAQs}

    # Scrolling down to FAQs section
    Scroll To                                  xpath://section[@aria-label="faqs section"]

    # For loop to checking accordion functionality
    FOR  ${i}  IN RANGE    0    ${total_FAQs}

        # Clicking "+" icon to expand FAQ
        Wait For And Click Element               xpath:(//span[contains(@class,"accordion")]//*[local-name()='path' and contains(@d,"M20")])[${i+1}]
        Sleep    2s

        # Verifying icon is changed to "-"
        Wait For And Verify Element              xpath:(//span[contains(@class,"accordion")]//*[local-name()='path' and contains(@d,"M3.293")])

        # Verifying that the FAQ is expanded
        Element Attribute Value Should Be        xpath:(//div[@class="j-accordion"]/div[@class="j-accordion-panel active"])   aria-expanded    true  

        # Clicking "-" icon to collapse FAQ
        Wait For And Click Element               xpath:(//span[contains(@class,"accordion")]//*[local-name()='path' and contains(@d,"M3.293")])
        Sleep    2s

        # Verifying icon is changed to "+"
        Wait For And Verify Element              xpath:(//span[contains(@class,"accordion")]//*[local-name()='path' and contains(@d,"M20")])[${i+1}]

        # Verifying that the FAQ is collapsed
        Element Attribute Value Should Be        xpath:(//div[@class="j-accordion"]/div[@class="j-accordion-panel"])[${i+1}]    aria-expanded    false  

    END

#-------------------------------------------



Verify Heading & Sub-Heading
    [Arguments]  ${Heading}  ${Sub_Heading}
    Scroll To  ${Sub_Heading}
    Sleep  2s 
    Mouse Down  ${Heading}


#-------------------------------------------

    
Button Verification
    [Arguments]                             ${locator}
    Scroll To                             ${locator}
    Wait Until Element Is Visible           ${locator}
    Page Should Contain Button              ${locator}

#-------------------------------------------


Toast Capture and Data Validation
    [Arguments]    ${SC_name}    ${locator}    ${ToastTitle}
    Sleep    1s
    Wait For And Verify Content    ${locator}    ${ToastTitle}   
    Take Element Screenshot    ${locator}    ${SC_name}
    Take Page Screenshot    ${SC_name}-Page-Screenshot
    Log To Console    "${ToastTitle} found on Toast"

#-------------------------------------------

   
Redirection On Clicking_Button
   [Arguments]       ${Button}          ${WebPageURL}    ${Sc_name}   ${Landing_Back_Url} 
    Scroll To            ${Button}                 
    Wait For And Click Element          ${Button}              
    Sleep     5s
    Log To Console    ${WebPageURL}
    URL Validation                      ${WebPageURL}
    Take Page Screenshot                     ${Sc_name}
    Go To                               ${Landing_Back_Url}
    Log To Console                      ${Sc_name} Redirection Successful

#-------------------------------------------

   
Logo Verification
    [Arguments]                             ${locator}  
    Wait Until Element Is Visible           ${locator}    10s
    Element Should Be Visible               ${locator}




# ------------------------------- APPS --------------------------#

Tile Verification    
    IF         "${App_name}" == "MyJio"
        #Backgroud Image Verification
        Image Verification                            xpath=//section[@class="css-1b1uwmf j-container l-layout--max-width"]//section[@class="j-container l-layout--flex"]//img
        #App Tiles Logo Verification
        Image Verification                            xpath=//section[@class="css-1b1uwmf j-container l-layout--max-width"]//div[@class="j-listBlock__prefix"]//img
        #Title Verification Heading
        Text Verification                             xpath=//div[@class="j-contentBlock__title"]//h3                    Here's how India got a first taste of a super app
        #App Tiles Title Verification
        Text Verification                             xpath=//h6[normalize-space()='${App_name}']        ${App_name}
        #App Tiles Subtitle Verification
        Text Verification                             xpath=//section[@class="css-1b1uwmf j-container l-layout--max-width"]//div[@class="j-contentBlock__description"]               ${Subtitle} 
        #App Tiles Text Verification
        Text Verification                             xpath=//h6[normalize-space()='${App_name}']        ${App_name}
        #App Tiles Get Now Button Verification
        Text Verification                             xpath=//section[@class="css-1b1uwmf j-container l-layout--max-width"]//div[@class="j-button-group"]//button[1]         Get Now
        #App Tiles Know More Button verification
        Text Verification                             xpath=//section[@class="css-1b1uwmf j-container l-layout--max-width"]//div[@class="j-button-group"]//button[2]      ${Button_2}
    ELSE
        #Backgroud Image Verification
        Image Verification                            xpath=//div[@aria-label="${App_name}"]//div[@class="j-card__image ratio-wide"]//img
        #App Tiles Logo Verification
        Image Verification                            xpath=//div[@aria-label="${App_name}"]//div[@class="j-listBlock__main"]//img
        #App Tiles Title Verification
        Text Verification                             xpath=//h6[normalize-space()='${App_name}']        ${App_name}
        #App Tiles Subtitle Verification
        Text Verification                             xpath=//div[@aria-label="${App_name}"]//div[@class="j-contentBlock__description"]        ${Subtitle}
        #App Tiles Get Now Button Verification
        #JioPOS Lite Should throw error
        Text Verification                             xpath=//div[@aria-label="${App_name}"]//div[@class="j-button-group"]//button[1]           Get Now
        #App Tiles Know More Button verification
        Text Verification                             xpath=//div[@aria-label="${App_name}"]//div[@class="j-button-group"]//button[2]           ${Button_2}
    END
    


Popup Content Verification
    #Verifies the content of Pop Up    
    Text Verification                                           xpath=//section[@class="j-container l-layout--centered"]//h5[@cLass="j-heading j-text-heading-xs"]                     This app is not available for your device
    Text Verification                                           xpath=//div[@class='j-text j-text-body-xs']                             Available only in
    
    ${elements}=                   Get WebElements              xpath=//div[@class="j-modal-content"]//img
    FOR  ${element}  IN  @{elements}
        Wait For And Verify Element                             ${element}     
    END
  
 
Infographics Verificationn
    ${count}=     Set Variable  0
    #Stores the infographic's titles into a list
    ${elements_title}=  Get WebElements   xpath=//section[@data-testid="app-features-section"]//div[@class="j-grid"]//div[@class="j-contentBlock__title"]    
    ${length_title}=    Get Length       ${elements_title}
    #Text Verification For Title. This compares the list with excel values
    
    #Text Verification For Title
    FOR  ${title}  IN  @{elements_title}
                Text Verification           ${title}       ${Infographics}[${count}] 
                ${count}=   Evaluate     ${count} + 1
    END
    
    ${count}=     Set Variable  0
    #Stores the infographic's subtitles into a list
    ${elements_subtitle}=  Get WebElements   xpath=//section[@data-testid="app-features-section"]//div[@class="j-grid"]//div[@class="j-contentBlock__description"]
   
    #Text Verification For Subtitle. This compares the list with excel values
    FOR  ${subtitle}  IN  @{elements_subtitle}
                Text Verification           ${subtitle}       ${Infographics_subtitle}[${count}]
                ${count}=   Evaluate     ${count} + 1
    END

    #Image Verification of Infographics 
    FOR  ${image}  IN RANGE    1   ${length_title} + 1
            Scroll To                 xpath=(//div[@class="j-card__image ratio-landscape"])[${image}]
            Image Verification           xpath=(//div[@class="j-card__image ratio-landscape"])[${image}]/img
    END

    #Verifying Title is Bold and Subtext is of Lighter Font. Checks for the required CSS attribute
    FOR  ${check_text}  IN RANGE    1   ${length_title} + 1
            CSS Verification        xpath=(//section[@data-testid="app-features-section"]//div[@class="j-grid"]//div[@class="j-contentBlock__title"]//h3)[${check_text}]        font-weight        900
            CSS Verification        xpath=(//section[@data-testid="app-features-section"]//div[@class="j-grid"]//div[@class="j-contentBlock__description"]//div)[${check_text}]        font-weight        500
    END

    #Images are in alternate positions. The loop is iterating for all the sections in infographics
    FOR  ${it}  IN RANGE    1   ${length_title} + 1
        ${val}=     Set Variable        ${2}
        ${zero}=    Set Variable        ${0}
        ${modulo_result}    Evaluate    ${it}%${val}
        # If the image is on the left side or right side the following if else loop checks for the attribute order.
        IF     ${modulo_result} == ${zero}
            IF  "${App_name}" == "JioMart"
                    CSS Verification      xpath://div[@class="j-card size--xs card-vertical no-top-padding no-bottom-padding j-card__shadow"]/ancestor::section[@data-testid="app-features-section"]/div[${it}]/div[1]        order        1
            ELSE
                    CSS Verification      xpath://div[@class="j-card size--xs card-vertical no-top-padding no-bottom-padding j-card__shadow"]/ancestor::section[@data-testid="app-features-section"]/div[${it}]/div[1]        order        2
            END
        ELSE
            IF  "${App_name}" == "JioMart"
                    CSS Verification      xpath://div[@class="j-card size--xs card-vertical no-top-padding no-bottom-padding j-card__shadow"]/ancestor::section[@data-testid="app-features-section"]/div[${it}]/div[1]         order        2
            ELSE
                    CSS Verification      xpath://div[@class="j-card size--xs card-vertical no-top-padding no-bottom-padding j-card__shadow"]/ancestor::section[@data-testid="app-features-section"]/div[${it}]/div[1]         order        1
            END
        END
    END

    #Checking for infographics button
    ${count}=     Set Variable  0
    ${Infographics_Button_Presense}=      Run Keyword And Return Status   Element Should Be Visible   xpath=//section[@data-testid="app-features-section"]//div[@class="j-grid"]//div[@class="j-contentBlock__children"]      
    IF  ${Infographics_Button_Presense} == True
        ${elements_button}=  Get WebElements   xpath=//section[@data-testid="app-features-section"]//div[@class="j-grid"]//div[@class="j-contentBlock__children"]    
        # Following loop checks the text of all the buttons if present in the infographics section
        FOR  ${button}  IN  @{elements_button}
                    Text Verification           ${button}       ${Infographics_button}[${count}] 
                    ${count}=   Evaluate     ${count} + 1
        END
    END
    
    #Checking for infographics caption
    ${count}=     Set Variable  0
    ${Infographics_Caption_Presense}=      Run Keyword And Return Status   Element Should Be Visible   xpath=//section[@data-testid="app-features-section"]//div[@class="j-grid"]//div[@class="j-contentBlock__caption"]  
    IF  ${Infographics_Caption_Presense} == True
        ${elements_caption}=  Get WebElements   xpath=//section[@data-testid="app-features-section"]//div[@class="j-grid"]//div[@class="j-contentBlock__caption"] 
        #Text Verification For Caption
        FOR  ${caption}  IN  @{elements_caption}
                    Text Verification           ${caption}       ${Infographics_caption}[${count}] 
                    ${count}=   Evaluate     ${count} + 1
                    #This is to verify that the captions present in JioMart is of blue color but is not automatable as there is no CSS attribute to verify. If any attribute found add it below
                    # IF  "${App_name}" == "JioMart"
                    #         CSS Verification        (//section[@data-testid="app-features-section"]//div[@class="j-grid"]//div[@class="j-contentBlock__caption"])[${count}]            color        rgba(0, 0, 0, 0)
                    # END         
        END
    END

    #Checking for infographics Links
    Reload Page 
    ${Infographics_Link_Presense}=      Run Keyword And Return Status   Element Should Be Visible   xpath=//section[@data-testid="app-features-section"]//div[@class="j-grid"]//div[@class="j-contentBlock__description"]//a
    IF  ${Infographics_Link_Presense} == True
        Wait For And Verify Element                xpath://section[@data-testid="app-features-section"]//div[@class="j-grid"]//div[@class="j-contentBlock__description"]//a  
        ${Link_name}=    Get WebElement    xpath://section[@data-testid="app-features-section"]//div[@class="j-grid"]//div[@class="j-contentBlock__description"]//a  
        Text Verification        ${Link_name}        ${InfoGraphicsLinks}
        IF  "${App_name}" == "JioChat"
                Wait For And Click Element         xpath=//a[ normalize-space()='${InfoGraphicsLinks}']
                Take Page Screenshot               Mail_App     
                #It open's up the mail App which does not close.  
                #Wait For And Click Element         xpath=//span[ @class='l-breakpoint--widescreen sp--xxl pd--all j-Space__horizontal j-Space']
        ELSE
                Redirection On Clicking            xpath=//a[normalize-space()='${InfoGraphicsLinks}']  ${Infographics_URL}   ${App_name}_InfoGraphicsLink
        END
    END

Click Get Now Button
    [Arguments]    ${Carousel_button}=${NONE}
    Log to Console    ${App_name}
    IF    "${App_name}" == "JioMeet" or "${App_name}" == "JioHome"
        #Set Selenium Speed                                      100ms 
        # This Loop is present because both of these apps does not open a popup    
        Wait For And Click Element                              xpath=//div[@aria-label="${App_name}"]//div[@class="j-button-group"]//button[1]   
    ELSE    
        #Set Selenium Speed                                      100ms     
        IF         "${App_name}" == "MyJio"
            Wait For And Click Element                              xpath=//section[@class="css-1b1uwmf j-container l-layout--max-width"]//div[@class="j-button-group"]//button[1]
            #Passes the xpath of get now button on which it clicked to download page redirection
            Download Page Redirection                               //section[@class="css-1b1uwmf j-container l-layout--max-width"]//div[@class="j-button-group"]//button[1]
        ELSE
            Wait For And Click Element                              xpath=//div[@aria-label="${App_name}"]//div[@class="j-button-group"]//button[1]   
            #IF it's not None
            IF    "${Carousel_button}" 
                #Passes the xpath of get now button on which it clicked and Value of Carousel Button if present to download page redirection
                Download Page Redirection                           //div[@aria-label="${App_name}"]//div[@class="j-button-group"]//button[1]                ${Carousel_button}     
            ELSE
                #Passes the xpath of get now button on which it clicked to download page redirection
                Download Page Redirection                           //div[@aria-label="${App_name}"]//div[@class="j-button-group"]//button[1] 
            END
        
        END
        #Closes the popup
        Click Close Button
    END
    

Download Page Redirection
    [Arguments]        ${Get_Now_Path}                      ${Carousel_Button}=${NONE}         
    ${elements}=  Get WebElements                           xpath=//div[@class="j-modal-content"]//img
    #Finds how many buttons are there in the Popup
    ${length of elements}=                                  Get Length           ${elements}
    #Following Loop does the following operations for the number of buttons it has. i.e Playstore, Appstore, Go to Website
    # 1. Clicks the button -> Validates URL-> Takes Screenshot -> Goes back -> Clicks again
    # If Carousel is present for the app, it clicks the carousel button
    IF  ${length of elements} == 2
            Popup Content Verification 
            Redirection On Clicking                             xpath=//img[@src="https://jep-asset.akamaized.net/jio/svg/android-ios-logo/G-Play.png"]    ${POPUP_URL}[0]    ${App_name}_PlayStore
            Wait For And Click Element                          xpath=${Get_Now_Path}
            Redirection On Clicking                             xpath=//img[@src="https://jep-asset.akamaized.net/jio/svg/android-ios-logo/AppStore.png"]    ${POPUP_URL}[1]    ${App_name}_AppStore                     
            Wait For And Click Element                          xpath=${Get_Now_Path}     
    
    ELSE IF   ${length of elements} == 3
            Popup Content Verification 
            Redirection On Clicking                             xpath=//img[@src="https://jep-asset.akamaized.net/jio/svg/android-ios-logo/G-Play.png"]    ${POPUP_URL}[0]    ${App_name}_PlayStore

                IF  ${Carousel_Button}
                    Wait For And Click Element                      xpath=(//ul[@class="react-multi-carousel-dot-list "]//li)[${Carousel_Button}]
                END

            Wait For And Click Element                          xpath=${Get_Now_Path}
            Redirection On Clicking                             xpath=//img[@src="https://jep-asset.akamaized.net/jio/svg/android-ios-logo/AppStore.png"]    ${POPUP_URL}[1]    ${App_name}_AppStore   

                IF  ${Carousel_Button}
                    Wait For And Click Element                      xpath=(//ul[@class="react-multi-carousel-dot-list "]//li)[${Carousel_Button}]
                END

            Wait For And Click Element                          xpath=${Get_Now_Path}
            Redirection On Clicking                             xpath=//img[@src="https://jep-asset.akamaized.net/jio/svg/android-ios-logo/GoToWebsite.png"]    ${POPUP_URL}[2]    ${App_name}_Website  
                IF  ${Carousel_Button}
                    Wait For And Click Element                      xpath=(//ul[@class="react-multi-carousel-dot-list "]//li)[${Carousel_Button}]
                END
            Wait For And Click Element                          xpath=${Get_Now_Path}

    #---- FOLLOWING MUST BE UNCOMMENTED WHEN CAROUSAL APPEARS ON COMMUNICATIONS TAB-----
    
    # ELSE IF     "${App_name}" == "JioCall"
    #         Wait For And Click Element                          xpath=//img[@src="https://jep-asset.akamaized.net/jio/svg/android-ios-logo/G-Play.png"]   
    #         Verify Page Loaded                                  ${App_name}
    #         URL Validation                                      ${POPUP_URL}
    #         Take Page Screenshot                                ${App_name}_PlayStore
    #         Go Back
    #         Wait for and click element                          xpath=(//span[@class="inactive"])[3]
    #         Wait For And Click Element                          xpath=(//button[@class="j-button j-button-size__medium primary"])[${index}]  
    
    ELSE
            Popup Content Verification 
            Redirection On Clicking                             xpath=//img[@src="https://jep-asset.akamaized.net/jio/svg/android-ios-logo/G-Play.png"]    ${POPUP_URL}[0]    ${App_name}_PlayStore
            Wait For And Click Element                          xpath=${Get_Now_Path}      
    END


Banner Verification
    #This Keyword Clicks the Banner
    IF    "${App_name}" == "JioMeet" or "${App_name}" == "JioHome"
        #Set Selenium Speed                                      100ms     
        Wait For And Click Element                              xpath=//div[@class='j-promo-card bg--primary img--filled orientation--horizontal no-children']
        # Set File Path                                           C:\Users\Jay.Chaudhari\Downloads\JioMeetSetup.exe
        # File Should Exist                                       JioMeetSetup.exe
        # Click Close Button
    # ELSE IF    "${App_name}" == "JioHome"
    #     Set Selenium Speed                                      100ms     
    #     Wait For And Click Element                              xpath=//div[@class='j-promo-card bg--primary img--filled orientation--horizontal no-children']
    ELSE    
        Wait For And Click Element                 xpath=//div[@class='j-promo-card bg--primary img--filled orientation--horizontal no-children']
        Popup Content Verification
        Redirection for banner
        Click Close Button
    END

Redirection for banner
    ${elements}=  Get WebElements                           xpath=//div[@class="j-modal-content"]//img
    #Finds how many buttons are there in the Popup
    ${length of elements}=                                  Get Length           ${elements}
    #Following Loop does the following operations for the number of buttons it has. i.e Playstore, Appstore, Go to Website
    # 1. Clicks the Banner -> Validates URL-> Takes Screenshot -> Goes back -> Clicks again
    IF  ${length of elements} == 2
            Redirection On Clicking                               xpath=//img[@src="https://jep-asset.akamaized.net/jio/svg/android-ios-logo/G-Play.png"]    ${POPUP_URL}[0]    ${App_name}_PlayStore
            Wait For And Click Element                          xpath=//div[@class='j-promo-card bg--primary img--filled orientation--horizontal no-children'] 
            Redirection On Clicking                               xpath=//img[@src="https://jep-asset.akamaized.net/jio/svg/android-ios-logo/AppStore.png"]    ${POPUP_URL}[1]    ${App_name}_AppStore                       
            Wait For And Click Element                          xpath=//div[@class='j-promo-card bg--primary img--filled orientation--horizontal no-children']
    ELSE IF   ${length of elements} == 3 
            Redirection On Clicking                               xpath=//img[@src="https://jep-asset.akamaized.net/jio/svg/android-ios-logo/G-Play.png"]    ${POPUP_URL}[0]    ${App_name}_PlayStore
            Wait For And Click Element                          xpath=//div[@class='j-promo-card bg--primary img--filled orientation--horizontal no-children']
            Redirection On Clicking                               xpath=//img[@src="https://jep-asset.akamaized.net/jio/svg/android-ios-logo/AppStore.png"]    ${POPUP_URL}[1]    ${App_name}_AppStore
            Wait For And Click Element                          xpath=//div[@class='j-promo-card bg--primary img--filled orientation--horizontal no-children']
            Redirection On Clicking                               xpath=//img[@src="https://jep-asset.akamaized.net/jio/svg/android-ios-logo/GoToWebsite.png"]    ${POPUP_URL}[2]    ${App_name}_Website  
            Wait For And Click Element                          xpath=//div[@class='j-promo-card bg--primary img--filled orientation--horizontal no-children']  
    ELSE
            Redirection On Clicking                               xpath=//img[@src="https://jep-asset.akamaized.net/jio/svg/android-ios-logo/G-Play.png"]    ${POPUP_URL}[0]    ${App_name}_PlayStore
            Wait For And Click Element                          xpath=//div[@class='j-promo-card bg--primary img--filled orientation--horizontal no-children']
    END

Click Close Button
    #Verifies and Clicks the X button in Popups
    Wait For And Verify Element                                 xpath=//button[@class='j-button j-button-size__medium tertiary icon-primary icon-only']
    Wait For And Click Element                                  xpath=//button[@class='j-button j-button-size__medium tertiary icon-primary icon-only']

Content Validation
    # Scrolls to Top getnow Button
    Scroll To                                 xpath=//button[@class="j-button j-button-size__medium primary"]
    

    #Following IF loop validates Logo,App name and their subtitles(Top Text) for various apps for top get now button and bottom get bow button (if present).
    ${temp}=       Convert To Lower Case    ${App_name}
        #Following IF loop validates Logo,App name and their subtitles For (Top Text) and (Bottom Text) for various apps.
    IF    "${App_name}" == "JioGames"
        #Top Get Now Header
        Logo Verification                     xpath=//section[@data-testid="get-now-top-header"]//img
        Text Verification                     xpath=//section[@data-testid="get-now-top-header"]//div[@class="j-heading j-text-heading-xs"]                   ${App_name}
        Text Verification                     xpath=//section[@data-testid="get-now-top-header"]//h2                      ${TopText}
    ELSE
        #Top Get Now Header
        Logo Verification                     xpath=//section[@data-testid="get-now-top-header"]//img
        Text Verification                     xpath=//section[@data-testid="get-now-top-header"]//div[@class="j-heading j-text-heading-xs"]                   ${App_name}
        Text Verification                     xpath=//section[@data-testid="get-now-top-header"]//h2                                                          ${TopText}
            
        #Bottom Get Now Header
        Logo Verification                     xpath=//section[@class="css-1x6are8 j-container"]//img
        Text Verification                     xpath=//section[@class="css-1x6are8 j-container"]//h2                      ${App_name}
        Text Verification                     xpath=//section[@class="css-1x6are8 j-container"]//h3                     ${BottomText}
          
    END
   
    #Following IF loop validates Smart Features ,Testimonials and FAQ sections for various apps.  
   IF    "${App_name}" == "MyJio" or "${App_name}" == "JioTV" or "${App_name}" == "JioCinema" or "${App_name}" == "JioHealthHub" or "${App_name}" == "JioChat" or "${App_name}" == "JioSecurity" or "${App_name}" == "JioPages"
       Smart Features Verification
       Testimonials Verification
       Apps FAQ Verification
     
   ELSE IF  "${App_name}" == "JioMart" or "${App_name}" == "JioPOS Lite" or "${App_name}" == "JioCall" or "${App_name}" == "JioGames" or "${App_name}" == "JioCloud" or "${App_name}" == "JioHome"
       Apps FAQ Verification
        IF    "${App_name}" == "JioMart" or "${App_name}" == "JioCloud"
           Testimonials Verification
        ELSE
            Smart Features Verification
        END   
    ELSE     
       Apps FAQ Verification
    END


All Get Now Verification of App Information Page
    #All Buttons Verification 
    ${count}=                   Set Variable                    0
    ${elements}=                Get WebElements                 xpath=//div[@class="j-contentBlock__children"]//button
    #Gets the count of the buttons present
    ${length}=                  Get Length                      ${elements} 
    ${length}=                  Evaluate                        ${length} + 1
    ${count_button}=    Set Variable    0
    #Running for respective Get Now and as well as remaining buttons
    FOR     ${index}  IN RANGE     1     ${length}
        ${Button_click}=                                         Get Text                              xpath=(//div[@class="j-contentBlock__children"]//button)[${index}]        
        IF   "${Button_click}" == "Get Started, Its Free" or "${Button_click}" == "Get JioFiber" or "${Button_click}" == "Know More" or "${Button_click}" == "Get JioPagesTV"
            Wait For And Click Element     xpath=(//div[@class="j-contentBlock__children"]//button)[${index}]
            IF  "${App_name}" == "JioPages"
                Switch Window                               NEW 
                ${name}=   Get Text    xpath=//title
                Take Page Screenshot            ${name}    
                Close Window
                Switch Window                               MAIN 
            ELSE IF    "${Button_click}" == "Get JioFiber"
                URL Validation    https://www.jio.com/selfcare/interest/fiber/?nav=g  
                Go Back
            ELSE IF     "${Button_click}" == "Know More"
                IF    ${count_button} == 0
                    URL Validation      https://jiogames.com/devices/jiophone 
                ELSE    
                    URL Validation      https://developer.jiogames.com/
                END
                ${count_button}=    Evaluate    ${count_button} + 1
                Go Back
            ELSE IF     "${Button_click}" == "Get Started, Its Free"
            URL Validation      https://jiomeetpro.jio.com/signup
            Go Back
            ELSE IF     "${Button_click}" == "Get JioPagesTV"
            URL Validation      https://play.google.com/store/apps/details?id=com.jio.web.androidtv&hl=en&gl=US
            Go Back
            ELSE
                ${name}=   Get Text    xpath=//title
                # URL Validation                ${locator}
                Take Page Screenshot                ${name}
                Go Back
            END
        ELSE
            Wait For And Click Element                              xpath=(//div[@class="j-contentBlock__children"]//button)[${index}]                        
            ${elements}=  Get WebElements                           xpath=//div[@class="j-modal-content"]//img
            #Finds how many buttons are there in the Popup
            ${length of elements}=                                  Get Length           ${elements}
            #Following Loop does the following operations for the number of buttons it has. i.e Playstore, Appstore, Go to Website
            # 1. Clicks the button -> Validates URL-> Takes Screenshot -> Goes back -> Clicks again
            IF  ${length of elements} == 2
                Popup Content Verification
                Redirection On Clicking                             xpath=//img[@src="https://jep-asset.akamaized.net/jio/svg/android-ios-logo/G-Play.png"]    ${POPUP_URL}[0]    ${App_name}_PlayStore
                Wait For And Click Element                          xpath=(//div[@class="j-contentBlock__children"]//button)[${index}]
                Redirection On Clicking                             xpath=//img[@src="https://jep-asset.akamaized.net/jio/svg/android-ios-logo/AppStore.png"]    ${POPUP_URL}[1]    ${App_name}_AppStore                         
                Wait For And Click Element                          xpath=(//div[@class="j-contentBlock__children"]//button)[${index}]        
                Click Close Button
            ELSE IF   ${length of elements} == 3
                Popup Content Verification
                Redirection On Clicking                             xpath=//img[@src="https://jep-asset.akamaized.net/jio/svg/android-ios-logo/G-Play.png"]    ${POPUP_URL}[0]    ${App_name}_PlayStore
                Wait For And Click Element                          xpath=(//div[@class="j-contentBlock__children"]//button)[${index}]
                Redirection On Clicking                             xpath=//img[@src="https://jep-asset.akamaized.net/jio/svg/android-ios-logo/AppStore.png"]    ${POPUP_URL}[1]    ${App_name}_AppStore   
                Wait For And Click Element                          xpath=(//div[@class="j-contentBlock__children"]//button)[${index}]
                Redirection On Clicking                             xpath=//img[@src="https://jep-asset.akamaized.net/jio/svg/android-ios-logo/GoToWebsite.png"]    ${POPUP_URL}[2]    ${App_name}_Website   
                Wait For And Click Element                          xpath=(//div[@class="j-contentBlock__children"]//button)[${index}]   
                Click Close Button
            ELSE IF   "${App_name}" == "JioPages"
                Verify Page Loaded                                  ${App_name}
                URL Validation                                      ${POPUP_URL}[1]
                Take Page Screenshot                                ${App_name}_PlayStore
                Go Back   
            ELSE IF    "${App_name}" == "JioMeet"
                Take Page Screenshot                                ${App_name}_JioMeetexe
            ELSE IF    "${App_name}" == "JioHome"
                Take Page Screenshot                                ${App_name}_JioHomeexe  
            ELSE
                Popup Content Verification
                Redirection On Clicking                             xpath=//img[@src="https://jep-asset.akamaized.net/jio/svg/android-ios-logo/G-Play.png"]    ${POPUP_URL}[0]    ${App_name}_PlayStore
                Wait For And Click Element                          xpath=(//div[@class="j-contentBlock__children"]//button)[${index}]  
                Click Close Button
            END
        END
    END



Jio App Information Page Redirection
    #Clicks the Know More Button
    IF   "${App_name}" == "MyJio"
        Redirect And Continue                 xpath=//section[@class="css-1b1uwmf j-container l-layout--max-width"]//div[@class="j-button-group"]//button[2]    ${App_URL}    ${App_name}
    ELSE
        Redirect And Continue                 xpath=//div[@aria-label="${App_name}"]//div[@class="j-button-group"]//button[2]    ${App_URL}    ${App_name} 
    END

    
Smart Features Verification
    IF    "${App_name}" == "JioPOS Lite"
        Scroll To                              xpath=//h3[normalize-space()='Become a JioPartner and start earning now']
        Take Element Screenshot                xpath=//section[@aria-label='Become a JioPartner and start earning now']//div[@class='j-grid']    JioPartner
           
        Scroll To                              xpath=//h2[normalize-space()='3 Simple Steps and your business is all set!']
        Take Element Screenshot                xpath=//section[@aria-label='benefits section']//div[@class='j-grid']    Business_Steps
        
        ${count}=     Set Variable  0
        #Checks and verifies the content for Smart Feature Section
        ${features}=  Get WebElements    xpath=//div[@class="j-card h-100 size--xs card-vertical no-top-padding"]
        ${steps}=     Get WebElements    xpath=//div[@class="j-contentBlock j-contentBlock__size-xxs"]//div[contains(@class,"j-contentBlock__body")]
        FOR  ${feature}  IN  @{features}
            Wait For And Verify Element                 ${feature}
            Image Verification           xpath=(//div[@class="j-card__image ratio-wide"]/img)[${count} +1]
            Text Verification                           ${feature}       ${Smart_Features}[${count}] 
            ${count}=    Evaluate     ${count} + 1    
        END
        ${count}=     Set Variable     0
        FOR  ${step}  IN  @{steps}
            Wait For And Verify Element     ${step}
            Logo Verification           xpath=(//div[@class="caption-icon j-container l-layout--flex"]//span[@class="j-icon j-icon__bg"])[${count} +1]
            Wait For And Verify Content              ${step}      ${JPL_Steps}[${count}]
            ${count}=  Evaluate  ${count} + 1 
        END
    ELSE IF   "${App_name}" == "JioGames"
        Scroll To                              xpath=//h2[normalize-space()='Limitless features for limitless gaming']
        ${JH}=  Set Variable   0
        ${count}=   Set Variable   0
        WHILE    ${JH} < 8
            ${features}=  Get WebElements      xpath=//div[@id="panel-${JH}"]//div[@class="j-contentBlock j-contentBlock__size-xxs"]
            #Checks and verifies the content for Smart Feature Section
            FOR  ${feature}  IN  @{features}
                Wait For And Verify Element                ${feature}
                Logo Verification                          xpath=//span[@class='j-icon j-icon__bg']
                Text Verification                          ${feature}       ${Smart_Features}[${count}] 
                ${count}=   Evaluate     ${count} + 1    
               
            END
            Take Element Screenshot            xpath=//section[@class='j-container sp--l pd--vertical']    Limitless_Features_Tab_${JH}
           
            ${JH}=   Evaluate     ${JH} + 1
            #Increments JH value to go to the next section(2nd iteration) of smart features
            IF  ${JH} == 7  BREAK
            #Clicks the next section of smart features
            Wait For And Click Element         xpath=//section[@aria-label="benefits section"]//button[@aria-controls='panel-${JH}']
        END
    ELSE 
        Scroll To                              xpath=//section[@aria-label="benefits section"]
        Take Element Screenshot                xpath=//section[@aria-label='benefits section']//div[@class='j-grid']        Smart_Features
        ${count}=   Set Variable   0
        ${features}=  Get WebElements          xpath=//div[@class="j-contentBlock j-contentBlock__size-xxs"]
        #Checks and verifies the content for Smart Feature Section
        FOR  ${feature}  IN  @{features}
            Wait For And Verify Element              ${feature}
            Logo Verification                  xpath=(//span[@class="j-icon j-icon__bg"])[${count} + 1]
            Text Verification                          ${feature}       ${Smart_Features}[${count}] 
            ${count}=   Evaluate     ${count} + 1   
        END
    END 

Testimonials Verification 
    Scroll To                                  xpath=//h3[@class="j-heading j-text-heading-m"]
    Take Element Screenshot                    xpath=//h3[@class="j-heading j-text-heading-m"]        ${App_name}_Testimonials
    
    ${features}=  Get WebElements              xpath=//div[@class="j-card h-100 css-1gw70x size--xs card-vertical"]
    IF    "${App_name}" == "JioMart"
        ${features}=  Get WebElements          xpath=//div[@class="j-card h-100 css-13aakr1 size--xs card-vertical j-card__shadow"]
    END
    #Checks and verifies the content for Testimonial Section
    FOR  ${feature}  IN  @{features}
        Wait For And Verify Element                ${feature} 
    END

Apps FAQ Verification
    IF  "${App_name}" == "JioHome" or "${App_name}" == "JioGames"
        Scroll To                               xpath=//section[@aria-label='faqs by category section']
        IF  "${App_name}" == "JioHome"
            Scroll To                              xpath=//section[@aria-label='faqs by category section']
        ELSE
            Scroll To                              xpath=//section[@aria-label='faqs by category section']
        END
        #Gets the no of section of FAQ section present excluding current one
        ${countFAQ}=    Get Element Count                xpath=//div[@class="faqs-by-category"]//button[@class="css-1xxg4v6 j-tab j-tab-size__medium"]
        #This Variable JH is for iterating the section of FAQ section
        ${JH}  Set Variable   0
        WHILE    ${JH} < ${countFAQ + 1}
            ${features}=  Get WebElements      xpath=//div[@class="j-accordion"]//div[@class="j-listBlock__block-text"]
            #Verifies the FAQ Questions present
            FOR  ${feature}  IN  @{features}
                Wait For And Verify Element               ${feature} 
            END
            # Takes screenshot for respective apps
            IF  "${App_name}" == "JioHome"
                Take Element Screenshot        xpath=//section[@aria-label='faqs by category section']        FAQ_Tab_${JH}
            ELSE
                Take Element Screenshot        xpath=//section[@aria-label='faqs by category section']    FAQ_Tab_${JH}
            END
           #increments JH. To go to the next section of FAQ section
            ${JH}=   Evaluate     ${JH} + 1
            
            IF  ${JH} == 5  BREAK
            #Clicks the next section of FAQ section
            Wait For And Click Element     xpath=(//div[@class="faqs-by-category"]//button[@class="css-1xxg4v6 j-tab j-tab-size__medium"])[${JH}]
                 
        END
    ELSE 
        ${count}=   Set Variable   0
        Take Element Screenshot                xpath=//section[@aria-label='faqs section']        FAQ
            
        ${features}=  Get WebElements          xpath=//div[@class="j-accordion"]//div[@class='j-accordion-panel' and @role='tablist']
       #for all other apps, it just verifies the questions  
        FOR  ${feature}  IN  @{features}
            Wait For And Verify Element                ${feature} 
            ${count}=   Evaluate     ${count} + 1
 
        END
    END     

Checking Video Section
    IF     "${App_name}" == "JioPages" 
        #clicks on the video
        Wait For And Click Element             xpath=//div[@class="j-card h-100 size--xs card-vertical j-card__has-fullCardCTA no-top-padding j-card__shadow"]
        #Verifies the video
        Wait For And Verify Element            xpath=//div[@class="j-text j-text-body-m"]//h5[@class='j-heading j-text-heading-xs']
        #plays the video
        Wait For And Click Element             xpath=//div[@class="j-modal-content"]
        #Takes screenshot
        Take Page Screenshot                   Video_Play
        #Closes the video
        Wait For And Click Element             xpath=//button[@class='j-button j-button-size__medium tertiary icon-primary icon-only']
        
    ELSE
        #This is for JioPOS Lite
        #There are 3 videos
        FOR  ${i}  IN RANGE    1  3
            #Clicks on video
            Wait For And Click Element         xpath=(//div[@class="j-card h-100 size--xs card-vertical j-card__has-fullCardCTA no-top-padding j-card__shadow"])[${i}]
            #Verifies the video
            Wait For And Verify Element        xpath=//div[@class="j-text j-text-body-m"]//h5[@class='j-heading j-text-heading-xs']
            #plays the video
            Wait For And Click Element         xpath=//div[@class="j-modal-content"]
            #Takes screenshot
            Take Page Screenshot               Video_Play
            #Closes the video
            Wait For And Click Element         xpath=//button[@class='j-button j-button-size__medium tertiary icon-primary icon-only']
        END
    END

