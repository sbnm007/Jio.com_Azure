*** Settings ***
Library                                                 SeleniumLibrary
Resource                                                ../../../Common.robot
Variables                                               ../../../Common_Variables.yaml



*** Keywords ***
Landing on Discover Page
      
    Visit Jio.com    
    Go To                                                ${NavBar_URL[0]}
    URL Validation                                       ${NavBar_URL[${0}]}
    Wait Until Keyword Succeeds    1 min  0 min      CSS Verification                                  //li[@class='cursor-pointer active']    border-bottom-color     rgba(232, 232, 252, 1)
    Set Screenshot Directory                             ./Results/Shop/Discover_Screenshots/
    Take Page Screenshot                                 ShopPage_Loaded
