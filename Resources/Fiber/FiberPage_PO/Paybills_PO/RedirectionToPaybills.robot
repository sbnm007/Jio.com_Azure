*** Settings ***
Library    SeleniumLibrary
Resource    ../../../Common.robot
Variables    ../../../Common_Variables.yaml
Resource    ../../../Excel_Activity.robot

*** Keywords ***
Landing on Pay Bills Page
    #92243,92244
    Visit Jio.com And Goto                                  ${Fiber}      
    Wait For And Click Element                              ${Paybills}    
    URL Validation                                          ${Sub_NavBar_URLs[${5}]}
    Reading Data of Fiber Paybills Page from Excel
    Set Screenshot Directory                                ./Results/Fiber/PayBills_Screenshots/
    Take Page Screenshot                                    Pay_BillsPage_Loaded
