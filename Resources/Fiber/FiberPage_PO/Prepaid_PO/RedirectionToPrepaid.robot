*** Settings ***
Library    SeleniumLibrary
Resource    ../../../Common.robot
Variables    ../../../Common_Variables.yaml
Variables   ../../../../Tests/Fiber/FPrepaid_Variables.yaml
Resource     ../../../Excel_Activity.robot 


*** Keywords ***
Landing on Prepaid Page
     #Visting Jio.com
    Visit Jio.com And Goto                             ${Fiber}      
    #Clicking on Prepaid Button on Navigation Bar        
    Wait For And Click Element                         ${Prepaid}
    #URL Validation of Prepaid Page
    URL Validation                                     ${Sub_NavBar_URLs}[1]
    Set Screenshot Directory                           ./Results/Fiber/Prepaid_Screenshots/
    #Reading Excel Data
    Reading Data of Prepaid Fiber Page from Excel 
    Take Page Screenshot                               PrepaidPage_Loaded
