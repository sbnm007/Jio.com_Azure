*** Settings ***
Library    SeleniumLibrary
Resource   ../../../Common.robot

*** Keywords ***
Carousel Banner Visibility
    #[91864,91866] Confirm visibility of banner, Auto scrolling 
    #[91865 - Swiping - Not automatable]
    FOR     ${i}     IN RANGE    0    3
    Wait Until Element Is Visible         xpath://div[@data-slick-index="${i}"]    6s
    #Sleep is mandatory since it get paused on clicking the slick slide
    Sleep    300ms      
    END

    #[91867] - Banner Redirection
    #Sleep is mandatory since it get paused on clicking the slick slide
    Sleep    550ms
    FOR  ${i}  IN RANGE    1    4  
        #Sleep is mandatory since it get paused on clicking the slick slide
        Sleep    50ms
        Wait For And Click Element        xpath://button[normalize-space()='${i}']  
        Redirection On Clicking           xpath:(//button[@class="j-button j-button-size__medium primary redirectButton w-auto mr-3 mt-3"])[${i}]        https://www.jio.com/selfcare/interest/fiber/?nav=g        Carousel     
    END
    
    #[91868] - Carousel present 
    FOR     ${i}     IN RANGE    1    4
    Wait For And Verify Element           xpath://button[normalize-space()='${i}']
    END

    #[91870] - Carousel indicator's colour changes from grey to blue when it gets highlighted
    FOR     ${i}     IN RANGE    0    3
        Wait For And Click Element        xpath://button[normalize-space()='${i+1}']
        ${attribute_value}=    Execute Javascript    return window.getComputedStyle(document.querySelector('#slick-slide0${i} > button'),':before').getPropertyValue('background-color');
        Should Be Equal As Strings        ${attribute_value}    rgb(15, 60, 201) 
    END


    
    
    
    
    
