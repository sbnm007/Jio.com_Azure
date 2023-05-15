*** Settings ***
Library                                                    SeleniumLibrary
Resource                                                   ../../../Common.robot
Variables                                                  ../../../Common_Variables.yaml
Variables                                                  ../../../../Tests/Shop/Smart_Devices_Variables.yaml



*** Keywords ***
Landing on Smart Devices Page

    #To Visit Jio.com and click Shop
    Visit Jio.com And Goto                                  ${Shops}

    #Go to SmartDevices      
    Wait For And Click Element                              ${SmartDevices}  

    #Validate SmartDevices URL  
    URL Validation                                          ${NavBar_URL[${2}]}

    #Sub Navbar Underline CSS Verification 
    Wait Until Keyword Succeeds    1 min  0 min             CSS Verification           //li[@onclick="window.location.href='/shop/en-in/c/smart-devices'"]    border-bottom-color     rgba(232, 232, 252, 1)
    
    #Sets screenshot directory
    Set Screenshot Directory                                ./Results/Shop/SmartDevices_Screenshots/

    #Sets Excel Sheet Variable
    ${sheet} =    Set Variable                              Shop_SmartDevices
    Set Test Variable                                       ${sheet}

    #Takes Page Screenshot
    Take Page Screenshot                                    Smart_DevicesPage_Loaded

