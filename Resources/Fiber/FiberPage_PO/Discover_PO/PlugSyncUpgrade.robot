*** Settings ***
Library     SeleniumLibrary
Resource    ../../../Common.robot

*** Keywords ***
#TC ID:91915-91918
Plug Sync and Upgrade Validation
    #To Verify Plug,Sync and Upgrade! Section Visibility 
    Section Verification                    xpath=//section[@class='j-container']//section[@class='j-container l-layout--max-width-narrow']        Plug,SyncAndUpgrade!
    
    #To Verify Plug,Sync and Upgrade! text
    Text Verification                       xpath=//h2[contains(text(),'Plug, sync, and upgrade!')]        ${plug_text}[0]

    #To Verify Sub Text
    Text Verification                       xpath=//div[contains(text(),'Experience the best of JioFiber with our lineup of innovations. ')]        ${plug_text}[1]

    #To Verify Three Tiles Section 
    ${i}    Set Variable    0
    WHILE  ${i}!=3
        Section Verification                xpath=(//div[@class='j-card__flex'])[1${i}]        ${prod_name}[${i}]
        ${i}    Evaluate    ${i}+1
    END
  
    #To Verify Start Shopping button 
    Button Verification                     xpath=//button[normalize-space()='Start shopping']
    
    #Scrolling to tiles container
    Scroll To                               xpath:(//div[@class='overflow-scroll-max-width j-content-layout l-layout--max-width j-content-layout__layout-3-col-even carousel-card-wrap common_card_row_carousel_function equal_height_card grid-j-card'])[2]

    FOR     ${in}    IN RANGE    0    3
        
        #Verifying Tags
        Text Verification                   xpath://span[contains(text(),'${prod_tag}[${in}]')]      ${prod_tag_caps}[${in}]  
        Css Verification                    xpath:(//div[@class="j-card__header"]//div[@class="j-badge j-badge-size__small"])[${in+1}]       background-color    rgba(12, 82, 115, 1)     
        
        #Verifying Image
        Image Verification                  xpath://img[@src='${prod_img}[${in}]']                       
        
        #Verifying product name
        Text Verification                   xpath://h3[contains(text(),'${prod_name}[${in}]')]       ${prod_name}[${in}]
        
        #Verifying Product amount 
        Text Verification                   xpath: //div[contains(text(),'${prod_amt}[${in}]')]      ${prod_amt}[${in}]  
        ${in}=    Evaluate    ${in} + 1
        
    END

    #To Verify JioExtender6 Mesh Wi-Fi Product Tile Redirection
    Redirection On Clicking                 xpath=//img[@alt="JioExtender6 Mesh Wi-Fi System"]        ${URLs_PlugSync}[0]        JioExtender6Product

    #To Verify Jio Game Controller Product Tile  Redirection
    Redirection On Clicking                 xpath=//img[@alt='Jio Game Controller']                   ${URLs_PlugSync}[1]        JioGameController

    #To Verify JioRemote Product Tile Redirection
    Redirection On Clicking                 xpath=//img[@alt='JioRemote']                             ${URLs_PlugSync}[2]        JioRemote
