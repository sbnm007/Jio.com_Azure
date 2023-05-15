*** Settings ***
Library    SeleniumLibrary
Resource    ../../../Common.robot
Resource    ../../../Excel_Activity.robot
Resource    ../../../Local_Keywords.robot
Variables    ../../../Common_Variables.yaml
Variables    ../../../../Tests/Fiber/FRecharge_Variables.yaml

*** Keywords ***
Click on Mobile tab
    #Switch to mobile tab
    Wait For And Click Element                     xpath: //span[@class="j-selectors__item"][1]
    
    #Enter a correct Jio number 
    Wait For And Input Text                        xpath: //input[@id="submitNumber"]    ${COCP_OR_Postpaid_Number}
    
    #Click on Continue
    Redirect and continue                          xpath: //button[@aria-label="button Continue"]    https://www.jio.com/selfcare/recharge/mobility/plans/?serviceId=${COCP_OR_Postpaid_Number}&serviceType=mobility&next=PREPAID&billingType=POSTPAID    Sc_SelectPlanPage

Confirm UI, redirection on clicking Mobile tab and toast on entering Invalid Mobile number
    #Switch to mobile tab
    Wait For And Click Element                     xpath: //span[@class="j-selectors__item"][1]
    
    Verify UI and redirection on clicking Mobile tab
    
    #Input Incorrect Mobile Number
    Wait For And Input Text                        xpath: //input[@id='submitNumber']  ${Incorrect_No1}
    
    #Click on Continue Button
    Wait For And Click Element                     xpath: //button[@aria-label="button Continue"]
    
    #Verify a toast with message,"The number you have entered is not a valid JioFiberVoice number/service ID."
    Toast Capture and Data Validation    WrongMobileNoToast    xpath: //div[@class="field-error"]    ${WrongMobileNoToast}

Verify UI and redirection on clicking Mobile tab
    #Verify rupee symbol
    Wait For And Verify Element                    xpath://body/div[@id='__next']/div/div/div/section[@class='jds_desktopCont__1I8th j-container']/section[@class='j-container']/div[@class='j-container sp--m pd--all l-layout--full']/section[@class='j-container l-layout--centered']/span[2]
    
    #verify recharge text
    Text Verification                              xpath://h1[@class="j-text j-text-heading-xs"]          Recharge
    
    #Verify 'Enter your details to find the best prepaid plans' text
    Text Verification                              xpath://h2[@class="txt-align--center j-text j-text-body-xs"]        Enter your details to find the best prepaid plans.
    
    #Tab Switcher Verification
    Wait For And Verify Element                    //div[@class='jds_toggle__mrH_E j-selectors']
    #css verification of mobile tab
    CSS Verification                               xpath: //span[@class="switcher"]    background-color     rgba(15, 60, 201, 1)
    #clicking on JioFiber Tab
    Wait For And Click Element                     xpath:(//span[@class='content'])[2]
    CSS Verification                               xpath: //span[@class="switcher"]    background-color     rgba(15, 60, 201, 1)
    #Switch to mobile tab
    Wait For And Click Element                     xpath: //span[@class="j-selectors__item"][1]
    #Verfiying the Mobile Number field
    Wait For And Verify Element                    xpath://input[@id='submitNumber']
    
    #Verifying Grayed Out Continue Button
    Element Should Be Disabled                      xpath:(//button[@aria-label='button Continue'][normalize-space()='Continue'])[1]
    CSS Verification                                xpath:(//button[@aria-label='button Continue'][normalize-space()='Continue'])[1]    background-color    rgba(10, 40, 133, 1) 
    
    #verify Using JioLink? text and Recharge here hyperlink
    Text Verification                               xpath://div[@class="j-text j-text-body-s-bold"]          Using JioLink?
    
    #verify link
    Page Should Contain Link                        Recharge here
    
    #verify image 
    Image Verification                              xpath://img[@alt='Jio Recharge Online']
    
Verify UI elements and accordian functionality of Select plan and View details page mobile tab
    Click on Mobile tab
    
    # On left side of page
    #a. Select plan header
    Wait For And Verify Content                    xpath: //h1[normalize-space()='Select plan']    Select plan
    
    #b. Jio number text with user's number below
    Wait For And Verify Content                    xpath: //div[@class="field-group"]//div[@class="css-bcp9a3"]    Jio number
    Wait For And Verify Element                    xpath: //div[@class="field-group"]//input[@value=${COCP_OR_Postpaid_Number}]
    
    #c. Edit button
    Wait For And Verify Element                    xpath: //div[@class="css-6yr0zv"]//button[normalize-space()='Edit']
    
    #d. List of plan types in the following order :
    # New plan (Cricket plan) i. Popular plans ii. Annual plans iii. Data Add-On iv. No Daily Limit v. ISD vi. International Roaming vii. In-Flight Packs viii. value
    ${NoOfPlanTypes}=    Get Element Count         xpath: //div[@class="css-2bjzdr"]//button
    FOR    ${i}    IN RANGE    1    ${NoOfPlanTypes} 
            Wait For And Verify Content            xpath: //div[@class="css-2bjzdr"]//button[${i}]    ${SelectPlanPageContent}[${i}]
    END
    
    # 2. On right side of page
    #a. (plan-name) with accordion function
    ${NumberOfPlans} =    Get Element Count        xpath: //div[@class="css-1urkwwk"]
    Log To Console    ${NumberOfPlans}
    FOR    ${NoOfPlans}    IN RANGE    0    ${NumberOfPlans}
    
    #Verify Plan name
        Wait For And Verify Content                xpath: //span[normalize-space()='${NameOfPlans}[${NoOfPlans}]']    ${NameOfPlans}[${NoOfPlans}]
    
    #Verify Accordian function
        Wait For And Verify Element                xpath: //div[@class="css-1urkwwk"]//button[@id='${NoOfPlans}']
    END
    ${NoOfSubPlans}=    Get Element Count          xpath: //div[@id='panel_0']//div[@data-testid="plan"]
    FOR    ${SubPlans}    IN RANGE    1    ${NoOfSubPlans}+1
        
        #b. Plan cost
        Wait For And Verify Content                xpath: //div[@class="css-1q5nm3e"]//div[@class="css-1urkwwk"]//div[@id='panel_0']//div[@data-testid="plan"][${SubPlans}]//div[@data-testid="planCol"]//div[normalize-space()="PLAN"]    ${PlanPrice}[${0}]
        Wait For And Verify Content                xpath: //div[@class="css-1q5nm3e"]//div[@class="css-1urkwwk"]//div[@id='panel_0']//div[@data-testid="plan"][${SubPlans}]//div[@data-testid="planCol"]//div[2]//div   ${PlanPrice}[${SubPlans}]
        
        #c. Validity 
        Wait For And Verify Content                xpath: //div[@class="css-1q5nm3e"]//div[@class="css-1urkwwk"]//div[@id='panel_0']//div[@data-testid="plan"][${SubPlans}]//div[@data-testid="validityCol"]//div//div[normalize-space()="VALIDITY"]    ${PlanValidity}[${0}]
        Wait For And Verify Content                xpath: //div[@class="css-1q5nm3e"]//div[@class="css-1urkwwk"]//div[@id='panel_0']//div[@data-testid="plan"][${SubPlans}]//div[@data-testid="validityCol"]//span[1]    ${PlanValidity}[${SubPlans}]
        
        #d. Data
        Wait For And Verify Content                xpath: //div[@class="css-1q5nm3e"]//div[@class="css-1urkwwk"]//div[@id='panel_0']//div[@data-testid="plan"][${SubPlans}]//div[@data-testid="dataCol"]//div    ${PlanData}[${0}]
        Wait For And Verify Content                xpath: //div[@class="css-1q5nm3e"]//div[@class="css-1urkwwk"]//div[@id='panel_0']//div[@data-testid="plan"][${SubPlans}]//div[@data-testid="dataCol"]//span    ${PlanData}[${SubPlans}]
        Wait For And Verify Content                xpath: //div[@class="css-1q5nm3e"]//div[@class="css-1urkwwk"]//div[@id='panel_0']//div[@data-testid="plan"][${SubPlans}]//div[@data-testid="dataCol"]//div[@class="css-m62r2n"]    ${PlanData}[${SubPlans + 3}]
        
        #e. Subscriptions with two apps in preview
        Wait For And Verify Element                xpath: //div[@id='panel_0']//div[@data-testid="plan"][${SubPlans}]//div[@data-testid="subscriptions"]//div[normalize-space()='SUBSCRIPTIONS']
        FOR    ${appsIcon}    IN RANGE    1    3 
            Image Verification                     xpath: //div[@class="css-1q5nm3e"]//div[@class="css-1urkwwk"]//div[@id='panel_0']//div[@data-testid="plan"][${SubPlans}]//div[@data-testid="subscriptions"]//div[2]//div[1]//img[${appsIcon}]
        END
        
        #f. View details button
        Wait For And Verify Element                xpath: //div[@class="css-1q5nm3e"]//div[@class="css-1urkwwk"]//div[@id='panel_0']//div[@data-testid="plan"][${SubPlans}]//div[@class="css-ddnaeb"]//button[normalize-space()="View details"]
        
        #g. Buy button    
        Wait For And Verify Element                xpath: //div[@class="css-1q5nm3e"]//div[@class="css-1urkwwk"]//div[@id='panel_0']//div[@data-testid="plan"][${SubPlans}]//div[@class="css-ddnaeb"]//button[normalize-space()="Buy"]
    END
        
        #h. Terms & conditions hyperlink below last plan
        Wait For And Verify Element                xpath: //button[@class='css-ix7vbg']
    
    #Verify UI elements of View details Mobile Tab
    #Click on View 
    Open Popup                                     xpath: (//button[@type='button'][normalize-space()='View details'])[1]
    Sleep    200ms
    
    #Price of plan and data text over red background
    CSS Verification                               xpath: //div[@class="top-head-section w-100"]    background-image    radial-gradient(rgb(255, 50, 49), rgb(173, 0, 0))
    #${ViewDetailsHeading}=    Get Text    //div[@class="top-head-section w-100"]
    #Log To Console    ${ViewDetailsHeading}
    Text Verification                              xpath: //div[@class="top-head-section w-100"]     ${ViewDetailsDescription}[${0}]              
    
    #Details about the plan
    #${DetailsText}=    Get Text    //div[@class="row"]
    #Log To Console    ${DetailsText}
    Text Verification                               xpath: //div[@class="row"]    ${ViewDetailsDescription}[${1}]
    
    #Jio Apps & other subscriptions with app logos below
    Text Verification                              xpath: //div[@class="app-section-detail"]//div[@class="text-center title_app"]   ${ViewDetailsNote}[${0}]
    ${NoOfApps}=    Get Element Count              xpath: (//div[@class='app-set']//img)
    FOR    ${AppsNo}    IN RANGE    1        ${NoOfApps}+1
        Image Verification                         xpath: (//div[@class='app-set']//img)[${AppsNo}]
        Text Verification                          xpath: //li[normalize-space()='${ViewDetailsNote}[${AppsNo}]']    ${ViewDetailsNote}[${AppsNo}] 
    END
    
    #View details Note section with relevant text
    #${DetailsText}=    Get Text    (//div[@class="detail-section-notes-wrapper"])[1]
    #Log To Console    ${DetailsText}
    Text Verification                              xpath: (//div[@class="detail-section-notes-wrapper"])[1]    ${ViewDetailsNote}[${5}]
    #Text Verification                             xpath: //div[contains(text(),'*Unlimited 5G data for eligible subscribers')]    ${ViewDetailsNote}[${6}]
    #Click on Cross button
    Wait For And Verify Element                    xpath: //button[@aria-label='Close']    
    Close Popup                                    xpath: //button[@aria-label='Close']
    
    #Verify accordian functionalities  
    #Click on down arrow above buy button 
    Wait For And Click Element                     xpath: //button[@id='0']
    Sleep    500ms
    Element Attribute Verification                 xpath: //button[@id='0']   aria-expanded    false
    
    #Click on up arrow beside any of the plan tiles
    Wait For And Click Element                     xpath://button[@id='0']
    Sleep    500ms
    Element Attribute Verification                 xpath: //button[@id='0']   aria-expanded    true
    
    #Click on Buy button from any pack
    #Verify User is redirected to Payment Gateway page
    Redirect and continue                         xpath: //button[@class="css-r5gb33"]     https://www.jio.com/selfcare/recharge/mobility/plans/?serviceId=${COCP_OR_Postpaid_Number}&serviceType=mobility&next=PREPAID&billingType=POSTPAID     Sc_paymentsgateway
    Go To                                         https://www.jio.com/selfcare/recharge/mobility/plans/?serviceId=${COCP_OR_Postpaid_Number}&serviceType=mobility&next=PREPAID&billingType=POSTPAID
    #Click on Terms & conditions hyperlink below last plan
    Wait For And Click Element                     xpath: //button[@class='css-ix7vbg']

Verify UI and Content elements of ISD tab
    Click on Mobile tab
    #Edit Button redirection
    Redirection On Clicking                        xpath://button[normalize-space()='Edit']    https://www.jio.com/selfcare/recharge/mobility/?serviceId=${COCP_OR_Postpaid_Number}&serviceType=mobility&next=PREPAID&billingType=POSTPAID&action=edit    Sc_Editbuttonredirection
    #Click on ISD from list of plan types    
    Wait For And Click Element                     xpath: //button[@class="css-1k2fqmw"][5]
    
    #Global ISD Pack with plan tile below
    Text Verification                              xpath: //span[@class="css-g88c3e"]    Global ISD Pack
    Wait For And Verify Element                    xpath: //div[@id="panel_0"]
    
    #Individual country benefits
    Text Verification                              xpath: //h3[@class="css-m2nrxd"]    Individual country benefits
    
    #Select country to check pay as you go rates button
    Text Verification                              xpath: //button[@class="css-7adpwj"]//span//span    Select country to check pay as you go rates
    Button Verification                            xpath://button[@class='css-7adpwj']
    #Note section with relevant text and a hyperlink
    #${NoteText}=    Get Text    //div[@class="css-11eiedl"]
    #Log To Console    ${NoteText}
    Text Verification                               xpath: //div[@class="css-11eiedl"]    ${STDPlanNote}
    Link Verification                               xpath://a[@href="https://www.jio.com/dl/billpay"]
    #Click on Select country to check pay as you go rates button
    Open Popup                                     xpath: //button[@class="css-7adpwj"]
    
    #Validate pop-up is present
    Wait For And Verify Element                    xpath://div[@id='popup_overlay']//div[@role='dialog']
    
    #Verify UI elements of Select country pop-up
    #Verify 'Select country text'
    Text Verification                              xpath: //div[@class="css-3sw68w"]    Select country
    
    #verify 'Search bar'
    Wait For And Verify Element                    xpath: //input[@type="search"]
    
    #Verify 'List of countries below'
    Wait For And Verify Element                    xpath: ${SuggestedCountryPlan}

    #Search for a country name
    #Enter country name in search box
    Wait For And Input Text                        xpath: //input[@type="search"]    ${CountryNameForPlan}
    
    #Verify suggested country name is same as country name searched for
    Wait For And Verify Content                    xpath: ${SuggestedCountryPlan}    ${CountryNameForPlan}
    
    #Click on suggestion
    Wait For And Click Element                     xpath: ${SuggestedCountryPlan}
    
    #Verify results are for country name searched for
    Wait For And Verify Content                    xpath: //button[@class="css-190pa26"]    ${CountryNameForPlan}
    
    #User sees table of Area codes and Price with relevant data 
    Wait For And Verify Content                    xpath: //div[@class="css-9l52eh"]    Country Area codes
    Wait For And Verify Content                    xpath: //div[@class="css-1ty0z10"]    Price
    Wait For And Verify Element                    xpath: //div[@data-testid="areaCode"]
    
    #Click on hyperlink under Note section
    Wait For And Click Element                     xpath: //a[@href="https://www.jio.com/dl/billpay"]
    
    #confirm User is redirected to PayBills page 
    URL Validation    ${PayBill}

Verify UI elements of International Roaming tab
    Click on Mobile tab
    
    #Click on International Roaming from list of plan types
    Wait For And Click Element                     xpath: //button[@class="css-1k2fqmw"][6]
    
    #User sees plans under International Roaming
    Wait For And Verify Content                    xpath: //div[@class="css-1nskagl"]    ${IRPlanHeading}[${0}]
    Wait For And Verify Content                    xpath: //div[@class="css-th8yc3"]    ${IRPlanHeading}[${1}]
    
    #Verify UI
    #1. Select country button.
    Button Verification                            xpath: //button[normalize-space()='Select country']   
    Wait For And Verify Content                    xpath: //button[normalize-space()='Select country']    ${IRPlanHeading}[${2}] 
    #2. Note section with text relevant to it 
    Text Verification                              xpath: //div[@class='css-1v25hyj']   ${IRPlanNote}[${0}]
    ${NoOfNotes}=    Get Element Count             xpath: //div[@class='css-1i0w6zo']//ol[@data-testid="irnote-ul"]//li
    FOR    ${i}    IN RANGE    1    ${NoOfNotes}+1  
        Text Verification                          xpath: //div[@class='css-1i0w6zo']//ol[@data-testid="irnote-ul"]//li[${i}]    ${IRPlanNote}[${i}]
    END
    
    #3. Two Terms and conditions hyperlinks
    ${NoOfHyperlinks}=    Get Element Count        xpath: //button[@class="css-ix7vbg"]
    ${j}=    Evaluate    5
    FOR    ${i}    IN RANGE    1    ${NoOfHyperlinks}+1
        Text Verification                          xpath: //button[@class="css-ix7vbg"][${i}]    ${IRPlanNote}[${j}]
        ${j}=    Evaluate    ${j} + 1
    END
    
    #Click on Select country(s) filter 
    Wait For And Click Element                     xpath: //button[normalize-space()='Select country']
    
    #User is redirected to Filter pop-up
    Wait For And Verify Element                    xpath: //div[@id='popup_overlay']//div[@role='dialog']
    
    #Verify UI
    # 1. Select country text
    Text Verification                              xpath: //div[@class="css-3sw68w"]    ${IRPlanHeading}[${3}]
    
    # 2. Search bar
    Wait For And Verify Element                    xpath: //input[@type='search']
    
    # 3. List of countries below
    Wait For And Verify Element                    xpath: ${SuggestedCountryPlan}
    
    # 4.Clear and Submit button
    Wait For And Verify Element                    xpath: //button[normalize-space()='Clear']
    Wait For And Verify Element                    xpath: //button[normalize-space()='Submit']
    
    #Select more than 10 countries from filter 
    FOR    ${CountryNo}    IN RANGE    1    12    
        Wait For And Click Element                 xpath: (//button[@role="checkbox"])[${CountryNo}]        
    END
    
    #User gets toast with message, "Max 10 countries can be selected"
    
    Wait For And Verify Content                    xpath: //div[@data-testid="toast"]//span    ${IRPlanHeading}[${4}]
    
    #Verify cross button in toast
    Wait For And Verify Element                    xpath: //div[@data-testid="toast"]//button[@aria-label="close"]
    Take Page Screenshot                                IRPlanToast
    
    #Click on Clear button
    Wait For And Click Element                     xpath: //button[normalize-space()='Clear']
    
    #Check mark on selected countries disappear
    ${TotalNoOfCountries}=    Get Element Count    xpath: //button[@role="checkbox"]
    ${DeselectedCountries}=   Get Element Count    xpath: //div[@class="css-1f16dmn"]//button[@aria-checked="false"]
    Should Be Equal    ${TotalNoOfCountries}    ${DeselectedCountries}
    
    #Search for a country name
    Wait For And Input Text                        xpath: //input[@type='search']    ${CountryNameForPlan}
    
    #User is shown relevant search results
    Wait For And Verify Content                    xpath: ${SuggestedCountryPlan}    ${CountryNameForPlan}
    
    #Select any country from filter
    Wait For And Click Element                     xpath: //button[@role="checkbox"]
    
    #Click on Submit button
    Wait For And Click Element                     xpath: //button[normalize-space()='Submit']
    
    #User sees the data in Standard PayGo Rates table changes to the selected country
    #Verify heading of section
    Wait For And Verify Content                    xpath: //div[@class="css-ttqbcl"]//h3    ${IRPlanHeading}[${5}]
    
    #Verify table presence
    Wait For And Verify Element                    xpath: //div[@class="css-1g0zq10"]
    
    #Verify data in Standard PayGo Rates table changes to the selected country
    Wait For And Verify Content                    xpath: //div[@class="css-1bfagly"]    Country
    Wait For And Verify Content                    xpath: //div[@data-testid="rateRow"]//div[1]    ${CountryNameForPlan}
