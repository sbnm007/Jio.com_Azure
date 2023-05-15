*** Settings ***
Library    SeleniumLibrary
Resource    ../../../Common.robot
Resource    ../../../Resources/Local_Keywords.robot
Resource    ../../../Resources/Excel_Activity.robot

*** Keywords ***
Landing on Services Page
    Visit Jio.com And Goto                                  ${Fiber}
    Wait For And Click Element    ${Services}          
    URL Validation                                     ${Sub_NavBar_URLs[${6}]}
    Reading Data of Services Page from Excel 
    Set Screenshot Directory                           ./Results/Fiber/Services_Screenshots/
    Take Page Screenshot                                    ServicesPage_Loaded
    
