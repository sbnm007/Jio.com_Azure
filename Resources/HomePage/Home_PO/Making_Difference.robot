***Settings***
Library                                SeleniumLibrary
Resource                               ../../Common.robot

***Keywords***
Making a Difference Validation
    Scroll To                                                  xpath=//section[@class='j-container bg--primary-grey-20']
    
    # Heading Text and CSS Verification
    Text Verification                                          xpath=//section[@class="j-container bg--primary-grey-20"]//h2[@class="j-contentBlock__title j-heading j-text-heading-l"]    ${Makingdiff_section[0]}
    CSS Verification                                           xpath=//section[@class="j-container bg--primary-grey-20"]//h2[@class="j-contentBlock__title j-heading j-text-heading-l"]    font-weight    900 
    
    # Subtext Text and 
    Text Verification                                          xpath=//div[@class="j-color-primary-grey-80 j-contentBlock__description j-text-body-m"][text()="Here is a handful of the many success stories."]    ${Makingdiff_section[1]}
    
    # Get the count of tiles present in 'Making A Difference' section.
    ${get_tile_cnt} =  Get Element Count  xpath=//div[contains(@class,'shadow-vertical-mg ')]

    # Content Verification for Three Tiles
    FOR  ${MakingDiff_Tiles}  IN RANGE  0     ${get_tile_cnt}
        Wait For And Verify Element                             xpath=//div[contains(@class,'shadow-vertical-mg ')][${MakingDiff_Tiles+1}]

        # Verifying the content present on banner
        Banner Content Verification                             xpath=//div[contains(@class,'shadow-vertical-mg ')][${MakingDiff_Tiles+1}]//div[@class="j-contentBlock__description j-text-body-m-bold"]   ${Makingdiff_storytext}[${MakingDiff_Tiles}]   xpath=//div[contains(@class,'shadow-vertical-mg ')][${MakingDiff_Tiles+1}]//img    xpath=//div[contains(@class,'shadow-vertical-mg ')][${MakingDiff_Tiles+1}]//button   Making difference 

        # Description Text Verification
        Wait For And Verify Element                             xpath=//div[contains(@class,'shadow-vertical-mg ')][${MakingDiff_Tiles+1}]//div[@class="j-contentBlock__description j-text-body-s j-color-primary-grey-80"]        
    END 

    Wait For And Verify Element                                 xpath=//button[normalize-space()='View all']
    # Three Tiles Redirection       
    ${j}        Set Variable   0
    FOR  ${i}  IN RANGE  0     ${get_tile_cnt}

        Redirection On Clicking                                 xpath=//div[contains(@class,'shadow-vertical-mg ')][${i+1}]//button      https://www.jio.com/jcms/jiostories/${Makingdiff_storyurl}[${i}]/  ${Makingdiff_storyurl}[${i}]_Page       
        # Success Stories page Content Verifcation
        Wait For And Click Element                              xpath=//div[contains(@class,'shadow-vertical-mg ')][${i+1}]
        # Buttons CSS Verification
        Sleep   50ms
        # JioGraphy Tag
        Wait For And Verify Element                             xpath=//span[@class='j-text j-text-body-xxs-bold']   
        # Heading
        Wait For And Verify Element                             xpath=//h2[@class="j-heading j-text-heading-l"]
        # Date
        Wait For And Verify Element                             xpath=//section[@data-testid="story-details"]//div[@class="j-text j-text-body-m"]
        # Share Icons Redirection
        WHILE   ${j}!=4
            Wait For And Verify Element                         xpath=//button[@aria-label='${Makingdiff_shareicons}[${j}]']
            Wait For And Click Element                          xpath=//button[@aria-label='${Makingdiff_shareicons}[${j}]']
            Sleep   100ms
            Log To Console                                      ${Makingdiff_storyurl}[${i}] stories for ${Makingdiff_shareicons}[${j}] Redirection Successful
            ${j}=       Evaluate     ${j} + 1
        END
        ${j}    Set Variable   0
        # Images on Success Stories Page
        ${images}=      Get WebElements                        xpath=//div[@class='video-btn-custom ']//img
        FOR  ${image}  IN  @{images}
            Image Verification    ${image}
        END
        # Text Content on Success Stories Page
        ${elements}=      Get WebElements                      xpath=//div[@class='j-color-primary-grey-80']
        FOR  ${element}  IN  @{elements}
            Wait For And Verify Element                        ${element}
        END
        # Related Stories
        Scroll To                                              xpath=//section[@class="j-container l-layout--max-width"]//h3[@class="j-heading j-text-heading-m"]
        # Related Stories Section Verification and Redirection
        Wait For And Verify Element                            xpath=//h3[normalize-space()='Related Stories']
        Wait For And Verify Element                            xpath=//body/div[@id='__next']/div/main/section[@class='j-container l-layout--full-width']/section[@class='j-container l-layout--full']/section[2]
        ${cnt}  Set Variable   1
        WHILE  ${cnt} !=4  
            Image Verification                                 xpath=//div[@class="j-card h-100 css-1tpuwfs size--xs card-vertical j-card__has-fullCardCTA no-top-padding j-card__shadow"][${cnt}]//img
            Wait For And Verify Element                        xpath=(//div[contains(text(),'Read story')])[${cnt}]
            Mouse Over                                         xpath=(//div[contains(text(),'Read story')])[${cnt}]
            ${temp}=    Get Text                               xpath=(//section[@class="j-container l-layout--max-width"]//div[@class="j-contentBlock__title"])[${cnt}]
            List Should Contain Value                          ${Makingdiff_relatedstorytext}     ${temp} 
            Wait For And Verify Element                        xpath=(//section[@class="j-container l-layout--max-width"]//div[@class="j-contentBlock__description"])[${cnt}]
            Wait For And Verify Element                        xpath=(//section[@class="j-container l-layout--max-width"]//button[@class="j-button j-button-size__medium tertiary"])[${cnt}]
            Wait For And Click Element                         xpath=(//section[@class="j-container l-layout--max-width"]//button[@class="j-button j-button-size__medium tertiary"])[${cnt}]
            Sleep   100ms
            Take Page Screenshot                               ${Makingdiff_storyurl}[${i}] Success Page_${cnt}                    
            Go Back
            ${cnt}=     Evaluate     ${cnt} + 1
        END  
        Log To Console      Success Stories Page of            ${Makingdiff_storyurl}[${i}]     Content Verified
        Go Back
    END 
