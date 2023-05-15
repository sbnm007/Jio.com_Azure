*** Settings ***
Library                              SeleniumLibrary
Resource                            ../../../../Resources/Local_Keywords.robot

*** Variables ***
${Seacrh_txt}=          AUS
${Area_code}=           6129

*** Keywords ***

Redirection to ISD Plan Page  
    Scroll To                                  xpath=//button[normalize-space()='ISD']    
    
    #Clicking on ISD Plan button
    Wait For And Click Element                 xpath=//button[normalize-space()='ISD']
    
    #Setting and Taking Screenshot
    Set Screenshot Directory            /Results/Mobile/Postpaid_Screenshots/ISD/
    Take Page Screenshot                     ISDPlan-PageLoaded
    
Validate UI and Content of ISD Plans Page
    
    #To Scroll Up-Down Page
    Scroll To                                  xpath=//h3[normalize-space()='Connect with us']
    Sleep       150ms
    Scroll To                                  xpath=//div[@class='j-text j-text-heading-l']

    #---------------------------------------- ISD Top Page ----------------------------------------------------------#
    
    #Title
    Text Verification                          xpath=//div[@class='j-text j-text-heading-l']       ISD mobile plans
    
    #Country Name
    Text Verification                          xpath=(//div[@class='j-text j-text-heading-xs'])[1]                  UAE
    
    #Change Country Button
    Wait For And Verify Element                xpath=//div[@aria-label="button Change country"]

    #-------------------------------------- Pay as you go Section ----------------------------------------------------#
    
    #Pay as you go Title
    Text Verification                          xpath=//div[contains(text(),'Pay as')]              Pay as you go rates     
    
    #Pay as you go Table
    Wait For And Verify Element                xpath=//table[@aria-label="j-table"]  
    
    #Pay as you go Search box
    Wait For And Verify Element                xpath=//input[@aria-label="Search area code"]

    #----------------------------------------Plan Cards-----------------------------------------------------------------#
    Wait For And Verify Element                xpath=(//section[contains(@class,"desktop")]//section[contains(@class,'j-container bg--primary-20 l-radius--xl')])[2]

    #--------------------------------------- More Information Section ---------------------------------------------------#
    
    #Buttons
    ${elements}=      Get WebElements          xpath=//button[contains(@class,'j-button-size__medium secondary')]
    FOR  ${element}  IN  @{elements}
        Wait For And Verify Element  ${element}
    END
    Log To Console    ${element}

Change Country button functionality of ISD Plans Page
    #Redirection
    Open Popup                                 xpath=//div[@aria-label="button Change country"]
    
    #---------------------------------- UI and Content Verification ---------------------------------------------------------------------------#
    
    #Cross Button
    Wait For And Verify Element                xpath=//div[contains(@class,'j-modal-visible')]//button 
    
    #Search Field
    Wait For And Verify Element                xpath=//div[contains(@class,'j-modal-visible')]//input 
    Element Attribute Verification             xpath=//div[contains(@class,'j-modal-visible')]//input      placeholder     Select country
    
    #Country List
    Wait For And Verify Element                xpath=//div[contains(@class,'j-modal-visible')]//div[@class='customScroll_scroll__1lZUu']
    
    #---------------------------Invalid Seacrh Text-------------------------------------------#
    
    #Entering Invalid Text
    Wait For And Click Element                 xpath=//div[contains(@class,'j-modal-visible')]//input                                      
    Wait For And Input Text                    xpath=//div[contains(@class,'j-modal-visible')]//input      ${Name}
    
    #Error Msg
    Text Verification                          xpath=//div[contains(@class,'noResults')]                   No results found
    
    #Clear Invalid text
    Press Keys                                 xpath=//div[contains(@class,'j-modal-visible')]//input          CTRL+a+BACKSPACE

    #---------------------------Seacrh and Select Country-------------------------------------------#

    #Searching Country
    Wait For And Input Text                    xpath=//div[contains(@class,'j-modal-visible')]//input      ${Seacrh_txt}
    ${elements}=      Get WebElements          xpath=//div[contains(@class,'j-modal-visible')]//div[@class='j-text j-text-body-m']
    FOR  ${element}  IN  @{elements}
        Wait For And Verify Content   ${element}    ${Seacrh_txt}
    END
    Log To Console    ${element}

    #Selecting Country
    Wait For And Click Element              ${elements}[0]
    ${Country_Nm}=      Take Element Text            ${elements}[0]

    #Verifying Same Country is Visible
    Text Verification                          xpath=(//div[@class='j-text j-text-heading-xs'])[1]         ${Country_Nm}
    Wait For And Verify Element                xpath=//table[@aria-label="j-table"] 
    Wait For And Verify Element                xpath=(//section[contains(@class,"desktop")]//section[contains(@class,'j-container bg--primary-20 l-radius--xl')])[2]

    #To Scroll Up-Down Page
    Scroll To                                  xpath=//h3[normalize-space()='Connect with us']
    Sleep       150ms
    Scroll To                                  xpath=//div[@class='j-text j-text-heading-l']

    #-----------------------------------------Pay as Search Field  Functionality-------------------------------------------------------------------------------------------#
    
    #Entering Area Code
    Wait For And Click Element                 xpath=//input[@aria-label="Search area code"]                                      
    Wait For And Input Text                    xpath=//input[@aria-label="Search area code"]     ${Area_code}
    Press Keys                                 xpath=//input[@aria-label="Search area code"]     RETURN
    Sleep       1s            #Required and fixed
    Wait For And Verify Content                xpath=//table[@aria-label="j-table"]//td[1]       ${Area_code}
    
    #Clear Invalid text
    Press Keys                                 xpath=//input[@aria-label="Search area code"]     CTRL+a+BACKSPACE
    Sleep       150ms

Verify and Validate Plan Cards and Recharge Redirection of ISD Plans
    ${RURL}=        Get Location
    #---------------------------------------- Plan Card Section ---------------------------------------------------------#
    
    Plan Card Verification    Mobile_Postpaid  xpath=(//div[@class='j-text j-text-heading-m'])[3]  xpath=(//div[@class='j-grid'])[10]      xpath=(//section[contains(@class,'desktop')]//div[normalize-space()='Recharge'])[2]      xpath=(//button[@aria-label='button'][normalize-space()='View details'])[3]  ISD

    #----------------------------------Recharge Button Redirection--------------------------------------------------------------#
    
    Recharge Popup Verification                xpath=(//section[contains(@class,'desktop')]//div[normalize-space()='Recharge'])[2]         xpath=(//div[@class='j-text j-text-heading-m'])[3]  No View Details     ${RURL}    ${COCP_OR_Postpaid_Number}
    
    # Gets the count of View details button
    ${card_count}=    Get Element Count        xpath=//section[@class='j-container l-breakpoint--desktop']//section[@class='j-container bg--primary-20 l-radius--xl']
    Log To Console    ${card_count}
    View Details Pop up Verification 2         xpath:(//section[contains(@class,"desktop")]//button[@class='j-button j-button-size__medium tertiary'])[2]     xpath://div[@class='j-modal j-modal-visible j-modal-closable j-modal-size-s planDetailsPopup j-modal-kind-dialog']//div[@class='j-modal-container']//div//div[@class='j-modal-body']  Mobile_Postpaid   18   1  xpath:(//div[@class='j-modal j-modal-visible j-modal-closable j-modal-size-s planDetailsPopup j-modal-kind-dialog']//div[@class='j-modal-container']//div//header[@class='j-modal-header']//button[@aria-label='button'])
    
    #------------------------------Buy Button Redirection--------------------------------------------#
    
    # Open Pop-up
    Open Popup                                 xpath=(//button[@aria-label='button'][normalize-space()='View details'])[3]
    Recharge Popup Verification                xpath=(//button[@aria-label='button'][normalize-space()='Buy'])[3]     xpath=(//div[@class='j-text j-text-heading-m'])[3]   xpath=(//button[@aria-label='button'][normalize-space()='View details'])[3]     ${RURL}    ${COCP_OR_Postpaid_Number}
   

Verify Redirection of More Information section ISD Page
    More Information Section Redirection       xpath=//div[contains(@class,'MoreInformation')]//button[contains(@class,'secondary')]    NO Urls  ISD
