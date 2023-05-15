*** Settings ***
Library                              SeleniumLibrary
Resource                  ../../../../Resources/Local_Keywords.robot
Resource                  ../../../../Resources/Excel_activity.robot



*** Keywords ***
Visit Mobile Recharge Page
    Visit Jio.com And Goto                                  ${Mobile_URL}      
    URL Validation                                     https://www.jio.com/mobile
    Set Screenshot Directory                           ./Results/Mobile/Recharge_Screenshots/
    Wait For And Click Element                         xpath=//section[@class="j-container"]//a[normalize-space()="Recharge"]
    URL Validation                                     https://www.jio.com/selfcare/recharge/mobility/
    Wait Until Keyword Succeeds   5 min    1 s        CSS Verification       xpath=//li[@onclick="window.location.href='/selfcare/recharge/mobility/'"]          border-bottom     3px solid rgb(229, 247, 238)
    Reading Data of Discover Mobile Page from Excel 
    Reading Data of Fiber Recharge Page from Excel  
    Take Page Screenshot                                    Mobile_Recharge_Loaded