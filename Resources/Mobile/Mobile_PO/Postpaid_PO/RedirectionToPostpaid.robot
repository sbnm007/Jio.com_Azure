*** Settings ***
Library                              SeleniumLibrary
Resource                            ../../../../Resources/Local_Keywords.robot

*** Keywords ***

Landing on Postpaid Page
    #Redirection to Mobile Page
    Visit Jio.com And Goto                              ${Mobile_URL}      

    #Redirection to Postpaid Page
    Wait For And Click Element                          xpath=//nav[@parent-attr="Mobile" ]//a[@aria-label="Postpaid"]
    URL Validation                                      https://www.jio.com/selfcare/plans/mobility/postpaid-plans-home/
    
    #Setting Directory for storing Screenshot
    Set Screenshot Directory                           ./Results/Mobile/Postpaid_Screenshots/
    #Taking Data from excel for validation
    Reading Data of Postpaid Mobile Page from Excel 
    Take Page Screenshot                                    PostpaidPage_Loaded
