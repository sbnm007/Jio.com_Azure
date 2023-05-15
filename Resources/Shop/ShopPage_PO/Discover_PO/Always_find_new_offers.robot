*** Settings ***
Library                                  SeleniumLibrary
Resource                                 ../../../Common.robot
Variables                                ../../../Common_Variables.yaml
Resource                                 ../../../../Resources/Excel_Activity.robot
Resource                                 ../../../Local_Keywords.robot


*** Keywords ***

Always find new offers section visibility, UI verification and is redirected to relevant product page on clicking on Buy Now button
    #Scroll To The Always Find New Offers Section
    Scroll To                            xpath=(//section[@class="l-layout--max-width"])[1]

    #Verify Always Find New Offers Section
    Text Verification                    xpath=//h2[normalize-space()='Always find new offers']    Always find new offers
    Take Element Screenshot              xpath=(//section[@class="l-layout--max-width"])[1]        SC_AFNOVisible     
    
    #Verify Ui Elements Of 'Always Find New Offers' Section
    Read Data of Always Find New Offers section from Excel
    
    #Scroll To To 1st Banner Of Always Find New Offers
    Scroll To             xpath=//div[@class="j-card__flex j-flex-column-reverse "]
    
    #Content Verification Of The Banner
    Wait Until Element is Visible        xpath=//section[@class='j-container'][contains(.,'61% off on Jio Extender6 MeshNow enjoy uninterrupted internet in every room.Buy NowIrresistible JioFi offer!Enjoy ₹1,500 cashback on JioFi worth ₹2,800. T&C Apply.Buy Now')]
    
    #Print Title Of Section I.E Always Find New Offer In The Console
    Log To Console                       ${Jio_Extender6_Section} 
    
    #Print Text Present Below The Heading Of Section In The Console
    Log To Console                       ${Now_enjoy}
    
    #Verify Title Of Section I.E Always Find New Offer In The Console
    Element Text Should Be               xpath=//h2[normalize-space()='Always find new offers']            ${Jio_Extender6_Section}
    
    #Verify Text Present Below The Heading Of Section In The Console
    Element Text Should Be               xpath=//div[normalize-space()='Cashback, vouchers, and more!']    ${Now_enjoy}
    
    #Verify Buy Now Button Is Visible Or Not
    Wait Until Element is Visible        xpath=(//button[@class='j-button j-button-size__small primary w-auto'][contains(.,'Buy Now')])[1]
    Wait Until Element is Visible        xpath=(//button[@class='j-button j-button-size__small primary w-auto'][contains(.,'Buy Now')])[2]
    
    #User Is Transferred To Product Page Using Buy Now Button
    Scroll To                            //div[@class="overflow-scroll-max-width j-content-layout l-layout--max-width j-content-layout__layout-2-col-even carousel-card-wrap 2_column_carousel_function equal_height_card larger-screen"]
    Redirection On Clicking        xpath=(//button[@class="j-button j-button-size__small primary w-auto"])[1]    https://www.jio.com/shop/en-in/jioextender6-mesh-wi-fi-system/p/491894637    Sc_MeshWifiSystem 