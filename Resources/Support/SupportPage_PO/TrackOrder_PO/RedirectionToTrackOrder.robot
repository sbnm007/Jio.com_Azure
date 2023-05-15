*** Settings ***
Library                            SeleniumLibrary
Resource                           ../../../Common.robot
Resource                           ../../../Excel_Activity.robot


*** Keywords ***
#92624 
Landing on Track Order Page   
    Visit Jio.com And Goto                                ${Support}
    Wait For And Click Element                            ${NavBar[1]}
    URL Validation                                        ${Support_NavBarUrl[1]}
    CSS Verification                                      xpath://li[@onclick="window.location.href='/en-in/track-order'"]    border-bottom-color    rgba(232, 232, 252, 1)
    Set Screenshot Directory                              ./Results/Support/TrackOrder_Screenshots/
    Reading Data of Support Track Order Page from Excel
    Take Page Screenshot                                  TrackOrderPage_Loaded