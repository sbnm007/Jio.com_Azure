*** Settings ***
Library                              SeleniumLibrary
Library                              Dialogs
Resource                            ../../../../Resources/Local_keywords.robot 
Resource                            ../../../../Resources/Common.robot
Resource                            ../../../Excel_Activity.robot

*** Keywords ***

Search Menu UI and Functionality   

    #Verify Search bar is present           #TC12
    Wait For And Verify Element         xpath=//input[contains(@onclick,"Search")]  

    #Click on search bar                    #TC13
    Wait For And Click element         xpath=//input[contains(@onclick,"Search")]

    # Search menu expanded    
    Wait For And Verify Element        xpath=//aside[@id="searchMain"][@style="display: block;"]

# Search Menu UI verification         TC14    
    #Back button
    Wait For And Verify Element        xpath=//span[@class="input-icon clickable input-icon-prefix j-icon"]
    
    #Input field place holder
    Wait For And Verify Element        xpath=//div[contains(@class,'pkv-searchview')]//input[@placeholder="Search"]
    
    # Quick links
    Wait For And Verify Element        xpath=//div[@id="quicklink-list-id"]
    
    # Suggested searches
    Wait For And Verify Element        xpath=//div[@id="suggested-list-id"]
    # Arrow in Suggested searches

    # Suggested search arrow icon
    Wait For And Verify Element        xpath=(//span[@class="arrow-suggest"])[1]
    Wait For And Verify Element        xpath=(//span[@class="arrow-suggest"])[2]

#Search Menu List Functionality
    # quick links redirections
    Quicklinks Redirection                  #TC 15

    # suggested links redirections
    Suggested links Redirection             #TC 16

    # verifying suggessted arrow icons
    Click on Suggestion Arrow Icon          #TC17

    # verifying "<"                         #TC18
    Wait For And Click Element              xpath=//span[@class="input-icon clickable input-icon-prefix j-icon"]

    # Search menu is closed
    Wait For And Verify Element             xpath=//aside[@id="searchMain"][contains(@class,"animate_block")]


Quicklinks Redirection
    @{quick_link}=      Get WebElements      xpath=//li[@class="pkv-searchresult-item"]
    ${length_quick}=    Get Length           ${quick_link}
    Log To Console                           ${length_quick}

    FOR     ${i}    IN RANGE    1  ${length_quick}+1
        ${text}=                            Take Element Text                   xpath=(//li[@class="pkv-searchresult-item"]//div[@class="item-text j-text-body-xs"])[${i}]  #add s
        ${search_url}                       Get Element Attribute               xpath=//a[contains(@onclick,'${i}')]         href 
        # Clicking All links present in search menu
        Wait For And Click element          xpath=(//li[@class="pkv-searchresult-item"])[${i}]
        # Page Screenshot
        Take Page Screenshot                quicklink_${text}
        Log To Console                      quicklink_${text} : ${search_url} Page Verified
        # Redirecting to Mobile Page
        Redirection to Mobile Page
        # Clicking Search Bar
        Wait For And Click element          xpath=//input[contains(@onclick,"Search")]
        # Verifying Quick Link Section
        Wait for and Verify Element         xpath=//div[@class="pkv-searchresult-section-inner"]
    END


Suggested links Redirection
    @{suggestions}=                Get WebElements                              xpath=//li[@class="pkv-searchresult-item static-suggestion"]
    ${len_suggestions}=            Get Length         ${suggestions}
    Log To Console                 ${len_suggestions}
    
    FOR     ${i}    IN RANGE    1  ${len_suggestions}+1
        ${text}=                            Take Element Text                   xpath=(//li[@class="pkv-searchresult-item static-suggestion"]//div[@class="item-text j-text-body-xs"])[${i}]
        ${search_url}                       Get Element Attribute               xpath=//a[contains(@onclick,'${i}')]         href
        # Clicking Suggested Search Present In Search Menu
        Wait For And Click element                                              xpath=(//li[@class="pkv-searchresult-item static-suggestion"])[${i}]
        Take Page Screenshot                suggested_${text}
        Log To Console                      suggested_${text} : ${search_url} Page Verified
        # Redirecting To Mobile Page
        Redirection to Mobile Page
        # Clicking Search Menu
        Wait For And Click element          xpath=//input[contains(@onclick,"Search")]
        Wait for and Verify Element         xpath=//div[@class="pkv-searchresult-section-inner"]
    END


Click on Suggestion Arrow Icon
    # Clicking Arrow Present Inside Suggested searches
    Wait For And Click element          xpath=(//span[@class="arrow-suggest"])[${1}]
    ${arrow1}                          Get Element Attribute       xpath=//input[@id="topnav-search"]     value
    Log To Console                      ${arrow1}
    Take Page Screenshot                ${arrow1}_selected
    # Clicking Arrow Present Inside Suggested searches
    Wait For And Click element          xpath=(//span[@class="arrow-suggest"])[${2}]
    # Click Search in Top Nav Bar
    ${arrow2}                          Get Element Attribute       xpath=//input[@id="topnav-search"]     value
    Log To Console                      ${arrow2}
    Take Page Screenshot                ${arrow2}_selected


Search Menu Input Functionality and Redirection
    #Open Search menu
    Wait For And Click Element           xpath=//input[contains(@onclick,"Search")]  
    
    #Entering data into searchbar
    Wait For And Input Text               xpath=//*[@id="topnav-search"]       1a2b3c
    
    # Check suggested list appears for random input                                     #TC 20
    Wait For And Verify Element            xpath=//div[@id="suggested-list-id"]
    
    #Click on 'x' button to clear input field                                           #TC 19
    Wait For And Click Element             xpath=//*[@id="topnav-search-close"]

    # Search for "Jio"                                                                  #TC 21
    Wait For And Input Text                xpath=//*[@id="topnav-search"]         Jio
    Press Keys        NONE     ENTER
    Top Viewed Videos

Verifying UI of Search results                                                        #TC 22
    # Results in features
    Wait For And Verify Element            xpath=//div[normalize-space()='Results in features']

    # Video results & More videos
    Wait For And Verify Element            xpath=//div[normalize-space()='Top viewed videos']
    Wait For And Verify Element            xpath=//a[normalize-space()='View more videos']

    #Apps & more apps       
    Wait For And Verify Element            xpath=//div[normalize-space()='Results in apps']
    Wait For And Verify Element            xpath=//a[normalize-space()='View all apps']

    #FAQ section
    Wait For And Verify Element            xpath=//div[normalize-space()='Popular questions']
    Wait For And Verify Element            xpath=//a[normalize-space()='Browse all FAQs']

# Verifying Search results redirections    
        # ---------- Refer to Excel_activity while merging *********

    #Results in features 
    FOR  ${inc}  IN RANGE  0  5
        Redirection On Clicking           xpath=(//div[@class="pkv-pill-title"])[${inc+1}]    ${Results_In_Features}[${inc}]    Results_In_Features_Sc[${inc+1}]
    END


Top Viewed Videos
      #View More Videos Button 
    FOR  ${i}  IN RANGE  0  4
            Wait For And Click Element          xpath=//a[contains(text(),'videos')]
    END
    # Clicking Videos under Top Viewed Videos Section
    ${elements}=    Get WebElements          xpath=//div[@class="pkv-card-media"]
    ${Count of video tiles}=    Get Length    ${elements}
    Log To Console    Total videos=${Count of video tiles}
    ${inc}    Set Variable    1
    FOR  ${element}  IN  @{elements}
        Scroll To      xpath=(//div[@class="pkv-card-media"])[${inc}]
        Wait For And Verify Element    ${element}
        Wait For And Click Element     ${element}
        # Control Over Video
        Select Frame                       xpath=//iframe[@class="embed-responsive-item"]
        # Checking for Play Button visible or not
        ${play-button} =     Run Keyword And Return Status        Wait Until Element Is Visible   xpath=//button[@class="ytp-large-play-button ytp-button ytp-large-play-button-red-bg"]
        # If get youtube error icon
        ${Youtube error icon} =  Run Keyword And Return Status    Element Should Be Visible    xpath=//div[@class="ytp-error"]
        Log To Console    YT play button:${play-button}
        Log To Console    YT Error:${Youtube error icon}
            IF  ${play-button} == True          
                Wait For And Click Element                        xpath=//button[@class="ytp-large-play-button ytp-button ytp-large-play-button-red-bg"]
                Sleep    150ms
                Unselect Frame
                Log To Console    ${inc} video checked
            ELSE IF    ${Youtube error icon} == True
                # Run if gets some youtube error
                Unselect Frame
                Log To Console    Video is private
            
            ELSE
                # Run if video is autoplayable 
                Unselect Frame
                Log To Console    Autoplay video
            END

        Wait For And Click Element                             xpath=//button[@id="video-close"]
        ${inc}=    Evaluate    ${inc} + 1   
    END

    Log To Console   Videos verified
    #Browse videos option
    Wait For And Click Element         xpath=//a[normalize-space()='Browse all videos']
    URL Validation                     https://www.jio.com/help/watch-and-learn
    Wait For And Verify Element        xpath=//h1[normalize-space()='Top helpful videos']                  
    Go Back
    
    #Results from Apps
    Wait For And Click Element         xpath=//div[@class="pkv-card-pill-image-txt-wrapper"]
    Wait For And Verify Content        xpath=//span[@class="j-heading j-text-heading-l"]                  MyJio, for everything Jio    
    Go Back

    #Redirection to App Store       
    Redirection On Clicking            xpath=//div[@class="pkv-apple-icon pkv-card-pill-icon"]            https://apps.apple.com/us/app/myjio/id1074964262                   App_store
    
    #Redirection to PlayStore
    Redirection On Clicking            xpath=//div[@class="pkv-google-play-icon pkv-card-pill-icon"]      https://play.google.com/store/apps/details?id=com.jio.myjio        PlayStore
    
    #Redirection to Apps Page
    Redirection On Clicking            xpath=//a[normalize-space()='View all apps']                       https://www.jio.com/jcms/apps/                                     AppsPage
    
    
#Browse FAQ
    ${count_FAQ}    Get Length                   xpath=(//div[@class="pkv-search-faq-question"]//a)  
    Log To Console   Total FAQ ${count_FAQ}  
    FOR  ${i}  IN RANGE  1  11
        # Taking Text Of Popular Questions In FAQ
        ${FAQ}=        Take Element Text         xpath=(//div[@class="pkv-search-faq-question"]//a)[${i}]
        Wait For And Click Element               xpath=(//div[@class="pkv-search-faq-question"])[${i}]
        # Verifying Content After Clicking FAQ
        Wait For And Verify Content              xpath=//div[@class="j-text j-text-body-l-bold"]         ${FAQ}
        Go Back
        # ${Captcha_Present}=    Run Keyword And Return Status    Wait Until Element is visible   xpath=//button[contains(text(),'Proceed')]   
        # IF  ${Captcha_Present} == True
        #     ${captcha}=    Get Value From User    Enter Captcha
        #     Wait For And Input Text              xpath://input[@id='captchaEntered']   ${captcha}  
        #     Wait For And Click Element           xpath=//button[@id='generateOTP-btn']
        # END
    END
    # Redirecting To Help Support
    Wait For And Click Element          xpath=//a[@href="https://www.jio.com/en-in/help-support"]
    Wait For And Verify Content         xpath=//h1[@class=" j-heading j-text-heading-l"]        Welcome to Jio Support
