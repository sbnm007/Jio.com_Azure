*** Settings ***
Library                                                             SeleniumLibrary
Resource                                                            ../../../Common.robot
Variables                                                           ../../../../Tests/Shop/Discover_Variables.yaml
Resource                                                            ../../../Excel_Activity.robot
Resource                                                            ../../../Local_Keywords.robot


*** Keywords ***
Top Banner Carousel Section Verification
    #Verify Top Banner Under Discover Section Is Visible Or Not
    Section Verification                                             xpath=//section[contains(@class,"container masthead-slick fullscreen-slick-dots slick-initialized ")]    Discover Page   
    Reload Page
    Wait For And Click Element                                       xpath://ul[@class='slick-dots']//li[1] 

    # Confirm top banner section hovering or not
    Mouse Over                                                       xpath:(//div[@class="bg-linear-gradient-banner"])[1]
    Sleep    6s    #Test case requirement
    Element Attribute Value Should Be                                xpath:(//ul[@class="slick-dots"]//li)[1]    class    slick-active

    # Check Whether Top Banner Carousel Is Moving Automatically Or Not
    Mouse Over                                                       xpath://ul[@class='slick-dots']//li[1] 
    Wait For And Click Element                                       xpath://ul[@class='slick-dots']//li[1] 
    ${VB}=    Set Variable    1 
    WHILE  ${VB}<3
        #getting slick dot's width
        ${css}=         Get WebElement                               xpath://ul[@class='slick-dots']//li[${VB}]
        ${width_slick}=    Call Method         ${css}                value_of_css_property    width
        
        Run Keyword And Continue on Failure    Should Be Equal As Strings     ${width_slick}    24px    #Some might face site issue so this keyword is kept
        
        Log To Console        Banner${VB}
        
        ${VB}=    Evaluate    ${VB}+1
        Sleep    4s    #Testcase Requirement Do not Remove!!!
    END
    
    # Each Top Banner  Carousel Verification
    FOR    ${i}   IN RANGE    0    3
        # Clicking Sleek In Top Banner Carousel
        Wait For And Click Element                                    xpath=//button[normalize-space()='${i+1}']
        
        # Verifying  Each Banner In Top Banner Carousel
        Wait For And Verify Element                                   xpath=(//div[contains(@class,"j-fullwidth-banner-container d-flex align")])[${i+1}]
        
        # Clicking Buttons Present In Top Banner Carousel
        Wait For And Click Element                                    xpath=(//button[@aria-label="button Button"])[${i+1}]
        
        # Verifying Redirection After Clicking Each Button
        URL Validation                                                ${Top_Banner_Redirecton}[${i}]
        
        #Taking Screenshot After Clicking The Button In Top Banner Carousel
        Take Page Screenshot                                          Top_Banner_Redirection[${i+1}]
        Go Back
    END
#vivek
More reasons to shop here section visibility along with UI
    #Scroll To 'More Reason To Shop Here' Section
    Scroll To                                                        xpath=(//section[@class="l-layout--max-width"])[2]
    Text Verification                                                xpath=//h2[normalize-space()='More reasons to shop here']    More reasons to shop here
    Take Element Screenshot                                          xpath=(//section[@class="l-layout--max-width"])[2]           SC_MRTSVisibility
    
    #Verify Ui Elements Of 'More Reasons To Shop Here' Section
    Read Data of More reason to Shop here section from Excel
    
    #Scroll To Till More Reason To Shop Section Is Visible
    Scroll To                                                       xpath=//div[@class='j-container pad-top-24 pad-bt-64 pad-bt-40']//section[@class='j-container']
    
    #Print Title Of The Section In The Console
    Log To Console                                                   ${More_reasons} 
    
    #Verify Title Of The Section In The Console
    Element Text Should Be                                          xpath=//h2[normalize-space()='More reasons to shop here']                                                                  ${More_reasons}
    
    #Print Text Present Below The Title Of The Section In The Console
    Log To Console                                                  ${Check_the_benefits}

    #Verify Text Present Below The Title Of The Section In The Console
    Element Text Should Be                                          xpath=//div[normalize-space()='Check the benefits of buying your favourite device from Jio.']                              ${Check_the_benefits}
    
    #Gets The Count Of The Images Present 
    ${card_count_1}=    Get Element Count                           xpath=(//img[@class='l-radius--large fill width-100pc'])     
    IF  ${card_count_1} != 3
      Fail    msg=Images are more or less
    END

    #Verifies The Images Present
    FOR  ${i}  IN RANGE    ${card_count_1}
        Wait For And Verify Element                               xpath=(//img[@class='l-radius--large fill width-100pc'])[${i+1}]
        
        #Verifies The Heading In The Images
        Log To Console                                            ${heading[${i}]} 
        Element Text Should Be                                    xpath=(//h3[@class='j-text-heading-xs j-color-primary-grey-100 mg-bt-8'])[${i+1}]                                            ${heading[${i}]}
        
        #Verifies The Subcontent In The Images
        Log To Console                                            ${Receive_secure[${i}]} 
        Element Text Should Be                                    xpath=(//div[@class='j-text-body-m j-color-primary-grey-100'])[${i+1}]                                                       ${Receive_secure[${i}]}
    END

Need guidance? section visibility, UI Verfification and is redirected to Online Shopping FAQ page on clicking on Support button also redirected to contact centre when clicked on call us
    #Scroll To To Need Guidance Section
    Scroll To                                                    xpath=//section[@class="j-container bg--primary-background"]
    
    #Need Guidance Section 
    Text Verification                                            xpath=//h2[normalize-space()='Need guidance?']    Need guidance?
    Take Element Screenshot                                      xpath=//section[@class="j-container bg--primary-background"]    SC_NGSVisibility
    
    #Verify Ui Elements Of 'Need Guidance?' Section
    Read Data of Need Guidance? section from Excel
    
    #Verifies The Heading Of The Section
    Log To Console                                               ${Need_Guidance} 
    Element Text Should Be                                       xpath=//h2[contains(.,'Need guidance?')]                                                                                         ${Need_Guidance}
    
    #Verifies The Subtext Present Below The Heading
    Log To Console                                               ${We'd_love_to}
    Element Text Should Be                                       xpath=//div[@class='j-contentBlock__description j-text-body-m j-color-primary-grey-80'][contains(.,'We’d love to help you.')]    ${We'd_love_to}
    Element Text Should Be                                       xpath=//section[@class='j-container bg--primary-background']//a[1]    Support
    Element Text Should Be                                       xpath=//a[@href='https://www.jio.com/en-in/help-support/call-us?nav=g#/']    Call us
    
    #User Is Transferred To Online Shopping Tab Under Support Section
    Redirection On Clicking                                      xpath=//a[@href="https://www.jio.com/en-in/help-support/frequently-asked-questions?parentId=1407507402270#/"]    https://www.jio.com/help/faq?parentId=1407507402270#/    Sc_SupportFAQ
    Go To                                                        https://www.jio.com/shop/homepage
    
    #User Is Transferred To Contact Tab On Clicking On Call Us Button
    Scroll To                                                    xpath=//a[@href="https://www.jio.com/en-in/help-support/call-us?nav=g#/"]
    Redirection On Clicking                                      xpath=//a[@href="https://www.jio.com/en-in/help-support/call-us?nav=g#/"]    https://www.jio.com/help/contact-us?tab=call?nav=g#/    Sc_CallusButton






    