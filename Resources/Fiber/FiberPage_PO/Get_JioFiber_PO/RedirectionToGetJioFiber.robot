*** Settings ***
Library    SeleniumLibrary
Resource    ../../../Excel_Activity.robot
Resource    ../../../Common.robot
Variables    ../../../Common_Variables.yaml
Variables    ../../../../Tests/Fiber/Get_JioFiber_Variables.yaml

*** Keywords ***
Landing on Get JioFiber Page
    Visit Jio.com And Goto                                  ${Fiber}
    # Clicking Get JioFiber Tab
    Wait For And Click Element    ${Get_JioFiber}          
    URL Validation                                     ${Sub_NavBar_URLs[${3}]}
    Set Screenshot Directory                           ./Results/Fiber/GetJioFiber_Screenshots/
    Take Page Screenshot                                    Get_JioFiberPage_Loaded
    # Reading Data from Excel
    Reading data from Excel file for Get JioFiber Section

