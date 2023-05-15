*** Settings ***
Resource                            ../../Resources/Common.robot
Resource                            ../../Resources/Local_keywords.robot
Resource                            ../../Resources/Mobile/Mobile_GetJioSIM.robot
#Variables                           variable.yaml
Resource                            ../../Resources/Tags.robot
Suite Setup                         Mobile Get Jio Sim Tag Activity
Test Setup                          Begin Web Test
Test Teardown                       End Web Test


*** Test Cases ***
Confirm user is redirected to 'Get Jio SIM' page on clicking 'Get Jio SIM' tab on the 2nd Navbar
    [Documentation]  TC01
    [Tags]    ${TC01-MGetJioSIM}    TC01-MGetJioSIM        Sanity
    Visit Get JioSim page of Jio.com
    
Confirm the UI elements and Content and Functionality of 'Get Jio SIM' page
    [Documentation]  TC02 To TC36    #(28-36 partially Automated)
    [Tags]    ${TC02-MGetJioSIM}    TC02-MGetJioSIM    Sanity
    Visit Get JioSim page of Jio.com
    Get JioSim Page Validation

Confirm the functionality of all accordion in FAQs section
    [Documentation]  TC37 & TC38
    [Tags]    ${TC37-MGetJioSim}    TC37-MGetJioSIM
    Visit Get JioSim page of Jio.com
    FAQ Section Validation

 


  #robot -d Results/Mobile_Results/GetJioSIM_Results -i TC02-MGetJioSIM Tests/Mobile_page/GetJioSIM/main.robot

