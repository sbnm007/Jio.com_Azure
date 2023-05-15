*** Settings ***
Library     SeleniumLibrary
Resource    ../../../Common.robot
Resource    ../../../Excel_Activity.robot
Resource    ../../../Local_Keywords.robot

*** Keywords ***
#TC ID: 91892-91910
Popular JioFiber Plans Validation
    #Scrolling to Popular JioFiber Plans 
    Scroll To                               xpath://h2[normalize-space()='Popular JioFiber plans']

    #Popular JioFiber plans Section Verification
    Section Verification                    xpath://section[@class='j-container bg--primary-20']    Popular JioFiber plans
    
    #Verifying heading
    Text Verification                       xpath://h2[normalize-space()='${PopularJFP}[0]']        ${PopularJFP}[0]
    
    #Verifying text below heading
    Text Verification                       xpath://div[normalize-space()='${PopularJFP}[1]']    ${PopularJFP}[1]
    
    #Verifying switch tab between prepaid and postpaid
    Wait For and Verify Element             xpath://ul[@class='tab-list justify-content-center bg--secondary-grey-20 d-inline-block']
    
    #To Verify Postpaid Tab Text
    Text Verification                       xpath=//a[@role='tab'][normalize-space()='Postpaid']       ${PopularJFP}[2]
    
    #To Verify Prepaid Tab Text 
    Text Verification                       xpath=//a[@role='tab'][normalize-space()='Prepaid']        ${PopularJFP}[3]

    #Visibility of 3 tiles
    Wait For And Verify Element             xpath://div[@id='jio-postpaid']//div[contains(@class,'overflow-scroll-max-width')]


    #Verifying View all postpaid plans button
    Button Verification                     xpath://button[normalize-space()='View all postpaid plans']
    
    UI Verification of Popular JioFiber plans- Postpaid     
    UI Verification of Popular JioFiber plans- Prepaid     

UI Verification of Popular JioFiber plans- Postpaid     
    #To Verify Postpaid Toggle button Selected by Default 
    Wait Until Element Is Enabled           xpath=//a[@aria-selected="true"][normalize-space()='Postpaid'] 
    CSS Verification                        xpath=//a[@aria-selected="true"][normalize-space()='Postpaid']        background-color        rgba(15, 60, 201, 1)
    
    #To Verify Three cards Section 
    Section Verification                    xpath=//div[@id='jio-postpaid']//section[contains(@class,'j-container')]        Postpaid3Cards
    ${i}    Set Variable  0
    WHILE    ${i}!=3
        Wait For And Verify Element         xpath=(//div[contains(@class,'w-100')])[1${i}]  
        ${i}=       Evaluate     ${i} + 1
    END
    
    #To Verify View Details Pop-Up 
    Button Verification                     xpath=(//button[@class='j-button j-button-size__medium tertiary'])[1]
    Text Verification                       xpath=(//button[@class='j-button j-button-size__medium tertiary'])[1]        ${PopularJFP}[4]
    
    #Open View Details Pop-Up
    Open Popup                              xpath=(//button[@class='j-button j-button-size__medium tertiary'])[1]
    
    #To Verify Cross Button 
    Button Verification                     xpath=//button[@data-popup-close='plan-detail-modal']
    
    #To Verify Plan Tag
    Text Verification                       xpath=//div[contains(@class,'j-listBlock__block-text')]//div[contains(@class,'j-badge j-badge-size__small')]        ${PopularJFP}[5]
   
    #To Verify Plan Price (₹499 and +GST)
    Text Verification                       xpath=//div[contains(@class,'j-contentBlock j-contentBlock__size-xxs')]//h3[contains(@class,'j-contentBlock__title j-heading j-text-heading-m')][contains(text(),'₹499')]        ${PopularJFP}[6]
    Text Verification                       xpath=//div[contains(@class,'j-contentBlock j-contentBlock__size-xxs')]//div[contains(@class,'j-text-body-xs j-color-primary-grey-80 sp--xs pd--left')][normalize-space()='+GST']        ${PopularJFP}[7]
   
    #To Verify Details Text
    Text Verification                       xpath=//div[normalize-space()='Details']        ${PopularJFP}[8]
   
    #To Verify Plan validity, Speed, Data, Voice and On-demand TV
    ${j}        Set Variable    1
    ${k}        Set Variable    0
    WHILE  ${j}!=6
        Scroll To                           xpath=//table[contains(@class,'column-divider j-table j-text-body-s relaxed simple w-100')] 
        Text Verification                   xpath=//tbody/tr[${j}]    ${PostpaidPlans_Text}[${k}]
        ${j}    Evaluate    ${j}+1
        ${k}    Evaluate    ${k}+1
    END
    
    #To Verify Subscriptions  Text 
    Text Verification                       xpath=//div[normalize-space()='Subscriptions']        ${PopularJFP}[9]
    
    #To Verify List of OTT Subscriptions 
    Scroll To                               xpath=//div[@class='j-grid equal-width-grid']
    ${l}    Set Variable    1
    ${m}    Set Variable    0
    WHILE  ${l}!=8
        Text Verification                   xpath=(//div[contains(@class,'txt-align--center')])[${l}]       ${SubscriptText}[${m}]
        Image Verification                  xpath=//img[@alt='${SubscriptText}[${m}]']
        ${l}    Evaluate    ${l}+1  
        ${m}    Evaluate    ${m}+1 
    END   
    
    #To Verify Note and Note pointers
    Scroll To                               xpath=//div[@class='j-contentBlock__description j-text j-text-body-xxs']
    Text Verification                       xpath=//div[@class='j-contentBlock__description j-text j-text-body-xxs']        ${PopularJFP}[10]
   
    #To Verify Book Now button
    Button Verification                     xpath=//button[@aria-label='Primary Text']
    
    #Close View Details Pop-Up
    Close Popup                             xpath=//button[@data-popup-close='plan-detail-modal']
    
    #To Verify View all Postpaid plans button redirection
    Button Verification                     xpath=//button[normalize-space()='View all postpaid plans']
    Text Verification                       xpath=//button[normalize-space()='View all postpaid plans']        ${PopularJFP}[11]
    Redirection On Clicking                 xpath=//button[normalize-space()='View all postpaid plans']        ${Urls_PoJioFiber}[0]        PostpaidPlansPage
   
    #To Verify Book Now button redirection
    Button Verification                     xpath=(//button[@class='j-button j-button-size__medium primary'])[1]
    Text Verification                       xpath=(//button[@class='j-button j-button-size__medium primary'])[1]        ${PopularJFP}[12]
    Redirection On Clicking                 xpath=(//button[@class='j-button j-button-size__medium primary'])[1]        ${Urls_PoJioFiber}[2]        GetJioFiberPage

UI Verification of Popular JioFiber plans- Prepaid 
    #Clicking on Discover
    Wait For And Click Element              xpath://a[@cust-url='/fiber'][normalize-space()='Discover']

    #Scrolling down to Prepaid Tab into view and clicking it
    Scroll To                               xpath=//a[@role='tab'][normalize-space()='Prepaid']
    Wait For And Click Element              xpath=//a[@role='tab'][normalize-space()='Prepaid']   
    Css Verification                        xpath://a[@role='tab'][normalize-space()='Prepaid']    background-color    rgba(15, 60, 201, 1)    

    #Scrolling to View Details button
    Scroll To                               xpath:(//button[@class='j-button j-button-size__medium tertiary'])[4]
    
    #To Verify View Details Pop-Up button 
    Button Verification                     xpath=(//button[@class='j-button j-button-size__medium tertiary'])[4]
    Text Verification                       xpath=(//button[@class='j-button j-button-size__medium tertiary'])[4]        ${PopularJFP}[4]       

    #Open View Details Pop-Up
    Open Popup                              xpath=(//button[@class='j-button j-button-size__medium tertiary'])[4]
    
    #To Verify View Details Pop-Up
    Wait For And Verify Element             xpath=//div[@id='plan-detail-modal']//div[@class='j-modal-container']
    Take Element Screenshot                 xpath=//div[@id='plan-detail-modal']//div[@class='j-modal-container']        ViewDetailPop-Up SectionVerified
   
    #Verifying close button
    Wait For And Verify Element             xpath://div[@id='plan-detail-modal']//header[contains(@class,'j-modal-header')]//button[contains(@aria-label,'button')]

    #Verifying Plan tag
    Text Verification                       xpath://div[contains(@class,'j-listBlock__block-text')]//span[contains(@class,'j-text j-text-body-xxs-bold')][normalize-space()='POPULAR PLAN']        POPULAR PLAN

    #Verifying Plan price
    Text Verification                       xpath://div[contains(@class,'d-flex align-items-center')]//h3[contains(@class,'j-contentBlock__title j-heading j-text-heading-m')][contains(text(),'₹999')]    ₹999

    #To Verify Plan validity, Speed, Data, Voice
    ${j}        Set Variable    1
    ${k}        Set Variable    0
    WHILE  ${j}!=5
        Scroll To                           xpath=//table[contains(@class,'column-divider j-table j-text-body-s relaxed simple w-100')] 
        Text Verification                   xpath=//tbody/tr[${j}]    ${PrepaidPlans_Text}[${k}]
        ${j}    Evaluate    ${j}+1
        ${k}    Evaluate    ${k}+1
    END

    #Verifying Subscriptions
    Scroll To                               xpath://div[normalize-space()='Subscriptions']
    Wait For And Verify Element             xpath://div[contains(@class,'j-grid equal-width-grid')]

    #To Verify List of OTT Subscriptions 
    Scroll To                               xpath=//div[@class='j-grid equal-width-grid']
    ${l}    Set Variable    1
    ${m}    Set Variable    0
    FOR     ${l}     IN RANGE    1    17
        Scroll To                           xpath=//div[@class="j-card__children"]//img[@alt='${sub_text_1}[${m}]']
        Text Verification                   xpath=(//div[contains(@class,'txt-align--center')])[${l}]       ${sub_text_1}[${m}]
        IF  "${sub_text_1}[${m}]" == "Disney+ Hotstar"
            Image Verification              xpath=(//img[@alt='${sub_text_1}[${m}]'])[5]
        ELSE IF  "${sub_text_1}[${m}]" == "ZEE5"
            Image Verification              xpath=(//img[@alt='${sub_text_1}[${m}]'])[3]
        ELSE
            Image Verification              xpath=//img[@alt='${sub_text_1}[${m}]']
        END
        #${l}    Evaluate    ${l}+1  
        ${m}    Evaluate    ${m}+1 
    END   
    
    #Opening Recharge Pop-Up from inside of View Details Pop-Up
    Wait For And Click Element             xpath=//div[@class='j-modal-buttons']//button[@aria-label='button'][normalize-space()='Recharge']
    
    #Close Recharge Pop-Up
    Wait For And Click Element             xpath=//button[@data-popup-close='modal-quickrechargewithplan']

    #Open View details pop up
    Open Popup                             xpath=(//button[@class='j-button j-button-size__medium tertiary'])[4] 

    #Open Recharge Pop-Up 
    Wait For And Click Element             xpath=//div[@class='j-modal-buttons']//button[@aria-label='button'][normalize-space()='Recharge']

    #Verifying header
    Text Verification                      xpath://h5[normalize-space()='Quick Recharge']             ${PopularJFP}[13]

    #Verifying text below header
    Text Verification                      xpath://div[@class='j-contentBlock__description j-text-body-xs j-color-primary-grey-80']        ${PopularJFP}[14]

    #To Verify Invalid No.
    Enter Number and Proceed               xpath=//input[@id='quick-recharge-user-number']        ${Incorrect_No2}        xpath=//button[normalize-space()='Continue']
    
    #To Verify Invalid No. Error Toast
    Text Verification                      xpath=//span[normalize-space()='Please enter an active Jio number.']        Please enter an active Jio number.            
    
    #To Verify Clear Button
    Wait For And Click Element             xpath://span[@class='input-icon input-icon-suffix clickable clear-btn']
   
    #Verifying Mobile Number Field
    Wait For And Verify Element            xpath://input[@id='quick-recharge-user-number']

    #Verifying Inactive Continue button
    Element Should Be Disabled             xpath://button[normalize-space()='Continue']      

    #Enter Number in Mobile number field
    Wait For And Input text                xpath://input[@id='quick-recharge-user-number']            ${COCP_OR_Postpaid_Number}   

    #Verifying Cross button in Input field
    Wait For And Verify Element            xpath://span[@class='input-icon input-icon-suffix clickable clear-btn']
    Wait for And Click Element             xpath://span[@class='input-icon input-icon-suffix clickable clear-btn']

    #Verifying Mobile Number Field
    Wait For And Verify Element            xpath://input[@id='quick-recharge-user-number']

    #Verifying Continue button is disabled when input field is cleared
    Element Should Be Disabled             xpath://button[normalize-space()='Continue']  

    #Enter Number in Mobile number field
    Wait For And Input text                xpath://input[@id='quick-recharge-user-number']            ${COCP_OR_Postpaid_Number}   

    #Verifying Continue button is enabled
    Wait Until Element Is Enabled          xpath://button[normalize-space()='Continue']   

    #To Verify Invalid No.
    Enter Number and Proceed               xpath=//input[@id='quick-recharge-user-number']        ${Incorrect_No2}        xpath=//button[normalize-space()='Continue']
    
    #To Verify Invalid No. Error Toast
    Text Verification                      xpath=//span[normalize-space()='Please enter an active Jio number.']        Please enter an active Jio number.            
    
    #To Verify Clear Button
    Wait For And Click Element             xpath=//span[@class='input-icon input-icon-suffix clickable clear-btn']
   
    #To Verify Correct No.
    Enter Number and Proceed               xpath=//input[@id='quick-recharge-user-number']        ${Fiber_No}        xpath=//button[normalize-space()='Continue']
    
    #To Verify URL of Continue button redirection (Top Trending Plans Page)
    Text Verification                      xpath=//p[@class='css-173t8lh']    Amount Payable   
    #Sleep    500ms
    
    #Going back from Payments page is unstable. Therefore 'Go To' is used.
    Go To    ${Sub_NavBar_URLs}[0]

    Scroll To                              xpath=//div[@class="jds-tabs jds-tabs-filled jds-tabs-radius override_tab"]
    Wait For And Click Element             xpath=//a[@role='tab'][normalize-space()='Prepaid']    

    #To Verify View all Prepaid plans button redirection
    Redirection On Clicking                xpath=//button[normalize-space()='View all prepaid plans']        ${Urls_PoJioFiber}[1]        PrepaidPlansPage
