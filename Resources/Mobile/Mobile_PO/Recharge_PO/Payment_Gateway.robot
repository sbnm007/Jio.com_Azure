*** Settings ***
Library                             SeleniumLibrary
Resource                  ../../../../Resources/Local_Keywords.robot

***Variables***
#${RechargeAmmount}=     2999

***Keywords***
MR-Payment Gateway Page Verification 
    Payment Gateway Page Verification   ${COCP_OR_Postpaid_Number}    mobility     999
    Sleep  200ms
    Go To                               https://www.jio.com/selfcare/recharge/mobility/
    Sleep  200ms
    Wait For And Click Element          xpath=//span//div[contains(text(),'JioFiber')]
    Payment Gateway Page Verification   ${Fiber_No}     fiber       4788

Payment Gateway Page Verification
    [Arguments]       ${Mobile_FiberNumber}      ${Tab}      ${RechargeAmmount}

    #Checking Continue Button is Enable and Clicking it
    Enter Number and Proceed            xpath=//input[@id="submitNumber"]      ${Mobile_FiberNumber}  xpath=//div[@style="width: 100%;"]//button[contains(text(),Continue)]      

     #Clicking Buy Button on 
     Wait For And Click Element         xpath=//div[@id='panel_0']//button[@type='button'][normalize-space()='Buy']
      
    #Clicking Go Back Button and Checking Redirection
    Scroll To                           xpath=//div[@class="css-1h94jvj"]
    Wait For And Click Element          xpath=//div[@class="css-1h94jvj"]

    #Verifing URL
    URL Validation                      https://www.jio.com/selfcare/recharge/${Tab}/plans/?serviceId=${Mobile_FiberNumber}&serviceType=${Tab}&next=PREPAID&billingType=PREPAID
