*** Settings ***
Library    SeleniumLibrary
Resource    ../../../Common.robot
Variables    ../../../Common_Variables.yaml
Variables    ../../../../Tests/Fiber/FRecharge_Variables.yaml
Resource     ../../../Excel_Activity.robot 

*** Keywords ***
Landing on Recharge Page
    Visit Jio.com and Goto                             ${Fiber}     
    Wait For And Click Element                         ${Recharge}
    URL Validation                                     ${Sub_NavBar_URLs[${4}]}
    Wait Until Keyword Succeeds    30 sec    0 sec    CSS Verification    xpath://li[@onclick="window.location.href='/selfcare/recharge/fiber/'"]    border-bottom-color    rgba(229, 247, 238, 1)
    Reading Data of Fiber Recharge Page from Excel  
    Set Screenshot Directory                           ./Results/Fiber/Recharge_Screenshots/
    Take Page Screenshot                               RechargePage_Loaded
