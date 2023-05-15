*** Settings ***
Resource                               ../../../Common.robot
Resource                               ../../../Excel_activity.robot
Resource                               ../../../Local_Keywords.robot

*** Keywords ***
Verify UI and content of 'Troubleshoot problems all by yourself' section and 'Facing any issue?' page
    #92478
    #Scroll to 'Troubleshoot problems all by yourself' section
    Scroll To                          xpath://div[contains(text(),"Any other issues? Explore")]
    Text Verification                  xpath://div[contains(text(),'Troubleshoot problems all by yourself')]                              ${Troubleshoot_Title}
    Take Page Screenshot                    Sc_TroubleshootProblems  
    #92479
    Verify 'troubleshoot problems' contents
    #92480
    #click on > sign
    Wait For And Click Element         xpath:(//button[@class="j-button j-button-size__small tertiary icon-primary icon-only"])[1]
    Chat-bot verification
    #92481
    #click on the link and verify video of 'jio set-top box not recieving signal'
    Wait For And Click Element         xpath:(//button[@class="j-button j-button-size__small tertiary icon-primary icon-only"])[5]
    Video Verification
    #92482
    #click on the link and verify video of 'jio set-top box remote not working'
    Wait For And Click Element         xpath:(//button[@class="j-button j-button-size__small tertiary icon-primary icon-only"])[6]
    video Verification
    Verify redirection and content of 'Facing any issue?' page

Verify 'troubleshoot problems' contents
    #verify title and subtitle
    Text Verification                  xpath://div[contains(text(),'Troubleshoot problems all by yourself')]                              ${Troubleshoot_Title}
    Text Verification                  xpath://div[contains(text(),'Resolve issues without needing assistance.')]                         ${Troubleshoot_SubTitle}
    #verify body text
    FOR    ${i}    IN RANGE    1  7
        Text Verification              xpath:(//div[@class="spacing-n-alignment"]//*[@class="j-text j-text-body-xs"])[${i}]               ${Troubleshoot_Body}[${i-1}]
        Wait For And Verify Element    xpath:(//div[@class="spacing-n-alignment"]//*[@class="j-button j-button-size__small tertiary icon-primary icon-only"])[${i}]
    END
    #button verification
    Wait For And Verify Element        xpath://div[contains(text(),"Any other issues? Explore")]

Verify redirection and content of 'Facing any issue?' page
    #92483
    #check redirection of 'Any other issues? Explore'
    Redirect and continue              xpath://div[contains(text(),"Any other issues? Explore")]    https://www.jio.com/help/troubleshoot#/    Sc_FacingAnyIssue
    check content of 'Facing any issue?' page
    
check content of 'Facing any issue?' page
    #92484
    #title and subtitle verification
    Text Verification                  xpath://h1[contains(text(),'Facing any issue? Let’s resolve now')]    ${FacingIssues_title}
    Text Verification                  xpath://p[contains(text(),'Resolve any issue related to our services without ')]    ${FacingIssues_subtitle}
    #scroll to the issues and verify
    Scroll To                          xpath:(//div[@class="j-container"])[2]
    ${k}    Set Variable    0
    FOR    ${i}    IN RANGE    1  3
        Text Verification              xpath:(//div[@class="j-container"])[${i}]//h2    ${issue_type}[${i-1}]
        ${issues}=    Get WebElements  xpath:(//div[@class="j-container"])[${i}]//a
        ${count}=     Get Length       ${issues}
        FOR    ${j}    IN RANGE    ${count}
            Text Verification          xpath:((//div[@class="j-container"])[${i}]//a)[${j+1}]    ${issue_title}[${k}]
            ${k}=    Evaluate          ${k}+1
        END
    END

    verify 'still need to discuss something?' section
    #92487
    #check redirection of 'Find a store'
    Redirection On Clicking            xpath://div[contains(text(),'Find a store')]                                                    https://www.jio.com/selfcare/locate-us/           Sc_FindAStore
    #92486
    #check redirection of 'Call us'
    Redirection On Clicking            xpath://div[contains(text(),'Call us')]                                                         https://www.jio.com/help/contact-us?tab=call#/    Sc_CallUs
    #92485
    #check chat-bot opens after clicking on 'chat with us'
    Wait For And Click Element         xpath://button[@aria-label="Chat with us inform about any query"]
    Chat-bot verification
    Go Back
    #footer verification
    Sleep    200ms
    Scroll To                          xpath://div[@id="sites-footer-container"]
    Wait For And Verify Element        xpath://div[@id="sites-footer-container"]
    #chat-bot icon verification
    Text Verification                  xpath://div[@class="widget-lagnguge-slot"]    Chat with us!
    Image Verification                 xpath://img[@class="chatbotImg open_chatbox"]