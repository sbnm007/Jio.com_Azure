*** Settings ***
Library                              SeleniumLibrary
Resource                             ../../Common.robot
Resource                             ../../Local_Keywords.robot

*** Keywords ***
Landing on Apps Page 
        Visit Jio.com And Goto                                                  ${Apps}
        Set Screenshot Directory                                ./Results/Apps/Apps_Screenshots/
        #Checking CSS of top apps page header
        Run Keyword And Continue On Failure         Wait Until Keyword Succeeds    30 sec  1 sec      CSS Verification     ${Apps}    text-decoration     underline solid rgb(255, 255, 255)
        Take Page Screenshot                                                    Apps_MainPage

Apps Homepage UI verification
    Main Banner Verification
    MyJio Section Verification
    Entertainment Section Verification
    Shopping Section Verification
    Partner Section Verification
    Health Section Verification
    Communication Section Verification
    Smart Home Section Verification
    Utility Section Verification
 
Verify Page Loaded
        [Arguments]                             ${str}
        TRY
                Sleep  300ms
                Wait Until Page Contains        ${str}
        EXCEPT
            Reload Page
            Sleep  300ms
            Wait Until Page Contains            ${str}
        END

# Home Page Sections

Main Banner Verification
    Image Verification                  xpath=//img[@src='https://jep-asset.akamaized.net/cms/assets/jioapps/landing-page/app-page-banner-27-3-23.webp']
    Text Verification                   xpath=//h2[@class='j-heading j-text-heading-l']                                              Building your digital world 

Section Banner Verification
    Image Verification                  xpath=//img[@src='https://jep-asset.akamaized.net/cms/assets/jioapps/landing-page/apps-desktop.png']
    Logo Verification                   xpath=//img[@src='https://jep-asset.akamaized.net/jio/svg/logo/myjio-n.svg']
    Text Verification                   xpath=//h6[@class="j-heading j-text-heading-xxs"]                                            MyJio
    Text Verification                   xpath=//h3[@class="j-heading j-text-heading-m"]                                              Here's how India got a first taste of a super app
    Text Verification                   xpath=//div[@class="j-contentBlock__description"]//div[@class="j-text j-text-body-m"]        Shop, stream, pay, and do more.                                                                                                                  

MyJio Section Verification
    Section Verification                xpath=//div[@class="css-1viv00l"]    MyJio_Section
    Take Page Screenshot                MyJio_Section

Entertainment Section Verification
    Text Verification                   xpath=//h3[contains(text(),'Entertainment')]                           Entertainment
    Section Verification                xpath=(//section[@class="css-w0nq0z j-container"])[1]                  Entertainment_Section
    Take Page Screenshot                Entertainment_Section

Shopping Section Verification
    Text Verification                   xpath=//h3[contains(text(),'Shopping')]                                Shopping
    Section Verification                xpath=(//section[@class="css-w0nq0z j-container"])[2]                  Shopping_Section
    Take Page Screenshot                Shopping_Section

Partner Section Verification
    Text Verification                   xpath=//h3[contains(text(),'Partner')]                                 Partner
    Section Verification                xpath=(//section[@class="css-w0nq0z j-container"])[3]                  Partner_Section
    Take Page Screenshot                Partner_Section

Health Section Verification
    Text Verification                   xpath=//h3[contains(text(),'Health')]                                  Health
    Section Verification                xpath=(//section[@class="css-w0nq0z j-container"])[4]                  Health_Section
    Take Page Screenshot                Health_Section

Communication Section Verification
    Text Verification                   xpath=//h3[contains(text(),'Communication')]                           Communication
    Section Verification                xpath=(//section[@class="css-w0nq0z j-container"])[5]                  Communication_Section
    Take Page Screenshot                Communication_Section

Smart Home Section Verification
    Text Verification                   xpath=//h3[contains(text(),'Smart Home')]                              Smart Home
    Section Verification                xpath=(//section[@class="css-w0nq0z j-container"])[6]                  Smart_Home_Section
    Take Page Screenshot                Smart_Home_Section

Utility Section Verification
    Text Verification                   xpath=//h3[contains(text(),'Utility')]                                 Utility
    Section Verification                xpath=(//section[@class="css-w0nq0z j-container"])[7]                  Utility_Section
    Take Page Screenshot                Utility_Section

