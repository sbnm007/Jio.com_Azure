*** Settings ***
Library                             SeleniumLibrary
Resource                          ../../../Local_keywords.robot


*** Keywords ***
Hot deals on cool devices Section Validation
    #Validating user able to see Hot deals Section
    Scroll To                                    xpath=//button[@aria-label='Start shopping']
    Wait For And Verify Element                  xpath=//div[@class=" l-layout--max-width"]//div[@class="j-contentBlock__body"]//h2[@class="j-contentBlock__title j-heading j-text-heading-l"]  
    
    
    #Validating present devices from section
    ${Devices}=  Get WebElements                 xpath=//div[contains(@style,"justify-content")]
    FOR  ${Device}  IN  @{Devices} 
        Wait For And Verify Element              ${Device}
    END                
    
    Wait For And Verify Element                  xpath=//button[@aria-label='Start shopping']
    Take Page Screenshot                         HotDeals 
    
    #Validating Device name
    ${Mainelements}=  Get WebElements            xpath=//h3[@class="j-contentBlock__title j-color-primary-grey-100 j-text-body-s-bold "]
    ${SubElements}=  Get WebElements             xpath=//div[contains(@class,"j-color-primary-grey-80 j-text-body-s")]
    FOR  ${i}  IN RANGE  0  3
        Text Verification                        ${Mainelements}[${i}]       ${DevicesMaintext}[${i}]
        Text Verification                        ${Subelements}[${i}]        ${DevicesSubtext}[${i}] 
    END

    #Respective Device Page Redirection
    #List of Devices
    ${DevicesList}=   Create List   JioFi  Apple iPhone 14  Apple Watch 
    ${length}=  Get Length  ${DevicesList}
    ${count}=     Set Variable  0
    FOR  ${Device}  IN  @{DevicesList}
        Wait For And Click Element              xpath=//div[@class="j-card__flex"]//img[contains(@alt,"${Device}")]
        Sleep   2s
        #For iPhone Page 
        Page Should Contain      ${Device}     
        Go Back
        ${count}=   Evaluate     ${count} + 1   
    END

    #Start Shopping Button Redirection
    Scroll To                                  xpath=//div[@class="l-layout--max-width l-align-center"]//button[@aria-label="Start shopping"]
    Redirection On Clicking                    xpath=//div[@class="l-layout--max-width l-align-center"]//button[@aria-label="Start shopping"]      https://www.jio.com/shop/en-in/c/jioaccessories?q=%3Arelevance      Device_Shop
    
 