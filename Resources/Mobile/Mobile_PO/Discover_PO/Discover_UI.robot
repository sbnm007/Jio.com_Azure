*** Settings ***
Library                             SeleniumLibrary
Resource                          ../../../Local_keywords.robot
Resource                          Popular_Mobile_Plans.robot
Variables                         ../../../../Tests/Mobile/MDiscover_Variable.yaml

***Keywords***
Discover Page UI Verification    
    #Carousel Banner Functionality 
    Reload Page
    FOR     ${i}    IN RANGE    0  3
        #Carousel Banner
        Wait For And Verify Element             xpath=//div[@class="j-fullwidth-banner slick-slide slick-current slick-active"][@aria-describedby="slick-slide1${i}"]
        Wait For And Verify Element             xpath=//li[@id="slick-slide1${i}"][@class="slick-active"]
        
        #Blue to Transperent  Change
        ${attribute_value} =                    Execute Javascript  return window.getComputedStyle(document.querySelector("#slick-slide1${i} > button"),':before').getPropertyValue('color');
        Log To Console    ${attribute_value}
        Should Be Equal As Strings              ${attribute_value}        rgb(15, 60, 201)
        
        #Takes page screenshot
        Take Page Screenshot                    Banner_${i}
        Log To Console                          Banner${i} Verified
    END

    #Easily recharge or pay bills online' banner
    Scroll To                                   xpath=//div[@class='j-card size--s j-card__shadow p-0 bg--primary-background']//div[@class='j-button-group align-items-baseline flex-row card-button-group']
    Banner Content Verification                 xpath=//div[@class='j-card size--s j-card__shadow p-0 bg--primary-background']//h3  Easily recharge or pay bills online  xpath=//div[@class='order_lg-2']//img  xpath=//div[@class='j-card size--s j-card__shadow p-0 bg--primary-background']//button   Disc_Recharge

    #Here’s why India prefers Jio
    Section Verification                        xpath=//div[normalize-space()='Here’s why India prefers Jio']        Here’s why India prefers Jio 
    
    #Heading
    Text Verification                           xpath=//h2[contains(text(),'Here’s why India prefers Jio')]    Here’s why India prefers Jio
    
    #4 Subpoints/Features
    ${Mainelements}=                            Get WebElements           xpath=//h3[@class='j-contentBlock__title j-heading j-text-body-s-bold']
    ${count}=     Set Variable  0
    FOR  ${Mainelement}  IN  @{Mainelements}
        Text Verification                       ${Mainelement}       ${Maintext}[${count}] 
        ${count}=   Evaluate     ${count} + 1  
    END
    Log To Console    ${count} Here's why Banners Verified

    #Thrilled about Jio benefits?' banner
    Section Verification                        xpath=//h3[normalize-space()='Thrilled about Jio benefits?']        Thrilled about Jio benefits?
    
    #Heading
    Text Verification                           xpath=//h3[normalize-space()='Thrilled about Jio benefits?']        Thrilled about Jio benefits?
    
    #Sub-heading
    Text Verification                           xpath=//div[normalize-space()='Order a new SIM or port your number to Jio.']        Order a new SIM or port your number to Jio.
   
    #Get New SIM button
    Wait For And Verify Element                 xpath=//button[@id='sim']
    
    #Port to Jio button
    Wait For And Verify Element                 xpath=//button[normalize-space()='Port to Jio']

    #'Popular mobile plans' section
    Section Verification                        xpath=//div[@id='jio-prepaid']//div[contains(@class,'overflow-scroll-max-width')]        Popular mobile plans
    
    #Heading
    Text Verification                           xpath=//h2[normalize-space()='Popular mobile plans']        Popular mobile plans
    
    #Sub-heading
    Text Verification                           xpath=//div[normalize-space()='Choose your connection type to find a plan as per your digital needs.']        Choose your connection type to find a plan as per your digital needs.        
     
    #Checking Prepaid section is Selected by deafault
    Wait For And Verify Element                 xpath=//a[@class="tab-link j-text j-text-body-s j-color-secondary-60"][@aria-controls="jio-prepaid"][@aria-selected="true"]
    
    #Checking Postpaid section get Selected
    Wait For And Verify Element                 xpath=//a[@role='tab'][normalize-space()='Postpaid']
   
    #Checking Toogle Tab
    Wait For And Click Element                  xpath=//a[@role='tab'][normalize-space()='Postpaid']
    Wait For And Click Element                  xpath=//a[@role='tab'][normalize-space()='Prepaid']
   
    #Relevant plan cards with 'Recharge' and 'View details' button
    Verifing Plans Buttons and Tags             xpath=//div[@id="jio-prepaid"]//div[@class="j-card__flex"]
   
    #Recharge Button verification
    Verifing Plans Buttons and Tags             xpath=//div[@id="jio-prepaid"]//button[contains(text(),"Recharge")]
   
    #View Details Button Verification
    Verifing Plans Buttons and Tags             xpath=//div[@id="jio-prepaid"]//button[contains(text(),"View details")]
    
    #View all Prepaid plans button
    Wait For And Verify Element                 xpath=//div[@id="jio-prepaid"]//button[normalize-space()="View all prepaid plans"]

    #What's trending' section
    Section Verification                        xpath=//section[contains(@class,'j-container l-layout--max-width-narrow theme--jiocinema')]//h2[contains(@class,'j-contentBlock__title j-heading j-text-heading-l')]        What's trending
    
    #Heading
    Text Verification                           xpath=//section[contains(@class,'j-container l-layout--max-width-narrow theme--jiocinema')]//h2[contains(@class,'j-contentBlock__title j-heading j-text-heading-l')]        What's trending
    
    #Sub-heading
    Text Verification                           xpath=//div[normalize-space()='Get updated on ongoing offers, latest products, and more.']        Get updated on ongoing offers, latest products, and more.       
    
    #3 relevant banners with their individual call- to - action button
    ${elements}=    Get WebElements             xpath=//h4[contains(@class,'j-promo-card__content-title j-heading j-text-heading-s')]
    ${i}  Set Variable   0
    FOR  ${element}  IN  @{elements}
        Banner Content Verification  ${element}  ${WT_Title}[${i}]   xpath=(//section[@class='j-container']//div[@class='j-promo-card__image ratio-landscape']//img)[${i}+1]   xpath=//button//div[normalize-space()="${WT_Button_Name}[${i}]"]  ${WT_Button_Name}[${i}]
        ${i}=   Evaluate     ${i} + 1
    END
    Log To Console    ${i} What's Trending Bannners Verified

    #'Already a Jio user?' section 
    Scroll To                                   xpath=//h2[normalize-space()='Already a Jio user?']
    
    #Heading
    Text Verification                           xpath=//h2[normalize-space()='Already a Jio user?']    Already a Jio user?
    
    #Subheading
    Text Verification                           xpath=//div[normalize-space()='Here are a few things you might find helpful.']        Here are a few things you might find helpful.
    
    #3 Relevant cards with their individual call-to-action button
    ${elements}=    Get WebElements             xpath=//h3[contains(@class,'j-contentBlock__title j-heading j-text-body-m-bold')]
    ${count}=     Set Variable  0
    FOR  ${Mainelement}  IN  @{Mainelements}
        Text Verification                       ${Mainelement}       ${Maintext}[${count}] 
        ${count}=   Evaluate     ${count} + 1  
    END
    Log To Console    ${count} Already a jio Banners Verified

    #'Hot deals on cool devices' section
    Scroll To                                   xpath=//h2[normalize-space()='Hot deals on cool devices']
    
    #Heading
    Text Verification                           xpath=//h2[normalize-space()='Hot deals on cool devices']        Hot deals on cool devices
    
    #Subheading
    Text Verification                           xpath=//div[normalize-space()='Smartphones, smartwatches, and trendy accessories at the best prices.']        Smartphones, smartwatches, and trendy accessories at the best prices.       
    
    #3 cards displaying three different products
    #Validating present devices from section
    ${Devices}=  Get WebElements                xpath=//div[@class='j-card size--xxs card-vertical top-padding j-card__shadow l-radius--xl cursor-pointer shadow-vertical-mg']
    ${Count}=    Set Variable    0
    FOR  ${Device}  IN  @{Devices} 
        Scroll To                               ${Device}
        Wait For And Verify Element             ${Device}    
        ${Count}=  Evaluate    ${Count} + 1
    END 
    Log To Console    ${Count} Hot Deals Banners Verified

    #Verify start shopping button
    Wait For And Verify Element                 xpath=//button[normalize-space()='Start shopping']

    #A bouquet of Jio apps' banner
    Scroll To                                   xpath=//h3[normalize-space()='A bouquet of Jio apps']
    Section Verification                        xpath=//h3[normalize-space()='A bouquet of Jio apps']       A bouquet of Jio apps
    
    #Heading
    Text Verification                           xpath=//h3[normalize-space()='A bouquet of Jio apps']        A bouquet of Jio apps
    
    #Subheading
    Text Verification                           xpath=//div[normalize-space()='With possibilities at your fingertips, digital feels magical.']        With possibilities at your fingertips, digital feels magical. 
   
    #View all Jio apps' button
    Wait For And Verify Element                 xpath=//button[normalize-space()='View all Jio apps']

    #Need Guidance Text Verification
    Scroll To                                   xpath=//section[@class='j-container bg--primary-background']
    Section Verification                        xpath=//section[@class='j-container bg--primary-background']    Need guidance?  
    
    #Heading
    Text Verification                           xpath=//h2[normalize-space()='Need guidance?']         Need guidance?
    
    #Subheading
    Text Verification                           xpath=//div[@class='j-contentBlock__description j-text-body-m j-color-primary-grey-80']        We’d love to help you.
    
    #Buttons under Need Guidance
    ${Ele}=  Get WebElements                    xpath=//button[contains(@class,'j-button j-button-size__medium secondary icon-primary icon-primary-inline j-button-flex ')]
    ${Count}=    Set Variable  0
    FOR  ${Ele}  IN  @{Ele} 
        Wait For And Verify Element             ${Ele}
        ${Count}=  Evaluate    ${Count} + 1
    END
    Log To Console    ${Count} Need Guidance Banners Verified
