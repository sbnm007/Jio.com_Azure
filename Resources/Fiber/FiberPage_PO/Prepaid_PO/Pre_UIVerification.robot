*** Settings ***
Library     SeleniumLibrary
Resource    ../../../Common.robot
Resource    ../Prepaid_PO/FAQ_Verification.robot
Resource    ../Prepaid_PO/NowUpgrade_Section.robot
Resource    ..//Prepaid_PO/RedirectionToPrepaid.robot

*** Keywords ***
Prepaid page UI Validation
    #Underline On Prepaid Button on Navigation Bar
    Wait Until Keyword Succeeds    30 sec    0 sec     CSS Verification     xpath=//li[@onclick="window.location.href='/selfcare/plans/fiber/fiber-prepaid-plans-home/'"]    border-bottom-color    rgba(229, 247, 238, 1)
    #Verifying Prepaid tab is underlined
    Wait For And Verify Element                 xpath=//li[@onclick="window.location.href='/selfcare/plans/fiber/fiber-prepaid-plans-home/'"]    
    CSS Verification                            xpath=//li[@onclick="window.location.href='/selfcare/plans/fiber/fiber-prepaid-plans-home/'"]    border-bottom-style    solid    
    
    #Verifying banner
    Now upgrade your JioFiber plan anytime UI & Content Validation 

    #Verifying Already a JioFiber User? heading
    Wait For And Verify Content                 xpath=//h1[@class="fiber-prepaid-plans_heading__7_OSD j-text j-text-heading-l"]    ${Pre_headings}[0]    
    CSS Verification                            xpath=//h1[@class="fiber-prepaid-plans_heading__7_OSD j-text j-text-heading-l"]    font-weight     900

    #Verifying Monthly, Quaterly, Semi-Annual, Annual, ISD, Top-up, Data Sachet buttons
    FOR     ${i}    IN RANGE    0    7
        Wait For And Verify Element             xpath=(//button[@aria-label='${pre_buttons}[${i}]'])    
        Redirection On Clicking                 xpath=//button[@aria-label='button ${PlanButtons}[${i}]']        ${PlanUrls}[${i}]        ${PlanButtons}[${i}]PlansPage
    END

    #Verifying 'Here’re some of the thoughtfully curated plans' heading 
    Scroll To                                   xpath=//div[@class="Category_heading__2AMfm j-text j-text-heading-m"]            
    Wait For And Verify Content                 xpath=//div[@class="Category_heading__2AMfm j-text j-text-heading-m"]    ${Pre_headings}[1] 
    CSS Verification                            xpath=//div[@class="Category_heading__2AMfm j-text j-text-heading-m"]    font-weight     900     

    #Verifying recharge tile 
    Scroll To                                   xpath=//div[@style="--grid-template:1fr 1fr 1fr;--grid-template-tablet:1fr 1fr;--grid-template-mobile:1fr;--grid-gap:1rem;--grid-align:center;--grid-justify:center"]
    FOR     ${i}    IN RANGE    0    3
        Section Verification                    xpath=(//section[@class="j-container bg--primary-20 l-radius--xl"])[${i+1}]        ${plan_tag}[${i}]
    END
    
    #Getting Number of Plan Cards
    ${Plan_Card_Count}=  Get Element Count      xpath=(//div[@class='j-grid']//div[@class='Details_detailsCont__iCgow'])
    Log To Console    ${Plan_Card_Count}
    #Loop for Verifying UI And Content
    FOR  ${i}  IN RANGE     0    ${Plan_Card_Count}
        #Loop to verify there are 3 Plan Cards
        Wait For And Verify Element             xpath=(//div[@class='j-grid']//div[@class='Details_detailsCont__iCgow'])[${i}+1]

        #Loop to Verify there are tags in each card
        Wait For And Verify Element             xpath=(//div[@class='j-contentBlock__caption'])[${i}+1]//div[@class='Details_planListTagStyle__1P-_M']
        Wait For And Verify Content             xpath=(//div[@class='j-contentBlock__caption'])[${i}+1]//div[@class='Details_planListTagStyle__1P-_M']    ${TAG_Text}[${i}]
        
        #Loop to Verify there are amount in each card
        Wait For And Verify Element             xpath=(//div[@class='planDetailsCard_container__1gH8d'])[${i}+1]//div[@class='PlanName_planText__26L0a j-text j-text-heading-m']
        Wait For And Verify Content             xpath=(//div[@class='planDetailsCard_container__1gH8d'])[${i}+1]//div[@class='PlanName_planText__26L0a j-text j-text-heading-m']    ₹\n${AMT_Value}[${i}]\n+GST
    
        #Loop to Verify Validity and Data

        #Data
        Wait For And Verify Element             xpath=(//div[@class='j-grid']//div[@class='DataCol_gridItem__3le8p'])[${i}+1]   
        Wait For And Verify Content             xpath=(//div[@class='j-grid']//div[@class='DataCol_gridItem__3le8p'])[${i}+1]//div[@class='j-text j-text-body-s-bold']    ${DATA_SPEED_Text}[${i}]
        #Validity
        Wait For And Verify Element             xpath=(//div[@class='j-grid']//div[@class='ValidityCol_gridItem__2zjei'])[${i}+1]
        Wait For And Verify Content             xpath=(//div[@class='j-grid']//div[@class='ValidityCol_gridItem__2zjei'])[${i}+1]//div[@class='j-text j-text-body-s-bold']     30 Days   
    

        #Loop to Verify Recharge and View Details button

        #Recharge
        Button Verification                     xpath=(//div[@class='j-grid']//div[@class='Details_detailsCont__iCgow'])[${i}+1]//button[@aria-label='button']    
        #View Details 
        Wait For And Verify Element             xpath=(//div[@class='j-grid']//div[@class='Details_detailsCont__iCgow']//button[@aria-label='button']//div[contains(text(),'View details')])[${i}+1]    
    
    END
    #Verifying View All plan button
    Wait For And Verify Element                 xpath=//button[@aria-label='button View all plans']


    
    #Loop for verifying the Logo
    ${Logo_Count}=    Get Element Count         xpath=(//div[@class='j-grid']//img[@alt='Subscription Item'])
    Log To Console    ${Logo_Count}
    FOR  ${i}  IN RANGE     1    ${Logo_Count}
        Logo Verification                       xpath=(//div[@class='j-grid']//img[@alt='Subscription Item'])[${i}]
    END
    #Clicking on the View Details of 1st Plan Card(RS 999)
    Wait For And Click Element                  xpath=(//button[@aria-label='button'][normalize-space()='View details'])[1]
    

    #Confirming the visibility of popup
    Wait Until Element Is Visible               xpath=//div[@class='j-modal j-modal-visible j-modal-closable j-modal-size-s planDetailsPopup j-modal-kind-dialog']
    Take Page Screenshot                        999_Popup
    
    #Verifying the 'X' Button
    Button Verification                         xpath=//div[@class='j-modal j-modal-visible j-modal-closable j-modal-size-s planDetailsPopup j-modal-kind-dialog']//div[@class='j-modal-container']//div//header[@class='j-modal-header']//button[@aria-label='button']
    
    #Verifying the Tag and Amount Text data through excel
    
    
    #Tag
    Text Verification                           xpath=//div[@class='j-modal-content']//span[@class='j-text j-text-body-xxs-bold'][normalize-space()='POPULAR PLAN']        ${TAG_Text}[0]
   
    #AMOUNT
    Text Verification                           xpath=(//div[@class='PlanName_planText__26L0a j-text j-text-heading-m'])[4]    ₹\n${AMT_Value}[0]\n+GST
   
    #Checking the CSS Verification for Amount Text
    ${Amount_Attr}=    Get Element Attribute    xpath=(//div[@class='PlanName_planText__26L0a j-text j-text-heading-m'])[4]    style
    # Log    ${Amount_Attr}
    Element Attribute Value Should Be           xpath=(//div[@class='PlanName_planText__26L0a j-text j-text-heading-m'])[4]    style    ${Amount_Attr}
   
    #Verifying whole data including Details and Notes
    Text Verification                           xpath=//div[@class='j-modal j-modal-visible j-modal-closable j-modal-size-s planDetailsPopup j-modal-kind-dialog']//div[@class='j-modal-container']//div//div[@class='j-modal-body']    ${999_Pop_Up_Whole_Text} 
   
    #LOOP FOR OTT LOGO VERIFICATION  
    #NOTE: Xpath used is RelXpath from Selectors Hub to Locate accurate LOGOs Location. Comment 'LOGO VERIFATION LOOP' if it disrupts the code. 
    ${No_of_LOGOS}=    Get Element Count        xpath=((//div[@class="simplebar-content"]//div[@class="j-grid"])[1]//img)                   
    Log To Console    ${No_of_LOGOS}
    FOR  ${i}  IN RANGE     1     ${No_of_LOGOS}
        Logo Verification                       xpath=((//div[@class="simplebar-content"]//div[@class="j-grid"])[1]//img)[${i}]          
    END  
   
    #RECHARGE BUTTON VERIFICATION
    Scroll To                    xpath=//div[@class='j-modal j-modal-visible j-modal-closable j-modal-size-s planDetailsPopup j-modal-kind-dialog']//div[@class='j-modal-container']//div//div[@class='j-modal-body']//button[@aria-label='button']
    Button Verification                         xpath=//div[@class='j-modal j-modal-visible j-modal-closable j-modal-size-s planDetailsPopup j-modal-kind-dialog']//div[@class='j-modal-container']//div//div[@class='j-modal-body']//button[@aria-label='button']
    
    # Verifying redirection after clicking continue button

    Wait For And Click Element                  xpath=//div[@class='j-modal j-modal-visible j-modal-closable j-modal-size-s planDetailsPopup j-modal-kind-dialog']//div[@class='j-modal-container']//div//div[@class='j-modal-body']//button[@aria-label='button']
    Wait For And Input Text                     xpath=//input[@type='tel']    ${Fiber_No}
    Element Should Be Enabled                   xpath=//div[contains(text(),'Continue')]
    Wait For And Click Element                  xpath=//div[contains(text(),'Continue')]

    #Redirection on clicking cannot be used as URL is dynamic
    Wait For And Verify Content                 xpath=(//p[@class='css-173t8lh'])[1]    Amount Payable
    Take Page Screenshot                        999_Plan_Payment_GateWay_Page
    Go Back
    


    
    #Verifying Category help section
    Scroll To                                   xpath=//div[@class="Category_helpFulCTAs__3XQ1T"]
    Wait For And Verify Content                 xpath=//div[contains(text(),"${Pre_headings}[2]")]     ${Pre_headings}[2] 
    Wait For And Verify Content                 xpath=//div[contains(text(),"${Pre_headings}[3]")]       ${Pre_headings}[3] 

    #Verifying Always at pace with your digital needs heading with plan details tile
    Scroll To                                   xpath=//div[contains(text(),'${Pre_headings}[4]')]
    Wait For And Verify Content                 xpath=//div[contains(text(),'${Pre_headings}[4]')]    ${Pre_headings}[4]
    CSS Verification                            xpath=//div[contains(text(),'${Pre_headings}[4]')]    font-weight     900
    
    #Verifying plan tile
    Scroll To                                   xpath=//div[@style="--grid-template:1fr 1fr 1fr;--grid-template-tablet:1fr 1fr;--grid-template-mobile:1fr;--grid-gap:1rem;--grid-align:stretch;--grid-justify:center"]
    FOR     ${i}    IN RANGE    1    4
        Wait For And Verify Element             xpath=(//div[@class="j-card bg--primary-20 size--s card-vertical j-card__shadow"])[${i}]
    END

    #Getting Number of Cards Present
    ${Card_Count}=    Get Element Count         xpath=//div[@class='j-grid']//div[@class='fiber-prepaid-plans_planCardCont__3YRQ8']
    Log To Console    ${Card_Count}
    #Loop to verify Data in Cards
    FOR  ${i}  IN RANGE    0    ${Card_Count}
        Wait For And Verify Element             xpath=//div[@class='j-grid']//div[@class='fiber-prepaid-plans_planCardCont__3YRQ8'][${i}+1]
        Text Verification                       xpath=//div[@class='j-grid']//div[@class='fiber-prepaid-plans_planCardCont__3YRQ8'][${i}+1]    ${Card_Data}[${i}] 
    END

    #Loop to Verify Redirections
    #Used Excel for buttons Xpath
    FOR  ${i}    ${j}    ${k}      IN ZIP       ${Always_At_Pace_Data_Buttons}    ${Always_At_Pace_URLs}    ${Button_Name}    
        Redirection On Clicking_Button          ${i}     ${j}     ${k}    https://www.jio.com/selfcare/plans/fiber/fiber-prepaid-plans-home/       
        #Scrollling on Always at pace section
        Scroll To                               xpath=//div[@class='j-grid']//div[@class='fiber-prepaid-plans_planCardCont__3YRQ8']
        Wait For And Verify Content             xpath=//div[normalize-space()='Always at pace with your digital needs']           Always at pace with your digital needs
        Element Attribute Value Should Be       xpath=//div[normalize-space()='Always at pace with your digital needs']    style                --color-text:var(--color-black);
    END

    
    
    #Verifying 'Build for your unique digital aspirations' heading
    Scroll To                                   xpath=//div[contains(text(),'${Pre_headings}[5]')]
    Wait For And Verify Content                 xpath=//div[contains(text(),'${Pre_headings}[5]')]    ${Pre_headings}[5]
    CSS Verification                            xpath=//div[contains(text(),'${Pre_headings}[5]')]    font-weight     900
    
    #Verifying Banner beside 'Build for your unique digital aspirations' heading 
    Scroll To                                   xpath=(//div[@class="j-card__image ratio-wide"])[1] 
    Image Verification                          xpath=//img[@src='${Banner_img}[0]']

    #Verifying  'Get additional validity on long term plans' Heading
    Wait For And Verify Content                 xpath=//div[contains(text(),'${Pre_headings}[5]')]    ${Pre_headings}[5]
    CSS Verification                            xpath=//div[contains(text(),'${Pre_headings}[5]')]    font-weight      900  
    
    #Verifying  Banners beside 'Get additional validity on long term plans' heading
    Scroll To                                   xpath=//img[@src='${Banner_img}[1]']
    Image Verification                          xpath=//img[@src='${Banner_img}[1]']
     
    #Banners 'Entertainment on Demand' heading
    Wait For And Verify Content                 xpath=//div[contains(text(),'${Pre_headings}[6]')]    ${Pre_headings}[6]
    CSS Verification                            xpath=//div[contains(text(),'${Pre_headings}[6]')]    font-weight      900  
    
    #Verifying icons beside 'Entertainment on Demand' heading
    Wait For And Verify Element                 xpath=//div[@class='EntertainmentIcons_iconContainer__1lXNx']//div[@class='j-grid']    
 
    #Verifying 'Know why India is obsessed with JioFiber' heading
    Scroll To                                   xpath=//section[@class='fiber-prepaid-plans_carouselContainer__fzmkC j-container']
    Wait For And Verify Content                 xpath=//div[contains(text(),'${Pre_headings}[7]')]    ${Pre_headings}[7]
    CSS Verification                            xpath=//div[contains(text(),'${Pre_headings}[7]')]    font-weight      900  
    Wait For And Verify Content                 xpath=//div[normalize-space()='Know why India is obsessed with JioFiber']         Know why India is obsessed with JioFiber

    #Promo Card Button Redirection Verification
    ${Card_Count}=    Get Element Count         xpath=(//section[@class='fiber-prepaid-plans_carouselContainer__fzmkC j-container']//section[@class='promoCards_promoCardStyle__1KLDk j-container'])
    Log To Console    ${Card_Count}
    FOR  ${i}  IN RANGE    0   ${Card_Count} 
        Redirection On Clicking                 xpath=(//section[@class='fiber-prepaid-plans_carouselContainer__fzmkC j-container']//section[@class='promoCards_promoCardStyle__1KLDk j-container'])[${i}+1]    ${Why_India_is_obsessed_Links}[${i}]    Banner_${i}_Successfull
    END


    #FAQ heading
    Scroll To                                   xpath=//div[@class='j-accordion']
    Wait For And Verify Content                 xpath=//div[contains(text(),'${Pre_headings}[8]')]    ${Pre_headings}[8]
    CSS Verification                            xpath=//div[contains(text(),'${Pre_headings}[8]')]    font-weight      900 

    #Unlimited data with JioFiber Prepaid plans Heading
    Scroll To                                   xpath=(//div[@class='j-contentBlock__title']//div[@class="j-text j-text-heading-m"]) 
    Wait For And Verify Content                 xpath=(//div[@class='j-contentBlock__title']//div[@class="j-text j-text-heading-m"])     Unlimited data with JioFiber Prepaid plans
    CSS Verification                            xpath=(//div[@class='j-contentBlock__title']//div[@class="j-text j-text-heading-m"])    font-weight      900