*** Settings ***
Resource                        ../../Resources/Support/SupportDiscover_Page.robot   
Resource                        ../../Resources/Common.robot
Resource                            ../../Resources/Tags.robot
Suite Setup                         Support Discover Tag Activity
Test Setup                      Begin Web Test
Test Teardown                   End Web Test


*** Test Cases ***

Confirm UI and content of Welcome to Jio Support Page
    [Documentation]    TC01 to TC05    Sanity
    [Tags]    ${TC01-SUD}    TC01-SUD     
    Visit Support Page of Jio.com
    Click on Search Button And Verify Contents Validation

Confirm redirection and UI of 'Shortcuts to most used services' and 'Track Order' page
    [Documentation]    TC06 to TC09    Sanity
    [Tags]    ${TC06-SUD}    TC06-SUD     
    Visit Support Page of Jio.com
    Shortcuts To Most Used Services and track order Redirection And UI Validation

Confirm Track Request Redirection And UI Contents
    [Documentation]    TC10 to TC11
    [Tags]    ${TC10-SUD}   TC10-SUD 
    Visit Support Page of Jio.com
    Track Request Redirection & UI Verification

Confirm Manage AutoPay Redirection And UI Contents
    [Documentation]    TC12 to TC13    Sanity
    [Tags]    ${TC12-SUD}    TC12-SUD     
    Visit Support Page of Jio.com
    Manage AutoPay Redirection And UI Validation

Confirm redirection,UI and contents 'Lost Sim' Page 
    [Documentation]    TC14 to TC15    Sanity
    [Tags]    ${TC14-SUD}    TC14-SUD     
    Visit Support Page of Jio.com
    Validate redirection and contents of 'Lost Sim' page

Confirm the redirection,UI elements and content of 'Port to Jio' page
    [Documentation]    TC16 to TC 17    Sanity
    [Tags]    ${TC16-SUD}    TC16-SUD     
    Visit Support Page of Jio.com
    Validate redirection and contents of 'Port to Jio'

# Confirm UI, content of 'Claim Refund' page.
#     [Documentation]    TC18 to TC19    Sanity
#     [Tags]    ${TC18-SUD}    TC18-SUD     
#     Visit Support Page of Jio.com
#     Validate redirection and content of 'Claim Refund'

Confirm UI and content of 'Check all the support links' page.
    [Documentation]    TC20 to TC21    Sanity
    [Tags]    ${TC20-SUD}    TC20-SUD     
    Visit Support Page of Jio.com
    Validate redirection and content of 'check all support links'

Confirm UI and content of 'Troubleshoot problems all by yourself' section and 'Facing any issue? Let's resolve now' page
    [Documentation]    TC22 to TC31    Sanity
    [Tags]    ${TC22-SUD}    TC22-SUD     
    Visit Support Page of Jio.com
    Validate UI and content of 'Troubleshoot problems all by yourself' section and 'Facing any issue? Let's resolve now' page

Confirm Redirection,UI and content of 'Got queries? 'section Functionality
    [Documentation]     TC32 to TC35    Sanity
    [Tags]    ${TC32-SUD}    TC32-SUD     
    Visit Support Page of Jio.com
    Got queries? Check FAQs for answers'section validation

Confirm that Popping menu and navigation bar is Redirecting properly
    [Documentation]    TC36 to TC37    Sanity
    [Tags]    ${TC36-SUD}    TC36-SUD     
    Visit Support Page of Jio.com
    Confirm That Popping Menu,Navigation Bar And Accordion Is Redirecting Validation

Confirm UI, content and functionality of Watch, Learn and Resolve Section and 'Top Helpful Videos' page
    [Documentation]    TC38 to TC43    Sanity
    [Tags]    ${TC38-SUD}    TC38-SUD     
    Visit Support Page of Jio.com
    Validate the UI and contents of 'watch, learn and resolve' section and 'Top Helpful Videos' page

Confirm Redirection,UI and content of Helpful Tips Section Functionality
    [Documentation]     TC44 to TC46    Sanity
    [Tags]    ${TC44-SUD}    TC44-SUD     
    Visit Support Page of Jio.com
    UI and content of Helpful Tips section validation 

Confirm UI And Content Elements Of The Jio Helpful Tips Page 
    [Documentation]    TC47 to TC49    Sanity
    [Tags]    ${TC47-SUD}    TC47-SUD     
    Visit Support Page of Jio.com
    Scroll down to Helpful Tips Section Check Redirection and UI Validation

Confirm the UI and Content of MyJio Resolving queries just got easier Functionality
    [Documentation]    TC50    
    [Tags]    ${TC50-SUD}    TC50-SUD
    Visit Support Page of Jio.com
    UI and Content of MyJio Resolving queries just got easier validation

Confirm the Redirection,UI and Content of 'Still need to discuss something?' section Functionality
    [Documentation]    TC51 to TC54    Sanity
    [Tags]    ${TC51-SUD}    TC51-SUD     
    Visit Support Page of Jio.com
    Redirection, UI and Content of 'Still need to discuss something?' section validation 





