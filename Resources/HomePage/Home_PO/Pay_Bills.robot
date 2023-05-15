***Settings***
Library                                        SeleniumLibrary
Resource                                       ../../Local_Keywords.robot

***Keywords***
Pay Bills Popup Validation
    Open Popup                                  xpath=//a[@id="paybill"]
    Take Page Screenshot                        PayBills_Pop-up
    ${title}=   Get Text                        xpath=//h5[contains(text(),'Pay Bill')]
    Pop-Up Verification Home                    ${title}
    
    #mobile tab
    Take Page Screenshot                        ${title}
    Paybill Mobile Tab Validation               ${COCP_OR_Postpaid_Number}
    
    #Fiber Tab
    Wait For And Click Element                  xpath=//a[@aria-controls="fiber1"][@aria-selected="false"]
    Paybill Fiber Tab Validation                ${Fiber_No}
   
    #Close Popup
    Close Popup                                 xpath=//button[@data-popup-close='modal-paybill']
