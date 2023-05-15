*** Settings ***
Library                             SeleniumLibrary
Resource                          ../../../Local_keywords.robot


*** Keywords ***
Discover Carousel Banner Validation
    Swipe All Banner
    Reload Page                                        #Required and Fixed
    AutoScroll Banner 
    Reload Page                                        #Required and Fixed
    Validating Banners Redirection

Swipe All Banner
    Wait For And Click Element                          xpath=//li[@id='slick-slide10']
    Sleep   100ms                                       #Required and Fixed
    Wait For And Click Element                          xpath=//li[@id='slick-slide12']
    Sleep   100ms                                       #Required and Fixed

AutoScroll Banner
    FOR     ${i}    IN RANGE    0  3
        Wait Until Page Contains Element                xpath=//div[@class="j-fullwidth-banner slick-slide slick-current slick-active"][@aria-describedby="slick-slide1${i}"]
        Wait Until Page Contains Element                xpath=//li[@id="slick-slide1${i}"][@class="slick-active"]      6s
        
        #Blue to Transperent Change (CSS Verification)
        ${attribute_value}=   Execute Javascript        return window.getComputedStyle(document.querySelector("#slick-slide1${i} > button"),':before').getPropertyValue('color');
        Log To Console    ${attribute_value}
        Should Be Equal As Strings                      ${attribute_value}        rgb(15, 60, 201)
        
        #Takes Screenshot
        Take Page Screenshot                            Banner_${i}
        Log To Console                                  Banner${i} Verified
    END

Validating Banners Redirection       
    Banner Redirection                                  NULL    slick-slide1  Mob-Disc

