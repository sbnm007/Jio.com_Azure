*** Settings ***
Library    SeleniumLibrary
Resource    ../../../Common.robot
Resource    ../../../Excel_Activity.robot
Resource    ../../../Local_Keywords.robot
Variables    ../../../Common_Variables.yaml
Variables    ../../../../Tests/Fiber/FRecharge_Variables.yaml

*** Keywords ***
Fiber tab is selected by default
    Wait Until Element Is Enabled                      xpath: //input[@aria-label="JioFiber"]
    
    #Verify background color of tab is Blue
    CSS Verification                                   xpath: //span[@class="switcher"]    background-color     rgba(15, 60, 201, 1)

Enter Correct JioFiber Number
    Fiber tab is selected by default
    
    #Enter a correct Jio number 
    Wait For And Input Text                            xpath: //input[@id="submitNumber"]    ${Fiber_No}
    
    #Click on Continue
    Wait For And Click Element                         xpath: //button[@aria-label="button Continue"]

Verify UI of JioFiber Tab and toast on entering wrong JioFiber No
    Fiber tab is selected by default
    Verify UI of JioFiber Tab
    
    #Enter a Incorrect Jio number 
    Wait For And Input Text                            xpath: //input[@id="submitNumber"]    ${Incorrect_No1}
    
    #Click on Continue
    Wait For And Click Element                         xpath: //button[@aria-label="button Continue"]
    
    #Verify a toast with message, "The number you have entered is not valid "
    Toast Capture and Data Validation                  WrongJioFiberNumberToast    xpath: //div[@class="field-error"]    ${WrongFiberToast}[${0}]
    
    #Click on 'i' Postpaid bills
    Open Popup                                         xpath: //span[@class='input-icon input-icon-suffix clickable']//span[@class='j-icon']
    
    #Checks visibility of Pop-Up
    Wait For And Verify Element                        xpath: //div[@class="j-modal-body"]
    
    #Verify UI elements
    # 1. Background gets blurred 
    CSS Verification                                   xpath: (//div[@aria-label="Modal "])[2]    backdrop-filter    blur(5px) contrast(0.8)
    
    # 2. Cross button at top right 
    Wait For And Verify Element                        xpath: (//header[@class="j-modal-header"]//button[@aria-label="button"]//i[@class="j-button-icon"])[1]
    
    #JioFiber Number header and other text
    Text Verification                                  xpath: //div[contains(text(),'JioFiber Number')]    ${FiberTab'i'btnPop}[${0}]
    Text Verification                                  xpath: (//div[@class="j-modal-content"])[1]    ${FiberTab'i'btnPop}[${1}]
    
    #Click on Cross button
    Close Popup                                        xpath: (//header[@class="j-modal-header"]//button[@aria-label="button"]//i[@class="j-button-icon"])[1]
    URL Validation    ${Sub_NavBar_URLs}[4]
    
    #Click on Recharge here hyperlink under Continue button
    Wait For And Click Element                         xpath: //a[normalize-space()='Recharge here']
    
    #Checks visibility of Pop-Up
    Wait For And Verify Element                        xpath: (//div[@class="j-modal-body"])[2]
    
    #Verify UI elements
    #Background gets blurred 
    CSS Verification                                   xpath: (//div[@aria-label="Modal "])[2]    backdrop-filter    blur(5px) contrast(0.8)
    
    #Cross button at top right 
    Wait For And Verify Element                        xpath: (//header[@class="j-modal-header"]//button[@aria-label="button"]//i[@class="j-button-icon"])[2]
    
    #Rupee symbol with Recharge your JioLink text below
    Wait For And Verify Element                        xpath: //div[@layout="centered"]//span[@class="j-icon j-icon__bg"]
    
    #Recharge your JioLink text 
    Text Verification                                  xpath: //div[normalize-space()='Recharge your JioLink']    ${FiberTabJioLinkPop}[${0}]
    
    # JioLink Number placeholder in text field
    Text Verification                                  xpath: //label[normalize-space()='JioLink Number']     ${FiberTabJioLinkPop}[${1}]        
    
    # Greyed out continue button 
    Element Should Be Disabled                         xpath: (//button[@aria-label="button Continue"])[2]
    Text Verification                                  xpath: (//button[@aria-label="button Continue"])[2]    ${FiberTabJioLinkPop}[${2}]
    
    #Enter an invalid number in JioLink Number field 
    Wait For And Input Text                            xpath: //div[@class="jds_label__snObX j-field input-tel"]//input[@type="tel"]    ${Incorrect_No1}
    
    #Continue button turns blue 
    CSS Verification                                   xpath: //div[@class="j-modal-content"]//button[@aria-label="button Continue"]    background-color     rgba(15, 60, 201, 1)
    
    #Click on Continue 
    Wait For And Click Element                         xpath: //div[@class="j-modal-content"]//button[@aria-label="button Continue"]
    
    #Verify error message which reads, "Please enter a valid JioLink number."
    Toast Capture and Data Validation                  WrongJioLinkNumberToast    xpath: (//div[@class="field-error"])[2]    ${WrongFiberToast}[${1}]
    
    #Click on Cross button
    Close Popup                                        xpath: (//header[@class="j-modal-header"]//button[@aria-label="button"]//i[@class="j-button-icon"])[2]
    URL Validation    ${Sub_NavBar_URLs}[4]

Verify UI of JioFiber Tab
    #Verifying Recharge Text with rupee symbol(Incomplete)
    Wait For And Verify Element                         //h1[normalize-space()='Recharge']
    Text Verification                                   //h1[normalize-space()='Recharge']    Recharge
    Wait For And Verify Element                         (//span[@class='j-icon j-icon__bg'])[1]
    
    #Verifying the text below Recharge 
    Text Verification                                   //h2[normalize-space()='Enter your details to find the best prepaid plans.']    Enter your details to find the best prepaid plans.
    
    #Tab Switcher Verification
    Wait For And Verify Element                         //div[@class='jds_toggle__mrH_E j-selectors']
    Fiber tab is selected by default
    #Verifying text of Jio-Fiber
    Text Verification                                   xpath://div[@class='switcher-text j-text j-text-body-s'][normalize-space()='JioFiber']    JioFiber    
    #clicking on Mobile Tab
    Wait For And Click Element                          xpath:(//span[@class='content'])[1]
    #verifying css of mobile tab
    CSS Verification                                    xpath: //span[@class="switcher"]    background-color     rgba(15, 60, 201, 1)
    #switching to fiber tab
    Wait For And Click Element                          xpath: //span[@class="j-selectors__item"][2]
    #Verfiying the JioFiber Number Field with 'i' button
    Wait For And Verify Element                       //input[@id='submitNumber']
    Wait For And Verify Element                         //div[@class='jds_label__snObX j-field input-tel input-has-suffix']//span[@class='input-icon input-icon-suffix clickable']
    
    #Verifying Grayed Out Continue Button
    Element Should Be Disabled                          (//button[@aria-label='button Continue'][normalize-space()='Continue'])[1]
    CSS Verification                                    (//button[@aria-label='button Continue'][normalize-space()='Continue'])[1]    background-color    rgba(10, 40, 133, 1) 
    
    #Verifying text and hyperlink below Recharge Button
    Text Verification                                   (//div[normalize-space()='Using JioLink?'])[1]    Using JioLink?
    Page Should Contain Link                            (//a[normalize-space()='Recharge here'])[1]
    
    #Verifying the banner to the right(Local Keyword)
    #Verifying the Plans to redifine your digital text and image below that
    Image Verification                                  (//img[@alt='Broadband Online Recharge'])[1]

Verify UI elements,redirection and functionality of Select plan, View details and Payments page Fiber tab
    Fiber tab is selected by default
    Enter Correct JioFiber Number
    
    # On left side of page
    #a. Select plan header
    Wait For And Verify Content                         xpath: //h1[normalize-space()='Select plan']    Select plan
    
    #b. Jio number text with user's number below
    Wait For And Verify Content                         xpath: //div[@class="field-group"]//div[@class="css-bcp9a3"]    Jio number
    Wait For And Verify Element                         xpath: //div[@class="field-group"]//input[@value=${Fiber_No}]
    
    #c. Edit button
    Wait For And Verify Element                         xpath: //div[@class="css-6yr0zv"]//button[normalize-space()='Edit']
    
    #d. List of plan types in the following order :
    
    #i. Monthly ii. Quarterly iii. Semi-Annual iv. Annual v. ISD vi. Top-up vii. Data Sachet
    ${NoOfPlanTypes}=    Get Element Count              xpath: //div[@class="css-147eks2"]//button
    FOR    ${i}    IN RANGE    1    ${NoOfPlanTypes}
            Wait For And Verify Content                 xpath: //div[@class="css-147eks2"]//button[${i}]    ${FiberTabSelectPlanPageContent}[${i}]
    END
    
    # 2. On right side of page
    #a. (plan-name) with accordion function
    ${NumberOfPlans} =    Get Element Count             xpath: //div[@class="css-1urkwwk"]
    Log To Console    ${NumberOfPlans}
    FOR    ${NoOfPlans}    IN RANGE    0    ${NumberOfPlans}
    
    #Verify Plan name
        Wait For And Verify Content                     xpath: //span[normalize-space()='${FiberTabNameOfPlans}[${NoOfPlans}]']    ${FiberTabNameOfPlans}[${NoOfPlans}]
    
    #Verify Accordian function
        Wait For And Verify Element                     xpath: //div[@class="css-1urkwwk"]//button[@id='${NoOfPlans}']
    END
    
    #${ViewDetailsHeading}=    Get Text    (//div[@class="css-1rxp3n8"])[1]
    #Log To Console    ${ViewDetailsHeading}
    
    Text Verification                                   xpath: (//div[@class="css-1rxp3n8"])[1]    ${FiberTabPlanDetails}
    ${NoOfSubPlans}=    Get Element Count               xpath: //div[@id='panel_0']//div[@data-testid="plan"]
    FOR    ${SubPlans}    IN RANGE    1    ${NoOfSubPlans}+1
    
    #e. Subscriptions with two apps in preview   
    ${Subcription}=    Run Keyword And Return Status    Wait For And Verify Element     xpath: //div[@id='panel_0']//div[@data-testid="plan"][${SubPlans}]//div[@data-testid="subscriptions"]//div[normalize-space()='SUBSCRIPTIONS']  
        IF    '${Subcription}' == 'true' 
            Wait For And Verify Element                 xpath: //div[@id='panel_0']//div[@data-testid="plan"][${SubPlans}]//div[@data-testid="subscriptions"]//div[normalize-space()='SUBSCRIPTIONS']
            FOR    ${appsIcon}    IN RANGE    1    3 
                Image Verification                      xpath: //div[@id='panel_0']//div[@data-testid="plan"][${SubPlans}]//div[@data-testid="subscriptions"]//div[2]//div[1]//img[${appsIcon}]
            END
        END
    END
    
    #f. View details button
        Wait For And Verify Element                     xpath: //div[@class="css-1q5nm3e"]//div[@class="css-1urkwwk"]//div[@id='panel_0']//div[@data-testid="plan"][${SubPlans}]//div[@class="css-ddnaeb"]//button[normalize-space()="View details"]
    
    #g. Buy button    
        Wait For And Verify Element                     xpath: //div[@class="css-1q5nm3e"]//div[@class="css-1urkwwk"]//div[@id='panel_0']//div[@data-testid="plan"][${SubPlans}]//div[@class="css-ddnaeb"]//button[normalize-space()="Buy"]
    
    #h. Terms & conditions hyperlink below last plan
        Wait For And Verify Element                     xpath: //button[normalize-space()='Terms & conditions']

    #Verify UI elements of View details Fiber Tab
    #Click on View 
    Open Popup                                          xpath: (//button[@type='button'][normalize-space()='View details'])[1]
    
    #Price of plan and data text over red background
    #Verify Rupee symbol,Verify amount,Text below price
    #${ViewDetailsHeading}=    Get Text    //div[@class="top-head-section w-100"]
    
    #Log To Console    ${ViewDetailsHeading}
    Text Verification                                   xpath: //div[@class="top-head-section w-100"]    ${FiberTabViewDetailsDescription}[${0}]
    
    #Verify red background
    CSS Verification                                    xpath: //div[@class="top-head-section w-100"]    background-image    radial-gradient(rgb(255, 50, 49), rgb(173, 0, 0))
    
    #Details about the plan
    #${ViewDetailsText}=    Get Text    //div[@class="detail_section"]
    
    #Log To Console    ${ViewDetailsText}
    Text Verification                                   xpath: //div[@class="detail_section"]    ${FiberTabViewDetailsDescription}[${1}]
    
    #Jio Apps & other subscriptions with app logos below
     ${Subcription}=     Run Keyword And Return Status   Wait For And Verify Element     xpath: //div[@class="app-section-detail"]//div[@class="title_app text-center"]
    IF    '${Subcription}' == 'true'
        Text Verification                               xpath: //div[@class="app-section-detail"]//div[@class="title_app text-center"]    ${FiberTabViewDetailsApps}[${0}]
        ${NoOfApps}=    Get Element Count               xpath: //div[@class="app-set"]//ul//li//div//img
        FOR    ${AppsNo}    IN RANGE    1        ${NoOfApps}+1
            Image Verification                          xpath: (//div[@class="app-set"]//ul//li//div//img)[${AppsNo}]
            Text Verification                           xpath: (//div[@class="app-set"]//ul//li//div[@class="app-bg"])[${AppsNo}]    ${FiberTabViewDetailsApps}[${AppsNo}] 
        END
    END
    #View details Note section with relevant text
    #${NoteText}=    Get Text    //div[@class="detail-section-notes-wrapper"]
    #Log To Console    ${NoteText}
    Text Verification                                   xpath: //div[@class="detail-section-notes-wrapper"]    ${FiberTabViewDetailsNote}
    
    #Click on 'here' hyperlink under Note section   
    #Redirection On Clicking                            xpath: //div[@class="details-notes-list"]//ul//li[2]//a     ${T&CpageFiberTabURL}    T&CpageFiberTab
    Close Popup                                         xpath: //button[@aria-label="Close"]
    
    #Verify accordian functionalities   
    #Click on Down arrow above buy button 
    Wait For And Click Element                          xpath: //span[@class="css-qf3x39"]
    Sleep    500ms
    Element Attribute Verification                      xpath: //button[@id='0']   aria-expanded    false
    
    #Click on up arrow beside any of the plan tiles
    Wait For And Click Element                          xpath: //span[@class="css-15ox7xe"]
    Sleep    500ms
    Element Attribute Verification                      xpath: //button[@id='0']   aria-expanded    true
    
    #Verify redirection of Rehcharge Payments page Fiber Tab
    #Click on Buy button from any pack
    Redirect and continue                               xpath: //button[@class="css-r5gb33"]    https://www.jio.com/selfcare/recharge/fiber/plans/?serviceId=${Fiber_No}&serviceType=fiber&next=PREPAID&billingType=PREPAID    SC_Payments
    #Verify User is redirected to Payment Gateway page
    Go To                                               https://www.jio.com/selfcare/recharge/fiber/plans/?serviceId=${Fiber_No}&serviceType=fiber&next=PREPAID&billingType=PREPAID
    #Click on Terms & conditions hyperlink below last plan
    Wait For And Click Element                          xpath: //button[normalize-space()='Terms & conditions']

Verify UI and Content elements of ISD tab for Fiber Tab
    Fiber tab is selected by default
    Enter Correct JioFiber Number 
    #Verify User is redirected to Recharge page on clicking Edit button
    Redirect and continue                              xpath: //button[@class="css-w027hr"]    https://www.jio.com/selfcare/recharge/fiber/?serviceId=${Fiber_No}&serviceType=fiber&next=PREPAID&billingType=PREPAID&action=edit    Sc_Rechargepage
    #Click on Continue
    Wait For And Click Element                         xpath: //button[@aria-label="button Continue"]
    #Click on ISD from list of plan types
    Wait For And Click Element                         xpath: //button[@class="css-1k2fqmw"][4]
    
    #Other Plans with plan tile below    
    Text Verification                                  xpath: //span[@class="css-g88c3e"]    Other Plans
    Wait For And Verify Element                        xpath: //div[@id="panel_0"]
    
    #Individual country benefits    
    Text Verification                                  xpath: //h3[@class="css-m2nrxd"]    Individual country benefits
    
    #Select country to check pay as you go rates button
    Text Verification                                  xpath: //button[@class="css-7adpwj"]//span//span    Select country to check pay as you go rates
    Button Verification                                xpath://button[@class='css-7adpwj']
    #Note section with relevant text and a hyperlink
    #${NoteText}=    Get Text    //div[@class="css-11eiedl"]
    #Log To Console    ${NoteText}
    Text Verification                                  xpath: //div[@class="css-11eiedl"]    ${FiberTabSTDPlanNote}
    
    #Click on Select country to check pay as you go rates button
    Open Popup                                         xpath: //button[@class="css-7adpwj"]
    
    #Validate pop-up is present
    Wait For And Verify Element                        xpath://div[@id='popup_overlay']//div[@role='dialog']
    
    #Verify UI elements of Select country pop-up
    #Verify 'Select country text'
    Text Verification                                  xpath: //div[@class="css-3sw68w"]    Select country
    
    #verify 'Search bar'
    Wait For And Verify Element                        xpath: //input[@type="search"]
    
    #Verify 'List of countries below'
    Wait For And Verify Element                        xpath: ${SuggestedCountryPlan}
    
    #Search for a country name
    #Enter country name in search box
    Wait For And Input Text                            xpath: //input[@type="search"]    ${CountryNameForPlan}
    
    #Verify suggested country name is same as country name searched for
    Wait For And Verify Content                        xpath: ${SuggestedCountryPlan}    ${CountryNameForPlan}
    
    #Click on suggestion
    Wait For And Click Element                         xpath: ${SuggestedCountryPlan}
    
    #Verify results are for country name searched for
    Wait For And Verify Content                        xpath: //button[@class="css-190pa26"]    ${CountryNameForPlan}
    
    #User sees table of Area codes and Price with relevant data 
    Wait For And Verify Content                        xpath: //div[@class="css-9l52eh"]    Country Area codes
    Wait For And Verify Content                        xpath: //div[@class="css-1ty0z10"]    Price
    Wait For And Verify Element                        xpath: //div[@data-testid="areaCode"]
    
    #Click on hyperlink under Note section
    Wait For And Click Element                         xpath: //a[@href="https://www.jio.com/dl/topup"]
    
    #Confirm User is redirected to recharge page 
    #NOTE: Redirection to link may throw error beacause of bug it should redirect to Fiber tab of Recharge Section inside Fiber page
    URL Validation                                     https://www.jio.com/selfcare/recharge/fiber/    
