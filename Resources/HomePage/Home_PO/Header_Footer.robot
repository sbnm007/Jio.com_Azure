*** Settings ***
Library                                      SeleniumLibrary
Resource                                     ../../Local_Keywords.robot


*** Keywords ***
Header Content Validation   
    ${Navbar_Redirection}    Set Variable   0
    #Jio Logo
    Wait For And Verify Element                       xpath=//div[@class="header_logo-group override_logo"]

    #Clicks on Jio Logo
    Wait For And Click Element                        xpath=//div[@class="header_logo-group override_logo"]
    WHILE  ${Navbar_Redirection} != 8
        IF  ${Navbar_Redirection} < 7

            #Verifies the header present in navbar
            Wait For And Verify Element               xpath=//a[@aria-label='${Header_Options}[${Navbar_Redirection}]']
            
            #Verifies the text present in the navbar
            Text Verification                         xpath=//a[@aria-label='${Header_Options}[${Navbar_Redirection}]']    ${Header_Options}[${Navbar_Redirection}]
            CSS Verification                          xpath=//a[@aria-label='${Header_Options}[${Navbar_Redirection}]']      font-weight	 700
        END
        ${Navbar_Redirection}=       Evaluate     ${Navbar_Redirection} + 1
    END
    Wait For And Verify Element                       xpath=//section[@class='header_search-box j-container override_search hide-in--xmobile']
    Wait For And Verify Element                       xpath=//a[@id='Sign-In']
    Log To Console                                    Header UI and Content Verified 

    #Header Content Redirection
    ${Navbar_Redirection}    Set Variable   0
    WHILE  ${Navbar_Redirection} != 8
        IF  ${Navbar_Redirection} < 7
            Wait For And Verify Element               xpath=//a[@aria-label='${Header_Options}[${Navbar_Redirection}]'] 
            Redirection On Clicking                   xpath=//a[@aria-label='${Header_Options}[${Navbar_Redirection}]']    ${Header_URLs}[${Navbar_Redirection}]    ${Header_Options}[${Navbar_Redirection}]_Page
        END
        ${Navbar_Redirection}=       Evaluate     ${Navbar_Redirection} + 1
    END
    Wait For And Click Element                        xpath=//section[@class='header_search-box j-container override_search hide-in--xmobile']    
    Wait For And Click Element                        xpath=//span[@class='input-icon clickable input-icon-prefix j-icon']
    Redirection On Clicking                           xpath=//a[@id='Sign-In']    ${Header_URLs}[7]    Login_page
    Log To Console                                    Header UI and Content Verified 



Footer Content Validation
    Scroll To                                         xpath=//div[@class="j-footer j-accordion-wrapper j-accordion-plus-minus-icon"]
    #Footer Title Verification
    ${Footer_Headings}=    Get WebElements                   xpath=//div[@class="group__heading j-listBlock align-middle"]
    FOR  ${Footer}  IN  @{Footer_Headings}
        Wait For And Verify Element  ${Footer}
        CSS Verification             ${Footer}       font-weight    500   
    END

    #Footer Sub Section Verification
    ${Footer_SubSection}=    Get WebElements                   xpath=//div[@class='group']//div[@class='group__links j-grid']//a
    FOR  ${Footer_Section}  IN  @{Footer_SubSection}
        Wait For And Verify Element  ${Footer_Section}
    END

    #Connect with us & Download MyJio Title Verification
    ${text}=    Get WebElements                   xpath=//h3[@class='j-heading j-text-heading-xs']
    FOR  ${element}  IN  @{text}
        Wait For And Verify Element  ${element}
        CSS Verification    ${element}    font-weight    900                
    END

    #Connect with us Section Verification
    ${Icon_Verification}=    Get WebElements                   xpath=//div[@class='items']//a
    FOR  ${Icon}  IN  @{Icon_Verification}
        Wait For And Verify Element  ${Icon}
    END

    #Download MyJio Section Verification
    ${Download_MyJioButtons}=    Get WebElements                   xpath=//div[@class='stores']//a
    FOR  ${MyJio_Buttons}  IN  @{Download_MyJioButtons}
        Wait For And Verify Element  ${MyJio_Buttons}
    END

    #Jio Logo and Copyright Content  
    Wait For And Verify Element                       xpath=//div[@class='j-footer-legals__content__logo']
    Text Verification                                 xpath=//div[@class='j-footer-legals__content__copyright']    Copyright © 2023 Reliance Jio Infocomm Ltd. All rights reserved.

    #Footer Legals Title Verification
    ${elements}=    Get WebElements                   xpath=//div[@class='j-text j-text-body-xxs']
    FOR  ${element}  IN  @{elements}
        Wait For And Verify Element  ${element}
    END    

#Footer Content Redirection

    #Our_offerings Redirection
    Text Verification                                 xpath=//div[@class='group__heading j-listBlock align-middle']//div[@class='j-text j-text-body-m'][normalize-space()='Our offerings']    Our offerings
    CSS Verification	                              xpath=//div[@class='group__heading j-listBlock align-middle']//div[@class='j-text j-text-body-m'][normalize-space()='Our offerings']    font-weight	 900
    ${Our_offerings_Section}  Set Variable   1
    FOR  ${inc}  IN RANGE  0  5
        Text Verification                             xpath=//div[@class='group'][1]//div[@class='group__links j-grid']//a[${Our_offerings_Section}]  ${Ourofferings_text}[${inc}]
        Redirection On Clicking                       xpath=//div[@class='group'][1]//div[@class='group__links j-grid']//a[${Our_offerings_Section}]  ${Our_offerings}[${inc}]      Our_Offerings_Sub_${Our_offerings_Section}
        ${Our_offerings_Section}=   Evaluate     ${Our_offerings_Section} + 1
    END

    #Support Redirection
    Text Verification                                 xpath=//div[@class='group__heading j-listBlock align-middle']//div[@class='j-text j-text-body-m'][normalize-space()='Support']    Support
    CSS Verification                                  xpath=//div[@class='group__heading j-listBlock align-middle']//div[@class='j-text j-text-body-m'][normalize-space()='Support']    font-weight	 900
    ${j}  Set Variable   1
    FOR  ${inc}  IN RANGE  0  5
        Text Verification                             xpath=//div[@class='group'][2]//div[@class='group__links j-grid']//a[${j}]  ${Footer_Support_text}[${inc}]
        Redirection On Clicking                       xpath=//div[@class='group'][2]//div[@class='group__links j-grid']//a[${j}]  ${Footer_Support}[${inc}]  Support_Sub_${j}
        ${j}=   Evaluate     ${j} + 1
    END

    #Our_company Redirection       
    Text Verification                                 xpath=//div[@class='group__heading j-listBlock align-middle']//div[@class='j-text j-text-body-m'][normalize-space()='Our company']    Our company
    CSS Verification                                  xpath=//div[@class='group__heading j-listBlock align-middle']//div[@class='j-text j-text-body-m'][normalize-space()='Our company']    font-weight	 900
    ${Our_company_Section}  Set Variable   1
    FOR  ${inc}  IN RANGE  0  5

        # Verifying the text of the link present.
        Text Verification                             xpath=//div[@class='group'][3]//div[@class='group__links j-grid']//a[${Our_company_Section}]  ${Ourcompany_text}[${inc}]

        # It will check if the page opens in redirected page.
        IF  ${inc} == 0 or ${inc} == 1

            Wait For And Click Element                xpath=//div[@class='group'][3]//div[@class='group__links j-grid']//a[${Our_company_Section}]
            Change Tab                                ${Footer_Titles}[${inc}]
            Sleep  100ms
            Take Page Screenshot                      Our_company_Sub_${Our_company_Section}
            Change Tab                                Jio - Best Prepaid, Postpaid Plans, WiFi Connection & Mobile Apps

        # It will open the page in the tab itself.
        ELSE
            ${link_title}  Get Text  //div[@class='group'][3]//div[@class='group__links j-grid']//a[${Our_company_Section}]
            ${status}  Run Keyword And Return Status  Should be Equal As Strings  ${link_title}  Careers  strip_spaces=True   
            IF  ${status}
                Wait For And Click Element  //div[@class='group'][3]//div[@class='group__links j-grid']//a[${Our_company_Section}]
                Text Verification  //div[@class="title-wrap" and text()="Jio Careers"]  Jio Careers
                Go back  
            ELSE
                Redirection On Clicking                   xpath=//div[@class='group'][3]//div[@class='group__links j-grid']//a[${Our_company_Section}]  ${Our_company}[${inc}]  Our_company_Sub_${Our_company_Section}
            END
        END
        ${Our_company_Section}=   Evaluate     ${Our_company_Section} + 1
    END

    #Useful_links Redirection 
    Text Verification                                 xpath=//div[@class='group__heading j-listBlock align-middle']//div[@class='j-text j-text-body-m'][normalize-space()='Useful links']    Useful links
    CSS Verification                                  xpath=//div[@class='group__heading j-listBlock align-middle']//div[@class='j-text j-text-body-m'][normalize-space()='Useful links']    font-weight	 900
    ${Useful_Links_Section}  Set Variable   1
    FOR  ${inc}  IN RANGE  0  5
        Text Verification                             xpath=//div[@class='group'][4]//div[@class='group__links j-grid']//a[${Useful_Links_Section}]  ${Usefulinks_text}[${inc}]
        Redirection On Clicking                       xpath=//div[@class='group'][4]//div[@class='group__links j-grid']//a[${Useful_Links_Section}]  ${Useful_links}[${inc}]  Useful_links_Sub_${Useful_Links_Section}
        ${Useful_Links_Section}=   Evaluate     ${Useful_Links_Section} + 1
    END

    #Connect_with_us Redirection
    Text Verification                                 xpath=//h3[normalize-space()='Connect with us']    Connect with us
    CSS Verification                                  xpath=//h3[normalize-space()='Connect with us']    font-weight	 900
    ${Connect_with_us_Section}  Set Variable   1
    FOR  ${inc}  IN RANGE  0  5
        
        Redirection On Clicking                       xpath=//div[@class='items']//a[${Connect_with_us_Section}]  ${Connect_with_us}[${inc}]  Connect_with_us_Sub_${Connect_with_us_Section}
        ${Connect_with_us_Section}=   Evaluate     ${Connect_with_us_Section} + 1
    END

    #Download_MyJio Redirection
    Text Verification                                 xpath=//h3[normalize-space()='Download MyJio']    Download MyJio
    CSS Verification 	                              xpath=//h3[normalize-space()='Download MyJio']        font-weight	 900
    ${Download_MyJioSection}  Set Variable   1
    FOR  ${inc}  IN RANGE  0  2
        Redirection On Clicking                       xpath=//div[@class='stores']//a[${Download_MyJio_Section}]  ${Download_MyJio}[${inc}]  Download_MyJio_Sub_${Download_MyJio_Section}
        ${Download_MyJio_Section}=   Evaluate     ${Download_MyJio_Section} + 1
    END

    #Footer Legals Redirection
    ${Footer_Legals}  Set Variable   1
    FOR  ${inc}  IN RANGE  0  4
        Redirection On Clicking                       xpath=//div[@class='j-text j-text-body-xxs'][${Footer_Legals}]//a  ${Copyright_Section}[${inc}]  Copyright_Section_${Footer_Legals}
        ${Footer_Legals}=   Evaluate     ${Footer_Legals} + 1
    END