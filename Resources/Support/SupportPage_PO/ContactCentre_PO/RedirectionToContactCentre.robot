*** Settings ***
Library                            SeleniumLibrary
Resource                           ../../../Common.robot
Variables                          ../../../Common_Variables.yaml
Resource                           ../../../Excel_Activity.robot

*** Keywords ***
Landing on Contact Centre Page
    Visit Jio.com And Goto                                ${Support}
    Wait For And Click Element                            ${NavBar[2]}
    URL Validation                                        ${Support_NavBarUrl[2]}
    CSS Verification                                      xpath://li[@onclick="window.location.href='/help/contact-us'"]    border-bottom-color     rgba(232, 232, 252, 1)
    Set Screenshot Directory                              ./Results/Support/ContactCentre_Screenshots/
    Reading data of Support Contact Center page from Excel
    #Take Page Screenshot                                  ContactCentrePage_Loaded