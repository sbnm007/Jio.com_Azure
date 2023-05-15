*** Settings ***
Library                             SeleniumLibrary
Resource                            ../../Common.robot



*** Keywords ***
Latest and Trending Devices Section Validation
    # Validating user able to see Latest and trending devices Section
    Scroll To                                                   xpath=(//section[contains(@class,'j-container')])//*[contains(text(),"Latest and trending devices")]
    Text Verification                                           xpath=//div[@class=" l-layout--max-width"]//h2         ${Latestdevices_section[0]}
    CSS Verification                                            xpath=//div[@class=" l-layout--max-width"]//h2        font-weight     900
   
    # sub-text verification
    Text Verification                                           xpath=//div[@class="j-color-primary-grey-80 j-contentBlock__description j-text-body-m" and normalize-space()="${Latestdevices_section[1]}"]    ${Latestdevices_section[1]}      
    Take Page Screenshot                                        LatestDevices
    
       
    # Validating present devices from section
    ${Devices}=  Get WebElements                                xpath=//div[contains(@style,"justify-content")]
    FOR  ${Device}  IN  @{Devices} 
        Wait For And Verify Element     ${Device}             
    END    

    ${Hyperlink_presence}=    Run Keyword And Return Status   Element Should Be Visible   //div[@class='j-badge j-badge-size__small']   
    IF  ${Hyperlink_presence} == True
        Wait For And Verify Element                             xpath=//div[@class='j-badge j-badge-size__small']
    END     
   
    # Verifying price of each product
    FOR  ${Device_pi}  IN  @{Latestdevices_price}
        Wait For And Verify Element                             xpath=//div[normalize-space()='${Device_pi}']            
    END         
   
    # Respective Device Page Redirection  
    FOR  ${Device}  IN  @{Latestdevices_list}
        
        # CSS Verification of the amount present on the card
        CSS Verification                                        xpath=//h3[normalize-space()='${Device}']     font-weight     700

        # Clicking on the card
        Wait For And Click Element                              xpath=//h3[normalize-space()='${Device}']

        # Post clicking, capturing the screenshot of redirected page
        Take Page Screenshot      ${Device}_Page

        # Going back to main page.
        Go Back   
    END

    # Scrolling again to 'Latest Trending Devices Section'
    Scroll To                                                    xpath=(//section[contains(@class,'j-container')])//*[contains(text(),"Latest and trending devices")]

    # Clicking on 'View All Products' Button
    Redirection On Clicking                                      xpath=//button[@aria-label='View all products']   https://www.jio.com/shop/homepage  Shop_Page