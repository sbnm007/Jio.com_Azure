*** Settings ***
Library                                               SeleniumLibrary
Resource                                              ../../../Common.robot
Variables                                             ../../../Common_Variables.yaml
Variables                                             ../../../../Tests/Shop/Accessories_Variables.yaml



*** Keywords ***
Landing on Accessories Page
    
    Visit Jio.com    
    
    #Clicking on Shop from Top Navigation bar
    Go To                                              ${NavBar_URL[0]}
    
    #Clicking on Accessories from Sub Navigation bar
    Wait For And Click Element                         ${Accessories}
    
    #Verifying Accessories page is open    
    URL Validation                                     ${NavBar_URL[${4}]}
    
    #Verifying Underline is present to highlight Accessories tab
    Wait Until Keyword Succeeds    30 sec  1 sec       CSS Verification        //li[@onclick="window.location.href='/shop/en-in/c/jioaccessories'"]    border-bottom-color     rgba(232, 232, 252, 1)
    
    #Setting Folder path to save screenshots
    Set Screenshot Directory                           ./Results/Shop/Accessories_Screenshots/
    
    #Taking screenshot of loaded page
    Take Page Screenshot                               AccessoriesPage_Loaded
    
    #Setting Temporary Variable for Excel 
    ${sheet} =    Set Variable                         Shop_Accessories
    Set Test Variable                                  ${sheet}
    
