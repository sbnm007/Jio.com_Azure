*** Settings ***
Library                              SeleniumLibrary
Resource                            ../../../Local_Keywords.robot
Resource                            ../../../Excel_Activity.robot

*** Keywords ***
Landing on Mobile Page
    Visit Jio.com And Goto                                 ${Mobile_URL}      
    URL Validation                                         https://www.jio.com/mobile
    Set Screenshot Directory                               ./Results/Mobile/Discover_Screenshots/
    Reading Data of Discover Mobile Page from Excel 
    Take Page Screenshot                                   MobilePage_Loaded
