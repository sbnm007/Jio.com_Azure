*** Settings ***
Library                                                SeleniumLibrary
Resource                                               ../../../Common.robot
Variables                                              ../../../Common_Variables.yaml
Variables                                              ../../../../Tests/Shop/JioFi_Variables.yaml



*** Keywords ***
Landing on JioFi Page  
        
    Visit Jio.com    
    Go To                                              ${NavBar_URL[0]}
    URL Validation                                     ${NavBar_URL[${0}]}
    Wait For And Click Element                         ${JioFi}
    URL Validation                                     ${NavBar_URL[${3}]}
    Wait Until Keyword Succeeds    1 min  0 min        CSS Verification                                  //li[@onclick="window.location.href='/shop/en-in/c/jiofi'"]    border-bottom-color     rgba(232, 232, 252, 1)
    Set Screenshot Directory                           ./Results/Shop/JioFi_Screenshots/
    Take Page Screenshot                               JioFiPage_Loaded
    ${sheet} =    Set Variable                         Shop_JioFi
    Set Test Variable                                  ${sheet}
