*** Settings ***
Resource                           ../../../Excel_activity.robot
Resource                           ../../../Common.robot
Resource                           ../../../Local_Keywords.robot
Variables                          ../../../../Tests/Support/Discover_Variables.yaml

*** Keywords ***
UI and content of Helpful Tips section verification
    #92446
    #section verification of Helpful Tips
    Scroll To                                 ${helpfultips_section}
    Section Verification                      ${helpfultips_section}     ${helpfultips_texts[0]}
    #Helpful Tips Heading Verification
    Wait For And Verify Element               ${helpfultips_header}    
    Text Verification                         ${helpfultips_header}      ${helpfultips_texts[0]}
    #92447
    #clicking on every tip  and validating redirection
    ${j}  Set Variable   0
    FOR  ${i}  IN RANGE  1  4 
        Page Should Contain Element           (${helpfultips_tips})[${i}]
        Click Element                         (${helpfultips_tips})[${i}]
        URL Validation                        ${helpfultips_urls}[${j}]
        Take Page Screenshot                  ${helpfultips_scname}[${j}]
        ${j}=   Evaluate     ${j} + 1
        Go Back
    END
    #view more helpful tips button verification
    Wait For And Verify Element               ${helpfultips_viewmore}
    Text Verification                         ${helpfultips_viewmore}    ${helpfultips_texts[1]}
    #92448
    #View more helpful tips redirection check
    Redirection On Clicking                   ${helpfultips_viewmore}    ${helpfultips_urls[3]}     viewmorehelpfultips 

Scroll down to Helpful Tips Section Check Redirection and UI verification
    #Scrolling down to Helpful Tips section
    Scroll To                                 xpath://button[normalize-space()='View more helpful tips']
    Wait For And Verify Element               xpath=//button[normalize-space()='View more helpful tips']
    #Check redirection of View More Helpful Tips   
    Redirect and continue                     xpath=//button[normalize-space()='View more helpful tips']    ${HelfulTipsURL[0]}    Sc_HelpfulTips
    #Check onclicking view more helpful videos user is redirected to Jio Helpful Tips Page  
    #Title & SubTitle
    Wait For And Verify Content               xpath://h1[contains(text(),'Jio helpful tips')]     ${JioHelpfulTips1[0]}
    Wait For And Verify Content               xpath://p[contains(text(),'Mobile users can track and manage mobile data usage.')]      ${JioHelpfulTips1[1]} 
    Check UI
     
#Check UI Of Helpful Tips Page 
Check UI   
    FOR    ${i}    IN RANGE   1    9  
        #Scroll to Every Element and Check whether 
        Sleep    3s
        Scroll To                             xpath:(//div[@class="card_visible_list"])[${i}]
        Sleep    200ms
        Wait For And Click Element            xpath:(//div[@class="card_visible_list"])[${i}]
        Redirection Of Helpful Tips    ${i}     
    END

Check UI and Contents of Helpful Tips Page
    [Arguments]    ${j}
    #Title Content Verification
    Text Verification                         xpath://h1[@class="j-contentBlock__title j-heading j-text-heading-l"]   ${JioHelpfulTips3}[${j-1}]
    #Verifying Image of Each Page
    Image Verification                        xpath://img[@class="w-100"]
    #Verifying whole Body Content
    Scroll To                                 xpath://div[@class='content-information-wrapper my-3 p-0']
    Text Verification                         xpath://div[@class='content-information-wrapper my-3 p-0']   ${TextVerify${j}}
    #Verifying Related Helpful Tips
    Wait For And Verify Element               xpath:(//section[@class="j-container "])[2]

Redirection Of Helpful Tips
    [Arguments]    ${j}
    #Validating URL of every Page of Helpful Tips
    URL Validation        ${WebPageURL}
    Take Page Screenshot       Sc_HelpfulTip${j}
    #Verifying contents of Every Helpful Tip Page
    Check UI and Contents of Helpful Tips Page    ${j}
    Go Back