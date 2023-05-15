*** Settings ***
Library                            SeleniumLibrary
Resource                           ../../../Common.robot
Resource                           ../../../Excel_Activity.robot

*** Keywords ***
Landing on Locate Us Page
    #visit Support_LocateUs page
    Visit Jio.com And Goto                                ${Support}
    Wait For And Click Element                            ${NavBar[0]}
    URL Validation                                        ${Support_NavBarUrl[0]}
    #It is an issue on prod which is yet to be resolved
    Run Keyword And Continue On Failure                   CSS Verification                                      xpath://li[@onclick="window.location.href='/selfcare/locate-us'"]   border-bottom    3px solid rgba(232, 232, 252) 
    Set Screenshot Directory                              ./Results/Support/LocateUs_Screenshots/
    Reading Data of LocateUs Support Page from Excel
    Take Page Screenshot                                  LocateUsPage_Loaded
    