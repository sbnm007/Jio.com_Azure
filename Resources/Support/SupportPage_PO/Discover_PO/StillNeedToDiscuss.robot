*** Settings ***
Resource                           ../../../Common.robot
Resource                           ../../../Excel_activity.robot
Variables                          ../../../../Tests/Support/Discover_Variables.yaml

*** Keywords ***
Redirection, UI and Content of 'Still need to discuss something?' section verification
    #92453
    #Still need to discuss something? section verification
    Scroll To                                   ${stillneed_section}
    Section Verification                        ${stillneed_section}                  ${stillneed_text[0]}
    #Heading of 'Still need to discuss something?'
    Text Verification                           xpath://h2[normalize-space()='Still need to discuss something?']                            ${stillneed_text[0]}
    #Subtext under Heading
    Text Verification                           xpath://div[@class='j-contentBlock__description j-text-body-m j-color-primary-grey-80']     ${stillneed_text[1]}
    #92454 to 92456
    #Text and Redirection Verification of Three buttons
    FOR    ${i}    IN RANGE    1   4
        #Element Verification of Buttons
        Wait For And verify Element             (${stillneed_buttons_xpath})[${i}]
        #TExt Verification of Buttons
        Text Verification                       (${stillneed_buttons_xpath})[${i}]    ${stillneed_buttons_text}[${i-1}]
        #Click on every button
        wait for and Click Element              (${stillneed_buttons_xpath})[${i}] 
        IF  ${i} == 1
            Sleep    1s
            #Cross button of popup
            Wait For And Click Element          xpath://img[@src="https://jep-asset.akamaized.net/jiostaticresources/chat/revamp/chatbot/icon-close.svg"]
            URL Validation                      ${stillneed_urls}[${i-1}]
            Take Page Screenshot                     ${stillneed_buttons_text}[${i-1}]
        ELSE
            URL Validation                      ${stillneed_urls}[${i-1}]
            Take Page Screenshot                     ${stillneed_buttons_text}[${i-1}]
            Go Back
        END           
    END   

"Find a Store" is Redirecting To The Relevant Page Verification
    #Scroll To to "Still need to discuss something" section
    Scroll To                                 xpath:(//span[@class="l-breakpoint--desktop sp--huge pd--top j-Space__vertical j-Space"])[7]
    Sleep    1s
    #Redirection to Find a Store from Still need to discuss something section
    Redirection On Clicking                     xpath:(//div[normalize-space()='Find a store'])[1]    ${LocateUsURL}    Sc_LocateUs