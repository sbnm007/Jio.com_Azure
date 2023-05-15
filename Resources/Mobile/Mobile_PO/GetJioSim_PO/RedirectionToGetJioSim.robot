*** Settings ***
Library                              SeleniumLibrary
Resource                            ../../../../Resources/Local_keywords.robot
Resource                            ../../../Excel_Activity.robot

*** Keywords ***
Landing on Get JioSim Page
    #Redirection to Mobile Page
    Visit Jio.com And Goto                                  ${Mobile_URL} 
    #Redirection to Get Jio SIM Page     
    Wait For And Click Element                          xpath=//a[contains(text(),'Get Jio SIM')]
    URL Validation                                      https://www.jio.com/selfcare/interest/sim/
    #Setting Directory for storing Screenshot
    Set Screenshot Directory                           ./Results/Mobile/GetJioSIM_Screenshots/
    #Taking Data from excel for validation
    Reading Data of Get Jio SIM Mobile Page from Excel 
    Take Page Screenshot                                    GetJioSimPage_Loaded