*** Settings ***
Resource                            ../../Resources/Common.robot
Resource                            ../../Resources/Local_Keywords.robot
Variables                           ../../Resources/Common_Variables.yaml
Resource                            ../../Resources/HomePage/Home_page.robot
Resource                            ../../Resources/Excel_activity.robot
Variables                           variables.yaml

#robot -d Results Tests/Home_Page/Home/Home_main.robot
Resource                            ../../Resources/Tags.robot
Suite Setup                          Home Tags Activity
Test Setup                          Begin Web Test
Test Teardown                       End Web Test

*** Test Cases ***

Confirm UI Elements of Home Page
    [Documentation]  This is 1st and 2nd Test case
    [Tags]  ${TC01-Home}    TC01-Home    Sanity
    Home Page UI Elements Verification

Confirm UI, Content and Redirection of Header options
    [Documentation]  This is 3rd to 12th Test case
    [Tags]  ${TC03-Home}        TC03-Home    Sanity
    Header Content Verification    

Confirm UI, Content and Redirection of Carousel Banners
    [Documentation]  This is 13th and 14th Test case
    [Tags]  ${TC13-Home}        TC13-Home    Sanity
    Home Carousel Banners Validation

Confirm UI and Content of Quick Action Section
    [Documentation]  This is 15th Test case
    [Tags]  ${TC15-Home}    TC15-Home
    Quick actions UI Elements Verification

Confirm Quick Recharge Popup Functionality
    [Documentation]  This is 16th to 40th Test case
    [Tags]  ${TC16-Home}      TC16-Home        Sanity
    Quick Recharge Popup Verification

Confirm Pay Bills Popup Functionality
    [Documentation]  This is 41st to 52nd Test case
    [Tags]  ${TC41-Home}      TC41-Home        Sanity
    Pay bills Popup Verification

Confirm Get Jio SIM Popup Functionality
    [Documentation]  This is 53rd to 69th  Test case
    [Tags]  ${TC53-Home}      TC53-Home    Sanity     
    Get Jio SIM Popup Verification

Confirm Redirection to Port to Jio page 
    [Documentation]  This is 70th Test case
    [Tags]  ${TC70-Home}     TC70-Home        Sanity
    Visit Port to Jio Page

Confirm Get JioFiber Popup Functionality
    [Documentation]  This is 71st to 97th Test case   (TC83 - TC97 Partially Automated)
    [Tags]  ${TC71-Home}      TC71-Home    Sanity
    Get Jio Fiber Popup Verification

Confirm Redirection to Support page
    [Documentation]  This is 98th Test case
    [Tags]  ${TC98-Home}     TC98-Home    Sanity
    Visit Support Page 

Confirm UI, Content and Redirection of Discover New possibilities Section 
    [Documentation]  This is 99th to 103th Test case 
    [Tags]  ${TC99-Home}      TC99-Home     Sanity 
    Discover New Section Verification 
    
Confirm UI, Content,Functionality and Redirection of Enrich your Digital life Section 
    [Documentation]  This is 104th to 110th Test case 
    [Tags]  ${TC104-Home}      TC104-Home      Sanity 
    Enrich Your Section Verification 
    
Confirm UI, Content and Redirection of In the Spotlight Section 
    [Documentation]  This is 111th to 113th Test case 
    [Tags]  ${TC111-Home}     TC111-Home      Sanity 
    In the Spotlight Section Verification 
    
Confirm UI, Content and Redirection of Three Application Banners 
    [Documentation]  This is 114th Test case 
    [Tags]     ${TC114-Home}      TC114-Home 
    Three Promo Cards

Confirm UI, Content and Redirection of Latest and Trending Devices Section
    [Documentation]  This is 115th to 118st Test case
    [Tags]  ${TC115-Home}    TC115-Home    Sanity    
    Latest and Trending Devices Section Verification

Confirm UI, Content and Redirection of Career Banner Section
    [Documentation]  This is 119th to 121th Test case       
    [Tags]  ${TC119-Home}    TC119-Home    Sanity
    Career Banner Verification

Confirm UI, Content,Functionality and Redirection of Making a Difference Section
    [Documentation]  This is 122th to 131th Test case     
    [Tags]  ${TC122-Home}    TC122-Home    Sanity
    Making a Difference Verification

Confirm UI, Content and Redirection of Business Section
    [Documentation]  This is 132th to 134th Test case       
    [Tags]     ${TC132-Home}     TC132-Home    Sanity
    Business Banner Verification

Confirm UI and Content of QR Code Section
    [Documentation]  This is 135th to 136th Test case (137 is out of scope)
    [Tags]  ${TC135-Home}    TC135-Home    Sanity 
    QR code Section Verification

Confirm UI, Content and Redirection of Need Guidance Section
    [Documentation]  This is 138st to 143th Test case
    [Tags]  ${TC138-Home}    TC138-Home    Sanity
    Home Need Guidance Section Verification

Confirm UI, Content and Redirection of Footer
    [Documentation]  This is 144th to 176th Test case (177 is out of scope)
    [Tags]  ${TC144-Home}    TC144-Home    Sanity
    Footer Section Verification
