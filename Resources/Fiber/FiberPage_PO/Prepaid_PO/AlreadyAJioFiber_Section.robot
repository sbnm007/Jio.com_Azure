*** Settings ***
Library        SeleniumLibrary
Resource    ../../../Common.robot

*** Keywords ***

Already a JioFiber user? 

    #To Verify Already a JioFiber user section
    Scroll To                               xpath=//section[@class='fiber-prepaid-plans_flexDisplay__2MPQD j-container l-layout--flex']
    Section Verification                    xpath=//section[@class='fiber-prepaid-plans_flexDisplay__2MPQD j-container l-layout--flex']        AlreadyAJioFiberUser
    
    #Checking all the buttons redirection under Already a JioFiber user section
    ${i}    Set Variable    0
    WHILE  ${i}!=7
        Scroll To                           xpath=//button[@aria-label='button ${PlanButtons}[${i}]']
        Redirection On Clicking             xpath=//button[@aria-label='button ${PlanButtons}[${i}]']        ${PlanUrls}[${i}]        ${PlanButtons}[${i}]PlansPage
        ${i}    Evaluate    ${i}+1
    END

Monthly Subscription Page Validation


    #To Verify Monthly button and redirection
    Scroll To                               xpath=//section[@class="fiber-prepaid-plans_flexDisplay__2MPQD j-container l-layout--flex"]//button[@aria-label='button Monthly'] 
    Wait For And Click Element              xpath=//section[@class="fiber-prepaid-plans_flexDisplay__2MPQD j-container l-layout--flex"]//button[@aria-label='button Monthly']
    URL Validation                          ${PlanUrls}[3]

    #To Verify Filter Pop-Up
    Filter Button Verification
    
    #To Verify Continue Button is Enabled after entering No.
    Open Popup                              xpath=//section[@class='j-container l-breakpoint--desktop']//button[@class="j-button j-button-size__medium primary"]
    Check Continue Button Enabled           xpath=//input[@type='tel']        xpath=//button[normalize-space()='Continue']        ${Fiber_No}
    Close Popup                             xpath=//div[@class='j-modal j-modal-visible j-modal-closable j-modal-size-s j-modal-kind-informational']//button[@aria-label='button']
    
    #To Verify Recharge pop-up verification for all plans
    ${i}    Set Variable    1
    WHILE  ${i}!=8
        Open Popup                          xpath=(//button[@aria-label='button'][normalize-space()='Recharge'])[${i}]
        Wait For And Verify Element         xpath=//div[@class='j-text j-text-heading-xs']
        # Verifying Rupee symbol
        Wait For And Verify Element         xpath=//span[@class='j-icon j-icon__bg']
        #Click on input text box
        Wait For And Click Element          xpath=//input[@type='tel']
        #Enter incorrect number 
        Wait For And Input Text             xpath=//input[@type='tel']                                    ${Incorrect_No1}
        #Click on Continue button
        Wait For And Click Element          xpath=//button[@aria-label="button Continue"]
        #Checking Error message
        Wait For And Verify Content         xpath=//div[@class='txt-align--left j-text j-text-body-s']    ${Invalid_Num_Error}
        # Verifying the 'X' button
        Wait For And Verify Element         xpath=//div[@class='j-modal j-modal-visible j-modal-closable j-modal-size-s j-modal-kind-informational']//button[@aria-label='button']
        Close Popup                         xpath=//div[@class='j-modal j-modal-visible j-modal-closable j-modal-size-s j-modal-kind-informational']//button[@aria-label='button']
        ${i}            Evaluate            ${i}+1
    END
    
    #To Verify Veiw details pop-up UI elements for all plans
    View Details Popup UI Verification      ${PContent}       ${Re_Button}       ${C_Button}
    
View Details Popup UI Verification    [Arguments]     ${PopUp_Content}     ${Recharge_Button}     ${Cross}
    ${j}    Set Variable    1  
    WHILE  ${j}!=8 
        Reload Page 
        Scroll To                           xpath=(//button[@aria-label='button'][normalize-space()='View details'])[${j}]  
        Wait Until Keyword Succeeds         30sec  1sec          Open Popup      xpath=(//button[@aria-label='button'][normalize-space()='View details'])[${j}]
        ${PlansText}=    Get Text       ${PopUp_Content}
        
        #Use below mentioned keywords only once
        #Write Excel Cell    row_num=4    col_num=${j}    value=${PlansText}    sheet_name=Fiber_Prepaid
        #Save Excel Document        filename=Resources/JioWeb.xlsx

        #Already a JioFiber User?
        ${MonthlyPlansText}             Read Excel Cell         row_num=4    col_num=${j}    sheet_name=Fiber_Prepaid
        #Sticky Tag,Amount,Details Table,Subscription and Notes
        Wait For And Verify Element     ${PopUp_Content}
        Wait For And Verify Content     ${PopUp_Content}        ${MonthlyPlansText}     
        #Recharge Button
        
        #Click X button
        Wait Until Keyword Succeeds     30sec  1sec             Close Popup                  ${Cross}
        ${j}    Evaluate    ${j}+1 
    END
        
    #To Verify View Details (Recharge Button Validation)
    ${k}    Set Variable    1
    WHILE  ${k}!=8
        #Scrolling To each Plan Card to Click on View Details
        Scroll To                               xpath=(//button[@aria-label='button'][normalize-space()='View details'])[${k}]
        Wait For And Verify Element             xpath=(//button[@aria-label='button'][normalize-space()='View details'])[${k}]
        Open Popup                              xpath=(//button[@aria-label='button'][normalize-space()='View details'])[${k}]
        #Click Recharge button
        Wait For And Click Element              ${Re_Button}
        Wait For And Verify Element             xpath=//div[@class='j-text j-text-heading-xs']
        Close Popup                             xpath=//div[@class='j-modal j-modal-visible j-modal-closable j-modal-size-s j-modal-kind-informational']//button[@aria-label='button']
        ${k}    Evaluate    ${k}+1
    END
    
    #To Verify More Information section and buttons-Plan Packs,ISD Packs & ISD Packs  
    Scroll To                                   xpath=//section[@class='j-container l-breakpoint--desktop']//div[contains(text(),'Plan Voucher')]
    ${index} =  Set Variable  0
    FOR  ${button}  IN  Plan Voucher  ISD Packs  T&C
        Wait For And Click Element              xpath=//section[@class='j-container l-breakpoint--desktop']//div[contains(text(),'${button}')]  
        IF  '${button}' == 'T&C'            
            Wait For And Verify Element         xpath=//h5[normalize-space()='Terms and conditions']           
            Take Page Screenshot                Sc_Name=${button}_Confirmation
            Scroll To                           xpath=//li[contains(text(),'The customer can avail only one Jio STB per connec')]
            Close Popup                         xpath=//div[@aria-label='Modal Terms and conditions']//button[@aria-label='button']        
            Go Back
        ELSE           
            ${index} =  Evaluate                expression=${index} + 1  
            Take Page Screenshot                ${index}PDF Opened
        END    
    END


Quarterly Subscription Page Validation  

 
    #To Verify Quarterly text
    Scroll To                                   xpath=//section[@class="fiber-prepaid-plans_flexDisplay__2MPQD j-container l-layout--flex"]//button[@aria-label='button Quarterly']
    Wait For And Click Element                  xpath=//section[@class="fiber-prepaid-plans_flexDisplay__2MPQD j-container l-layout--flex"]//button[@aria-label='button Quarterly']
    Wait For And Verify Content                 xpath=//section[@class='j-container l-breakpoint--desktop']//h1[@class='Filter_category__2vFb8 j-text j-text-heading-l'][normalize-space()='Quarterly']        Quarterly
    
    #To Verify Other Prepaid plans button
    Wait For And Verify Content                 xpath=//section[@class='j-container l-breakpoint--desktop']//button[@aria-label='button'][normalize-space()='Other Prepaid plans']        Other Prepaid plans
   
    #Click on Quarterly Filter Button
    Wait For And Click Element                  xpath=//section[@class='j-container l-breakpoint--desktop']//button[@class="j-button j-button-size__large secondary icon-primary icon-only"]
    
    #Verify Filter Pop-up is opened 
    Wait For And Verify Element                 xpath=//div[@class='j-modal j-modal-visible j-modal-closable j-modal-size-m j-modal-kind-dialog']//h4[@class='FilterPopup_heading__3xFzU j-heading j-text-heading-xs'][normalize-space()='Filter']
   
    #Closing Filter Pop-up
    Wait For And Click Element                  xpath=//div[@class='j-modal j-modal-visible j-modal-closable j-modal-size-m j-modal-kind-dialog']//header[@class='j-modal-header']//button[@aria-label='button']

    #To Verify Other Prepaid Plans 
    Wait For And Verify Content                 xpath=//section[@class='j-container l-breakpoint--desktop']//div[@class='changeCategory_moreInfo__2QPjV j-text j-text-heading-l'][normalize-space()='Other Prepaid plans']        Other Prepaid plans
    Section Verification                        xpath=//section[@class='j-container l-breakpoint--desktop']//section[@class='changeCategory_flexDisplay__1bVGH j-container l-layout--flex']        OtherPrepaidPlans
    
    #To Verify More Information
    Wait For And Verify Content                 xpath=//section[@class='j-container l-breakpoint--desktop']//div[@class='MoreInformation_moreInfo__2qAx3 j-text j-text-heading-s'][normalize-space()='More information']        More information
    Section Verification                        xpath=//section[@class='j-container l-breakpoint--desktop']//div[@class='MoreInformation_buttonCont__1bLIb']        MoreInformation        
    
    #To Verify Footer 
    Section Verification                        xpath=//div[@class='j-footer-menu j-grid']        Footer
    
    #To Verify Filter Pop-Up
    Filter Button Verification
    
#Confirm UI and content of all plan cards in Quarterly plan section
    Prepaid Quarterly Plan Cards UI Verification                    (//section[@class="j-container l-breakpoint--desktop"]//section[@class="j-container bg--primary-20 l-radius--xl"])    xpath=(//section[@class="j-container l-breakpoint--desktop"]//button[@aria-label='button'][normalize-space()='Recharge'])    xpath=(//section[@class="j-container l-breakpoint--desktop"]//button[@aria-label='button'][normalize-space()='View details'])
        
Prepaid Quarterly Plan Cards UI Verification      [Arguments]     ${PopUp_Content}     ${Recharge_Button}     ${View_Details}  
            ${z}    Set Variable    1    
            WHILE  ${z}!=8        
                Scroll To                       xpath=(//section[@class="j-container l-breakpoint--desktop"]//section[@class="j-container bg--primary-20 l-radius--xl"])[${z}]
                #Wait Until Keyword Succeeds    30sec  1sec  Open Popup  xpath=(//button[@aria-label='button'][normalize-space()='View details'])[${j}]
                ${PlansText}=    Get Text       xpath=(//section[@class="j-container l-breakpoint--desktop"]//section[@class="j-container bg--primary-20 l-radius--xl"])[${z}]
                #Use below mentioned keywords only once        
                #Write Excel Cell               row_num=8    col_num=${z}    value=${PlansText}    sheet_name=Fiber_Prepaid    
                #Save Excel Document            filename=Resources/JioWeb.xlsx        
                
                #Already a JioFiber User?        
                ${MonthlyPlansText}             Read Excel Cell        row_num=8   col_num=${z}    sheet_name=Fiber_Prepaid
                #Sticky Tag,Amount,Details Table,Subscription and Notes        
                Wait For And Verify Element     xpath=${PopUp_Content}        
                Wait For And Verify Content     xpath=(//section[@class="j-container l-breakpoint--desktop"]//section[@class="j-container bg--primary-20 l-radius--xl"])[${z}]      ${MonthlyPlansText}     
                #Recharge Button        
                Scroll To                       xpath=(//section[@class="j-container l-breakpoint--desktop"]//button[@aria-label='button'][normalize-space()='Recharge'])[${z}]   
                
                #View Details Button    
                ${z}                            Evaluate    ${z}+1    
            END
       
    ${j}     Set Variable    1 
    ${VB}    Set Variable    0
    WHILE   ${j}!=8
        
        #Verifying Recharge button is present
        Wait For And Verify Content            xpath=//section[@class="j-container l-breakpoint--desktop"]//button[@class="j-button j-button-size__medium primary"]    Recharge
        
        #Click on Recharge button
        Wait For And Click Element             xpath=(//section[@class="j-container l-breakpoint--desktop"]//button[@class="j-button j-button-size__medium primary"])[${j}]
       
        #Verify Recharge Popup has opened
        Wait For And Verify Content            xpath=//div[@class="j-text j-text-heading-xs"]    Recharge
        IF    ${VB}==0
            #Disabled Continue button
            Wait For And Verify Element        xpath=//button[@class="j-button j-button-size__medium primary disabled"]
        END
        
        #Enter Invalid Number, Validate Error
        Wait For And Click Element             xpath=//input[@type="tel"]
        
        #Enter Incorrect number
        Wait For And Input Text                xpath=//input[@type="tel"]                                    ${Incorrect_No1}
       
        #Click on Continue number
        Wait For And Click Element             xpath=//button[@aria-label="button Continue"]
       
        #Validate Error message
        Wait For And Verify Content            xpath=//div[@class="txt-align--left j-text j-text-body-s"]    ${Invalid_Num_Error}
       
        #Close Recharge Popup
        Wait For And Click Element             xpath=//div[@class='j-modal j-modal-visible j-modal-closable j-modal-size-s j-modal-kind-informational']//button[@aria-label='button']
       
        #View Details button
        Wait For And Verify Content            xpath=//section[@class="j-container l-breakpoint--desktop"]//button[@class="j-button j-button-size__medium tertiary"]    View details
        Scroll To                              xpath=(//section[@class="j-container l-breakpoint--desktop"]//button[@class="j-button j-button-size__medium tertiary"])[${j}]
       # Wait For And Click Element            xpath=(//section[@class="j-container l-breakpoint--desktop"]//button[@class="j-button j-button-size__medium tertiary"])[${j}]

        ${VB}=   Evaluate     ${VB} + 1 
        ${j}=   Evaluate     ${j} + 1 
    END   
    
    #Confirm UI of Recharge pop-up of Prepaid Quarterly plans
        Quarterly Recharge Pop-up Verification                 xpath=//div[@class='j-modal j-modal-visible j-modal-closable j-modal-size-s j-modal-kind-informational']//div[@class='j-modal-container']//div//div[@class='j-modal-body']    xpath=//div[@class='j-modal j-modal-visible j-modal-closable j-modal-size-s j-modal-kind-informational']//div[@class='j-modal-container']//button[@aria-label="button Continue"]    xpath=//div[@class='j-modal j-modal-visible j-modal-closable j-modal-size-s j-modal-kind-informational']//div[@class='j-modal-container']//div//button[@aria-label='button']
        
        #Verifying Continue button gets enabled on entering number in field
        ${VB}=    Set Variable    0
        WHILE  ${VB}<7
            
            #Click on Recharge button
            Scroll To                            xpath=(//section[@class="j-container l-breakpoint--desktop"]//button[@class="j-button j-button-size__medium primary"])[${VB}+${1}]    
            Wait For And Click Element           xpath=(//section[@class="j-container l-breakpoint--desktop"]//button[@class="j-button j-button-size__medium primary"])[${VB}+${1}]
            
            #Click on Number Field
            Wait For And Click Element           xpath=//div[@class="j-field input-tel"]
            
            #Enter number in Input field
            Wait For And Input Text              xpath=//input[@type="tel"]    ${Fiber_No}
            
            #Enabled Continue button
            Element Should Be Enabled            xpath=//button[@class="j-button j-button-size__medium primary"][@aria-label="button Continue"]
            
            #Click on Pop-up Close button
            Wait For And Click Element           xpath=//div[@class='j-modal j-modal-visible j-modal-closable j-modal-size-s j-modal-kind-informational']//button[@aria-label='button']
            ${VB}=   Evaluate     ${VB} + 1
        END    
   
    #Confirm the UI and content of Prepaid Quarterly View details pop-up card
        Scroll To                                xpath=(//section[@class="j-container l-breakpoint--desktop"]//button[@class="j-button j-button-size__medium tertiary"])[1]
        Quarterly View Details Popup UI Verification                            xpath=//div[@class='j-modal j-modal-visible j-modal-closable j-modal-size-s planDetailsPopup j-modal-kind-dialog']//div[@class='j-modal-container']    xpath=//div[@class='j-modal j-modal-visible j-modal-closable j-modal-size-s planDetailsPopup j-modal-kind-dialog']//div[@class='j-modal-container']//div//div[@class='j-modal-body']//button[@aria-label='button']    xpath=//div[@class='j-modal j-modal-visible j-modal-closable j-modal-size-s j-modal-kind-informational']//div[@class='j-modal-container']//div//button[@aria-label='button']
        
        #Verifying Redirection of Recharge button in View Details Pop-up
        ${p}=    Set Variable    0
        WHILE  ${p} < 7
            
            #Scroll View Details buttons on Plan Cards into view
            Scroll To                            xpath=(//section[@class="j-container l-breakpoint--desktop"]//button[@class="j-button j-button-size__medium tertiary"])[${p}+${1}] 
            
            #Clicking on View Details
            Wait For And Click Element           xpath=(//section[@class="j-container l-breakpoint--desktop"]//button[@class="j-button j-button-size__medium tertiary"])[${p}+${1}]    
            
            #Clicking on Recharge button in View Details Pop-up
            Scroll To                            xpath=//div[@class='j-modal j-modal-visible j-modal-closable j-modal-size-s planDetailsPopup j-modal-kind-dialog']//div[@class='j-modal-container']//div//div[@class='j-modal-body']//button[@aria-label='button']
            Wait For And Click Element           xpath=//div[@class='j-modal j-modal-visible j-modal-closable j-modal-size-s planDetailsPopup j-modal-kind-dialog']//div[@class='j-modal-container']//div//div[@class='j-modal-body']//button[@aria-label='button']
            
            #Closing Recharge Pop-up when redirected from View Details Pop=up
            Close Popup                          xpath=//div[@class='j-modal j-modal-visible j-modal-closable j-modal-size-s j-modal-kind-informational']//div[@class='j-modal-container']//div//button[@aria-label='button']
            ${p}=                                Evaluate     ${p} + 1
        END
    
    # To Check Redirection of Quaterly More Information Buttons
        
        #Scrolling down to More information section
        Scroll To                                xpath=//section[@class="j-container l-breakpoint--desktop"]//div[@class="MoreInformation_buttonCont__1bLIb"]
        
        #Clicking on Plan Packs button
        Wait For And Click Element               xpath=//section[@class='j-container l-breakpoint--desktop']//button[@aria-label='button'][normalize-space()='Plan Voucher']
        
        #Changing Tab back to Quarterly Page
        Change Tab                               Prepaid Broadband Plans & Offers - JioFiber Prepaid Plans
        
        #Clicking on ISD Packs Page
        Wait For And Click Element               xpath=//section[@class='j-container l-breakpoint--desktop']//button[@aria-label='button'][normalize-space()='ISD Packs']
        
        #Changing Tab back to Quarterly Page
        Change Tab                               Prepaid Broadband Plans & Offers - JioFiber Prepaid Plans
        
        #Clicking on T&C button
        Wait For And Click Element               xpath=//section[@class='j-container l-breakpoint--desktop']//button[@aria-label='button'][normalize-space()='T&C']
        
        #Verifying T&C Pop-up opened
        Close Popup                              xpath=//h5[normalize-space()='Terms and conditions']
        
        #Closing T&C Pop-up
        Wait For And Click Element               xpath=//div[@aria-label='Modal Terms and conditions']//button[@aria-label='button']
        
        #Go Back
        Go Back
    
Quarterly Recharge Pop-up Verification    [Arguments]     ${PopUp_Content}     ${Continue_Button}     ${Cross} 
        ${j}    Set Variable    1    
        WHILE  ${j}!=8        
            Scroll To                            xpath=(//section[@class='j-container l-breakpoint--desktop']//section[@class="j-container bg--primary-20 l-radius--xl"])[${j}]  
            
            #Wait Until Keyword Succeeds            30sec  1sec  
            Open Popup                           xpath=(//section[@class='j-container l-breakpoint--desktop']//button[@class="j-button j-button-size__medium primary"])[${j}]
            ${PlansText}=    Get Text            ${PopUp_Content}
            
            # #Use below mentioned keywords only once        
            #Write Excel Cell                    row_num=12    col_num=${j}    value=${PlansText}    sheet_name=Fiber_Prepaid       
            #Save Excel Document                 filename=Resources/JioWeb.xlsx        
            
            #Already a JioFiber User?        
            ${MonthlyPlansText}                  Read Excel Cell        row_num=12    col_num=${j}    sheet_name=Fiber_Prepaid       
            
            #Sticky Tag,Amount,Details Table,Subscription and Notes        
            Wait For And Verify Element           ${PopUp_Content}
            Wait For And Verify Content           ${PopUp_Content}      ${MonthlyPlansText}  
            
            #Verify Rupee Symbol is present
            Wait For And Verify Element           xpath=//span[@class='j-icon j-icon__bg']
            
            #Verify Placeholder is present in Input field
            Wait For And Verify Element           xpath=//label[normalize-space()='JioFiber number']
            
            #Continue Button        
            Wait For And Verify Element           xpath=//section[@class='j-container']//button[@aria-label='button Continue']
            
            #Click X button        
            Wait Until Keyword Succeeds           30sec  1sec        Close Popup         ${Cross}
            ${j}                                  Evaluate    ${j}+1    
        END 
    
Quarterly View Details Popup UI Verification    [Arguments]     ${PopUp_Content}     ${Recharge_Button}     ${Cross} 
        ${j}    Set Variable    1    
        Reload Page
        WHILE  ${j}!=8        
            Scroll To                             xpath=(//button[@aria-label='button'][normalize-space()='View details'])[${j}]  
            Wait Until Keyword Succeeds           30sec  1sec         Open Popup      xpath=(//button[@aria-label='button'][normalize-space()='View details'])[${j}]
            ${PlansText}=    Get Text             ${PopUp_Content}
            
            #Use below mentioned keywords only once        
            #Write Excel Cell                     row_num=10    col_num=${j}    value=${PlansText}    sheet_name=Fiber_Prepaid
            #Save Excel Document                  filename=Resources/JioWeb.xlsx        
            
            #Already a JioFiber User?        
            ${MonthlyPlansText}                   Read Excel Cell        row_num=10    col_num=${j}    sheet_name=Fiber_Prepaid
            
            #Sticky Tag,Amount,Details Table,Subscription and Notes        
            Wait For And Verify Element           ${PopUp_Content}
            Wait For And Verify Content           ${PopUp_Content}      ${MonthlyPlansText}     
            
            #Recharge Button        
            Scroll To                             ${Recharge_Button}
            Wait For And Click Element            xpath=//div[@class='j-modal j-modal-visible j-modal-closable j-modal-size-s planDetailsPopup j-modal-kind-dialog']//div[@class='j-modal-container']//div//div[@class='j-modal-body']//button[@aria-label='button']
            Wait For And Verify Content                     xpath=//div[@class='j-text j-text-heading-xs']    Recharge
            
            #Click X button        
            Wait Until Keyword Succeeds           30sec  1sec    Close Popup     ${Cross}
            ${j}                                  Evaluate    ${j}+1    
        END
       


Semi-Annual Subscription Page Validation 

   
    #To Verify Semi-Annual
    Scroll To                                     xpath=//section[@class="fiber-prepaid-plans_flexDisplay__2MPQD j-container l-layout--flex"]//button[@aria-label='button Semi-Annual']
    Wait For And Click Element                    xpath=//section[@class="fiber-prepaid-plans_flexDisplay__2MPQD j-container l-layout--flex"]//button[@aria-label='button Semi-Annual']
    Wait For And Verify Content                   xpath=//section[@class='j-container l-breakpoint--desktop']//h1[@class='Filter_category__2vFb8 j-text j-text-heading-l'][normalize-space()='Semi-Annual']        Semi-Annual
    
    #To Verify Other Prepaid plans button
    Wait For And Verify Element                   xpath=//section[@class='j-container l-breakpoint--desktop']//button[@aria-label='button'][normalize-space()='Other Prepaid plans']      
    
    #To Verify Filter button
    Wait For And Verify Element                   xpath=//section[@class='j-container l-breakpoint--desktop']//div[@class='Filter_filter__2yX0Z']//button[@class="j-button j-button-size__large secondary icon-primary icon-only"]
    
    #To Verify Plans Cards 
    ${l}    Set Variable    1    
    WHILE  ${l}!=7
        Scroll To                                 xpath=(//div[@class='Subcategory_gridCont__2F4Pm'])[${l}]
        
        #Recharge button
        Wait For And Verify Element               xpath=//section[@class='j-container l-breakpoint--desktop']//button[@aria-label='button'][normalize-space()='Recharge']
        Wait For And Verify Content               xpath=//section[@class='j-container l-breakpoint--desktop']//button[@aria-label='button'][normalize-space()='Recharge']        Recharge
        
        #View Details button
        Wait For And Verify Element               xpath=//button[@aria-label='button'][normalize-space()='View details']        
        Wait For And Verify Content               xpath=//button[@aria-label='button'][normalize-space()='View details']        View details
        ${l}    Evaluate    ${l}+1
    END
    
    #To Verify Other Prepaid Plans 
    Wait For And Verify Element                   xpath=//section[@class='j-container l-breakpoint--desktop']//div[@class='changeCategory_moreInfo__2QPjV j-text j-text-heading-l'][normalize-space()='Other Prepaid plans']        
    Section Verification                          xpath=//section[@class='j-container l-breakpoint--desktop']//section[@class='changeCategory_flexDisplay__1bVGH j-container l-layout--flex']        OtherPrepaidPlans
    
    #To Verify More Information
    Wait For And Verify Element                   xpath=//section[@class='j-container l-breakpoint--desktop']//div[@class='MoreInformation_moreInfo__2qAx3 j-text j-text-heading-s'][normalize-space()='More information']        
    Section Verification                          xpath=//section[@class='j-container l-breakpoint--desktop']//div[@class='MoreInformation_buttonCont__1bLIb']        MoreInformation        
    
    #To Verify PlanPacks, ISD and T&C buttons


    #Click on Filter Pop-Up   
    Scroll To                                     xpath=//section[@class='j-container l-breakpoint--desktop']//div[@class='Filter_header__EkHAT']//button[2]
    Open Popup                                    xpath=//section[@class='j-container l-breakpoint--desktop']//div[@class='Filter_header__EkHAT']//button[2]
    
    #Verifying Filter Pop-up is opened
    Section Verification                          xpath=//div[@class='j-modal j-modal-visible j-modal-closable j-modal-size-m j-modal-kind-dialog']//div[@class='j-modal-container']        FilterPopUp    
   
    #Verifying Cross Button is present in Filter Pop-up
    Wait For And Verify Element                   xpath=//div[@class='j-modal j-modal-visible j-modal-closable j-modal-size-m j-modal-kind-dialog']//div[@class='j-modal-container']//div//header[@class='j-modal-header']//button[@aria-label='button']    
    
    #Verifying List Of Plans With Check Box is present in Filter Pop-up    
    ${i}    Set Variable    1    
    ${j}    Set Variable    0    
    WHILE  ${i}!=7        
        Wait For And Verify Element               xpath=(//div[@class="switch-checkbox-root"])[${i}]
        Wait For And Verify Content               xpath=(//div[@class="switch-checkbox-root"])[${i}]        ${Plan_Speeds}[${j}]
        ${i}    Evaluate    ${i}+1        
        ${j}    Evaluate    ${j}+1    
    END    
    
    #Verifying Show Plans Button is present in Filter Pop-up    
    Wait For And Verify Element                  xpath=//div[@class='j-modal j-modal-visible j-modal-closable j-modal-size-m j-modal-kind-dialog']//button[@aria-label='button'][normalize-space()='Show plans']         
    
    #Verifying Clear filter Button is present in Filter Pop-up     
    Wait For And Verify Element                  xpath=//div[@class='j-modal j-modal-visible j-modal-closable j-modal-size-m j-modal-kind-dialog']//button[@aria-label='button'][normalize-space()='Clear filter']        

#Confirm plans are filtered only after clicking on Show plans button on JioFiber Prepaid Semi-Annual page    #92301,92302,92303,92304
    
    #Selecting multiple Plans from Filter - 30 Mbps, 100 Mbps, 150 Mbps, 1Gbps 
    Wait For And Click Element                   xpath=//div[@class='j-modal j-modal-visible j-modal-closable j-modal-size-m j-modal-kind-dialog']//div[@class='j-modal-container']//div//span[@aria-label='30 Mbps']
    Wait For And Click Element                   xpath=//div[@class='j-modal j-modal-visible j-modal-closable j-modal-size-m j-modal-kind-dialog']//div[@class='j-modal-container']//div//span[@aria-label='100 Mbps']
    Wait For And Click Element                   xpath=//div[@class='j-modal j-modal-visible j-modal-closable j-modal-size-m j-modal-kind-dialog']//div[@class='j-modal-container']//div//span[@aria-label='150 Mbps']
    Wait For And Click Element                   xpath=//div[@class='j-modal j-modal-visible j-modal-closable j-modal-size-m j-modal-kind-dialog']//div[@class='j-modal-container']//div//span[@aria-label='1 Gbps']
   
    #Close Popup without applying Filter
    Close Popup                                  xpath=//div[@class='j-modal j-modal-visible j-modal-closable j-modal-size-m j-modal-kind-dialog']//header[@class='j-modal-header']//button[@aria-label='button']
   
    #Verifying 30 Mbps, 100 Mbps, 150 Mbps 1Gbps plans are not visible
    Element Should Not Be Visible                xpath=//section[@class='j-container l-breakpoint--desktop']//button[@class="j-tag active clickable"][normalize-space()='30 Mbps']
    Element Should Not Be Visible                xpath=//section[@class='j-container l-breakpoint--desktop']//button[@class="j-tag active clickable"][normalize-space()='100 Mbps']
    Element Should Not Be Visible                xpath=//section[@class='j-container l-breakpoint--desktop']//button[@class="j-tag active clickable"][normalize-space()='150 Mbps']
    Element Should Not Be Visible                xpath=//section[@class='j-container l-breakpoint--desktop']//button[@class="j-tag active clickable"][normalize-space()='1 Gbps']
   
    #Click on Filter button
    Open Popup                                   xpath=//section[@class='j-container l-breakpoint--desktop']//div[@class='Filter_header__EkHAT']//button[2]
   
    #Click Show Plans button
    Wait For And Click Element                   xpath=//div[@class='j-modal j-modal-visible j-modal-closable j-modal-size-m j-modal-kind-dialog']//button[@aria-label='button'][normalize-space()='Show plans']
   
    #Verifying All selected plans are Visible (30 Mbps, 100 Mbps, 150 Mbps, 1Gbps)
    Element Should Be Visible                    xpath=//section[@class='j-container l-breakpoint--desktop']//button[@class="j-tag active clickable"][normalize-space()='30 Mbps']
    Element Should Be Visible                    xpath=//section[@class='j-container l-breakpoint--desktop']//button[@class="j-tag active clickable"][normalize-space()='100 Mbps']
    Element Should Be Visible                    xpath=//section[@class='j-container l-breakpoint--desktop']//button[@class="j-tag active clickable"][normalize-space()='150 Mbps']
    Element Should Be Visible                    xpath=//section[@class='j-container l-breakpoint--desktop']//button[@class="j-tag active clickable"][normalize-space()='1 Gbps']
    
    #Count of Plans after applying filter
    Element Should Be Visible                    xpath=//section[@class='j-container l-breakpoint--desktop']//div[@class='Filter_moreResults__1_4b6 j-text j-text-body-m']
   
    #Clicking on 30 Mbps and 1Gbps X button
    Wait For And Click Element                   xpath=//section[@class='j-container l-breakpoint--desktop']//div[@class='j-text j-text-body-s'][normalize-space()='30 Mbps']
    Wait For And Click Element                   xpath=//section[@class='j-container l-breakpoint--desktop']//div[@class='j-text j-text-body-s'][normalize-space()='1 Gbps']
   
    #Verifying 30 Mbps, 1Gbps plans are not visible
    Element Should Not Be Visible                xpath=//section[@class='j-container l-breakpoint--desktop']//div[@class='Subcategory_heading__3Y18a j-text j-text-heading-m'][normalize-space()='30 Mbps']
    Element Should Not Be Visible                xpath=//section[@class='j-container l-breakpoint--desktop']//div[@class='Subcategory_heading__3Y18a j-text j-text-heading-m'][normalize-space()='1 Gbps']
   
    #Click on Filter button
    Open Popup                                   xpath=//section[@class='j-container l-breakpoint--desktop']//div[@class='Filter_header__EkHAT']//button[2]
   
    #Click on Clear Filter button
    Wait For And Click Element                   xpath=//div[@class='j-modal j-modal-visible j-modal-closable j-modal-size-m j-modal-kind-dialog']//button[@aria-label='button'][normalize-space()='Clear filter']
   
    #Click Show Plans button
    Wait For And Click Element                   xpath=//div[@class='j-modal j-modal-visible j-modal-closable j-modal-size-m j-modal-kind-dialog']//button[@aria-label='button'][normalize-space()='Show plans']
   
    #100 Mbps, 150Mbps plans should be removed from Filter and not be visible 
    Element Should Not Be Visible                xpath=//section[@class='j-container l-breakpoint--desktop']//button[@class="j-tag active clickable"][normalize-space()='100 Mbps']
    Element Should Not Be Visible                xpath=//section[@class='j-container l-breakpoint--desktop']//button[@class="j-tag active clickable"][normalize-space()='150 Mbps']

#Confirm UI and content of all plan cards in Semi-Annual plan section
    ${VB}  Set Variable   1
    ${i}  Set Variable    1    
    WHILE  ${VB} < 8
        
        #Text Validation of Plan Cards
        ${PlansText}=            Get Text        xpath=(//section[@class="j-container l-breakpoint--desktop"]//section[@class="j-container bg--primary-20 l-radius--xl"])[${VB}]
        
        #Use below mentioned keywords only once        
        #Write Excel Cell                        row_num=30    col_num=${i}    value=${PlansText}    sheet_name=Fiber_Prepaid
        #Save Excel Document                     filename=Resources/JioWeb.xlsx 
        ${E_Details}=                            Read Excel Cell          row_num=30      col_num=${i}    sheet_name=Fiber_Prepaid
        Should Be Equal                          ${PlansText}    ${E_Details}
        
        #Scroll particular Plan Card into view
        Scroll To                                xpath=(//section[@class="j-container l-breakpoint--desktop"]//section[@class="j-container bg--primary-20 l-radius--xl"])[${VB}]
        
        #Verify Plan Card Heading is present 
        Wait Until Element Is Visible            xpath=(//section[@class="j-container l-breakpoint--desktop"]//div[@class="PlanName_planText__26L0a j-text j-text-heading-m"])[${VB}]
        
        #Verify Recharge button is present on plan cards
        Element Should Be Visible                xpath=(//section[@class="j-container l-breakpoint--desktop"]//button[@class="j-button j-button-size__medium primary"][normalize-space()='Recharge'])[${VB}]
        
        #Click on Recharge button
        Wait For And Click Element               xpath=(//section[@class="j-container l-breakpoint--desktop"]//button[@class="j-button j-button-size__medium primary"][normalize-space()='Recharge'])[${VB}]
        
        #Verifying Rupee Symbol is present
        Element Should Be Visible                xpath=//div[@class='j-modal j-modal-visible j-modal-closable j-modal-size-s j-modal-kind-informational']//div[@class='j-modal-body']
        
        #Verifying Recharge Popup heading 
        Wait For And Verify Element              xpath=//div[@class='j-text j-text-heading-xs'][normalize-space()='Recharge']
        
        #Verifying Input Field is present
        Element Should Be Visible                xpath=//div[@class="j-field input-tel"]//label[@class="field-label"][normalize-space()='JioFiber number']
        
        #Recharge Popup Wait For And Verify Content
        ${RechargePopup}=            Get Text    xpath=//div[@class='j-modal j-modal-visible j-modal-closable j-modal-size-s j-modal-kind-informational']//div[@class='j-modal-body']
        
        #Use below mentioned keywords only once 
        # Write Excel Cell                       row_num=34    col_num=${i}    value=${RechargePopup}    sheet_name=Fiber_Prepaid
        # Save Excel Document                    filename=Resources/JioWeb.xlsx
        ${JioFiber_Prepaid_SemiAnnual_Recharge}=                     Read Excel Cell                row_num=34    col_num=${i}        sheet_name=Fiber_Prepaid
        Should Be Equal                          ${RechargePopup}    ${JioFiber_Prepaid_SemiAnnual_Recharge}        
        
        #Verifying Continue button is disabled in first Recharge popup
        IF  ${VB}==1
            Element Should Be Disabled           xpath=//button[normalize-space()='Continue']
        END
        
        #Entering Number in Text Field
        Wait For And Click Element               xpath=//input[@type='tel']
        Wait For And Input Text                  xpath=//input[@type='tel']                                     ${Incorrect_No1}
        
        #Verifying Continue Button is Enabled on entering number in Input Field
        Element Should Be Enabled                xpath=//button[@class="j-button j-button-size__medium primary"][@aria-label="button Continue"]
        
        #Clicking on Continue button
        Wait For And Click Element               xpath=//button[@class="j-button j-button-size__medium primary"][@aria-label="button Continue"]
        
        #Validating Error message
        Wait For And Verify Content              xpath=//div[@class='txt-align--left j-text j-text-body-s']    ${Invalid_Num_Error}    
        
        #Close Recharge Popup
        Close Popup                              xpath=//div[@class='j-modal j-modal-visible j-modal-closable j-modal-size-s j-modal-kind-informational']//button[@aria-label='button']
        
        #Verify View Details button is present on plan cards
        Element Should Be Visible                xpath=(//section[@class="j-container l-breakpoint--desktop"]//section[@class="j-container bg--primary-20 l-radius--xl"]//button[@class="j-button j-button-size__medium tertiary"][normalize-space()='View details'])[${VB}]
        
        #Open View Details Popup
        Open Popup                               xpath=(//section[@class="j-container l-breakpoint--desktop"]//section[@class="j-container bg--primary-20 l-radius--xl"]//button[@class="j-button j-button-size__medium tertiary"][normalize-space()='View details'])[${VB}]    
        
        #Verify View Details Popup is opened
        Wait For And Verify Element              xpath=//div[@class='j-modal j-modal-visible j-modal-closable j-modal-size-s planDetailsPopup j-modal-kind-dialog']//h4[@class='detailsTable_details__21D4X j-heading j-text-heading-xxs'][normalize-space()='Details']
        
        #View Details Pop-up Text Validation
        ${E_View_Details}=           Get Text    xpath=//div[@class='j-modal j-modal-visible j-modal-closable j-modal-size-s planDetailsPopup j-modal-kind-dialog']//div[@class='j-modal-container']//div
        
        #Use below mentioned keywords only once 
        #Write Excel Cell                        row_num=32    col_num=${i}    value=${E_View_Details}    sheet_name=Fiber_Prepaid
        #Save Excel Document                     filename=Resources/JioWeb.xlsx
        ${Read_View_Details}=                    Read Excel Cell    row_num=32    col_num=${i}        sheet_name=Fiber_Prepaid
        Should Be Equal                          ${E_View_Details}                ${Read_View_Details}
        
        #Clicking on Recharge button in View Details Pop-up
        Scroll To                                xpath=//div[@class='j-modal j-modal-visible j-modal-closable j-modal-size-s planDetailsPopup j-modal-kind-dialog']//div[@class='j-modal-container']//div//div[@class='j-modal-body']//button[@aria-label='button']
        Wait For And Click Element               xpath=//div[@class='j-modal j-modal-visible j-modal-closable j-modal-size-s planDetailsPopup j-modal-kind-dialog']//div[@class='j-modal-container']//div//div[@class='j-modal-body']//button[@aria-label='button']
        
        #Verifying Recharge Pop-up opened
        Wait Until Element Is Visible            xpath=//div[@class='j-text j-text-heading-xs'][normalize-space()='Recharge']
        Sleep    200ms
        
        #Close Recharge Popup
        Close Popup                              xpath=//div[@class='j-modal j-modal-visible j-modal-closable j-modal-size-s j-modal-kind-informational']//button[@aria-label='button']
        
        #Verifying Subscriptions are present in Plan Cards
        IF  ${i}>2
            ${visiblity_Subscriptions}=          Run Keyword And Return Status        Wait Until Element Is Visible        xpath=//section[@class="j-container l-breakpoint--desktop"]//div[@class="Details_subscriptionStyle__1ibDI"]
            IF    ${visiblity_Subscriptions}==True
                Wait For And Verify Element      xpath=//section[@class='j-container l-breakpoint--desktop']//div[@class="Details_subscriptionStyle__1ibDI"]
                ${i}=                            Evaluate        ${i} + 1 
            END 
        END
        ${VB}=   Evaluate     ${VB} + 1   
        ${i}=    Evaluate     ${i} + 1  
    END

#Confirm redirection of all buttons under More Information section
    
    #To Check Redirection of Semi-Annual More Information Buttons
    Scroll To                                   xpath=//section[@class="j-container l-breakpoint--desktop"]//div[@class="MoreInformation_buttonCont__1bLIb"]
   
    #Clicking on Plan Packs button
    Wait For And Click Element                  xpath=//section[@class='j-container l-breakpoint--desktop']//button[@aria-label='button'][normalize-space()='Plan Voucher']
   
    #Changing Tab back to Semi-Annual Page
    Change Tab                                  Prepaid Broadband Plans & Offers - JioFiber Prepaid Plans
  
    #Clicking on ISD Packs Page
    Wait For And Click Element                  xpath=//section[@class='j-container l-breakpoint--desktop']//button[@aria-label='button'][normalize-space()='ISD Packs']
   
    #Changing Tab back to Semi-Annual Page
    Change Tab                                  Prepaid Broadband Plans & Offers - JioFiber Prepaid Plans
   
    #Clicking on T&C button
    Wait For And Click Element                  xpath=//section[@class='j-container l-breakpoint--desktop']//button[@aria-label='button'][normalize-space()='T&C']
   
    #Verifying T&C Pop-up opened
    Wait For And Verify Element                 xpath=//h5[normalize-space()='Terms and conditions']

    #Go Back
    Go Back

Annual Subscription Page Validation


    #To Verify Jio Fiber Annual Plan
    Scroll To                                   xpath=//section[@class="fiber-prepaid-plans_flexDisplay__2MPQD j-container l-layout--flex"]//button[@aria-label='button Annual']
    Wait For And Click Element                  xpath=//section[@class="fiber-prepaid-plans_flexDisplay__2MPQD j-container l-layout--flex"]//button[@aria-label='button Annual']
    Wait For And Verify Content                 xpath=//section[@class='j-container l-breakpoint--desktop']//h1[@class='Filter_category__2vFb8 j-text j-text-heading-l'][normalize-space()='JioFiber Annual Plan']        JioFiber Annual Plan
   
    #To Verify Other Prepaid plans button  
    Wait For And Verify Element                 xpath=//section[@class='j-container l-breakpoint--desktop']//button[@aria-label='button'][normalize-space()='Other Prepaid plans']      
    
    #To Verify Filter button
    Wait For And Verify Element                 xpath=//section[@class='j-container l-breakpoint--desktop']//div[@class='Filter_filter__2yX0Z']//button[@class="j-button j-button-size__large secondary icon-primary icon-only"]
    
    #Plans Cards 
    ${l}    Set Variable    1    
    WHILE  ${l}!=7
        Scroll To                               xpath=(//div[@class='Subcategory_gridCont__2F4Pm'])[${l}]
        
        #Recharge button
        Wait For And Verify Element             xpath=//button[@aria-label='button'][normalize-space()='Recharge']        
        
        #View Details button
        Wait For And Verify Element             xpath=//button[@aria-label='button'][normalize-space()='View details']       
        ${l}    Evaluate    ${l}+1
    END
    
    #To Verify Other Prepaid Plans 
    Wait For And Verify Element                 xpath=//section[@class='j-container l-breakpoint--desktop']//div[@class='changeCategory_moreInfo__2QPjV j-text j-text-heading-l'][normalize-space()='Other Prepaid plans']     
    Section Verification                        xpath=//section[@class='j-container l-breakpoint--desktop']//section[@class='changeCategory_flexDisplay__1bVGH j-container l-layout--flex']        OtherPrepaidPlans
    
    #To Verify More Information
    Wait For And Verify Element                 xpath=//section[@class='j-container l-breakpoint--desktop']//div[@class='MoreInformation_moreInfo__2qAx3 j-text j-text-heading-s'][normalize-space()='More information']      
    Section Verification                        xpath=//section[@class='j-container l-breakpoint--desktop']//div[@class='MoreInformation_buttonCont__1bLIb']        MoreInformation       
    
    #To Verify PlanPacks, ISD and T&C buttons
    

    #Information Section
    Section Verification                        xpath=//div[@style="padding-top: 3.125rem;"]     Information
    
    #To Verify FAQ's Section
    Section Verification                        xpath=//section[@class='j-container l-breakpoint--desktop']//h3[@class='j-heading j-text-heading-m'][normalize-space()='FAQ']       FAQ's

    #Open Filter Pop-up  
    Filter Button Verification
#92322
    Prepaid Annual Plan Cards UI Verification   xpath=(//section[@class="j-container l-breakpoint--desktop"]//section[@class="j-container bg--primary-20 l-radius--xl"])    xpath=(//section[@class="j-container l-breakpoint--desktop"]//button[@aria-label='button'][normalize-space()='Recharge'])    xpath=(//section[@class="j-container l-breakpoint--desktop"]//button[@aria-label='button'][normalize-space()='View details'])

Prepaid Annual Plan Cards UI Verification    
    [Arguments]     ${PopUp_Content}     ${Recharge_Button}     ${View_Details} 
    ${z}    Set Variable    1    
    WHILE  ${z}!=8        
        Scroll To                               xpath=(//section[@class="j-container l-breakpoint--desktop"]//section[@class="j-container bg--primary-20 l-radius--xl"])[${z}]
        
        #Wait Until Keyword Succeeds            30sec  1sec  Open Popup  xpath=(//button[@aria-label='button'][normalize-space()='View details'])[${j}]
        ${PlansText}=    Get Text               xpath=(//section[@class="j-container l-breakpoint--desktop"]//section[@class="j-container bg--primary-20 l-radius--xl"])[${z}]
        
        #Use below mentioned keywords only once        
        #Write Excel Cell                       row_num=22    col_num=${z}    value=${PlansText}    sheet_name=Fiber_Prepaid    
        #Save Excel Document                    filename=Resources/JioWeb.xlsx        
        
        #Already a JioFiber User?        
        ${MonthlyPlansText}                     Read Excel Cell        row_num=22    col_num=${z}    sheet_name=Fiber_Prepaid    
        
        #Sticky Tag,Amount,Details Table,Subscription and Notes        
        Wait For And Verify Element             ${PopUp_Content}        
        Wait For And Verify Content             xpath=(//section[@class="j-container l-breakpoint--desktop"]//section[@class="j-container bg--primary-20 l-radius--xl"])[${z}]      ${MonthlyPlansText}     
        
        #Recharge Button        
        Scroll To                               xpath=(//section[@class="j-container l-breakpoint--desktop"]//button[@aria-label='button'][normalize-space()='Recharge'])[${z}]   
        Wait For And Verify Element             ${Recharge_Button}
        
        #View Details Button    
        Wait For And Verify Element             ${View_Details}
        ${z}                                    Evaluate    ${z}+1    
    END
    
    #Confirm redirection of Recharge button of all plans card on Annual page    
    #Click On Recharge
    Scroll To                                   xpath=(//button[@class="j-button j-button-size__medium primary"])[1] 
    Wait For And Click Element                  xpath=(//button[@class="j-button j-button-size__medium primary"])[1]
    
    #verify rupee Symbol
    Wait For And Verify Element                 xpath=//span[@class="j-icon j-icon__bg"]                   
   
    #Verify Jio Fiber Number Text
    Page Should Contain                         Enter your JioFiber number
   
    #Verifying Placeholder is present
    Wait For And Verify Content                 xpath=//label[normalize-space()='JioFiber number']        JioFiber number
   
    #Verify Continue Button
    Element Should Be Disabled                  xpath=//button[@aria-label='button Continue']   
    
    #close button
    Wait For And Click Element                  xpath=//div[@class='j-modal j-modal-visible j-modal-closable j-modal-size-s j-modal-kind-informational']//button[@aria-label='button']
   
    ${VB}  Set Variable   1    
    WHILE  ${VB} < 8
        #Scroll To to Plan Cards
        Scroll To                               xpath=(//section[@class="j-container l-breakpoint--desktop"]//section[@class="j-container bg--primary-20 l-radius--xl"])[${VB}]
       
        #Verifying Recharge button is present on Plan Cards
        Wait For And Verify Content             xpath=(//section[@class="j-container l-breakpoint--desktop"]//button[@class="j-button j-button-size__medium primary"])[${VB}]    Recharge
       
        #Clicking on Recharge button
        Wait For And Click Element              xpath=(//section[@class="j-container l-breakpoint--desktop"]//button[@class="j-button j-button-size__medium primary"])[${VB}]
        
        #Verifying Recharge Pop-up is opened
        Wait For And Verify Element             xpath=//div[@class="j-text j-text-heading-xs"]
        Wait For And Verify Content             xpath=//div[@class="j-text j-text-heading-xs"]             Recharge
       
        #Entering Invalid Number in Input field
        Wait For And Click Element              xpath=//input[@type='tel']
        Wait For And Input Text                 xpath=//input[@type='tel']                                 ${Incorrect_No1}
       
        #Clicking Continue button
        Wait For And Click Element              xpath=//button[@aria-label="button Continue"]
       
        #Verifying appropriate error message is dispalyed
        Wait For And Verify Content             xpath=//div[@class='txt-align--left j-text j-text-body-s']    ${Invalid_Num_Error}
        
        #Closing Recharge Pop-up
        Close Popup                             xpath=//div[@class='j-modal j-modal-visible j-modal-closable j-modal-size-s j-modal-kind-informational']//div[@class='j-modal-container']//button[@aria-label='button']
        ${VB}=   Evaluate     ${VB} + 1    
    END

    #Confirm pop up is visible when clicked on View details button on Annual page
    ${VB}  Set Variable   0
    WHILE  ${VB}<7
        
        #Scroll Plan Cards into view
        Scroll To                               xpath=(//section[@class="j-container l-breakpoint--desktop"]//section[@class="j-container bg--primary-20 l-radius--xl"])[${VB}+${1}]    
        
        #Click on View Details button on each Plan Card
        Open Popup                              xpath=(//section[@class="j-container l-breakpoint--desktop"]//button[@class="j-button j-button-size__medium tertiary"])[${VB}+${1}] 
        
        #Verifying View Details Popup Opens up
        Wait For And Verify Element             xpath=//div[@class='j-modal j-modal-visible j-modal-closable j-modal-size-s planDetailsPopup j-modal-kind-dialog']//div[@class='j-modal-container']//div//h4[@class='detailsTable_details__21D4X j-heading j-text-heading-xxs'][normalize-space()='Details']
        Wait For And Verify Content             xpath=//div[@class='j-modal j-modal-visible j-modal-closable j-modal-size-s planDetailsPopup j-modal-kind-dialog']//div[@class='j-modal-container']//div//h4[@class='detailsTable_details__21D4X j-heading j-text-heading-xxs'][normalize-space()='Details']    Details
        
        #Click On Recharge button
        Scroll To                               xpath=//div[@class='j-modal j-modal-visible j-modal-closable j-modal-size-s planDetailsPopup j-modal-kind-dialog']//div[@class='j-modal-container']//div//div[@class='j-modal-body']//button[@aria-label='button']
        Wait For And Click Element              xpath=//div[@class='j-modal j-modal-visible j-modal-closable j-modal-size-s planDetailsPopup j-modal-kind-dialog']//div[@class='j-modal-container']//div//div[@class='j-modal-body']//button[@aria-label='button']
          
        #Closing Recharge Pop-up
        Close Popup                             xpath=//div[@class='j-modal j-modal-visible j-modal-closable j-modal-size-s j-modal-kind-informational']//div[@class='j-modal-container']//button[@aria-label='button']
        ${VB}=                                  Evaluate     ${VB} + 1
    END

    Prepaid Annual View Details Popup UI Verification        xpath=//div[@class='j-modal j-modal-visible j-modal-closable j-modal-size-s planDetailsPopup j-modal-kind-dialog']//div[@class='j-modal-container']//div//div[@class='j-modal-body']    xpath=//div[@class='j-modal j-modal-visible j-modal-closable j-modal-size-s planDetailsPopup j-modal-kind-dialog']//div[@class='j-modal-container']//div//div[@class='j-modal-body']//button[@aria-label='button']    xpath=//div[@class='j-modal j-modal-visible j-modal-closable j-modal-size-s planDetailsPopup j-modal-kind-dialog']//div[@class='j-modal-container']//div//header[@class='j-modal-header']//button[@aria-label='button']  

    #Confirm redirection of all buttons under More Information section in Annual Page                    #92331
    
    #scroll down to More Information section
    Scroll To                                   xpath=//section[@class='j-container l-breakpoint--desktop']//div[@class='MoreInformation_buttonCont__1bLIb']
  
    #Verify More information text
    Wait For And Verify Content                 xpath=//section[@class='j-container l-breakpoint--desktop']//div[@class='MoreInformation_moreInfo__2qAx3 j-text j-text-heading-s'][normalize-space()='More information']               More information
  
    #Click on plan packs button
    Wait For And Click Element                  xpath=//section[@class='j-container l-breakpoint--desktop']//div[contains(text(),'Plan Voucher')]
  
    #Click on ISD packs button
    Wait For And Click Element                  xpath=//section[@class='j-container l-breakpoint--desktop']//div[contains(text(),'ISD Packs')]
   
    #Click on T&C button
    Wait For And Click Element                  xpath=//button[@aria-label='button'][normalize-space()='T&C']
   
    #verifying T & C pop up
    Wait For And Verify Content                 xpath=//div[@aria-label='Modal Terms and conditions']//div[@class='j-modal-container']//div//div[@class='j-listBlock__block-text']    Terms and conditions
   
    #closed pop up
    Wait For And Click Element                  xpath=//div[@aria-label='Modal Terms and conditions']//div[@class='j-modal-container']//div//button[@aria-label='button']

    Prepaid Annual View Details Popup UI Verification                //div[@class='j-modal j-modal-visible j-modal-closable j-modal-size-s planDetailsPopup j-modal-kind-dialog']//div[@class='j-modal-container']//div//div[@class='j-modal-body']    xpath=//div[@class='j-modal j-modal-visible j-modal-closable j-modal-size-s planDetailsPopup j-modal-kind-dialog']//div[@class='j-modal-container']//div//div[@class='j-modal-body']//button[@aria-label='button']    xpath=//div[@class='j-modal j-modal-visible j-modal-closable j-modal-size-s planDetailsPopup j-modal-kind-dialog']//div[@class='j-modal-container']//div//header[@class='j-modal-header']//button[@aria-label='button']  
    Go Back

Prepaid Annual View Details Popup UI Verification    [Arguments]     ${PopUp_Content}     ${Recharge_Button}     ${Cross} 
    ${a}    Set Variable    1    
    WHILE  ${a}!=8        
        Scroll To                               xpath=(//button[@aria-label='button'][normalize-space()='View details'])[${a}]  
        Wait Until Keyword Succeeds             30sec  1sec      Open Popup          xpath=(//button[@aria-label='button'][normalize-space()='View details'])[${a}]
        ${PlansText}=    Get Text               ${PopUp_Content}
        
        #Use below mentioned keywords only once        
        #Write Excel Cell                       row_num=24    col_num=${a}    value=${PlansText}    sheet_name=Fiber_Prepaid      
        #Save Excel Document                    filename=Resources/JioWeb.xlsx        
        
        #Already a JioFiber User?        
        ${MonthlyPlansText}                     Read Excel Cell        row_num=24    col_num=${a}    sheet_name=Fiber_Prepaid        
        
        #Sticky Tag,Amount,Details Table,Subscription and Notes        
        Wait For And Verify Element             ${PopUp_Content}        
        Wait For And Verify Content             ${PopUp_Content}      ${MonthlyPlansText}     
        
        #Recharge Button        
        Scroll To                               ${Recharge_Button}    
        Wait For And Verify Element             ${Recharge_Button}
        
        #Click X button        
        Wait Until Keyword Succeeds             30sec  1sec    Close Popup     ${Cross}        
        ${a}=                                   Evaluate    ${a}+1    
    END


ISD Subscription Page Validation
    
  
    #ISD Plans Page
    Scroll To                                   xpath=//section[@class="fiber-prepaid-plans_flexDisplay__2MPQD j-container l-layout--flex"]//button[@aria-label='button ISD']
    Wait For And Click Element                  xpath=//section[@class="fiber-prepaid-plans_flexDisplay__2MPQD j-container l-layout--flex"]//button[@aria-label='button ISD']
    
    #To Verify ISD
    Wait For And Verify Element                 xpath=//section[@class='j-container l-breakpoint--desktop']//h1[@class='Filter_category__2vFb8 j-text j-text-heading-l'][normalize-space()='ISD']        
    
    #To Verify Other Prepaid plans button
    Wait For And Verify Element                 xpath=//section[@class='j-container l-breakpoint--desktop']//button[@aria-label='button'][normalize-space()='Other Prepaid plans']       
    
     
    #To Verify Plans Cards 
    ${l}    Set Variable    1    
    WHILE  ${l}!=7
        
        #Recharge button
        Wait For And Verify Element             xpath=//button[@aria-label='button'][normalize-space()='Recharge']     
        
        #View Details button 
        Wait For And Verify Element             xpath=//button[@aria-label='button'][normalize-space()='View details']        
        ${l}                                    Evaluate    ${l}+1
    END
    
    #To Verify Other Prepaid Plans 
    Wait For And Verify Content                 xpath=//section[@class='j-container l-breakpoint--desktop']//div[@class='changeCategory_moreInfo__2QPjV j-text j-text-heading-l'][normalize-space()='Other Prepaid plans']        Other Prepaid plans
    Section Verification                        xpath=//section[@class='j-container l-breakpoint--desktop']//section[@class='changeCategory_flexDisplay__1bVGH j-container l-layout--flex']        OtherPrepaidPlans
    
    #To Verify Annual ,Semi-Annual ,Quarterly ,Monthly ,ISD and Data Sachet buttons
    ${i}    Set Variable    0
    WHILE  ${i}!=6
        Wait For And Verify Element             xpath=//button[@aria-label='button ${ISDButtons}[${i}]']
        Wait For And Verify Content             xpath=//button[@aria-label='button ${ISDButtons}[${i}]']        ${ISDButtons}[${i}]   
        ${i}                                    Evaluate    ${i}+1
    END
    
    #To Verify More Information
    Wait For And Verify Content                xpath=//section[@class='j-container l-breakpoint--desktop']//div[@class='MoreInformation_moreInfo__2qAx3 j-text j-text-heading-s'][normalize-space()='More information']        More information
    Section Verification                       xpath=//section[@class='j-container l-breakpoint--desktop']//div[@class='MoreInformation_buttonCont__1bLIb']        MoreInformation        
   
   


    Prepaid ISD Plan Cards UI Verification     xpath=(//section[@class="j-container l-breakpoint--desktop"]//section[@class="j-container bg--primary-20 l-radius--xl"])    xpath=(//section[@class="j-container l-breakpoint--desktop"]//button[@aria-label='button'][normalize-space()='Recharge'])    xpath=(//section[@class="j-container l-breakpoint--desktop"]//button[@aria-label='button'][normalize-space()='View details'])

Prepaid ISD Plan Cards UI Verification    
    [Arguments]     ${PopUp_Content}     ${Recharge_Button}     ${View_Details} 
    ${m}    Set Variable    1    
    WHILE  ${m}!=3        
        Scroll To                              xpath=(//section[@class="j-container l-breakpoint--desktop"]//section[@class="j-container bg--primary-20 l-radius--xl"])[${m}]
        
        #Wait Until Keyword Succeeds     30sec  1sec  Open Popup  xpath=(//button[@aria-label='button'][normalize-space()='View details'])[${j}]
        ${PlansText}=    Get Text              xpath=(//section[@class="j-container l-breakpoint--desktop"]//section[@class="j-container bg--primary-20 l-radius--xl"])[${m}]
        
        #Use below mentioned keywords only once        
        #Write Excel Cell                      row_num=18    col_num=${z}    value=${PlansText}    sheet_name=Fiber_Prepaid   
        #Save Excel Document                   filename=Resources/JioWeb.xlsx        
        
        #Already a JioFiber User?        
        ${MonthlyPlansText}                    Read Excel Cell        row_num=18    col_num=${m}    sheet_name=Fiber_Prepaid  
        
        #Sticky Tag,Amount,Details Table,Subscription and Notes        
        Wait For And Verify Element            ${PopUp_Content}        
        Wait For And Verify Content            xpath=(//section[@class="j-container l-breakpoint--desktop"]//section[@class="j-container bg--primary-20 l-radius--xl"])[${m}]      ${MonthlyPlansText}     
        
        #Recharge Button        
        Scroll To                              xpath=(//section[@class="j-container l-breakpoint--desktop"]//button[@aria-label='button'][normalize-space()='Recharge'])   
        Wait For And Verify Element            xpath=(//section[@class="j-container l-breakpoint--desktop"]//button[@aria-label='button'][normalize-space()='Recharge'])[${m}]   
        
        #View Details Button    
        Wait For And Verify Element            ${View_Details}
        ${m}=                                   Evaluate    ${m}+1    
    END
    
    #Click on recharge
    Wait For And Click Element                 xpath=//button[@aria-label='button'][normalize-space()='Recharge']
    
    #rupee symbol
    Wait For And Verify Element                xpath=//span[@class="j-icon j-icon__bg"]
    
    #Sub Title
    Page Should Contain                        Enter your JioFiber number
    
    #JioFiber text verified placeholder
    Wait For And Verify Content                xpath=//div[@layout='centered']//div//label    JioFiber number
    
    #continue text verified
    Element Should Be Disabled                 xpath=//button[@aria-label='button Continue']    
   
    #Enter 10 digit valid number
    Wait For And Input Text                    xpath=//input[@type="tel"]    ${Fiber_No}
    
    #continue button enabled
    Element Should Be Enabled                  xpath=//button[@aria-label='button Continue']  
   
    #Close button
    Wait For And Click Element                 xpath=//div[@class='j-modal j-modal-visible j-modal-closable j-modal-size-s j-modal-kind-informational']//button[@aria-label='button']
   
    #verify user redirected on ISD page
    Wait For And Verify Content                xpath=(//h1[@class="Filter_category__2vFb8 j-text j-text-heading-l"])[1]         ISD
   
    #click on Recharge button
    Wait For And Click Element                 xpath=//button[@aria-label='button'][normalize-space()='Recharge']
   
    #enter fiber no.
    Wait For And Input Text                    xpath=//input[@type="tel"]    ${Fiber_No}
   
    #Close button 
    Wait For And Verify Element                xpath=//button[@aria-label='button Continue']
    
    #Close button 
    Wait For And Click Element                 xpath=//div[@class='j-modal j-modal-visible j-modal-closable j-modal-size-s j-modal-kind-informational']//div[@class='j-modal-container']//div//button[@aria-label='button']
   
    #Click on recharge 
    Wait For And Click Element                 xpath=//button[@aria-label='button'][normalize-space()='Recharge']
    
    #Invalid Number
    Wait For And Input Text                    xpath=//input[@type="tel"]    ${Incorrect_No1}
   
    #click on continue
    Wait For And Click Element                 xpath=//button[@aria-label='button Continue']
    
    #Pop message 
    Wait Until Page Contains                   It seems you have entered a non-Jio number. Please try again with a Jio number
    
    #close button
    Wait For And Click Element                 xpath=//div[@class='j-modal j-modal-visible j-modal-closable j-modal-size-s j-modal-kind-informational']//div[@class='j-modal-container']//div//button[@aria-label='button']
    
    #Recharge of all cards (92334)
    FOR    ${i}    IN RANGE    1    3
        #Click on recharge button
        Wait For And Click Element             xpath=(//button[@class="j-button j-button-size__medium primary"])[${i}]
        #Enter fiber no.
        Wait For And Input Text                xpath=//input[@type="tel"]    ${Fiber_No}
        #Continue button
        Wait For And Click Element             xpath=//button[@aria-label='button Continue']
        #verify amount payable text
        Wait Until Page Contains               Amount Payable
        Go Back 
    END
    
    Prepaid ISD View Details Popup UI Verification                //div[@class='j-modal j-modal-visible j-modal-closable j-modal-size-s planDetailsPopup j-modal-kind-dialog']//div[@class='j-modal-container']//div//div[@class='j-modal-body']    //div[@class='j-modal j-modal-visible j-modal-closable j-modal-size-s planDetailsPopup j-modal-kind-dialog']//div[@class='j-modal-container']//div//div[@class='j-modal-body']//button[@aria-label='button']    //div[@class='j-modal j-modal-visible j-modal-closable j-modal-size-s planDetailsPopup j-modal-kind-dialog']//div[@class='j-modal-container']//div//header[@class='j-modal-header']//button[@aria-label='button']  

Prepaid ISD View Details Popup UI Verification    [Arguments]     ${PopUp_Content}     ${Recharge_Button}     ${Cross} 
    ${j}    Set Variable    1  
    Scroll To                                  xpath=(//button[@aria-label='button'][normalize-space()='View details'])[${j}]  
    Wait Until Keyword Succeeds                30sec  1sec  Open Popup  xpath=(//button[@aria-label='button'][normalize-space()='View details'])[${j}]
    ${PlansText}=    Get Text                  ${PopUp_Content}
    
    # #Use below mentioned keywords only once        
    #Write Excel Cell                          row_num=20    col_num=${j}    value=${PlansText}    sheet_name=Fiber_Prepaid    
    #Save Excel Document                       filename=Resources/JioWeb.xlsx        
    
    #Already a JioFiber User?        
    ${MonthlyPlansText}                        Read Excel Cell        row_num=20    col_num=${j}    sheet_name=Fiber_Prepaid       
    
    #Sticky Tag,Amount,Details Table,Subscription and Notes        
    Wait For And Verify Element                ${PopUp_Content}        
    Wait For And Verify Content                ${PopUp_Content}      ${MonthlyPlansText}     
    
    #Recharge Button        
    Scroll To                                  ${Recharge_Button}    
    Wait For And Verify Element                ${Recharge_Button}
   
    #Click X button        
    Wait Until Keyword Succeeds                30sec  1sec    Close Popup     ${Cross}        

    #click on view details(92339)
    Wait For And Click Element                 xpath=(//button[@class="j-button j-button-size__medium tertiary"])[1]
    
    #click on link
    Click Link                                 Click here
    Go Back

#More Info
   # Already a JioFiber user? -> Annual
    #Verify More information text
    Wait For And Verify Content                xpath=//section[@class='j-container l-breakpoint--desktop']//div[@class='MoreInformation_moreInfo__2qAx3 j-text j-text-heading-s'][normalize-space()='More information']               More information
   
    #Click on plan packs button
    Wait For And Click Element                 xpath=//section[@class='j-container l-breakpoint--desktop']//div[contains(text(),'Plan Voucher')]
   
    #Click on ISD packs button
    Wait For And Click Element                 xpath=//section[@class='j-container l-breakpoint--desktop']//div[contains(text(),'ISD Packs')]
   
    #Click on T&C button
    Wait For And Click Element                 xpath=(//button[@class="tnc_button__1PfmD j-button j-button-size__medium secondary"])[1]
   
    #verifying T & C pop up
    Wait For And Verify Content                xpath=//div[@aria-label='Modal Terms and conditions']//div[@class='j-modal-container']//div//div[@class='j-listBlock__block-text']    Terms and conditions
  
    #closed pop up
    Wait For And Click Element                 xpath=//div[@aria-label='Modal Terms and conditions']//div[@class='j-modal-container']//div//button[@aria-label='button']
    Go Back


Top-up Subscription Page Validation

  
    #Scroll Down to Already a JioFiber user section
    Scroll To                                  xpath=//section[@class="fiber-prepaid-plans_flexDisplay__2MPQD j-container l-layout--flex"]
   
    #Click on Top-up button
    Wait For And Click Element                 xpath=//section[@class="fiber-prepaid-plans_flexDisplay__2MPQD j-container l-layout--flex"]//button[@aria-label='button Top-up']
    
    #verify Topup text(92343)
    Wait For And Verify Content                xpath=(//h1[@class="Filter_category__2vFb8 j-text j-text-heading-l"])[1]    Top-up  
   
    #verify Other Prepaid plans text
    Wait For And Click Element                 xpath=//section[@class='j-container l-breakpoint--desktop']//button[@class="Filter_plans__1nWZU j-button j-button-size__large secondary icon-primary icon-primary-inline"]
    
    #Close button
    Wait For And Click Element                 xpath=//div[@class='j-modal j-modal-visible j-modal-closable j-modal-size-m j-modal-kind-dialog']//div[@class='j-modal-container']//div//button[@aria-label='button']
   
    #erify Other prepaid plans text
    Wait For And Verify Content                xpath=//section[@class='j-container l-breakpoint--desktop']//div[@class='changeCategory_moreInfo__2QPjV j-text j-text-heading-l'][normalize-space()='Other Prepaid plans']        Other Prepaid plans
   
    #verify Annual button
    Wait For And Verify Element                xpath=//section[@class='j-container l-breakpoint--desktop']//button[@aria-label='button Annual']
    
    #verify Semi annual button
    Wait For And Verify Element                xpath=//section[@class='j-container l-breakpoint--desktop']//button[@aria-label='button Semi-Annual']
    
    #verify Quaterly button
    Wait For And Verify Element                xpath=//section[@class='j-container l-breakpoint--desktop']//button[@aria-label='button Quarterly']
   
    #verify monthly button
    Wait For And Verify Element                xpath=//section[@class='j-container l-breakpoint--desktop']//button[@aria-label='button Monthly']
   
    #verify ISD button
    Wait For And Verify Element                xpath=//section[@class='j-container l-breakpoint--desktop']//button[@aria-label='button ISD']
   
    #verify More information text
    Wait For And Verify Content                xpath=//section[@class='j-container l-breakpoint--desktop']//div[@class='MoreInformation_moreInfo__2qAx3 j-text j-text-heading-s'][normalize-space()='More information']    More information
  
    #verify Plan packs button
    Wait For And Verify Element                xpath=//button[@aria-label='button'][normalize-space()='Plan Voucher']
   
    #verify ISD Packs button
    Wait For And Verify Element                xpath=//button[@aria-label='button'][normalize-space()='ISD Packs']
   
    #verify T&C button
    Wait For And Verify Element                xpath=//button[@aria-label='button'][normalize-space()='T&C']
   
    #verify Amount    (92344)          
    Prepaid Top-up Plan Cards UI Verification  xpath=(//section[@class="j-container l-breakpoint--desktop"]//section[@class="j-container bg--primary-20 l-radius--xl"])    xpath=(//section[@class="j-container l-breakpoint--desktop"]//button[@aria-label='button'][normalize-space()='Recharge'])    xpath=(//section[@class="j-container l-breakpoint--desktop"]//button[@aria-label='button'][normalize-space()='View details'])

Prepaid Top-up Plan Cards UI Verification    
    [Arguments]     ${PopUp_Content}     ${Recharge_Button}     ${View_Details} 
    ${z}    Set Variable    1    
    WHILE  ${z}!=7        
        Scroll To                              xpath=(//section[@class="j-container l-breakpoint--desktop"]//section[@class="j-container bg--primary-20 l-radius--xl"])[${z}]
        
        #Wait Until Keyword Succeeds     30sec  1sec  Open Popup  xpath=(//button[@aria-label='button'][normalize-space()='View details'])[${j}]
        ${PlansText}=    Get Text              xpath=(//section[@class="j-container l-breakpoint--desktop"]//section[@class="j-container bg--primary-20 l-radius--xl"])[${z}]
        
        #Use below mentioned keywords only once        
        #Write Excel Cell                      row_num=14    col_num=${z}    value=${PlansText}    sheet_name=Fiber_Prepaid    
        #Save Excel Document                   filename=Resources/JioWeb.xlsx        
        
        #Already a JioFiber User?        
        ${MonthlyPlansText}                    Read Excel Cell        row_num=14   col_num=${z}    sheet_name=Fiber_Prepaid
        
        #Sticky Tag,Amount,Details Table,Subscription and Notes        
        Wait For And Verify Element            ${PopUp_Content}        
        Wait For And Verify Content            xpath=(//section[@class="j-container l-breakpoint--desktop"]//section[@class="j-container bg--primary-20 l-radius--xl"])[${z}]      ${MonthlyPlansText}     
        
        #Recharge Button        
        Scroll To                              xpath=(//section[@class="j-container l-breakpoint--desktop"]//button[@aria-label='button'][normalize-space()='Recharge'])[${z}]   
        Wait For And Verify Element            xpath=(//section[@class="j-container l-breakpoint--desktop"]//button[@aria-label='button'][normalize-space()='Recharge'])[${z}]    
        
        #View Details Button    
        Wait For And Verify Element            ${View_Details}
        ${z}                                   Evaluate    ${z}+1    
    END
    
    #click on recharge(92345)
    FOR    ${i}    IN RANGE    1    7
        
        #Click on recharge button
        Wait For And Click Element            xpath=(//button[@class="j-button j-button-size__medium primary"])[${i}]
       
        #Enter fiber no.
        Wait For And Input Text               xpath=//input[@type="tel"]    ${Fiber_No}
        Sleep    100ms
        
        #Continue button
        Wait For And Click Element            xpath=//button[@aria-label='button Continue']
        Sleep    200ms
        
        #verify amount payable text
        Wait Until Page Contains              ${Amount}
        Go Back
    END
    
    #Click on recharge button(92348/92346)
    Wait For And Click Element               xpath=(//button[@class="j-button j-button-size__medium primary"])[1]
    
    #continue button disabled
    Element Should Be Disabled               xpath=(//button[@aria-label='button Continue']) 
    Wait For And Click Element               xpath=//input[@type="tel"]
    
    #enter invalid number
    Wait For And Input Text                  xpath=//input[@type="tel"]    ${Incorrect_No1}
    
    #click continue button
    Wait For And Click Element               xpath=(//button[@aria-label='button Continue'])
   
    #error message poopup
    Wait Until Page Contains                 It seems you have entered a non-Jio number. Please try again with a Jio number
   
    #click on close icon
    Wait For And Click Element               xpath=//div[@class='j-modal j-modal-visible j-modal-closable j-modal-size-s j-modal-kind-informational']//div[@class='j-modal-container']//div//button[@aria-label='button']
   
    #Click On Recharge (92346)
    Wait For And Click Element               xpath=//button[@aria-label='button'][normalize-space()='Recharge']
   
    #verify rupee Symbol
    Wait For And Verify Element              xpath=//span[@class="j-icon j-icon__bg"]                   
   
    #Verify Jio Fiber Number Text
    Page Should Contain                      Enter your JioFiber number
   
    #placeholder text
    Wait For And Verify Content              xpath=//div[@layout='centered']//div//label        JioFiber number
   
    #Verify Continue Button
    Element Should Be Enabled                xpath=//button[@aria-label='button Continue']   
  
    #close button
    Wait For And Click Element               xpath=//div[@class='j-modal j-modal-visible j-modal-closable j-modal-size-s j-modal-kind-informational']//button[@aria-label='button']
     
    #Click on view details of any plan (92349)
    Prepaid TopUp View Details Popup UI Verifications            xpath=//div[@class='j-modal j-modal-visible j-modal-closable j-modal-size-s planDetailsPopup j-modal-kind-dialog']//div[@class='j-modal-container']//div//div[@class='j-modal-body']    xpath=//div[@class='j-modal j-modal-visible j-modal-closable j-modal-size-s planDetailsPopup j-modal-kind-dialog']//div[@class='j-modal-container']//div//div[@class='j-modal-body']//button[@aria-label='button']    xpath=//div[@class='j-modal j-modal-visible j-modal-closable j-modal-size-s planDetailsPopup j-modal-kind-dialog']//div[@class='j-modal-container']//div//header[@class='j-modal-header']//button[@aria-label='button']  

Prepaid TopUp View Details Popup UI Verifications    [Arguments]     ${PopUp_Content}     ${Recharge_Button}     ${Cross} 
    ${j}    Set Variable    1  
    Reload Page  
    WHILE  ${j}!=7        
        Scroll To                            xpath=(//button[@aria-label='button'][normalize-space()='View details'])[${j}]  
        Wait Until Keyword Succeeds          30sec  1sec  Open Popup  xpath=(//button[@aria-label='button'][normalize-space()='View details'])[${j}]
        ${PlansText}=    Get Text            ${PopUp_Content}
        
        #Use below mentioned keywords only once        
        #Write Excel Cell                    row_num=16    col_num=${j}    value=${PlansText}    sheet_name=Fiber_Prepaid     
        #Save Excel Document                 filename=Resources/JioWeb.xlsx        
        
        #Already a JioFiber User?        
        ${MonthlyPlansText}                  Read Excel Cell        row_num=16    col_num=${j}    sheet_name=Fiber_Prepaid      
        
        #Sticky Tag,Amount,Details Table,Subscription and Notes        
        Wait For And Verify Element          ${PopUp_Content}        
        Wait For And Verify Content          ${PopUp_Content}      ${MonthlyPlansText}     
        
        #Recharge Button        
        Scroll To                            ${Recharge_Button}    
        Wait For And Verify Element          ${Recharge_Button}
        
        #Click X button        
        Wait Until Keyword Succeeds         30sec  1sec    Close Popup     ${Cross}        
        ${j}                                Evaluate    ${j}+1    
    END
    
    #redirection of recharge(92350)
    FOR    ${i}    IN RANGE    1    7
    Wait For And Click Element              xpath=(//button[@class="j-button j-button-size__medium tertiary"])[${i}]
    Scroll To                               xpath=//div[@class='j-modal j-modal-visible j-modal-closable j-modal-size-s planDetailsPopup j-modal-kind-dialog']//div[@class='j-modal-container']//div//div[@class='j-modal-body']//button[@aria-label='button']
    Wait For And Click Element              xpath=//div[@class='j-modal j-modal-visible j-modal-closable j-modal-size-s planDetailsPopup j-modal-kind-dialog']//div[@class='j-modal-container']//div//div[@class='j-modal-body']//button[@aria-label='button']
    Wait For And Click Element              xpath=//div[@class='j-modal j-modal-visible j-modal-closable j-modal-size-s j-modal-kind-informational']//div[@class='j-modal-container']//div//button[@aria-label='button']
    END
   
   #More Info(92352)
   # Already a JioFiber user? -> Annual
    #Verify More information text
    Wait For And Verify Content             xpath=//section[@class='j-container l-breakpoint--desktop']//div[@class='MoreInformation_moreInfo__2qAx3 j-text j-text-heading-s'][normalize-space()='More information']               More information
    
    #Click on plan packs button
    Wait For And Click Element              xpath=//section[@class='j-container l-breakpoint--desktop']//div[contains(text(),'Plan Voucher')]
    
    #Click on ISD packs button
    Wait For And Click Element              xpath=//section[@class='j-container l-breakpoint--desktop']//div[contains(text(),'ISD Packs')]
   
    #Click on T&C button
    Wait For And Click Element              xpath=(//button[@class="tnc_button__1PfmD j-button j-button-size__medium secondary"])[1]
   
    #verifying T & C pop up
    Wait For And Verify Content             xpath=//div[@aria-label='Modal Terms and conditions']//div[@class='j-modal-container']//div//div[@class='j-listBlock__block-text']    Terms and conditions
   
    #closed pop up
    Wait For And Click Element              xpath=//div[@aria-label='Modal Terms and conditions']//div[@class='j-modal-container']//div//button[@aria-label='button']
    Go Back

   
Data Sachet Subscription Page Validation

    
    #Scroll Down to Already a JioFiber user section
    Scroll To                               xpath=//section[@class="fiber-prepaid-plans_flexDisplay__2MPQD j-container l-layout--flex"]
   
    #Click on Data Sachet button
    Wait For And Click Element              xpath=//section[@class="fiber-prepaid-plans_flexDisplay__2MPQD j-container l-layout--flex"]//button[@aria-label='button Data Sachet']
   
    #verify data sachet text(92353)
    Wait For And Verify Content             xpath=(//h1[@class="Filter_category__2vFb8 j-text j-text-heading-l"])[1]    Data Sachet  
   
    #verify Other Prepaid plans text
    Wait For And Click Element              xpath=//section[@class='j-container l-breakpoint--desktop']//button[@class="Filter_plans__1nWZU j-button j-button-size__large secondary icon-primary icon-primary-inline"]
    
    #Close button
    Wait For And Click Element              xpath=//div[@class='j-modal j-modal-visible j-modal-closable j-modal-size-m j-modal-kind-dialog']//div[@class='j-modal-container']//div//button[@aria-label='button']
   
    #verify Other Prepaid plans dropdown
    Wait For And Click Element              xpath=//section[@class='j-container l-breakpoint--desktop']//button[@class="Filter_plans__1nWZU j-button j-button-size__large secondary icon-primary icon-primary-inline"]
  
    #Close button
    Wait For And Click Element              xpath=//div[@class='j-modal j-modal-visible j-modal-closable j-modal-size-m j-modal-kind-dialog']//div[@class='j-modal-container']//div//button[@aria-label='button']
    
    #erify Other prepaid plans text
    Wait For And Verify Content             xpath=//section[@class='j-container l-breakpoint--desktop']//div[@class='changeCategory_moreInfo__2QPjV j-text j-text-heading-l'][normalize-space()='Other Prepaid plans']        Other Prepaid plans
   
    #verify Annual button
    Wait For And Verify Element             xpath=//section[@class='j-container l-breakpoint--desktop']//button[@aria-label='button Annual']
   
    #verify Semi annual button
    Wait For And Verify Element             xpath=//section[@class='j-container l-breakpoint--desktop']//button[@aria-label='button Semi-Annual']
   
    #verify Quaterly button
    Wait For And Verify Element             xpath=//section[@class='j-container l-breakpoint--desktop']//button[@aria-label='button Quarterly']
    
    #verify monthly button
    Wait For And Verify Element             xpath=//section[@class='j-container l-breakpoint--desktop']//button[@aria-label='button Monthly']
    
    #verify ISD button
    Wait For And Verify Element             xpath=//section[@class='j-container l-breakpoint--desktop']//button[@aria-label='button ISD']
   
    #verify More information text
    Wait For And Verify Content             xpath=//section[@class='j-container l-breakpoint--desktop']//div[@class='MoreInformation_moreInfo__2qAx3 j-text j-text-heading-s'][normalize-space()='More information']    More information
   
    #verify Plan packs button
    Wait For And Verify Element             xpath=//button[@aria-label='button'][normalize-space()='Plan Voucher']
    
    #verify ISD Packs button
    Wait For And Verify Element             xpath=//button[@aria-label='button'][normalize-space()='ISD Packs']
    
    #verify T&C button
    Wait For And Verify Element             xpath=//button[@aria-label='button'][normalize-space()='T&C']
    
    #verify Amount    (92354)          
    Prepaid Data Sachet Plan Cards UI Verification            xpath=(//section[@class="j-container l-breakpoint--desktop"]//section[@class="j-container bg--primary-20 l-radius--xl"])    xpath=(//section[@class="j-container l-breakpoint--desktop"]//button[@aria-label='button'][normalize-space()='Recharge'])    xpath=(//section[@class="j-container l-breakpoint--desktop"]//button[@aria-label='button'][normalize-space()='View details'])

Prepaid Data Sachet Plan Cards UI Verification    
    [Arguments]     ${PopUp_Content}     ${Recharge_Button}     ${View_Details} 
    ${z}    Set Variable    1    
    WHILE  ${z}!=2        
        Scroll To                           xpath=(//section[@class="j-container l-breakpoint--desktop"]//section[@class="j-container bg--primary-20 l-radius--xl"])[${z}]
        
        #Wait Until Keyword Succeeds     30sec  1sec  Open Popup  xpath=(//button[@aria-label='button'][normalize-space()='View details'])[${j}]
        ${PlansText}=    Get Text           xpath=(//section[@class="j-container l-breakpoint--desktop"]//section[@class="j-container bg--primary-20 l-radius--xl"])[${z}]
        
        #Use below mentioned keywords only once        
        #Write Excel Cell                   row_num=26    col_num=${z}    value=${PlansText}    sheet_name=Fiber_Prepaid  
        #Save Excel Document                filename=Resources/JioWeb.xlsx        
        
        #Already a JioFiber User?        
        ${MonthlyPlansText}                 Read Excel Cell        row_num=26    col_num=${z}    sheet_name=Fiber_Prepaid  
        
        #Sticky Tag,Amount,Details Table,Subscription and Notes        
        Wait For And Verify Element         ${PopUp_Content}        
        Wait For And Verify Content         (//section[@class="j-container l-breakpoint--desktop"]//section[@class="j-container bg--primary-20 l-radius--xl"])[${z}]      ${MonthlyPlansText}     
        
        #Recharge Button        
        Scroll To                           xpath=(//section[@class="j-container l-breakpoint--desktop"]//button[@aria-label='button'][normalize-space()='Recharge'])[${z}]   
        Wait For And Verify Element         xpath=(//section[@class="j-container l-breakpoint--desktop"]//button[@aria-label='button'][normalize-space()='Recharge'])[${z}] 
        
        #View Details Button    
        Wait For And Verify Element         ${View_Details}
        ${z}                                Evaluate    ${z}+1    
    END
    #Click on recharge button(92355)
    Wait For And Click Element              xpath=(//button[@class="j-button j-button-size__medium primary"])[1]
    
    #Enter fiber no.
    Wait For And Input Text                 xpath=//input[@type="tel"]    ${Fiber_No}
    
    #Continue button
    Wait For And Click Element              xpath=//button[@aria-label='button Continue']
   
    #verify amount payable text
    Wait Until Page Contains                ${Amount}
    Go Back
   
    #Click on recharge button(92358/92357)
    Wait For And Click Element              xpath=(//button[@class="j-button j-button-size__medium primary"])[1]
   
    #continue button disabled
    Element Should Be Disabled              xpath=(//button[@aria-label='button Continue']) 
    Wait For And Click Element              xpath=//input[@type="tel"]
   
    #enter invalid number
    Wait For And Input Text                 xpath=//input[@type="tel"]    ${Incorrect_No1}
    
    #click continue button
    Wait For And Click Element              xpath=(//button[@aria-label='button Continue'])
    
    #error message poopup
    Wait Until Page Contains                It seems you have entered a non-Jio number. Please try again with a Jio number
   
    #click on close icon
    Wait For And Click Element              xpath=//div[@class='j-modal j-modal-visible j-modal-closable j-modal-size-s j-modal-kind-informational']//div[@class='j-modal-container']//div//button[@aria-label='button']
    
    #Click On Recharge (92346)
    Wait For And Click Element              xpath=//button[@aria-label='button'][normalize-space()='Recharge']
   
    #verify rupee Symbol
    Wait For And Verify Element             xpath=//span[@class="j-icon j-icon__bg"]                   
    
    #Verify Jio Fiber Number Text
    Page Should Contain                     Enter your JioFiber number
    
    #placeholder text
    Wait For And Verify Content             xpath=//div[@layout='centered']//div//label        JioFiber number
    
    #Verify Continue Button
    Element Should Be Enabled               xpath= //button[@aria-label='button Continue']   
   
    #close button
    Wait For And Click Element              xpath=//div[@class='j-modal j-modal-visible j-modal-closable j-modal-size-s j-modal-kind-informational']//button[@aria-label='button']
    
    #Click On Recharge (92356)
    Wait For And Click Element              xpath=//button[@aria-label='button'][normalize-space()='Recharge']
   
    #verify rupee Symbol
    Wait For And Verify Element             xpath=//span[@class="j-icon j-icon__bg"]                   
   
    #Verify Jio Fiber Number Text
    Page Should Contain                     Enter your JioFiber number
   
    #placeholder text
    Wait For And Verify Content             xpath=//div[@layout='centered']//div//label        JioFiber number
   
    #Verify Continue Button
    Element Should Be Enabled               xpath= //button[@aria-label='button Continue']   
   
    #close button
    Wait For And Click Element              xpath=//div[@class='j-modal j-modal-visible j-modal-closable j-modal-size-s j-modal-kind-informational']//button[@aria-label='button']
   
    #click on view details(92359)
    Prepaid Data Sachet View Details Popup UI Verifications            xpath=//div[@class='j-modal j-modal-visible j-modal-closable j-modal-size-s planDetailsPopup j-modal-kind-dialog']//div[@class='j-modal-container']//div//div[@class='j-modal-body']    xpath=//div[@class='j-modal j-modal-visible j-modal-closable j-modal-size-s planDetailsPopup j-modal-kind-dialog']//div[@class='j-modal-container']//div//div[@class='j-modal-body']//button[@aria-label='button']    xpath=//div[@class='j-modal j-modal-visible j-modal-closable j-modal-size-s planDetailsPopup j-modal-kind-dialog']//div[@class='j-modal-container']//div//header[@class='j-modal-header']//button[@aria-label='button']  

Prepaid Data Sachet View Details Popup UI Verifications    [Arguments]     ${PopUp_Content}     ${Recharge_Button}     ${Cross} 
    ${j}    Set Variable    1    
    WHILE  ${j}!=2        
        Scroll To                          xpath=(//button[@aria-label='button'][normalize-space()='View details'])[${j}]  
        Wait Until Keyword Succeeds        30sec  1sec      Open Popup      xpath=(//button[@aria-label='button'][normalize-space()='View details'])[${j}]
        ${PlansText}=    Get Text          ${PopUp_Content}
        
        #Use below mentioned keywords only once        
        #Write Excel Cell                  row_num=28    col_num=${j}    value=${PlansText}    sheet_name=Fiber_Prepaid    
        #Save Excel Document               filename=Resources/JioWeb.xlsx        
        
        #Already a JioFiber User?        
        ${MonthlyPlansText}                Read Excel Cell        row_num=28    col_num=${j}    sheet_name=Fiber_Prepaid        
        
        #Sticky Tag,Amount,Details Table,Subscription and Notes        
        Wait For And Verify Element        ${PopUp_Content}        
        Wait For And Verify Content        ${PopUp_Content}      ${MonthlyPlansText}     
        
        #Recharge Button        
        Scroll To                          ${Recharge_Button}    
        Wait For And Verify Element        ${Recharge_Button} 
        
        #Click X button        
        Wait Until Keyword Succeeds       30sec  1sec    Close Popup     ${Cross}        
        ${j}                              Evaluate    ${j}+1    
    END
    
    #click on view details (92360)
    Wait For And Click Element             xpath=//section[@class='j-container l-breakpoint--desktop']//div//button[@aria-label='button'][normalize-space()='View details']
   
    #click on recharge
    Wait For And Click Element             xpath=//div[@class='j-modal-content']//button[@aria-label='button'][normalize-space()='Recharge']
    
    #click on close icon of recharge popup
    Wait For And Click Element             xpath=(//button[@class="j-button j-button-size__medium tertiary icon-primary icon-only"])[5]
    
    #More Info(92362)
    #Verify More information text
    Wait For And Verify Content            xpath=//section[@class='j-container l-breakpoint--desktop']//div[@class='MoreInformation_moreInfo__2qAx3 j-text j-text-heading-s'][normalize-space()='More information']               More information
   
    #Click on plan packs button
    Scroll To                              xpath=//section[@class='j-container l-breakpoint--desktop']//div[contains(text(),'Plan Voucher')]
    Wait For And Click Element             xpath=//section[@class='j-container l-breakpoint--desktop']//div[contains(text(),'Plan Voucher')]
   
    #Click on ISD packs button
    Wait For And Click Element             xpath=//section[@class='j-container l-breakpoint--desktop']//div[contains(text(),'ISD Packs')]
   
    #Click on T&C button
    Wait For And Click Element             xpath=(//button[@class="tnc_button__1PfmD j-button j-button-size__medium secondary"])[1]
   
    #verifying T & C pop up
    Wait For And Verify Content            xpath=//div[@aria-label='Modal Terms and conditions']//div[@class='j-modal-container']//div//div[@class='j-listBlock__block-text']    Terms and conditions
    
    #closed T&C popup
    Wait For And Click Element             xpath=//div[@aria-label='Modal Terms and conditions']//div[@class='j-modal-container']//div//button[@aria-label='button']
 
