*** Settings ***
Resource                               ../../../Common.robot
Resource                               ../../../Excel_activity.robot
Resource                               ../../../Local_Keywords.robot
Variables                              ../../../../Tests/Support/Discover_Variables.yaml

*** Keywords ***
Verify the UI and contents of 'watch, learn and resolve' section and 'Top Helpful Videos' page
    #92488
    #scroll to 'watch, learn and resolve' section
    Scroll To                                xpath://section[@id='videolinks']    
    #verify title and subtitle
    Text Verification                        xpath://div[contains(text(),'Watch, learn, and resolve your issues')]                 ${Title2}
    Text Verification                        xpath://div[contains(text(),'Check tutorial videos for step-by-step guidance.')]      ${SubTitle2}
    #verify the video options under the section
    FOR    ${i}    IN RANGE    1  4
        Wait For And Verify Element          xpath:(//section[@id="videolinks"]//div[@class="position-relative card-media-hover l-radius--large yt-img"])[${i}]
        Text Verification                    xpath:(//section[@id="videolinks"]//h3)[${i}]                                         ${Video_Title}[${i-1}]
        Wait For And Click Element           xpath:(//section[@id="videolinks"]//div[@data-popup-open="modal-video-custom"])[${i}]
        #92489/92490
        check videos are playable and user can pause and close video
    END
    Wait For And Verify Element              xpath://div[contains(text(),'View more how-to videos')]
    #92491-92493
    Verify redirection, UI and content of 'Top Helpful Videos' page

check videos are playable and user can pause and close video
    Sleep    1s
    #check video is playable
    Wait Until Element Is Visible            xpath://video[@id='videoCustom']
    Element Attribute Value Should Be        xpath://video[@id='videoCustom']    autoplay    true
    #pause video
    Wait For And Click Element               xpath://video[@id='videoCustom']
    #close video
    Wait For And Click Element               xpath://button[@class="j-button j-button-size__small tertiary icon-primary icon-only video-btn-close-custom"]

Verify redirection, UI and content of 'Top Helpful Videos' page
    #92491
    #check redirection of 'View more how-to videos'
    Redirect and continue                    xpath://div[contains(text(),'View more how-to videos')]    https://www.jio.com/help/watch-and-learn    Sc_ViewMoreVideos
    #92492-92493
    check contents and video functionality of 'Top Helpful Videos' page

check contents and video functionality of 'Top Helpful Videos' page
    #Title verification
    Text Verification                        xpath://h1[contains(text(),'Top helpful videos')]                                     Top helpful videos
    #verify language change menu
    Wait For And Verify Element              xpath://button[@class="w-100 j-button j-button-size__medium secondary icon-primary icon-primary-inline displayLang"]
    ${i}    Set Variable    0
    ${NavBar}=    Get WebElements            xpath://li[@class="tab-item list__item"]
    FOR    ${Element}    IN    @{NavBar}
        Scroll To                            ${Element}
        #verify navbar elements
        Wait For And Verify Content          ${Element}                                                                            ${TopHelpfulVideos_NavBar}[${i}]
        #click on element in navbar
        Wait For And Click Element           ${Element}
        #verify select category section
        Text Verification                    xpath://h2[contains(text(),'Select Category')]                                        Select Category
        Wait For And Verify Element          xpath://div[@class="sidebar_filter_inner"]
        Sleep    5s
        #get categories for the navbar option selected
        ${categories}=    Get WebElements    xpath://div[@class="sidebar_filter_inner"]//a[@class="j-text-list-title"]
        FOR    ${category}    IN    @{categories}
            Scroll To    ${category}
            #select category
            Wait For And Click Element       ${category}
            Sleep    1500ms
            #get videos in the selected category
            ${videos}=    Get WebElements    xpath://div[@data-popup-open="modal-video-custom"]
            FOR    ${video}    IN    @{videos}
                #click on video and verify
                Scroll To                    ${video}
                Wait For And Click Element   ${video}
                video Verification
                Sleep    100ms
            END
            Sleep    200ms
        END
        ${i}=    Evaluate    ${i}+1
    END

