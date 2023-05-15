*** Settings ***
Library                              SeleniumLibrary
Resource                            ../../../Local_Keywords.robot

*** Variables ***
${Seacrh_txt}=          AUS
${Area_code}=           6129

*** Keywords ***
Redirection to ISD Plan Page
    [Arguments]                                ${Page_Name}
    # Clicking on ISD Button
    Wait For And Click Element                 xpath=//button[@aria-label="button ISD"]  
    
    ${P_Name}  Set Variable                    ${Page_Name}
    Set Global Variable     ${P_Name}          ${P_Name}
    Set Screenshot Directory                   ./Results/Mobile/Prepaid_Screenshots/ISD/
    ${P_Name}=  Convert To Lower Case   ${P_Name}
    URL Validation                             https://www.jio.com/selfcare/plans/jio-isd-plans/?type=${P_Name}
    # Taking Screenshot of ISD Plans Page Load
    Take Page Screenshot                       ${P_Name}_ISD-PageLoaded
    
Validate UI and Content of ISD Plans Page
    # To Scroll Up-Down Page
    Scroll To                                  xpath=//h3[normalize-space()='Connect with us']
    Sleep       200ms
    Scroll To                                  xpath=//div[@class='j-text j-text-heading-l']

    #---------------------------------------- ISD Top Page ----------------------------------------------------------# 
    # Title
    Text Verification                          xpath=//div[@class='j-text j-text-heading-l']       ISD mobile plans
    # Country Name
    Text Verification                          xpath=(//div[@class='j-text j-text-heading-xs'])[1]                  UAE
    # Change Country Button
    Wait For And Verify Element                xpath=//div[@aria-label="button Change country"]
    #-------------------------------------- Pay as you go Section ----------------------------------------------------# 
    # Pay as you go Title
    Text Verification                          xpath=//div[contains(text(),'Pay as')]              Pay as you go rates     
    # Pay as you go Table
    Wait For And Verify Element                xpath=//table[@aria-label="j-table"]  
    # Pay as you go Search box
    Wait For And Verify Element                xpath=//input[@aria-label="Search area code"]
    #--------------------------------------- More Information Section ---------------------------------------------------# 
    # Buttons
    ${elements}=      Get WebElements          xpath=//button[contains(@class,'j-button-size__medium secondary')]
    FOR  ${element}  IN  @{elements}
        Wait For And Verify Element  ${element}
    END

Change Country button functionality of ISD Plans Page
    
    # Redirection
    Open Popup                                 xpath=//div[@aria-label="button Change country"]
    #---------------------------------- UI and Content Verification ---------------------------------------------------------------------------# 
    
    #  Cross Button
    Wait For And Verify Element                xpath=//div[contains(@class,'j-modal-visible')]//button 
    
    #  Search Field
    Wait For And Verify Element                xpath=//div[contains(@class,'j-modal-visible')]//input 
    Element Attribute Verification             xpath=//div[contains(@class,'j-modal-visible')]//input      placeholder     Select country
    
    #  Country List
    Wait For And Verify Element                xpath=//div[contains(@class,'j-modal-visible')]//div[@class='customScroll_scroll__1lZUu']
    
    #-----------------------------------------Change Country Popup Functionality-------------------------------------------------------------------------------------------# 
    
    #---------------------------Invalid Seacrh Text-------------------------------------------# 
    
    # Entering Invalid Text
    Wait For And Click Element                 xpath=//div[contains(@class,'j-modal-visible')]//input                                      
    Wait For And Input Text                    xpath=//div[contains(@class,'j-modal-visible')]//input      ${Name}
    
    #  Error Msg
    Text Verification                          xpath=//div[contains(@class,'noResults')]                   No results found
    
    #  Clear Invalid text
    Press Keys                                 xpath=//div[contains(@class,'j-modal-visible')]//input          CTRL+a+BACKSPACE

    #---------------------------Seacrh and Select Country-------------------------------------------# 

    #  Searching Country
    Wait For And Input Text                    xpath=//div[contains(@class,'j-modal-visible')]//input      ${Seacrh_txt}
    ${elements}=      Get WebElements          xpath=//div[contains(@class,'j-modal-visible')]//div[@class='j-text j-text-body-m']
    FOR  ${element}  IN  @{elements}
        Wait For And Verify Content            ${element}    ${Seacrh_txt}
    END

    #  Selecting Country
    Wait For And Click Element                 ${elements}[0]
    ${Country_Nm}=      Take Element Text      ${elements}[0]

    #  Verifying Same Country is Visible
    Text Verification                          xpath=(//div[@class='j-text j-text-heading-xs'])[1]         ${Country_Nm}
    
    #  To Scroll Up-Down Page
    Scroll To                                  xpath=//h3[normalize-space()='Connect with us']
    Sleep       200ms
    Scroll To                                  xpath=//div[@class='j-text j-text-heading-l']

    #-----------------------------------------Pay as Search Field  Functionality-------------------------------------------------------------------------------------------# 
    # Entering Area Code
    Wait For And Click Element                 xpath=//input[@aria-label="Search area code"]                                      
    Wait For And Input Text                    xpath=//input[@aria-label="Search area code"]      ${Area_code}
    Press Keys                                 xpath=//input[@aria-label="Search area code"]    RETURN
    #Sleep       1s
    Run Keyword    Press Keys  None  CTRL+-
    
    
    

    Sleep   200ms
    Wait For And Verify Content                xpath=//table[@aria-label="j-table"]//td[1]       ${Area_code}
    # Clear Invalid text
    Press Keys                                 xpath=//input[@aria-label="Search area code"]          CTRL+a+BACKSPACE
    #Sleep  1s



Verify and Validate Plan Cards and Recharge Redirection of ISD Plans
    ${RURL}=        Get Location
    #---------------------------------------- Plan Card Section ---------------------------------------------------------# 
    
    Plan Card Verification                     Mobile_Prepaid  xpath=(//div[@class='j-text j-text-heading-m'])[3]  xpath=(//div[@class='j-grid'])[10]  xpath=(//section[contains(@class,'desktop')]//div[normalize-space()='Recharge'])[2]      xpath=(//button[@aria-label='button'][normalize-space()='View details'])[3]  ISD

    #----------------------------------Recharge Button Redirection--------------------------------------------------------------# 
    
    Recharge Popup Verification                xpath=(//section[contains(@class,'desktop')]//div[normalize-space()='Recharge'])[2]         xpath=(//div[@class='j-text j-text-heading-m'])[3]  No View Details     ${RURL}    ${Prepaid_Number}

    View Details Popup Verification            Mobile_Prepaid     xpath=(//button[@aria-label='button'][normalize-space()='View details'])[3]  xpath=(//div[@class='j-text j-text-heading-m'])[7]   xpath=(//div[@class='customScroll_scroll__1lZUu'])[4]   No OTT   xpath=//div[contains(@class,'j-modal j-modal-visible j-modal-closable')]//i  ISD

    #------------------------------Buy Button Redirection--------------------------------------------# 
    #  Open Pop-up
    Open Popup                                 xpath=(//button[@aria-label='button'][normalize-space()='View details'])[3]
    
    Recharge Popup Verification                xpath=(//button[@aria-label='button'][normalize-space()='Buy'])[3]     xpath=(//div[@class='j-text j-text-heading-m'])[3]   xpath=(//button[@aria-label='button'][normalize-space()='View details'])[3]     ${RURL}    ${Prepaid_Number}
   

Verify Redirection of More Information section ISD Page
    More Information Section Redirection       xpath=//div[contains(@class,'MoreInformation')]//button[contains(@class,'secondary')]    NO Urls  ISD