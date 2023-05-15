*** Settings ***
Library                             SeleniumLibrary
Resource                  ../../../../Resources/Local_Keywords.robot


*** Keywords ***
Fiber View Details Section Validation
    #Clicking on Fiber and Verifing UI
    Wait For And Click Element                xpath=//span//div[contains(text(),'JioFiber')]
    URL Validation                            https://www.jio.com/selfcare/recharge/fiber/
    ViewDetailsPageFiber_UI.Tab UI Verification    JioFiberTab_Recharge      xpath=//img[@alt="Broadband Online Recharge"]
   
Tab UI Verification
   [Arguments]    ${SC-Name}     ${Img_locater}
   #Rupee Symbol Verification
   
   Wait For And Verify Element                 xpath=(//span[@class="j-icon j-icon__bg"])[1]   
   
   #Recharge Text verification
   Text Verification                           xpath=//h1[@class="j-text j-text-heading-xs"]       Recharge
   
   #Subtitle verification
   Text Verification                           xpath=//h2[@class="txt-align--center j-text j-text-body-xs"]     Enter your details to find the best prepaid plans.
   
   #Tab Switcher Verification
   Wait For And Verify Element                 xpath=//div[@class="jds_toggle__mrH_E j-selectors"]
   
   #Input Field Verification
   Wait For And Verify Element                 xpath=//input[@id="submitNumber"]
   
   #continue Button gray verification
   Wait For And Verify Element                 xpath=//button[@class="j-button j-button-size__medium primary disabled"]
   
   #Using Jio Link Recharge verification
   Wait For And Verify Element                 xpath=//div[@style="display: flex; align-items: center; width: 100%;"]
   
   #Capturing Page Screenshot
   Take Page Screenshot                        ${SC-Name}
   
   #Image Verification 
   #Image Verification of Recharge Page
   Image Verification                          ${Img_locater}  
   
   #Checking For Invalid Number Text
   Check Continue Button Enabled               xpath=//input[@id="submitNumber"]           xpath=//div[@style="width: 100%;"]//button[contains(text(),Continue)]     ${Incorrect_No1}
   Wait For And Click Element                  xpath=//div[@style="width: 100%;"]//button[contains(text(),Continue)]
   
   #Invalid Error Text Verification
   Text Verification                           xpath=//div[@class="field-error"]                  The number you have entered is not a Jio number. Please enter a Jio number and try again.
   

    #i Button Popup Validation
    Wait For And Click Element                 xpath=//span[@class="input-icon input-icon-suffix clickable"]
    #Checks visibility of Pop-Up
    Wait For And Verify Element                xpath: //div[@class="j-modal-body"]
    
    #Verify UI elements
    # Background gets blurred 
    CSS Verification                           xpath: (//div[@aria-label="Modal "])[2]    backdrop-filter    blur(5px) contrast(0.8)

   #JioFiber PopUp Heading Vreification
    Text Verification                          xpath=//div[@class="j-listBlock__block-text"]//div[@class="j-text j-text-heading-xs"]    JioFiber Number
   
    #SubText Verification
    Wait For And Verify Element                xpath=//div[@class="jds_popupText__S60jS j-text j-text-body-xxs"]
    Take Page Screenshot                              i Popup JioFiber
   
   #Clicking Cross Button On PopUp
    Cross Button Functionality                 xpath=//button[@class="j-button j-button-size__medium tertiary icon-primary icon-only"][@aria-label="button"]


    #Clicking Fiber tab 
    Wait For And Click Element  xpath=//span//div[contains(text(),'JioFiber')]
    ViewDetailsPageFiber_UI.Validating UI and Redirection on View Details Section       ${Fiber_No}     Fiber_Recharge        https://www.jio.com/selfcare/recharge/fiber/plans/?serviceId=${Fiber_No}&serviceType=fiber&next=PREPAID&billingType=PREPAID             https://www.jio.com/selfcare/recharge/fiber/?serviceId=7613564737&serviceType=fiber&next=PREPAID&billingType=PREPAID&action=edit 

Validating UI and Redirection on View Details Section
   [Arguments]      ${Mobile_FiberNumber}      ${TabName}     ${PlanPageURL}    ${RechargePage_URL}  
   #Checking The Continue Button get enable and clicking it
   Enter Number and Proceed                   xpath=//input[@id="submitNumber"]      ${Mobile_FiberNumber}  xpath=//div[@style="width: 100%;"]//button[contains(text(),Continue)]      
   #Taking Screenshoot 
   Take Page Screenshot                        ${TabName} Plan page Loaded 
   #Verify select plan header
   Wait Until Keyword Succeeds    15sec    0    CSS Verification                           xpath=//h1[@class='css-1b0kdeo']    font-size    30px
   #Verify Jio number text
   Text Verification                          xpath=//div[@class='css-bcp9a3']    Jio number
   #Verify user's JioFiber number
   Wait For And Verify Element                xpath=//input[@value='7613564559']
   #Verify edit button
   Button Verification                        xpath=//button[@class='css-w027hr'] 
   #Verifying list of plan types
   FOR    ${i}  IN  RANGE    0  7
    #    Scroll To                              xpath=//button[text()='Data Sachet']
       Wait For And Verify Element            xpath=//button[text()='Annual']
   END
   #verifying plan name
    Text Verification                  xpath=//span[@class="css-g88c3e"]    30 Mbps
    #Verifying accordion function
    Wait For And Verify Element        xpath=(//span[@class='css-15ox7xe'])[1]
    #Verfying plan cost
    Wait For And Verify Element        xpath=(//div[@class='css-7h7wp6'])[1]
    #Verifying plan validity
    Wait For And Verify Element        xpath=(//span[@class='css-1jy172b'])[1]
    #Verifying plan data
    Wait For And Verify Element        xpath=//div[@class='css-6x1dzb']//span[@class='css-1abzxp8']
    #Verifying view details button
    Button Verification                xpath=(//button[text()='View details'])[1]
    #Verifying buy button
    Button Verification                xpath=(//button[text()='Buy'])[1]

   #Validating URL of Recharge page
   URL Validation                              ${PlanPageURL}
   ${j}       Set Variable        1
   ${i}       Set Variable        0
   ${k}       Set Variable        1
   #${m}       Set Variable        3
   ${elements}=    Get WebElements             xpath=//span[@class="css-g88c3e"]
   ${Len}=   Get Length  ${elements}
   FOR  ${element}  IN  @{elements}
        Scroll to         ${element}
    
    #Clicking Name with Accordian function
      #Element Attribute Value Should Be          xpath=//button[@data-testid="${i}"]         aria-expanded      true   
    ${elements}=    Get WebElements            xpath=//div[@id="panel_${i}"]//div[@class="css-7h7wp6"]
    FOR  ${element}  IN  @{elements}
       #Verifing Plan Price
       Sleep        2s
       Wait Until Keyword Succeeds    20sec    2sec    Wait For And Verify Element    ${element}
        IF  ${k} == ${Len}  BREAK
        IF  "${TabName}" == "Fiber_Recharge"
            View Details Popup Verification    Mobile_Recharge   xpath=(//div[@id="panel_${i}"]//button[@class="css-mnbytr"])[${k}]   xpath=//div[@class="modal-header p-0 position-relative"]   xpath=//div[@class='card-popup-padding modal-body p-0']|//div[@class='modal-body p-0 card-popup-padding']    xpath=//div[@class="app-bg"]    xpath=//button[@aria-label="Close"]   ${TabName}
        ELSE
            Scroll To                          xpath=(//div[@id="panel_${i}"]//button[@class="css-mnbytr"])[${k}]
            Sleep    3s
            View Details Popup Verification    ${TabName}   xpath=(//div[@id="panel_${i}"]//button[@class="css-mnbytr"])[${k}]   xpath=//div[@class="modal-header p-0 position-relative"]   xpath=//div[@class='card-popup-padding modal-body p-0']|//div[@class='modal-body p-0 card-popup-padding']   xpath=//div[@class="app-bg"]    xpath=//button[@aria-label="Close"]  ${TabName}
        END
        ${j}=   Evaluate     ${j} + 1
        ${k}=   Evaluate     ${k} + 1
        #${m}=   Evaluate     ${m} + 1
        
    END
    ${i}=   Evaluate     ${i} + 1 
    Sleep    500ms 
    IF  ${i} == ${Len}  BREAK
    Wait For And Click Element                 xpath=//button[@data-testid="${i}"][@aria-expanded="false"]
    ${k}       Set Variable        1
   END

   #Verifying Subscriptions with two apps in preview
   Wait For And Verify Element                 xpath=(//img[@alt='Subscription Item'])[7]
   Wait For And Verify Element                 xpath=(//img[@alt='Subscription Item'])[8]
   #Verifying price of plan and plane name in view details section
   Wait For And Click Element                  xpath=(//button[text()='View details'])[6]
   CSS Verification                            xpath=//span[text()='47988']    font-size    70px    
   Text Verification                           xpath=//div[@class='info_txt']    ANNUAL PLAN
   #Verifying cross button
   Wait For And Verify Element                 xpath=//button[@aria-label='Close']
   #Verifying Jio Apps & other subscriptions with app logos below
   Text Verification                           xpath=//div[@class='title_app text-center']    Jio Apps & other subscription 
   FOR    ${i}    IN RANGE    0  17
       Wait For And Verify Element             xpath=//img[@src='https://jep-asset.akamaized.net/jio/svg/app-logo/ic_netflix.svg']
   END
   #Verifying text under note section
   Scroll To                                   xpath=//div[@class='details-notes-title']
   ${Note_section}=                            Read Excel Cell    row_num=45    col_num=3    sheet_name=Mobile_Recharge  
   #Clicking on here hyperlink under note section
   Wait For And Click Element                  xpath=//a[@href='https://www.jio.com/en-in/fiber/jiofiber-amazon-prime-offer']
   Sleep    150ms
   Go Back

    ViewDetailsPageFiber_UI.ISD Section Verification    ${Fiber_No}     Fiber

ISD Section Verification
    [Arguments]       ${Mobile_FiberNumber}            ${Tab}
    #Checking Continue Button is Enable and Clicking it
    # Enter Number and Proceed           xpath=//input[@id="submitNumber"]       ${Mobile_FiberNumber}  xpath=//button[@aria-label='button Continue']      

    #Switch to ISD Plan 
    Wait For And Click Element                 xpath=//button[contains(text(),"ISD")]
    
    #Checking other packs and title below
    Wait For And Verify Element                xpath=//div[@class="css-1urkwwk"]
    Wait For And Verify Content                xpath= //button[@class="css-7adpwj"]    Select country to check pay as you go rates
    
    #Verifing Individual country benefits
    Text Verification                          xpath=//h3[@class="css-m2nrxd"]   Individual country benefits
        
    #Verifing Select Country Search bar
    Wait For And Verify Element                xpath=//div[@class="css-d0qstn"]
    
    #Verifing Note Section
    Wait For And Verify Element                xpath=//div[@class="css-11eiedl"]
    
    #Screenshot of ISD Page
    Take Page Screenshot                       ${Tab} ISD Page Loaded
    
    #Clicking Search Box 
    Wait For And Click Element                 xpath=//button[@class="css-7adpwj"]
    
    #Taking Screenshot of Search Box Popup
    Take Page Screenshot                       ${Tab}SearchBox 
    
    #Verifing Search Box on PopUp
    Wait For And Verify Element                xpath=//input[@type="search"]    
    
    #Verifing Country List
    Wait For And Verify Element                xpath=//div[@class="simplebar-content"]  
    
    #Checking Error Tost for Invalid Search
    Wait For And Input Text                    xpath=//input[@type="search"]            ${IncorrectSearchText}
    
    #Error Text
    #Text Verification                          xpath=//div[@class="css-1ytf4sz"]        We searched far and wide and couldn't find what you were looking for. Try something else.
    #Take Page Screenshot                       ${Tab} Error Text
    
    #Clicking Cross Button in Search bar
    Wait For And Click Element                 xpath=//button[@class="css-w55tvj"]
    
    #Cheacking For Relevent Reasults Appears after search
    Wait For And Input Text                    xpath=//input[@type="search"]            ${CorrectSearchText1}
    ${elements}=    Get WebElements            xpath=//div[@class="css-uun9q9"]//span
    FOR  ${element}  IN  @{elements}
         ${text}=    Take Element Text         ${element}
         ${Temp}=    Convert To Upper Case     ${CorrectSearchText1}
         Wait For And Verify Content           ${element}   ${Temp}
    END
    
    #Clicking Country name from search option
    Wait For And Click Element                 ${elements}[0]  
    
    #Verifing Area Code and Rates With Searchbox
    Wait For And Verify Element                xpath=//div[@class="css-1tdezsf"] 
    Take Element Screenshot                    xpath=//div[@class="css-1tdezsf"]     ${Tab} Code & Rates
    
    #Checking country codes count 
    ${elements}=    Get WebElements            xpath=//div[@class="css-essr0f"]
    FOR  ${element}  IN  @{elements}
         ${text}=    Take Element Text         ${element}
    END
    
    #Searching For Invalid Country Code
    Wait For And Input Text                    xpath=//input[@placeholder="Search with area code"]   ${InvalidCode} 
    
    #Clicking Search Icon
    Wait For And Click Element                 xpath=//div[@class="css-1ro3g78"]//span 
    
    #Checking Invalid Code gets red
    Sleep   200ms
    Take Page Screenshot                       ${Tab} ContryInvalidCode
    CSS Verification                           xpath=//input[@value="${InvalidCode}"]          color        rgba(199, 23, 32, 1)
    #Clicking Cross Icon on search icon
    Wait For And Click Element                 xpath=//button[@aria-label="clear input"]

    #Searching for Valid country Code 
    Wait For And Input Text                    xpath=//input[@placeholder="Search with area code"]   ${text} 
    
    #Clicking Search Icon
    Wait For And Click Element                 xpath=//div[@class="css-1ro3g78"]//span  
    
    #Checking Country Code get Highlited
    Scroll To                                  xpath=//div[contains(text(),"${text}")]
    Sleep                                      200ms
    
    #Cheacking colour change on valid country code
    CSS Verification                           xpath=//div[@class="css-epgw22"]      background-color     rgba(255, 249, 222, 1)
    Take Page Screenshot                       ${Tab}ValidCountryCode
    
    #Clicking Link from Note
    Wait For And Click Element                 xpath=//ol[@data-testid="irnote-ul"]//a  
    
    #Verifing URL 
    URL Validation                             https://www.jio.com/selfcare/recharge/mobility/


