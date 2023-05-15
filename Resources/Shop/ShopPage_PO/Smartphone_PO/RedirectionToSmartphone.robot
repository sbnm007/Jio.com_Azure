*** Settings ***
Library                                               SeleniumLibrary
Resource                                              ../../../Common.robot
Variables                                             ../../../Common_Variables.yaml
Variables                                             ../../../../Tests/Shop/Smartphone_Variables.yaml



*** Keywords ***
Landing on Smartphone Page
    #Clicking on Shop from Top Navigation bar
    Visit Jio.com And Goto                            ${Shops}
    
    #Clicking on Smartphone from Sub Navigation bar
    Wait For And Click Element                        ${Smartphone}    
    
    #Verifying Smartphone page is open    
    URL Validation                                    ${NavBar_URL[${1}]}
    
    #Verifying Underline is present to highlight Smartphone tab
    Wait Until Keyword Succeeds    1 min  0 min       CSS Verification             //li[@onclick="window.location.href='/shop/en-in/c/smartphones'"]    border-bottom-color     rgba(232, 232, 252, 1)
    
    #Setting Folder path to save screenshots
    Set Screenshot Directory                          ./Results/Shop/Smartphone_Screenshots/
    
    #Setting Temporary Variable for Excel 
    ${sheet} =    Set Variable                        Shop_Smartphone
    Set Test Variable                                 ${sheet}

    #Taking screenshot of loaded page
    Take Page Screenshot                              SmartphonePage_Loaded
    
