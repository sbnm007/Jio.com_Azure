*** Settings ***
Library        SeleniumLibrary

*** Keywords ***
Career Banner Validation                         
    #Banner Content
    Scroll Element Into View                                          xpath=//button[contains(text(),'View job openings')] 
    Sleep    200ms
    Reload Page
    Scroll Element Into View                                          xpath=((//div[@class='j-card j-fullwidth-banner p-0'])[1])//a[@aria-label="View job openings"] 
    
    #Banner content (Title, Background Image, Button )
    Banner Content Verification                        xpath=((//div[@class='j-card j-fullwidth-banner p-0'])[1])    ${Createopportunity_title}      xpath=//div[@class="l-breakpoint--desktop"]//img[@alt="View job openings"]    xpath=//button[contains(text(),'View job openings')]      JobCareers
    CSS Verification                                   xpath=((//div[@class='j-card j-fullwidth-banner p-0'])[1])    font-weight    500 
   
    #Title Subtext Verification
    Wait For And Verify Element                        xpath=//div[normalize-space()='Build an eventful career.']   
    Text Verification                                  xpath=//div[normalize-space()='Build an eventful career.']    ${Createopportunity_subtitle}
   
    #Verifying the View Job Opening Button
    Wait For And Verify Element                        xpath=//button[contains(text(),'View job openings')]
    #'View Job Opening' Button Redirection
    Redirection On Clicking                            xpath=//button[contains(text(),'View job openings')]   https://careers.jio.com/   JobCareers_Page