*** Settings ***
Library                   SeleniumLibrary
Resource                  ../../../../Resources/Local_Keywords.robot

***Keywords***
MRecharge Page UI Verification
   #Clicking on Mobile and Verifing UI
   Wait For And Click Element          xpath=//span//div[contains(text(),'Mobile')]
   Recharge_Page_UI.Tab UI Verification                 MobileTab_Recharge      xpath=//img[@alt="Jio Recharge Online"]
   Cross Button Functionality          xpath=//span[@class="input-icon input-icon-suffix clickable"]


#Clicking on Mobile and Verifing UI
Tab UI Verification
   [Arguments]    ${SC-Name}     ${Img_locater}
   #Verify background color of tab is Blue
   CSS Verification                    xpath: //span[@class="switcher"]    background-color     rgba(15, 60, 201, 1)

   #Rupee Symbol Verification
   Wait For And Verify Element         xpath=(//span[@class="j-icon j-icon__bg"])[1]   
   
   #Recharge Text verification
   Text Verification                   xpath=//h1[@class="j-text j-text-heading-xs"]       Recharge
   
   #Subtitle verification
   Text Verification                   xpath=//h2[@class="txt-align--center j-text j-text-body-xs"]     Enter your details to find the best prepaid plans.
   
   #Tab Switcher Verification
   Wait For And Verify Element         xpath=//div[@class="jds_toggle__mrH_E j-selectors"]
   
   #Input Field Verification
   Wait For And Verify Element         xpath=//input[@id="submitNumber"]
   
   #continue Button gray verification
   Wait For And Verify Element         xpath=//button[@class="j-button j-button-size__medium primary disabled"]
   CSS Verification                    xpath=//button[@class="j-button j-button-size__medium primary disabled"]    background-color    rgba(10, 40, 133, 1) 
   
   #Using Jio Link Recharge verification
   Wait For And Verify Element         xpath=//div[@style="display: flex; align-items: center; width: 100%;"]
   
   #Capturing Page Screenshot
   Take Page Screenshot                ${SC-Name}
   
   #Image Verification of Recharge Page
   Image Verification                  ${Img_locater}  
   
   #Checking For Invalid Number Text
   Check Continue Button Enabled       xpath=//input[@id="submitNumber"]           xpath=//div[@style="width: 100%;"]//button[contains(text(),Continue)]     ${Incorrect_No1}
   CSS Verification                    xpath=//button[@class="j-button j-button-size__medium primary disabled"]    background-color    rgba(10, 40, 133, 1)
   Wait For And Click Element          xpath=//div[@style="width: 100%;"]//button[contains(text(),Continue)]
   
   #Invalid Error Text Verification
   Text Verification                   xpath=//div[@class="field-error"]                  The number you have entered is not a Jio number. Please enter a Jio number and try again.
   Mobile Recharge Plan Page Validation
   
Mobile Recharge Plan Page Validation
    Validating UI and Redirection on Recharge Plan Page       ${COCP_OR_Postpaid_Number}    Mobile_Recharge      https://www.jio.com/selfcare/recharge/mobility/plans/?serviceId=${COCP_OR_Postpaid_Number}&serviceType=mobility&next=PREPAID&billingType=PREPAID      https://www.jio.com/selfcare/recharge/mobility/?serviceId=${COCP_OR_Postpaid_Number}&serviceType=mobility&next=PREPAID&billingType=PREPAID&action=edit

Validating UI and Redirection on Recharge Plan Page
   [Arguments]      ${Mobile_FiberNumber}      ${TabName}     ${PlanPageURL}    ${RechargePage_URL}
   
   #Checking The Continue Button get enable and clicking it
   Enter Number and Proceed           xpath=//input[@id="submitNumber"]      ${Mobile_FiberNumber}  xpath=//div[@style="width: 100%;"]//button[contains(text(),Continue)]      
   
   #Taking Screenshoot 
   Take Page Screenshot               ${TabName} Plan page Loaded 
   
   #Validating URL of Recharge page
   URL Validation                     ${PlanPageURL}
   
   #Cheacking Select plan Section
   Wait For And Verify Element        xpath=//h1[@class="css-1b0kdeo"] 
   
   #Verifing Mobile Number Entered
   Wait For And Verify Element        xpath=//input[@value="${Mobile_FiberNumber}"]        
   
   #Verifing Edit Button
   Wait For And Verify Element        xpath=//div[@class="css-1tj09tu"]
   
   #Verifing all Plans Section
   ${elements}=    Get WebElements    xpath=//div[@class="css-2bjzdr"]//button
   FOR  ${element}  IN  @{elements}
       Wait For And Verify Element    ${element} 
   END
   Take Page Screenshot               ${TabName} Plan List 
   
   #Verifing Plan Name with Accordian function
   ${elements}=    Get WebElements    xpath=//button[@class="css-1o7wblt"]
   FOR  ${element}  IN  @{elements}
       Wait For And Verify Element    ${element} 
   END
   FOR  ${i}  IN RANGE    0  1
    
    #Clicking Name with Accordian function
      IF  ${i} == 0
          #verifing Top Trending DropDown all ready expanded
          Wait For And Verify Element       xpath=//button[@data-testid="${i}"][@aria-expanded="true"]
          ${elements}=    Get WebElements   xpath=//div[@id="panel_${i}"]//div[@class="css-ckqy8f"]
          Take Page Screenshot              ${TabName} Accordian function${i}
          FOR  ${element}  IN  @{elements}
          #Verifing Plan Price
          Wait For And Verify Element       ${element}
          END
      ELSE
      
          #Clicking Plan Name and verifying details
          Sleep   200ms
          
          #Clicking Plans Name with accordian
          Wait For And Click Element        xpath=//button[@data-testid="${i}"][@aria-expanded="false"]
          
          #Verifing Plan Dropdown gets Expanded
          Wait For And Verify Element       xpath=//button[@data-testid="${i}"][@aria-expanded="true"]
          ${elements}=    Get WebElements   xpath=//div[@id="panel_${i}"]//div[@class="css-ckqy8f"]
          FOR  ${element}  IN  @{elements}
          
          #Verifing Plan Price
            Wait For And Verify Element     ${element}
          END
          ${i}=   Evaluate     ${i} + 1 
          Take Page Screenshot              ${TabName} Accordian function${i}
       END
    END
    
    #Clicking Edit Button
    Scroll To                               xpath=//button[contains(text(),"Edit")]
    
    Wait For And Click Element              xpath=//button[contains(text(),"Edit")]
    #Verifing Redirects on Recharge Main Page after clicking Edit Button
    URL Validation                          ${RechargePage_URL}


