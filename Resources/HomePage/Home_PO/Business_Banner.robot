***Settings*** 
Library                                 SeleniumLibrary
Resource    ../../Common.robot

***Keywords***
Business Banner Validation
    # Scroll to Make your business grow faster than ever section
    
    Scroll To   //h2[normalize-space()='Making a difference']
    Sleep    1s
    Reload Page
    Scroll To    ((//div[@class='j-card j-fullwidth-banner p-0'])[2])     
    
    # Heading Content Verification
    
    Text Verification                            xpath=//h3[normalize-space()='Accelerate business growth']     Accelerate business growth
    CSS Verification                             xpath=//h3[normalize-space()='Accelerate business growth']        font-weight    900

    # Sub-Heading Content Verification
    Text Verification                            xpath=//div[contains(text(),'Try future-ready solutions.')]    Try future-ready solutions.    
    
    # Background Image Verification
    Image Verification                           xpath=//div[contains(@class,'l-breakpoint--desktop')]//img[contains(@alt,'Go to JioBusiness')]   
    
    # Button Verification
    Wait For And Verify Element                  xpath=//button[normalize-space()='Go to JioBusiness']
    Text Verification                            xpath=//button[normalize-space()='Go to JioBusiness']     Go to JioBusiness
                                
    Log To Console                               JioBusiness_Section Verified
         
    # Button Redirection
    Redirection On Clicking                      xpath=//button[normalize-space()='Go to JioBusiness']      https://www.jio.com/business/   JioBusiness_Page