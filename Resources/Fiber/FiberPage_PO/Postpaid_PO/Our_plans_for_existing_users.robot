*** Settings ***
Library    SeleniumLibrary
Library    Dialogs
Resource    ../../../Common.robot
Variables    ../../../../Tests/Fiber/FPostpaid_Variables.yaml
Resource     ../Postpaid_PO/RedirectionToPostpaid.robot
Resource         ../../../Excel_Activity.robot
Resource        ../../../Local_Keywords.robot


*** Keywords ***
Verifying 'Our plans for existing user' section, confirming it's visiblity, UI and content, Button redirection

    Scroll To                                               //h1[normalize-space()='Our plans for existing users']
    #Verifying the Heading
    Text Verification                                       //h1[normalize-space()='Our plans for existing users']                         Our plans for existing users
    CSS Verification                                        //h1[normalize-space()='Our plans for existing users']    color    rgba(20, 20, 20, 1)

    #Verifing the Sub Text
    Text Verification                                       //h2[contains(text(),'Enjoy unlimited internet and non-stop entertainmen')]    Enjoy unlimited internet and non-stop entertainment for as long as you want.
    
    #Button Verification
    ${Number_of_Buttons} =	Get Element Count                (//div[@class='fiber-postpaid-plans_buttonMobile__109Zv'])
    Should Be Equal As Integers    ${Number_of_Buttons}    7  #As there are 7 buttons
    
    #Loop to verify button and redirection
    FOR  ${i}  IN RANGE    1    ${Number_of_Buttons}+1
        #Button verification
        Button Verification    (//div[@class='fiber-postpaid-plans_buttonMobile__109Zv'])[${i}]/button  

        #Getting Text in order to have proper screenshot name
        ${Button_Text}=    Get Text    (//div[@class='fiber-postpaid-plans_buttonMobile__109Zv'])[${i}]/button/div

        #Checking if redirection is proper
        Redirection On Clicking    (//div[@class='fiber-postpaid-plans_buttonMobile__109Zv'])[${i}]/button   ${Our_Plan_For_Existing_User_Buttons_URL}[${i-1}]    ${Button_Text}_Sc
    END

Verifying the banner visibility, it's redirection and carousal functionality
    #Verify banners are visible
    Banner Content Verification            xpath: //div[normalize-space()='A happy beginning of your JioFiber journey']    A happy beginning of your JioFiber journey    xpath=(//img[@alt='banner'])[1]    (//button[normalize-space()='Get JioFiber Postpaid'])[1]    Postpage_Banner

    #Carousal Functionality
    #NA as Test Case ID:92067 can be Partialy Automated 

    #Verify banner redirection
    Banner Redirection                     xpath:(//div[@role='button'])[1]    NULL    Postpaid_Banner_Verification

Verify UI and Content of Postpaid Page
     #To Verify Top Banner
    Banner Content Verification            xpath=//div[@class='Banner_header__sq7Ie j-text j-text-heading-l']        ${PostpaidPage_Text}[0]       xpath=//img[@alt='banner']        xpath=//button[normalize-space()='Get JioFiber Postpaid']        TopBanner
    
    #To Verify Get JioFiber Postpaid
    Text Verification                      xpath=//button[normalize-space()='Get JioFiber Postpaid']        ${PostpaidPage_Text}[1]
    
    #To Verify Sub-text
    Text Verification                      xpath=//div[@class='j-text j-text-body-l']        ${PostpaidPage_Text}[2]
    
    #To Verify Our plans for existing users 
    Scroll To                              xpath=//section[contains(@class,'fiber-postpaid-plans_flexDisplay__dBQ2Z j-container l-layout--flex')]
    Text Verification                      xpath=//h1[normalize-space()='Our plans for existing users']        ${PostpaidPage_Text}[3]
    
    #To Verify Annual ,Semi-Annual ,Quarterly ,Monthly ,ISD and Data Sachet buttons
    ${i}    Set Variable    0
    WHILE  ${i}!=6
        Button Verification                 xpath=//button[@aria-label='button ${OurPlanButtons}[${i}]']
        Text Verification                   xpath=//button[@aria-label='button ${OurPlanButtons}[${i}]']        ${OurPlanButtons}[${i}]   
        ${i}       Evaluate    ${i}+1
    END
    
    #To Verify Packed with incredible experiences
    Scroll To                               xpath=//div[@class="j-grid"]//div[@class="Details_detailsCont__iCgow"]
    Text Verification                       xpath=//div[@class='Category_heading__2AMfm j-text j-text-heading-m']        ${PostpaidPage_Text}[4]
    #To Verify 3 Plan Cards
    ${i}    Set Variable    0
    ${j}    Set Variable    1
    WHILE  ${i}!=3
        Wait For And Verify Element        xpath=(//section)[6${i}]
        
        #Book Now
        Button Verification                xpath=(//button[@aria-label='button'][normalize-space()='Book Now'])[${j}]
        Text Verification                  xpath=(//button[@aria-label='button'][normalize-space()='Book Now'])[${j}]        ${PostpaidPage_Text}[5]
        #View details
        Button Verification                xpath=(//button[@aria-label='button'][normalize-space()='View details'])[${j}]
        Text Verification                  xpath=(//button[@aria-label='button'][normalize-space()='View details'])[${j}]        ${PostpaidPage_Text}[6] 
        ${i}    Evaluate    ${i}+1
        ${j}    Evaluate    ${i}+1   
    END
    
    #To Verify View all plans
    Button Verification                    xpath=//button[normalize-space()='View all plans']
    Text Verification                      xpath=//button[normalize-space()='View all plans']        ${PostpaidPage_Text}[7]    
    
    #To Verify Confused between 2-3 pans?
    Image Verification                     xpath=//img[@alt='comparePlansIcon.svg']
    Text Verification                      xpath=//div[contains(text(),'Confused between 2-3 plans?')]      ${PostpaidPage_Text}[8]   
    
    #To Verify Sub-Text
    Text Verification                      xpath=//div[@class='j-listBlock__block j-listBlock__block-helperBlock']//div[@class='j-listBlock__block-text']      ${PostpaidPage_Text}[9]
    
    #To Verify Speeds as per your digital needs
    Scroll To                              xpath=//div[@class="planCard_cardCont__2lArM"]
    Text Verification                      xpath=//div[normalize-space()='Speeds as per your digital needs']        ${PostpaidPage_Text}[10]   
    
    #To Verify Three Cards with internet speeds
    ${i}    Set Variable    0
    WHILE  ${i}!=3
        #Buttons
        Wait For And Verify Element        xpath=//div[contains(@class,'j-card bg--primary-20 size--s card-vertical j-card__shadow')]
        #Speeds
        Text Verification                  xpath=//h4[normalize-space()='${SpeedsSec}[${i}]']       ${SpeedsSec}[${i}]   
        ${i}       Evaluate    ${i}+1
    END
    
    #To Verify How about a FREE set-top box!
    Scroll To                              xpath=//div[normalize-space()='How about a FREE set-top box!']
    Text Verification                      xpath=//div[normalize-space()='How about a FREE set-top box!']        ${PostpaidPage_Text}[11]        
    Image Verification                     xpath=//img[@src='https://jep-asset.akamaized.net/jiocom/static/images/jioFiber.png']
    
    #Sub-Text 
    Scroll To                              xpath://div[normalize-space()='On selected plans, you get a JioFiber-enabled Jio Set-top Box for FREE that transforms your TV-viewing experience.']
    Text Verification                      xpath=//div[normalize-space()='On selected plans, you get a JioFiber-enabled Jio Set-top Box for FREE that transforms your TV-viewing experience.']        ${PostpaidPage_Text}[12]        
   
    #To Verify Now reimagine connected living
    Scroll To                              xpath=//div[normalize-space()='Now reimagine connected living']
    Text Verification                      xpath=//div[normalize-space()='Now reimagine connected living']        ${PostpaidPage_Text}[13]        
    Image Verification                     xpath=//img[@src='https://jep-asset.akamaized.net/jiocom/static/images/jioFiber-postpaid.jpg']
    
    #Sub-Text 
    Text Verification                      xpath=//div[normalize-space()='Make TV video calls to anyone, plan blockbuster family time, watch over loved ones when away, and more.']        ${PostpaidPage_Text}[14] 
    
    #To Verify Entertainment on demand!
    Scroll To                              xpath=//div[normalize-space()='Entertainment on demand!']
    Text Verification                      xpath=//div[normalize-space()='Entertainment on demand!']        ${PostpaidPage_Text}[15]
    ${k}    Set Variable    1
    WHILE  ${k}!=18
        Image Verification                 xpath=(//img[@class='EntertainmentIcons_appBg__3_oRx'])[${k}]
        ${k}    Evaluate    ${k}+1 
    END                    
    #Sub-Text 
    Text Verification                      xpath=//span[@class='j-text j-text-body-m']        ${PostpaidPage_Text}[16]
    
    #To Verify Discover more with Jio
    Scroll To                              xpath=//section[contains(@class,'fiber-postpaid-plans_carouselContainer__2RND2 j-container')]
    Text Verification                      xpath=//div[normalize-space()='Discover more with Jio']        ${PostpaidPage_Text}[17] 
    
    #To Verify Three Cards under Discover more with Jio
    ${i}    Set Variable    0
    ${p}    Set Variable    1
    WHILE  ${i}!=3
        #Images
        Image Verification                xpath=//img[@src="${DiscImages}[${i}]"]      
        #Buttons
        Text Verification                 xpath=(//a[contains(@aria-label,'[object Object]')])[${p}]        ${DiscButtons}[${i}]   
        ${i}       Evaluate    ${i}+1
        ${p}       Evaluate    ${p}+1
    END

    #To Verify FAQ
    Scroll To                              xpath=//section[contains(@class,'faqSection_faqContainer__3KZiU j-container')]
    Text Verification                      xpath=//div[contains(@class,'j-text j-text-heading-s')][normalize-space()='FAQ']        ${PostpaidPage_Text}[18]
    Section Verification                   xpath=//section[contains(@class,'faqSection_faqContainer__3KZiU j-container')]        FAQ
    
    #To Verify Unlimited entertainment
    Scroll To                              xpath=//section[contains(@class,'j-container l-layout--centered')]//div[contains(@class,'j-contentBlock__content')]
    Text Verification                      xpath=//div[contains(@class,'j-text j-text-heading-m')][normalize-space()='Unlimited entertainment with JioFiber Postpaid plans']        ${PostpaidPage_Text}[19]   
    Section Verification                   xpath=//section[contains(@class,'j-container l-layout--centered')]//div[contains(@class,'j-contentBlock__content')]        UnlimitedEntertainment


Verifying the options selected on header on postpaid page
    #Verify the options selected on Top navigation bar
    CSS Verification                        xpath: (//a[normalize-space()='JioFiber'])[1]    text-decoration-line    underline
    Element Attribute Value Should Be       xpath: //li[@onclick="window.location.href='/selfcare/plans/fiber/fiber-postpaid-plans-home/'"]    class    cursor-pointer active

# Monthly
Click on Monthly Section-Redirection

    #Scroll to 'Our plans for existing users' section
   Scroll To                                  ${Monthly_1} 

    #Waits Until Monthly  button is visible                
    Wait For And Verify Element               ${Monthly_1}   

    #Will Click on Monthly button             
    Wait For And Click Element                ${Monthly_1} 

Verifying the content and UI of page and plan cards of Monthly page
    #Redirection to Monthly Section
    Click on Monthly Section-Redirection

    #Section verification
    Plan Page UI Verification-2    Monthly   
    
    #Card Data Validation
    Plan Card Verification-2   cards=//*[contains(@class,"desktop")]//div[contains(@class,"planDetailsCard")]  sheet_name=Fiber_Postpaid  row_num=45

    #Loop to check the Sub Heading
    FOR  ${i}  IN RANGE    0    6     
        Text Verification                       xpath: (//div[@class='Subcategory_heading__3Y18a j-text j-text-heading-m'][normalize-space()='${Speed_Subheading}[${i}]'])    ${Speed_Subheading}[${i}]
        Element Attribute Value Should Be       xpath: (//div[@class='Subcategory_heading__3Y18a j-text j-text-heading-m'][normalize-space()='${Speed_Subheading}[${i}]'])     style    --color-text:var(--color-primary-grey-100);
    END

#Filter Redirection 
Verify UI elements and content of Filter pop-up-Monthly
    Filter Button Verification

Verify the Redirection of Book Now and View Details button of all plans card-Monthly
    #Getting count of all the cards present inside Monthly section 
    ${card_count}=    Get Element Count        xpath=//section[@class='j-container l-breakpoint--desktop']//section[@class='j-container bg--primary-20 l-radius--xl']   

    # Clicks on Book Now buttton of  12  cards   
    FOR  ${m}  IN RANGE  1  ${card_count}+1
        Wait For And Click Element                         xpath:(//button[@class='j-button j-button-size__medium primary'])[${m}]

        # Verifies the card of GetJio Fiber page   
        Wait For And Verify Element           ${Get_JioFiber}    
        Go Back

        #Verify Pop-up Details details
        View Details Pop up Verification 2    xpath:(//button[@class='j-button j-button-size__medium tertiary'])[${m}]  xpath:(//*[contains(@class,"planDetailsPopup")])[${m}]   Fiber_Postpaid   5   ${m}  xpath:(//div[@class='j-modal j-modal-visible j-modal-closable j-modal-size-s planDetailsPopup j-modal-kind-dialog']//div[@class='j-modal-container']//div//header[@class='j-modal-header']//button[@aria-label='button'])
        Sleep        200ms
    END


 Verify the Redirection of all button present under More Information Section-Monthly
    # Scroll to "More information" section 
    Scroll To   xpath=//button[normalize-space()="Plans"]

    # This will set the index variable to 0
    ${index} =  Set Variable  0

    # Loop will iterate for all the buttons present under 'More Information' section
    FOR  ${button}  IN  Plans  ISD Packs  T&C

        # Below command will press the button(s) as per the loop iterator 'Button'
        Wait For And Click Element             xpath=(//button[normalize-space()="${button}"])[1] 
        Sleep        200ms

        # Since T&C button click will open popup that's why the mentioned case is handled separately
        IF  '${button}' == 'T&C'
            # It will wait until the page contains the mentioned keyword

            Wait Until Page Contains  text=Terms and conditions
            # Once the desired redirection gets successfull, it will capture the screen shot and will save it to the mentioned directory
            Take Page Screenshot           Sc_Name=${button}_Confirmation
        ELSE
            # Once after the button click, pdf opens in different tab, so it'll switch to that tab to verify
            Switch Window                  url=${URLs}[${index}]

            # It will capture the page screen shot and save it to the mentioned directory.
            Take Page Screenshot           Sc_Name=${button}_Confirmation 

            # It will switch the window back to previous one to carry the execution further.
            Switch Window                  title=Postpaid Broadband Plans - JioFiber Postpaid Plans
            
            # This will increase the size of index by 1.
            ${index} =  Evaluate      expression=${index} + 1
        END
    END

Click on Quarterly Section-Redirection
    #  Quarterly

    # Scroll to 'Our plans for existing users' section
   Scroll To                                xpath://h1[contains(@class,'1vokM j-text j-text-heading-l')]

    # Will Click on Quarterly button
    Wait For And Click Element                ${Quarterly_1}

Verifying content and UI of page and plan cards of Quarterly
    Click on Quarterly Section-Redirection

    Plan Page UI Verification-2    Quarterly
    
    Plan Card Verification-2      cards=//*[contains(@class,"desktop")]//div[contains(@class,"planDetailsCard")]  sheet_name=Fiber_Postpaid  row_num=47

    #Loop to check the Sub Heading
    FOR  ${i}  IN RANGE    0    6      
        Text Verification                       (//div[@class='Subcategory_heading__3Y18a j-text j-text-heading-m'][normalize-space()='${Speed_Subheading}[${i}]'])    ${Speed_Subheading}[${i}]
        Element Attribute Value Should Be       (//div[@class='Subcategory_heading__3Y18a j-text j-text-heading-m'][normalize-space()='${Speed_Subheading}[${i}]'])     style    --color-text:var(--color-primary-grey-100);
    END

Verify UI elements and content of Filter pop-up-Quarterly 
    Filter Button Verification

Verify the Redirection of Book Now and View Details button of all plans card-Quarterly

        # Scroll Till Book Now is visible  
    ${card_count}=    Get Element Count         xpath=//section[@class='j-container l-breakpoint--desktop']//section[@class='j-container bg--primary-20 l-radius--xl']

    FOR  ${i}  IN RANGE    1   ${card_count}+1

        # Will Click on Book Now button of every 12 card
        Click Element                          xpath:(//button[@class='j-button j-button-size__medium primary'])[${i}] 

        # Verifies the card of GetJio Fiber 
        Wait Until Element Is Visible          ${Get_JioFiber}    timeout=10s

        Wait For And Verify Element            ${Get_JioFiber}
        Go Back
        Sleep    2s

        # View Details Popup UI Verification    xpath=//div[@class='j-modal j-modal-visible j-modal-closable j-modal-size-s planDetailsPopup j-modal-kind-dialog']//div[@class='j-modal-body']     ${i+1}   
        View Details Pop up Verification 2      xpath:(//button[@class='j-button j-button-size__medium tertiary'])[${i}]  xpath:(//*[contains(@class,"planDetailsPopup")])[${i}]   Fiber_Postpaid   11   ${i}  xpath:(//div[@class='j-modal j-modal-visible j-modal-closable j-modal-size-s planDetailsPopup j-modal-kind-dialog']//div[@class='j-modal-container']//div//header[@class='j-modal-header']//button[@aria-label='button'])
    END
    

Verify the Redirection of all the button present under More Information Section-Quarterly

    

    # Below command will Scroll To to 'More Information' section
    Scroll To   xpath=//button[normalize-space()="Plans"]
    Sleep  2s
    
    # This will set the index variable to 0
    ${index} =  Set Variable  0
    
    # Loop will iterate for all the buttons present under 'More Information' section
    FOR  ${button}  IN  Plans  ISD Packs  T&C
        
        # Below command will press the button(s) as per the loop iterator 'Button'
        Wait For And Click Element                  xpath=//button[normalize-space()="${button}"] 
        Sleep  2s
        
        # Since T&C button click will open popup that's why the mentioned case is handled separately
        IF  '${button}' == 'T&C'
            
            # It will wait until the page contains the mentioned keyword
            Wait Until Page Contains  text=Terms and conditions
            
            # Once the desired redirection gets successfull, it will capture the screen shot and will save it to the mentioned directory
            Take Page Screenshot      Sc_Name=${button}_Confirmation
        ELSE
            # Once after the button click, pdf opens in different tab, so it'll switch to that tab to verify
            Switch Window             url=${URLs}[${index}]
            
            # It will capture the page screen shot and save it to the mentioned directory.
            Take Page Screenshot      Sc_Name=${button}_Confirmation 
            
            # It will switch the window back to previous one to carry the execution further.
            Switch Window             title=Postpaid Broadband Plans - JioFiber Postpaid Plans
            
            # This will increase the size of index by 1.
            ${index} =  Evaluate      expression=${index} + 1
        END
    END

Click on Semi-Annual Section-Redirection

   # Scroll to 'Our plans for existing users' section
   Scroll To                                  xpath://h1[contains(@class,'1vokM j-text j-text-heading-l')]       
   
    # Will Click on SemiAnnual button             
    Wait For And Click Element                ${SemiAnnual_1} 

Verify the Content and UI of plan page and plan cards
    Click on Semi-Annual Section-Redirection

    Plan Page UI Verification-2    Semi-Annual
    
    Plan Card Verification-2   cards=//*[contains(@class,"desktop")]//div[contains(@class,"planDetailsCard")]  sheet_name=Fiber_Postpaid  row_num=49  
    
Verify UI elements and content of Filter pop-up-SemiAnnual
    

    # Filter Redirection and UI verification
    Filter Button Verification 

Verify the Redirection of Book Now and View Details button of all plans card-SemiAnnual

    

    ${card_count}=    Get Element Count           xpath=//section[@class='j-container l-breakpoint--desktop']//section[@class='j-container bg--primary-20 l-radius--xl']

    # Clicks on Book Now buttton of  12  cards
     FOR  ${i}  IN RANGE  1    ${card_count}+1    
        Click Element                             xpath:(//button[@class='j-button j-button-size__medium primary'])[${i}]  

        # Verifies the card of GetJio Fiber page 
        Wait For And Verify Element           ${Get_JioFiber}         
        Go Back
        Sleep    2s      
        
        # Verify Content Of View Details Popup
        View Details Pop up Verification 2         xpath:(//button[@class='j-button j-button-size__medium tertiary'])[${i}]  xpath:(//*[contains(@class,"planDetailsPopup")])[${i}]   Fiber_Postpaid   15   ${i}   xpath:(//div[@class='j-modal j-modal-visible j-modal-closable j-modal-size-s planDetailsPopup j-modal-kind-dialog']//div[@class='j-modal-container']//div//header[@class='j-modal-header']//button[@aria-label='button'])
    END


Verify the redirection of button present under More Information Section-Semi-Annual
    
    
    # Below command will Scroll To to 'More Information' section
    Scroll To   xpath=//button[normalize-space()="Plans"]
    Sleep  2s
    
    # This will set the index variable to 0
    ${index} =  Set Variable  0
    
    # Loop will iterate for all the buttons present under 'More Information' section
    FOR  ${button}  IN  Plans  ISD Packs  T&C
        
        # Below command will press the button(s) as per the loop iterator 'Button'
        Wait For And Click Element     xpath=//button[normalize-space()="${button}"] 
        Sleep  2s
        
        # Since T&C button click will open popup that's why the mentioned case is handled separately
        IF  '${button}' == 'T&C'
            
            # It will wait until the page contains the mentioned keyword
            Wait Until Page Contains   text=Terms and conditions
            
            # Once the desired redirection gets successfull, it will capture the screen shot and will save it to the mentioned directory
            Take Page Screenshot           Sc_Name=${button}_Confirmation
        ELSE
            
            # Once after the button click, pdf opens in different tab, so it'll switch to that tab to verify
            Switch Window                  url=${URLs}[${index}]
            
            # It will capture the page screen shot and save it to the mentioned directory.
            Take Page Screenshot           Sc_Name=${button}_Confirmation 
            
            # It will switch the window back to previous one to carry the execution further.
            Switch Window                  title=Postpaid Broadband Plans - JioFiber Postpaid Plans
            
            # This will increase the size of index by 1.
            ${index} =  Evaluate      expression=${index} + 1
        END
    END

Click on Annual Section-Redirection
    #  Annual

    # Scroll to "Our plans for existing users" section 
    Scroll To                                xpath://h1[contains(@class,'1vokM j-text j-text-heading-l')]

    # Click on Annual button
    Wait For And Click Element                 ${Annual_1}  

Verify the UI and content of Annual Plans page
    Click on Annual Section-Redirection
    Plan Page UI Verification-2    Annual
    
Verify UI elements and content of Filter pop-up-Annual 
    
    Filter Button Verification

Verify the UI and content of all plan cards in Annual plan section
    
    Plan Card Verification-2   cards=//*[contains(@class,"desktop")]//div[contains(@class,"planDetailsCard")]  sheet_name=Fiber_Postpaid  row_num=26
        
Verify the Redirection of Book Now and View Details button of all plans card-Annual
     
    ${card_count}=    Get Element Count       xpath=//section[@class='j-container l-breakpoint--desktop']//section[@class='j-container bg--primary-20 l-radius--xl']

    # Clicks on Book Now button of all 12 cards    
    FOR  ${i}  IN RANGE   1   ${card_count}+1 

        # Clicks on Book Now button of all 11 cards
        Click Element                          xpath:(//button[@class='j-button j-button-size__medium primary'])[${i}]

        # waits Till GetJio Fiber card is present after clicking on Book Now button
        Wait Until Element Is Visible          ${Get_JioFiber}    timeout=10s
        Go Back
        Sleep    3s

        View Details Pop up Verification 2    xpath:(//section[@class='j-container l-breakpoint--desktop']//button[@class='j-button j-button-size__medium tertiary'])[${i}]  xpath:(//*[contains(@class,"planDetailsPopup")])[${i}]   Fiber_Postpaid   8   ${i}  xpath:(//div[@class='j-modal j-modal-visible j-modal-closable j-modal-size-s planDetailsPopup j-modal-kind-dialog']//div[@class='j-modal-container']//div//header[@class='j-modal-header']//button[@aria-label='button'])

    END

Verify the redirection of all the button present under More Information Section-Annual
     
    # Below command will Scroll To to 'More Information' section
    Scroll To   xpath=//button[normalize-space()="Plans"]
    Sleep  2s

    # This will set the index variable to 0
    ${index} =  Set Variable  0

    # Loop will iterate for all the buttons present under 'More Information' section
    FOR  ${button}  IN  Plans  ISD Packs  T&C

        # Below command will press the button(s) as per the loop iterator 'Button'
        Wait For And Click Element                  xpath=//button[normalize-space()="${button}"] 
        Sleep    3s

        # Since T&C button click will open popup that's why the mentioned case is handled separately
        IF  '${button}' == 'T&C'

            # It will wait until the page contains the mentioned keyword
            Wait Until Page Contains      text=Terms and conditions

            # Once the desired redirection gets successfull, it will capture the screen shot and will save it to the mentioned directory
            Take Page Screenshot           Sc_Name=${button}_Confirmation
        ELSE
            # Once after the button click, pdf opens in different tab, so it'll switch to that tab to verify
            Switch Window                  url=${URLs}[${index}]

            # It will capture the page screen shot and save it to the mentioned directory.
            Take Page Screenshot           Sc_Name=${button}_Confirmation 
            
            # It will switch the window back to previous one to carry the execution further.
            Switch Window                  title=Postpaid Broadband Plans - JioFiber Postpaid Plans

            # This will increase the size of index by 1.
            ${index} =  Evaluate      expression=${index} + 1
        END
    END

#ISD
Click on ISD Section Redirection

    # Scroll and Clicks on ISD 
    Scroll To                                ${ISD_1}
    Wait For And Verify Element                ${ISD_1}   
    Wait For And Click Element                 ${ISD_1}

Verify the UI and content of ISD Plans page and plan cards

    Click on ISD Section Redirection

    CSS Verification                           xpath=//section[@class='j-container l-breakpoint--desktop']//h1[@class="Filter_category__2vFb8 j-text j-text-heading-l"]    font-weight    900

    # Verify the 1st card   
    Page Should Contain Element                xpath:(//section[@class='j-container bg--primary-20 l-radius--xl'])[1]

    # Verify the 2nd card
    Page Should Contain Element                xpath:(//section[@class='j-container bg--primary-20 l-radius--xl'])[2]
    Plan Card Verification-2   cards=//*[contains(@class,"desktop")]//div[contains(@class,"planDetailsCard")]  sheet_name=Fiber_Postpaid  row_num=51

    FOR  ${i}   IN RANGE   1      3
            Wait For And Verify Content        xpath:(//button[@class='j-button j-button-size__medium primary'])[${i}]    Recharge
            Wait For And Verify Content        xpath:(//button[@class='j-button j-button-size__medium tertiary'])[${i}]   View details
    END

Verify the redirection of Recharge button of ISD plans

    # Since in the page there are 2 cards so loop will iterate 2 times.    
    FOR  ${i}  IN RANGE  2

       # it will press 'Recharge' button present on card.       
       Wait For And Click Element       xpath=//*[contains(@class,"desktop")]//button//*[normalize-space()="Recharge"]       
       Sleep  2s

       # This will enter the number in the field present in the popup.       
       Input Text                        xpath=//label[text()="JioFiber number"]/preceding-sibling::input  text=${Fiber_no}       
       Sleep  100ms

       # After entering number in the input field,'Continue' button gets enabled and will press it.       
       Click Button                      xpath=//button[@aria-label="button Continue"]  

       # This will wait until the desired redirection takes place i.e., to 'Payments' page        
       Wait Until Page Contains Element  xpath=//p[text()="Payments"]      
        
       # It will capture the screen shot of the redirected page.       
       Take Page Screenshot              Sc_Name=Payments_redirection
       Go Back
    END
        
Verify UI of Recharge of and View details and check functionality of View details ISD plans


    # Clicks on Recharge button of 1st card
    Wait For And Click Element             xpath:(//button[@class='j-button j-button-size__medium primary'][contains(.,'Recharge')])[1]

    # It will move to 'Continue' button and then it will press 'Enter'    
    Element Should Be Disabled             xpath=//button[@aria-label="button Continue"]

    # It Will Wait Untile Page Contains That Element    
    Wait Until Page Contains Element        //label[text()="JioFiber number"]/preceding-sibling::input 

    # It will enter text into the field    
    Input Text                              xpath=//label[text()="JioFiber number"]/preceding-sibling::input   text=${Fiber_No}
    Sleep  100ms

    # It will press 'Continue' button    
    Element Should Be Enabled  xpath=//button[@aria-label="button Continue"]
    Sleep  100ms    

    # Cross icon
    Element Should Be Visible                  xpath://div[contains(@class,"j-modal-kind-informational")]//button//*[name()="svg"]  

    # Recharge as heading  
    Wait Until Element Is Visible              xpath://div[@class='j-text j-text-heading-xs']   
    CSS Verification                           xpath=//div[@class='j-text j-text-heading-xs']    font-weight    900    

    # Rupee symbol
    Wait Until Element Is Visible              xpath://span[@class='j-icon j-icon__bg']    timeout=10s 

    # Cross icon
    Element Should Be Visible                  xpath://div[contains(@class,"j-modal-kind-informational")]//button//*[name()="svg"]   

    # Textfield to enter number
    Element Should Be Visible                  xpath://input[@type='tel'] 

    # Placeholder as JioFiber number   
    Page Should Contain Element                xpath://label[contains(text() , 'JioFiber number')]    

    # Verifies Continue button
    Element Should Be Visible                  xpath://div[@layout='centered']//div[1]  

    # This will close the popup by pressing the 'Cross' button in top-left.    
    Click Element                              xpath=//div[contains(@class,"j-modal-kind-informational")]//button//*[name()="svg"]

Verify Error message when an Invalid Jio number/not registered number is entered

    Reload Page

    # It will first press 'Recharge' button and popup will appear    
    Wait For And Click Element                  xpath=//button//*[text()="Recharge"]

    # It will move to 'Continue' button and then it will press 'Enter'    
    Element Should Be Disabled                  xpath=//button[@aria-label="button Continue"]

    # It Will Wait Untile Page Contains That Element    
    Wait Until Page Contains Element            //label[text()="JioFiber number"]/preceding-sibling::input 

    # It will enter text into the field    
    Input Text                                  xpath=//label[text()="JioFiber number"]/preceding-sibling::input  text=${Incorrect_No1}

    # It will press 'Continue' button    
    Click Element                               xpath=//button[@aria-label="button Continue"]
    Sleep  100ms    

    # It will verify until error message pops up    
    Wait Until Page Contains      ${Error_message1}
    Sleep  100ms 

    # This will close the popup by pressing the 'Cross' button in top-left.   
    Click Element                               xpath=//div[contains(@class,"j-modal-kind-informational")]//button//*[name()="svg"]
    Sleep  2s
   
Verify UI and content of View details pop-up card and check functionality of buttons on pop-up-ISD
        


    FOR  ${i}  IN RANGE   1   3
        View Details Pop up Verification 2        xpath:(//section[@class='j-container l-breakpoint--desktop']//button[@class='j-button j-button-size__medium tertiary'])[${i}]  xpath:(//*[contains(@class,"planDetailsPopup")])[${i}]   Fiber_Postpaid    20  ${i}   xpath:(//div[@class='j-modal j-modal-visible j-modal-closable j-modal-size-s planDetailsPopup j-modal-kind-dialog']//div[@class='j-modal-container']//div//header[@class='j-modal-header']//button[@aria-label='button'])    
    END
    
    # Clicks on View details of 1st card  
    Click Element                                 xpath:(//button[contains(.,'View details')])[1] 

    # Click here link
    Scroll To                                     xpath://a[contains(text(),'Click here')]
    Page Should Contain                           Notes
    Page Should Contain                           For ISD Call rates, kindly Click here
    Element Should Be Visible                     xpath://a[contains(text(),'Click here')]    

    # Cross icon
    Element Should Be Visible                     xpath://div[contains(@class,"j-modal-visible")]//*[name()="svg"]  

    # Redirection will happen by clicking the button of which xpath provided, and it will verify and take screen shot    
    Redirection On Clicking  //*[contains(@class,"j-modal-visible")]//a[text()="Click here "]  https://jep-asset.akamaized.net/jio/plan/JioFIber-ISD-Packs-21072020_1.pdf   ISDConfirmation
    Sleep    2s
    
    # Clicks on View details of 1st card  
    Click Element                              xpath:(//button[contains(.,'View details')])[1]

    # Veifies Recharge button  
    Wait For And Verify Element                xpath://div[@class='j-modal j-modal-visible j-modal-closable j-modal-size-s planDetailsPopup j-modal-kind-dialog']//div//div[@class='j-modal-body']//button[@aria-label='button']   
    Wait For And Click Element                 xpath://div[@class='j-modal j-modal-visible j-modal-closable j-modal-size-s planDetailsPopup j-modal-kind-dialog']//div//div[@class='j-modal-body']//button[@aria-label='button']
    # Verifies Pop-up Opens Up
    Page Should Contain                        Recharge
    # Sleep        2s

    # Clicks on cross icon   
    Click Element                              xpath://div[contains(@class,"j-modal-visible")]//*[name()="svg"]

Verify the Redirection of all button present under More Information Section
    

    # Scroll till 'More information' section is visible
   Scroll To                                 xpath:(//div[contains(@class,'2qAx3 j-text j-text-heading-s')])[1]

    # Below command will Scroll To to 'More Information' section
    Scroll To   xpath=//button[normalize-space()="Plans"]
    Sleep  2s

    # This will set the index variable to 0
    ${index} =  Set Variable  0

    # Loop will iterate for all the buttons present under 'More Information' section
    FOR  ${button}  IN  Plans  ISD Packs  T&C

        # Below command will press the button(s) as per the loop iterator 'Button'
        Wait For And Click Element                  xpath=//button[normalize-space()="${button}"] 
        Sleep    2s

        # Since T&C button click will open popup that's why the mentioned case is handled separately
        IF  '${button}' == 'T&C'

            # It will wait until the page contains the mentioned keyword
            Wait Until Page Contains  text=Terms and conditions

            # Once the desired redirection gets successfull, it will capture the screen shot and will save it to the mentioned directory
            Take Page Screenshot           Sc_Name=${button}_Confirmation
        ELSE
            # Once after the button click, pdf opens in different tab, so it'll switch to that tab to verify
            Switch Window             url=${URLs}[${index}]

            # It will capture the page screen shot and save it to the mentioned directory.
            Take Page Screenshot           Sc_Name=${button}_Confirmation 

            # It will switch the window back to previous one to carry the execution further.
            Switch Window             title=Postpaid Broadband Plans - JioFiber Postpaid Plans

            # This will increase the size of index by 1.
            ${index} =  Evaluate      expression=${index} + 1
        END
    END

Click on DataSachet Section-Redirection
     Scroll To                                ${DataSachet_1}
    Wait For And Verify Element                ${DataSachet_1}   
    Wait For And Click Element                 ${DataSachet_1}

Verify UI and content of all plan cards in Data Sachet section
    Click on DataSachet Section-Redirection
    
    # This will verify page contains 'Data Sachet'
    Text Verification            locator=//*[contains(@class,"desktop")]//h1[normalize-space()="Data Sachet"]          title=Data Sachet

    # This will check whether page contains plan card or not.
    Page Should Contain Element  xpath=//div[contains(@class,"planDetailsCard_container__1gH8d")]

    
    Plan Card Verification-2   cards=//*[contains(@class,"desktop")]//div[contains(@class,"planDetailsCard")]  sheet_name=Fiber_Postpaid  row_num=53

    # It will click the button 'Recharge' present on the card of 'Data Sachet' page.
    Wait For And Click Element   xpath=//section[contains(@class,"desktop")]//button//*[text()="Recharge"]
    Sleep  2s

    # This will ensure the existence of 'Rupee' Symbol
    Page Should Contain Element  xpath=//div[@tabindex=0]//*[name()="svg"]  

    # This will ensure the existence of 'Recharge' Heading
    Page Should Contain Element  xpath=//div[@tabindex=0]//div[text()="Recharge"]

    # This will ensure the existence of Subheading
    Page Should Contain Element  xpath=//div[@tabindex=0]//*[text()="Enter your JioFiber number"]

    # This will ensure the existence of Label 'JioFiber number'
    Page Should Contain Element  xpath=//div[@tabindex="0"]//*[text()="JioFiber number"]

    # This will ensure the existence of input field present on card.
    Page Should Contain Element  xpath=//*[text()="JioFiber number"]//preceding-sibling::*[name()="input"]

    # This will ensure the existence of 'Cross Icon'
    Page Should Contain Element  xpath=//div[contains(@class,"j-modal-kind-informational")]//button//*[name()="svg"]

    # This will ensure the 'Continue' button present on popup
    Element Should Be Disabled   xpath=//div[@tabindex=0]//button[@aria-label="button Continue"]

    # It will move to 'Continue' button and then it will press 'Enter'    
    Element Should Be Disabled  xpath=//button[@aria-label="button Continue"]

    # It Will Wait Untile Page Contains That Element    
    Wait Until Page Contains Element   //label[text()="JioFiber number"]/preceding-sibling::input    

    # It will enter text into the field    
    Input Text                xpath=//label[text()="JioFiber number"]/preceding-sibling::input  text=${Incorrect_No1}
    
    # It will check For the enable of 'Continue' Button
    Element Should Be Enabled  xpath=//button[@aria-label="button Continue"]

    # It will press 'Continue' button    
    Click Element             xpath=//button[@aria-label="button Continue"]
    Sleep  100ms    

    # It will verify until error message pops up    
    Wait Until Page Contains      ${Error_message1}
    Sleep  100ms    

    # This will close the popup by pressing the 'Cross' button in top-left.  
    Click Element             xpath=//div[contains(@class,"j-modal-kind-informational")]//button//*[name()="svg"]
    Sleep  2s
    
    # It will Scroll To to 'Other Postpaid plans' section
   Scroll To                  xpath=//div[text()="Other Postpaid plans"]

   # It will Scroll To to 'More information' section
   Scroll To                  xpath=//div[text()="More information"]

Verify the UI and content of View details pop-up card
    
   

    # This will get all 'View details' buttons present on the card
    @{VDBT} =  Get WebElements      xpath=//section[contains(@class,"desktop")]//button//*[normalize-space()="View details"]

   # Below command will count all the 'View details' buttons present on card.
    ${btn_cnt} =  Get Length    item=${VDBT}
    ${index} =  Set Variable      20

    FOR  ${i}  IN RANGE   1  ${btn_cnt}+1

        View Details Pop up Verification 2    xpath:(//section[@class='j-container l-breakpoint--desktop']//button[@class='j-button j-button-size__medium tertiary'])[${i}]  xpath:(//*[contains(@class,"planDetailsPopup")])[${i}]   Fiber_Postpaid    22  ${i}   xpath:(//div[@class='j-modal j-modal-visible j-modal-closable j-modal-size-s planDetailsPopup j-modal-kind-dialog']//div[@class='j-modal-container']//div//header[@class='j-modal-header']//button[@aria-label='button'])
    END    
    
Verify redirection of Recharge button of all plans card
    
    

    # This will get all 'View details' buttons present on the card

    @{RBT} =  Get WebElements  xpath=//section[contains(@class,"desktop")]//button//*[normalize-space()="View details"]

   # Loop will iterate on the list of web elements got earlier
    FOR  ${btn}  IN  @{RBT}
        
       # This will click the 'Recharge' button present on card
       Wait For And Click Element                 locator=${btn}
       Sleep  2s

       # This will click the 'Recharge' button present on popup
       Wait For And Click Element   xpath=//div[contains(@class,"j-modal-visible")]//button//*[normalize-space()="Recharge"]
       Sleep  2s
       
       # This will check the heading 'Recharge' present on popup
       Page Should Contain Element  xpath=//div[contains(@class,"j-modal-visible")]//div[text()="Recharge"]
       Sleep  2s
       
       # This will Click The Cross Button On Popup
       Wait For And Click Element   xpath=//div[contains(@class,"j-modal-visible")]//*[name()="svg"]
       Sleep  2s

    END

Verify Redirection of all buttons under Other Postpaid plans-Data Sachet
    
        

         FOR  ${button}  IN  Monthly  Quarterly  Annual  Semi-Annual  ISD
    
       # This will Scroll To to specific button and click on it.
        Scroll To   xpath=//section[contains(@class,"desktop")]//section[contains(@class,"changeCategory")]//button[@aria-label="button ${button}"]  
        Click Element    xpath=//section[contains(@class,"desktop")]//section[contains(@class,"changeCategory")]//button[@aria-label="button ${button}"]  
       
       #Page should contain text after redirection 
       Page Should Contain      text=${button}
    
       # This will capture the page screenshot post redirection
       Take Page Screenshot  ${button}
       Sleep  2s
       Wait For And Click Element  xpath=//button[@aria-label="button Data Sachet"]
    END

Verify Redirection of button present under More Information Section-Data Sachet

    

    # Below command will Scroll To to 'More Information' section
    Scroll To   xpath=//button[normalize-space()="Plans"]
    Sleep  2s
    # This will set the index variable to 0
    ${index} =  Set Variable  0

    # Loop will iterate for all the buttons present under 'More Information' section
    FOR  ${button}  IN  Plans  ISD Packs  T&C

        # Below command will press the button(s) as per the loop iterator 'Button'
        Wait For And Click Element                  xpath=//button[normalize-space()="${button}"] 
        Sleep    2s

        # Since T&C button click will open popup that's why the mentioned case is handled separately
        IF  '${button}' == 'T&C'

            # It will wait until the page contains the mentioned keyword
            Wait Until Page Contains       text=Terms and conditions

            # Once the desired redirection gets successfull, it will capture the screen shot and will save it to the mentioned directory
            Take Page Screenshot           Sc_Name=${button}_Confirmation

        ELSE
            # Once after the button click, pdf opens in different tab, so it'll switch to that tab to verify
            Switch Window                  url=${URLs}[${index}]

            # It will capture the page screen shot and save it to the mentioned directory.
            Take Page Screenshot           Sc_Name=${button}_Confirmation 

            # It will switch the window back to previous one to carry the execution further.
            Switch Window                  title=Postpaid Broadband Plans - JioFiber Postpaid Plans

            # This will increase the size of index by 1.
            ${index} =  Evaluate           expression=${index} + 1
        END
    END
    
Verify Confirm Entertainment on demand section is visible and verify the UI elements and content

    # Scroll To Element Which Has Text JioSaavn
    Scroll To                        //*[text()="JioSaavn"]
    Sleep  200ms

    # Will Ensure That Page Must Be Containing 'Entertainment on demand!' Text
    Page Should Contain              ${Heading}

    # Will Ensure That Page Must Be Containing Provided Text
    Page Should Contain              ${Text}

    # It Will Get All The Elements Matching The Provided Xpath
    @{Ott_icons} =  Get WebElements  //div[contains(@class,"EntertainmentIcons_iconText")]

    # Loop To Iterate For Every Ott Icon Present
    FOR  ${icon}  IN  @{Ott_icons}
        
        # It Will Simulate Clicking The Icon
        Click Element  ${icon}
    END
