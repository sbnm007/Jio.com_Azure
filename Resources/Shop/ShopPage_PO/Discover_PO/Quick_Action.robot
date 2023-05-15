*** Settings ***
Library                                SeleniumLibrary
Resource                               ../../../Common.robot
Variables                              ../../../../Tests/Shop/Discover_Variables.yaml
Resource                               ../../../../Resources/Local_Keywords.robot

*** Keywords ***

Quick Action Button Section

    # Verifying  Quick Action Section Banner
    Section Verification                xpath=//div[@class='d-flex flex-wrap justify-content-center icon-wrapper']    Quick_Action_Banner

    # Verifying Each Banner In Quick Action Section
    ${VD}  Set Variable                 1

    WHILE  ${VD} < 5
      # Checking Redirection After Clicking Each Button  Of Quick Action Section 
      # Verifying Url After Redirection & Taking Screenshot
      Redirection On Clicking           xpath=(//div[contains(@class,"relative title-max-wid")])[${VD}]   ${NavBar_URL}[${VD}]    QuickAction[${VD}]  
      Sleep                            200ms
      ${VD}=   Evaluate                ${VD} + 1
    END
