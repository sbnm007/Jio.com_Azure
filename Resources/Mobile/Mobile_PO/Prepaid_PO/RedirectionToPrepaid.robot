*** Settings ***
Library                              SeleniumLibrary
Resource                            ../../../../Resources/Local_Keywords.robot


*** Keywords ***
Landing on Prepaid Page
    # Go to Jio.com website and clicking on mobile tab
    Visit Jio.com And Goto                               ${Mobile_URL}        
    Wait For And Click Element                          xpath=//nav[@parent-attr="Mobile" ]//a[@aria-label="Prepaid"]
    URL Validation                                      https://www.jio.com/selfcare/plans/mobility/prepaid-plans-home/
    # CSS Verification of mobile tab
    Wait Until Keyword Succeeds	    30 sec	1 sec       CSS Verification                xpath=//li[@onclick="window.location.href='/selfcare/plans/mobility/prepaid-plans-home/'"]            border-bottom-color        rgba(229, 247, 238, 1)
    Set Screenshot Directory                           ./Results/Mobile/Prepaid_Screenshots/
    Take Page Screenshot                                PrepaidPage_Loaded
