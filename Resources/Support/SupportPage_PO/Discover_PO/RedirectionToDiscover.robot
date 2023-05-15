*** Settings ***
Library                            SeleniumLibrary
Resource                           ../../../Common.robot
Variables                          ../../../Common_Variables.yaml
Resource                           ../../../Excel_Activity.robot

*** Keywords ***
Landing on Support Page
    #92457
    #visit support_discover page
    Visit Jio.com And Goto                                ${Support}
    URL Validation                                        https://www.jio.com/help/home#/
    CSS Verification                                      xpath://li[@class='cursor-pointer active']    border-bottom    3px solid rgb(232, 232, 252)
    Set Screenshot Directory                              ./Results/Support/Discover_Screenshots/
    Reading Data of Support Discover Page from Excel
    Take Page Screenshot                                  SupportPage_Loaded    
                                      