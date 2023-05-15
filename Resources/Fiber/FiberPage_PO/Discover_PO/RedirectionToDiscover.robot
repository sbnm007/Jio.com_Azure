*** Settings ***
Library        SeleniumLibrary
Resource       ../../../Common.robot
Variables      ../../../Common_Variables.yaml

*** Keywords ***
Landing on Fiber Discover Page
    Visit Jio.com And Goto                                  ${Fiber}    
    URL Validation                                          ${Sub_NavBar_URLs[${0}]}
    Wait Until Keyword Succeeds    30 sec    0 sec          CSS Verification    xpath:(//li[@onclick="window.location.href='/fiber'"])[2]    border-bottom-color    rgba(232, 232, 252, 1)
    Set Screenshot Directory                                ./Results/Fiber/Discover_Screenshots/
    Reading Data of Discover Page from Excel
    Take Page Screenshot                                    FiberPage_Loaded
