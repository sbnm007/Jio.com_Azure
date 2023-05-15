*** Settings ***
Library                             SeleniumLibrary
Resource                  ../../../../Resources/Local_Keywords.robot
#Resource                  ../../../../Resources/Excel_Activity.robot

*** Keywords ***
Mobile View Details Section Validation
    ViewDetailsPage_UI.Validating UI and Redirection on View Details Section       ${COCP_OR_Postpaid_Number}    Mobile_Recharge      https://www.jio.com/selfcare/recharge/mobility/plans/?serviceId=${COCP_OR_Postpaid_Number}&serviceType=mobility&next=PREPAID&billingType=PREPAID      https://www.jio.com/selfcare/recharge/mobility/?serviceId=${COCP_OR_Postpaid_Number}&serviceType=mobility&next=PREPAID&billingType=PREPAID&action=edit

Validating UI and Redirection on View Details Section
   [Arguments]      ${Mobile_FiberNumber}      ${TabName}     ${PlanPageURL}    ${RechargePage_URL}  
   #Checking The Continue Button get enable and clicking it
    Enter Number and Proceed                   xpath=//input[@id="submitNumber"]      ${Mobile_FiberNumber}  xpath=//div[@style="width: 100%;"]//button[contains(text(),Continue)]      
   #Taking Screenshoot 
   Take Page Screenshot                        ${TabName} Plan page Loaded 
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
    ${NumberOfPlans} =    Get Element Count        xpath: //div[@class="css-1urkwwk"]
    Log To Console    ${NumberOfPlans}
     FOR    ${NoOfPlans}    IN RANGE    0    ${NumberOfPlans}
    #Verify Plan name
        Wait For And Verify Content                xpath: //span[normalize-space()='${NameOfPlans}[${NoOfPlans}]']    ${NameOfPlans}[${NoOfPlans}]
    #Verify Accordian function
        Wait For And Verify Element                xpath: //div[@class="css-1urkwwk"]//button[@id='${NoOfPlans}']
    END
      #Element Attribute Value Should Be        xpath=//button[@data-testid="${i}"]         aria-expanded      true   
    ${elements}=    Get WebElements            xpath=//div[@id="panel_${i}"]//div[@class="css-7h7wp6"]
    FOR  ${element}  IN  @{elements}
       #Verifing Plan Price
       Wait Until Keyword Succeeds    20sec    2sec    Wait For And Verify Element    ${element}
        IF  ${k} == ${Len}  BREAK
        IF  "${TabName}" == "Fiber_Recharge"
            View Details Popup Verification    Mobile_Recharge   xpath=(//div[@id="panel_${i}"]//button[@class="css-mnbytr"])[${k}]   xpath=//div[@class='top-head-section w-100']   xpath=//div[@class='card-popup-padding modal-body p-0']|//div[@class='modal-body p-0 card-popup-padding']    xpath=//div[@class="app-bg"]    xpath=//button[@aria-label="Close"]   ${TabName}
            CSS Verification                   xpath=//span[@class='amt-plan']    font-size    4.375rem
            Text Verification                  xpath=//div[@class='info_txt']    3 GB/DAY PACK
            Cross Button Functionality         xpath=//button[@aria-label='Close']
            Text Verification                  xpath=//div[@class='text-center title_app']    Jio Apps & other subscription
            #Verifying other subsciprtions logos in view details popup 
            FOR    ${i}    IN  RANGE    0  4
                Wait For And Verify Element    xpath=//img[@src='https://jep-asset.akamaized.net/jio/svg/app-logo/ic_jiotv.svg']
            END
        ELSE
            Scroll To                          xpath=(//div[@id="panel_${i}"]//button[@class="css-mnbytr"])[${k}]
            Sleep    3s
            View Details Popup Verification    ${TabName}   xpath=(//div[@id="panel_${i}"]//button[@class="css-mnbytr"])[${k}]   xpath=//div[@class='top-head-section w-100']   xpath=//div[@class='card-popup-padding modal-body p-0']|//div[@class='modal-body p-0 card-popup-padding']   xpath=//div[@class="app-bg"]    xpath=//button[@aria-label="Close"]  ${TabName}
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

    #Verifying terms and  conditions popup
    Wait For And Click Element                 xpath=//button[@class='css-ix7vbg']
    Text Verification                          xpath=//div[@class='css-8eadqx']        Terms and conditions
    ${Terms_&_conditions}=                     Read Excel Cell    row_num=41    col_num=3    sheet_name=Mobile_Recharge
    Cross Button Functionality                 xpath=//button[@aria-label='Close']
    Sleep        300ms

    #Clicking on edit button
    Wait For And Click Element                 xpath=//button[contains(text(),"Edit")]
    #Verifing Redirects on Recharge Main Page after clicking Edit Button
    URL Validation                             ${RechargePage_URL}
