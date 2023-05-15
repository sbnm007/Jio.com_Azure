*** Settings ***
Library                                  SeleniumLibrary
Resource                                 ../../../Common.robot
Variables                                ../../../Common_Variables.yaml
Resource                                 ../../../../Resources/Excel_Activity.robot
Resource                                 ../../../../Resources/Local_Keywords.robot

*** Keywords ***
Bringing people together section visibility along with UI and redirected to GetJioFiber page
    Read Data of Bringing People Together from Excel
    
    #Scroll To To Bringing People Together Section
    Scroll To                            xpath=//div[@class="j-rich-text j-text"]//h2[@class="j-heading j-text-heading-l txt-align-center"][1]
    
    #Bringing  People Together Section Is Visible
    Text Verification                    xpath=//h3[normalize-space()='Bringing people together']    Bringing people together
    Take Element Screenshot              xpath=//div[@class="bg-linear-gradient-banner-l"]    SC_BPTVisible 
    Scroll To             xpath=//div[contains(@class,'bg-linear-gradient-banner-l')]//div[contains(@class,'align-items-sm-end')]
    
    #Section Verification
    Wait For And Verify Element          xpath=//div[contains(@class,'bg-linear-gradient-banner-l')]//div[contains(@class,'align-items-sm-end')]
    
    #Verify The Title Colour Is White
    CSS Verification                     xpath=//h3[normalize-space()='Bringing people together']    color    rgba(255, 255, 255, 1)
    
    #Verify Title Of The Section
    Element Text Should Be               xpath=//h3[normalize-space()='Bringing people together']    ${Bringing_people_together}
    
    #Verify The Subtext Of The Section
    Element Text Should Be               xpath=//div[normalize-space()='Now stay connected with your loved ones anytime, anywhere.']    ${Now_Stay_connected}
    
    #Verify The Colour Of The Button
    CSS Verification                     xpath=//button[normalize-space()='Get JioFiber']    background-color    rgba(17, 68, 228, 1)
    
    #Verify The Redirection After Clicking On The Button
    Redirection On Clicking        xpath=//button[@class="j-button j-button-size__small flex-grow-0 primary j-button j-button-size__medium primary flex-grow-0 w-auto"]     https://www.jio.com/selfcare/interest/fiber/?nav=g    getjioberscreenshot    





    
