*** Settings ***
Library    SeleniumLibrary
Resource    ../../../Common.robot
Resource    ../../../Excel_Activity.robot
Variables    ../../../Common_Variables.yaml
Variables    ../../../../Tests/Fiber/FPostpaid_Variables.yaml

*** Keywords ***
Landing on Postpaid Page
    Visit Jio.com And Goto                                  ${Fiber}
    Run Keyword And Return Status  Wait For And Click Element  locator=//div[contains(@class,"ads")]//*[name()="svg"]       
    Wait For And Click Element                              ${Postpaid}    
    URL Validation                                          ${Sub_NavBar_URLs[${2}]}
    Wait Until Keyword Succeeds    30 sec    0 sec    CSS Verification    xpath://li[@onclick="window.location.href='/selfcare/plans/fiber/fiber-postpaid-plans-home/'"]    border-bottom-color    rgba(229, 247, 238, 1)
    Reading Data of Postpaid Page from Excel 
    Set Screenshot Directory                                ./Results/Fiber/Postpaid_Screenshots/
    Take Page Screenshot                                     PostpaidPage_Loaded
    
