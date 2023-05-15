***Settings***
Library                                          SeleniumLibrary
Resource                                         ../../Common.robot
Resource                                         ../../Local_Keywords.robot
       
***Keywords***
In the Spotlight Section Validation
    #See Video in Spotlight Section
    Scroll To                                    xpath=//div[@class='w-100 d-flex']

    #Title verification
    Text Verification                            xpath=//h2[@class="j-contentBlock__title j-heading j-text-heading-l" and contains(text( ),"spotlight")]    ${Spotlight_text[0]}
    CSS Verification                             xpath=//h2[@class="j-contentBlock__title j-heading j-text-heading-l" and contains(text( ),"spotlight")]    font-weight     900

    #Subtitle verification
    Text Verification                            xpath=//div[@class="j-color-primary-grey-80 j-contentBlock__description j-text-body-m" and contains(text( ),"best deals")]     ${Spotlight_text[1]}

    #Validating Content
    Banner Content Verification                  xpath=//div[@class="j-grid custom-video-grid"]//h3[@class="j-contentBlock__title j-heading j-text-heading-m"]   ${Spotlight_text[2]}   xpath=//div[@class="w-100 d-flex"]//img      xpath=//button[normalize-space()='Watch TATA IPL on JioCinema']    Spotlight_Botton
    CSS Verification                             xpath=//div[@class='j-grid custom-video-grid']//h3   font-weight         900

    #Redirection to Product page
    Redirection On Clicking                      xpath=//button[@class="j-button j-button-size__medium primary flex-grow-0 w-auto "]    https://www.jio.com/    Spotlight_Redirection
