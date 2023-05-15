*** Settings ***
Library    SeleniumLibrary
Resource    ../../Common.robot
Resource    ../../Local_Keywords.robot
Resource    ../Apps_PO/Apps_FAQ.robot


*** Keywords ***
#Entertainment section
JioTV App Tile UI/Content/Functional Verification and Redirection
    ${ROW}=        Decide Start and End                    2    18    JioTV    Apps_Page
    Reading Data of Apps Page from Excel    ${ROW}
    Tile Verification
    Click Get Now Button
    Jio App Information Page Redirection
    Banner Verification
    Content Validation
    Infographics Verificationn
    All Get Now Verification of App Information Page
    App Validate FAQ
    Go Back


JioCinema App Tile UI/Content/Functional Verification and Redirection
    ${ROW}=        Decide Start and End                    2    18    JioCinema    Apps_Page
    Reading Data of Apps Page from Excel    ${ROW}
    Tile Verification
    Click Get Now Button
    Jio App Information Page Redirection
    Banner Verification
    Content Validation
    Infographics Verificationn
    All Get Now Verification of App Information Page
    App Validate FAQ
    Go Back



JioGames App Tile UI/Content/Functional Verification and Redirection
    ${ROW}=        Decide Start and End                    2    18    JioGames    Apps_Page
    Reading Data of Apps Page from Excel    ${ROW}
    Tile Verification
    Click Get Now Button
    Jio App Information Page Redirection
    Banner Verification
    Content Validation
    Infographics Verificationn
    All Get Now Verification of App Information Page
    FAQ Section                             0        1
    Go Back
    
JioSaavn App Tile UI/Content/Functional Verification and Redirection
    Wait For And Click Element    xpath=(//ul[@class="react-multi-carousel-dot-list "]//li)[2]
    ${ROW}=        Decide Start and End                    2    18    JioSaavn    Apps_Page
    Reading Data of Apps Page from Excel    ${ROW}
    Tile Verification
    Click Get Now Button    2
    Jio App Information Page Redirection
    Banner Verification
    Content Validation
    Infographics Verificationn
    All Get Now Verification of App Information Page
    App Validate FAQ
    Go Back

JioNews App Tile UI/Content/Functional Verification and Redirection
    Wait For And Click Element    xpath=(//ul[@class="react-multi-carousel-dot-list "]//li)[3]
    ${ROW}=        Decide Start and End                    2    18    JioNews    Apps_Page
    Reading Data of Apps Page from Excel    ${ROW}
    Tile Verification
    Click Get Now Button    3
    Jio App Information Page Redirection
    Banner Verification
    Content Validation
    Infographics Verificationn
    All Get Now Verification of App Information Page
    App Validate FAQ
    Go Back




*** Comments ***

Will be included after getting test case for the same


Check carousel functionality
    ${Carousel_Buttons}=     Get WebElements        xpath=(//ul[@class="react-multi-carousel-dot-list "]//li)
    ${C_Buttons_Length}=    Get Length    ${Carousel_Buttons}
    Log To Console    Buttons count=${C_Buttons_Length}
    FOR  ${Carousel_Button}  IN RANGE  1     ${C_Buttons_Length}+1
        #Clicking buttons
        Wait For And Click Element    xpath=(//ul[@class="react-multi-carousel-dot-list "]//li)[${Carousel_Button}]

        #Verify button active status
        ${Carousel_Status}=  Get Element Attribute   xpath=(//ul[@class="react-multi-carousel-dot-list "]//li//span)[${Carousel_Button}]    class
        Log To Console    Carousal-${Carousel_Button}:${Carousel_Status}
        should be equal as strings  ${Carousel_Status}  active

        #CSS color validation of active button
        CSS Verification    xpath=(//ul[@class="react-multi-carousel-dot-list "]//li//span)[${Carousel_Button}]    background-color    rgba(0, 0, 147, 1)

        #Apps tiles verification as per carousal
        IF  ${Carousel_Button} == ${1}
            Wait For And Verify Element    //li[contains(@class,"carousel-item--active ")]//h6[text()='JioTV']
            Wait For And Verify Element    //li[contains(@class,"carousel-item--active ")]//h6[text()='JioCinema']
            Wait For And Verify Element    //li[contains(@class,"carousel-item--active ")]//h6[text()='JioGames']            
        
        ELSE IF    ${Carousel_Button} == ${2}
            Wait For And Verify Element       //li[contains(@class,"carousel-item--active ")]//h6[text()='JioSaavn']
            Wait For And Verify Element       //li[contains(@class,"carousel-item")]//h6[text()='JioTV']
            Wait For And Verify Element       //li[contains(@class,"carousel-item")]//h6[text()='JioNews']

        ELSE
            Wait For And Verify Element          //li[contains(@class,"carousel-item--active ")]//h6[text()='JioSaavn']
            Wait For And Verify Element          //li[contains(@class,"carousel-item--active ")]//h6[text()='JioNews']
        END
        
    
        Sleep     2s
    END
    

