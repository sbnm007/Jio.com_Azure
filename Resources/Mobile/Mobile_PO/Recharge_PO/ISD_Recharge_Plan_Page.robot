*** Settings ***
Library                              SeleniumLibrary
Resource                  ../../../../Resources/Local_Keywords.robot
Variables                 ../../../../Tests/Mobile/MRecharge_Variables.yaml

***Keywords***
MR-ISD Section Verification
    ISD_Recharge_Plan_Page.ISD Section Verification    ${Prepaid_Number}    Mobile
    Sleep  200ms    
    Reload Page

ISD Section Verification
    [Arguments]       ${Mobile_FiberNumber}            ${Tab}
    #Checking Continue Button is Enable and Clicking it
    Enter Number and Proceed           xpath=//input[@id="submitNumber"]       ${Mobile_FiberNumber}  xpath=//button[@aria-label='button Continue']      

    #Switch to ISD Plan 
    Wait For And Click Element         xpath=//button[contains(text(),"ISD")]
    
    #Checking Global ISD packs and title below
    Wait For And Verify Element        xpath=//div[@class="css-1urkwwk"]
    Text Verification                  xpath=//button[@id="0"]//span[@class="css-g88c3e"]    Global ISD Pack
    
    #Verifing Individual country benefits
    Text Verification                  xpath=//h3[@class="css-m2nrxd"]   Individual country benefits
    
    #Verifing Select Country Search bar
    Wait For And Verify Element        xpath=//div[@class="css-d0qstn"]
    
    #Verifing Note Section
    Wait For And Verify Element        xpath=//div[@class="css-11eiedl"]
    
    #Screenshot of ISD Page
    Take Page Screenshot               ${Tab} ISD Page Loaded
    
    #Clicking Search Box 
    Wait For And Click Element         xpath=//button[@class="css-7adpwj"]
    
    #Taking Screenshot of Search Box Popup
    Take Page Screenshot               ${Tab}SearchBox 
    
    #Verifing Search Box on PopUp
    Wait For And Verify Element        xpath=//input[@type="search"]    
    
    #Verifing Country List
    Wait For And Verify Element        xpath=//div[@class="simplebar-content"]  
    
    #Checking Error Tost for Invalid Search
    Wait For And Input Text            xpath=//input[@type="search"]            ${IncorrectSearchText}
    
    #Error Text
    #Text Verification                  xpath=//div[@class="css-1ytf4sz"]        We searched far and wide and couldn't find what you were looking for. Try something else.
    #Take Page Screenshot               ${Tab} Error Text
    
    #Clicking Cross Button in Search bar
    Wait For And Click Element         xpath=//button[@class="css-w55tvj"]
    #Text in the search bar disappears
    Wait For And Verify Element        xpath=//div[@class="css-z3461j"]//input[@value=""]
    
    #Cheacking For Relevent Reasults Appears after search
    Wait For And Input Text            xpath=//input[@type="search"]            ${CorrectSearchText1}
    ${elements}=    Get WebElements    xpath=//div[@class="css-uun9q9"]//span
    FOR  ${element}  IN  @{elements}
         ${text}=    Take Element Text        ${element}
         ${Temp}=    Convert To Upper Case    ${CorrectSearchText1}
         Wait For And Verify Content          ${element}   ${Temp}
    END
    
    #Clicking Country name from search option
    Wait For And Click Element                ${elements}[0]  
    
    #Verifing Area Code and Rates With Searchbox
    Wait For And Verify Element        xpath=//div[@class="css-1tdezsf"] 
    Take Element Screenshot            xpath=//div[@class="css-1tdezsf"]     ${Tab} Code & Rates
    
    #Checking country codes count 
    ${elements}=    Get WebElements    xpath=//div[@class="css-essr0f"]
    FOR  ${element}  IN  @{elements}
         ${text}=    Take Element Text   ${element}
    END
    
    #Searching For Invalid Country Code
    Wait For And Input Text            xpath=//input[@placeholder="Search with area code"]   ${InvalidCode} 
    
    #Clicking Search Icon
    Wait For And Click Element         xpath=//div[@class="css-1ro3g78"]//span 
    
    #Checking Invalid Code gets red
    Sleep                              200ms
    Take Page Screenshot               ${Tab} ContryInvalidCode
    CSS Verification                   xpath=//input[@value="${InvalidCode}"]          color        rgba(199, 23, 32, 1)
    #Clicking Cross Icon on search icon
    Wait For And Click Element         xpath=//button[@aria-label="clear input"]

    #Searching for Valid country Code 
    Wait For And Input Text            xpath=//input[@placeholder="Search with area code"]   ${text} 
    
    #Clicking Search Icon
    Wait For And Click Element         xpath=//div[@class="css-1ro3g78"]//span  
    
    #Checking Country Code get Highlited
    Scroll To                          xpath=//div[contains(text(),"${text}")]
    Sleep                              200ms
    
    #Cheacking colour change on valid country code
    CSS Verification                   xpath=//div[@class="css-epgw22"]      background-color     rgba(255, 249, 222, 1)
    Take Page Screenshot               ${Tab}ValidCountryCode
    
    #Clicking Link from Note
    Wait For And Click Element         xpath=//ol[@data-testid="irnote-ul"]//a  
    
    #Verifing URL 
    URL Validation                     https://www.jio.com/selfcare/recharge/mobility/
