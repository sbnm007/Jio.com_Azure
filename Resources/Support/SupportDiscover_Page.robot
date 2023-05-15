*** Settings ***
Resource                        ../Support/SupportPage_PO/Discover_PO/RedirectionToDiscover.robot
Resource                        ../Support/SupportPage_PO/Discover_PO/TroubleshootProblems.robot
Resource                        ../Support/SupportPage_PO/Discover_PO/ResolveYourIssues.robot
Resource                        ../Support/SupportPage_PO/Discover_PO/ShortcutsToServices.robot
Resource                        ../Support/SupportPage_PO/Discover_PO/Banner.robot
Resource                        ../Support/SupportPage_PO/Discover_PO/GotQueries.robot
Resource                        ../Support/SupportPage_PO/Discover_PO/HelpfulTips.robot
Resource                        ../Support/SupportPage_PO/Discover_PO/ResolvingQueries.robot
Resource                        ../Support/SupportPage_PO/Discover_PO/StillNeedToDiscuss.robot


*** Keywords ***
Visit Support Page of Jio.com
    Landing on Support Page

Got queries? Check FAQs for answers'section validation
    'Got queries? Check FAQs for answers'section verification

UI and content of Helpful Tips section validation
    UI and content of Helpful Tips section verification

UI and Content of MyJio Resolving queries just got easier validation
    UI and Content of MyJio Resolving queries just got easier verification
    
Redirection, UI and Content of 'Still need to discuss something?' section validation 
    Redirection, UI and Content of 'Still need to discuss something?' section verification

Scroll down to Helpful Tips Section Check Redirection and UI Validation
#92449,92450,92451
    Scroll down to Helpful Tips Section Check Redirection and UI verification
        
Click on Search Button And Verify Contents Validation
    Click on Search box from Banner and Verify Contents of SearchBar Verification
    
Shortcuts To Most Used Services and track order Redirection And UI Validation
    Shortcuts To Most Used Services Redirection And UI Verification
    'Track Order' Page redirection and content verification

Confirm That Popping Menu,Navigation Bar And Accordion Is Redirecting Validation
    Popping Menu And Navigation Bar Is Redirecting Properly Verification

Track Request Redirection & UI Verification
    Track Request Redirection
    Track Request UI Verification

Manage AutoPay Redirection And UI Validation
    Manage Autopay Redirects User To 'Manage Autopay' Page
    UI Elements And Content Of 'Manage Autopay' Page

Validate redirection and contents of 'Lost Sim' page
    'Lost Sim' Page redirection and content verification

Validate redirection and contents of 'Port to Jio'
    Port to Jio redirection,UI and content verification

Validate redirection and content of 'Claim Refund'
    verify redirection and content of 'claim refund'

Validate redirection and content of 'check all support links'
    Verify redirection and content of 'check all support links'

Validate UI and content of 'Troubleshoot problems all by yourself' section and 'Facing any issue? Let's resolve now' page
    Verify UI and content of 'Troubleshoot problems all by yourself' section and 'Facing any issue?' page

Validate the UI and contents of 'watch, learn and resolve' section and 'Top Helpful Videos' page
    Verify the UI and contents of 'watch, learn and resolve' section and 'Top Helpful Videos' page