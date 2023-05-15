***Settings***
Library                                   SeleniumLibrary
Resource                                  ../../Local_Keywords.robot

***Keywords***
Discover New Section Validation
    Scroll To                                       xpath=//h2[@class="j-contentBlock__title j-heading j-text-heading-l" and contains(text(),'Discover')] 
    #Title Verification
    Text Verification                               xpath=//h2[@class="j-contentBlock__title j-heading j-text-heading-l" and contains(text(),'Discover')]       Discover new possibilities
    CSS Verification                                xpath=//h2[@class="j-contentBlock__title j-heading j-text-heading-l" and contains(text(),'Discover')]       font-weight     900
   
    #Subtitle Verification
    Text Verification                               xpath=//div[@class="j-contentBlock__description j-text-body-m j-color-primary-grey-80" and contains(text(),'Planning')]    Planning a digital transformation for home, business, or personal experiences? You're just a step away.
    
    #Icons Verifications
    ${Discover_New_Icon}=    Get WebElements                 xpath=//div[@class='custom_icon_size size_icon_home m-auto flex-shrink-0']
    FOR  ${Icon_Verification}    IN  @{Discover_New_Icon}
        Wait For And Verify Element                 ${Icon_Verification}
    END
    
    #Icon names verification
    ${Inc}  Set Variable   0
    ${Discover_New_IconText}=    Get WebElements                 xpath=//div[@class='j-grid']//h3
    
    FOR  ${element}    IN  @{Discover_New_IconText}
        Text Verification   ${element}              ${Discovernew_iconname}[${Inc}]
        CSS Verification    ${element}              font-weight     900
        ${inc}=   Evaluate     ${inc} + 1  
    END

    #Icon text verification
    ${IconText_Verification}  Set Variable   0
    ${DiscoverNew_Icon_Text}=    Get WebElements                     xpath=//div[@class="j-color-primary-grey-80 j-contentBlock__description j-text-body-s"]
    FOR  ${t}    IN  @{DiscoverNew_Icon_Text}
        Text Verification                           ${t}    ${Discovernew_subtext}[${IconText_Verification}]
        ${IconText_Verification}=   Evaluate     ${IconText_Verification} + 1  
    END

    #Icon button redirection
    ${Button_Redirection}  Set Variable   0
    WHILE  ${Button_Redirection} < 3
        Redirection On Clicking                      xpath=//button[@aria-label="${Discovernew_buttons}[${Button_Redirection}]"]   ${Discovernew_urls}[${Button_Redirection}]      DNP_${Discovernew_iconname}[${Button_Redirection}]
        CSS Verification                             xpath=//button[@aria-label="${Discovernew_buttons}[${Button_Redirection}]"]     font-weight     700
        ${Button_Redirection}=   Evaluate     ${Button_Redirection} + 1
    END
