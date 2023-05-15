*** Settings ***
Library                              SeleniumLibrary
Resource                  ../../../../Resources/Local_Keywords.robot
Variables                 ../../../../Tests/Mobile/MRecharge_Variables.yaml

*** Keywords ***
MR-International Roaming Section Verification
    International Roaming Section Verification    ${COCP_OR_Postpaid_Number}    Mobile
    
International Roaming Section Verification
    [Arguments]       ${Mobile_FiberNumber}      ${Tab}
    Enter Number and Proceed           xpath=//input[@id="submitNumber"]      ${Mobile_FiberNumber}  xpath=//div[@style="width: 100%;"]//button[contains(text(),Continue)]      
    Wait For And Click Element         xpath=//button[contains(text(),"International Roaming")]
    
    #Clicking Select Country Button
    Wait For And Click Element         xpath=//button[@class="css-pdug2v e1atwwch0"]
    #Content verification
    Text Verification                  xpath=//div[@class="css-3sw68w"]  Select one or more countries
    Wait For And Verify Element        xpath=//input[@class="css-sscivj"]
    Wait For And Verify Element        xpath=//div[@class="simplebar-content-wrapper"]
    
    #Select more than 10 countries from filter 
    FOR    ${CountryNo}    IN RANGE    1    12    
        Wait For And Click Element                 xpath: (//button[@role="checkbox"])[${CountryNo}]        
    END
    #User gets toast with message, "Max 10 countries can be selected"
    Wait For And Verify Content                    xpath: //div[@data-testid="toast"]//span    ${IRPlanHeading}[${4}]
    #Verify cross button in toast
    Wait For And Verify Element                    xpath: //div[@data-testid="toast"]//button[@aria-label="close"]
    #Take Page Screenshot                           MobilePage_IRPlanToast
    
    #Reset Button
    Wait For And Click Element         xpath=//button[@class="css-gysg24"]
    
    #Invalid counrty text verification
    Wait For And Input Text            xpath=//input[@type="search"]            ${IncorrectSearchText}
    
    #Error Text
    #Text Verification                  xpath=//div[@class="css-1ytf4sz"]        We searched far and wide and couldn't find what you were looking for. Try something else.
    #Take Page Screenshot               ${Tab} Error Text
    
    #Clicking Cross Button in Search bar
    Wait For And Click Element         xpath=//button[@class="css-w55tvj"]
    Wait For And Verify Element        xpath=//div[@class="css-z3461j"]//input[@value=""]
    
    #Valid country text verification
    Wait For And Input Text            xpath=//input[@type="search"]            ${CorrectSearchText1}
    ${elements}=    Get WebElements    xpath=//div[@class="css-1f16dmn"]
    FOR  ${element}  IN  @{elements}
         ${text}=    Take Element Text   ${element}
         ${Temp}=    Convert To Upper Case    ${CorrectSearchText1}
         Wait For And Verify Content          ${element}   ${Temp}
    END
    ${Country_Name}=  Take Element Text     ${elements}[0]
    Wait For And Click Element     ${elements}[0]
    
    #Submit Button
    Wait For And Click Element         xpath=//button[@class="css-1gjv8nm"]
    
    #Verifying UI elements on IR Plan page
    #Showing Results for selected country Text
    Wait For And Verify Element        xpath=//div[@class="css-mr3dze"]
    #Select country filter with Red dot
    Wait For And Verify Element        xpath=//button[@class="css-tw4jmn"]
    
    #Checking count of accordions for UAE and other countries
    ${elements}=    Get WebElements    xpath=//button[@class="css-1o7wblt"]
    FOR  ${element}  IN  @{elements}
        Wait For And Verify Element     ${element}
    END
    IF        "${Country_Name}" == "UNITED ARAB EMIRATES"
        FOR  ${i}  IN RANGE  0  3
            IF  ${i} == 0
                #Verifing Top Trending DropDown all ready expanded
                Wait For And Verify Element       xpath=//button[@class="css-1o7wblt"][@id="${i}"][@aria-expanded="true"]
                ${elements}=    Get WebElements   xpath=//div[@data-testid="body_${i}"]//div[@class="css-c5ddfs"]
                Take Page Screenshot              ${Tab} Accordian function${i}
                FOR  ${element}  IN  @{elements}
                #Verifing Plan Price
                Wait For And Verify Element  ${element}
                END
            ELSE
                #Clicking Plan Name and verifing details
                Sleep   200ms
                
                #Clicking Plans Name with accordian
                Wait For And Click Element        xpath=//button[@class="css-1o7wblt"][@id="${i}"][@aria-expanded="false"]
                
                #Verifing Plan Dropdown gets Expanded
                Wait For And Verify Element       xpath=//button[@class="css-1o7wblt"][@id="${i}"][@aria-expanded="true"]
                ${elements}=    Get WebElements   xpath=//div[@data-testid="body_${i}"]//div[@class="css-c5ddfs"]
                FOR  ${element}  IN  @{elements}
                
                #Verifing Plan Price
                    Wait For And Verify Element  ${element}
                END
                Take Page Screenshot              ${Tab} Accordian function${i}
            END
        END
    ELSE
        FOR  ${i}  IN RANGE  0  2
            IF  ${i} == 0
                #Verifing Top Trending DropDown all ready expanded
                Wait For And Verify Element       xpath=//button[@class="css-1o7wblt"][@id="${i}"][@aria-expanded="true"]
                ${elements}=    Get WebElements   xpath=//div[@data-testid="body_${i}"]//div[@class="css-c5ddfs"]
                Take Page Screenshot              ${Tab} Accordian function${i}
                FOR  ${element}  IN  @{elements}
                #Verifing Plan Price
                Wait For And Verify Element       ${element}
                END
            ELSE
                #Clicking Plan Name and verifing details
                Sleep   200ms
                #Clicking Plans Name with accordian
                Wait For And Click Element        xpath=//button[@class="css-1o7wblt"][@id="${i}"][@aria-expanded="false"]
                #Verifing Plan Dropdown gets Expanded
                Wait For And Verify Element       xpath=//button[@class="css-1o7wblt"][@id="${i}"][@aria-expanded="true"]
                ${elements}=    Get WebElements   xpath=//div[@data-testid="body_${i}"]//div[@class="css-c5ddfs"]
                FOR  ${element}  IN  @{elements}
                #Verifing Plan Price
                    Wait For And Verify Element   ${element}
                END 
                Take Page Screenshot              ${Tab} Accordian function${i}
            END
        END
    END
    #Pay Go rates
    Wait For And Verify Content                   xpath=//h3[@class="css-gayesv"]     Standard PayGo Rates
    Wait For And Verify Content                   xpath=//div[@class="css-ajea5t"]    United Arab Emirates
    #Note Section
    Wait For And Verify Element                   xpath=//div[@class="css-1i0w6zo"]
    #Hyperlinks
    Wait For And Verify Element                   xpath=//div[@class="css-1kajklu"]
    #Two Terms and conditions hyperlinks Text verification
    ${NoOfHyperlinks}=    Get Element Count       xpath: //button[@class="css-ix7vbg"]
    ${j}=    Set variable    5    
    FOR    ${i}    IN RANGE    1    ${NoOfHyperlinks}+1
        Text Verification                         xpath: //button[@class="css-ix7vbg"][${i}]    ${IRPlanNote}[${j}]
        ${j}=    Evaluate    ${j} + 1
    END
