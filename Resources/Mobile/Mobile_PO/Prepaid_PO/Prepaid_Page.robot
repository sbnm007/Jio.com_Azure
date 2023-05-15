*** Settings ***
Library                              SeleniumLibrary
Resource                            ../../../../Resources/Local_Keywords.robot
Variables                            ../../../../Tests/Mobile/MPrepaid_Variables.yaml

*** Keywords ***

Verify Redirection of Top Banner of Prepaid Page
    # Banner Verification
    Banner Content Verification     xpath=//div[@class="Banner_header__sq7Ie j-text j-text-heading-l"]      One-time recharge for 1 full year       xpath=//div[@class="Banner_imageCss__59oo6"]//img     xpath=//button[contains(text(),'Get the best Annual Plan')]     MobPrepaid_TopBanner
    # Banner Redirection
    Redirection On Clicking         xpath=//div[contains(text(),'Get the best Annual Plan')]             https://www.jio.com/selfcare/plans/mobility/prepaid-plans-list/?category=Annual%20Plans&categoryId=QW5udWFsIFBsYW5z&subcategory=MjAlIEppb01hcnQgTWFoYSBDYXNoYmFjaw==        TopBanner_Redirection

Verify UI elements of Prepaid page
    #Refuel your digital life" section and butttons
    Scroll To                        xpath=//button[@aria-label='button Value']
    Text Verification                xpath=//h1[normalize-space()='Refuel your digital life']    Refuel your digital life
    Text Verification                xpath=//h2[contains(text(),'Choose a prepaid mobile plan that suits your uniqu')]    Choose a prepaid mobile plan that suits your unique digital aspirations.
    ${Ele}=  Get WebElements         xpath=//div[@class="plans_buttonMobile__1bWl_"]
    FOR  ${Ele}  IN  @{Ele}
        Wait For And Verify Element     ${Ele}
    END

    #Find India's most-loved plans here
    Scroll To                        xpath=//div[contains(@class,'j-grid')]//div[1]//div[1]//section[1]
    Text Verification                xpath=//div[@class='Category_heading__3bsEB j-text j-text-heading-m']        Find India's most-loved plans here
    # 3 cards of different plans
    ${Ele}=  Get WebElements         xpath=//section[@class='j-container bg--primary-20 l-radius--xl']
    FOR  ${Ele}  IN  @{Ele}
        Wait For And Verify Element     ${Ele}
    END
    #View all plans button
    Wait For And Verify Element      xpath=//div[normalize-space()='View all plans']

    #Get the speed as per your digital needs
    Scroll To                        xpath=//body/div[@id='__next']/div[contains(@class,'selfcare')]/section[contains(@class,'j-container l-layout--full')]/section[contains(@class,'j-container l-layout--max-width')]/div[contains(@class,'j-grid')]/div[1]/div[1]/div[1]
    Text Verification                xpath=//div[normalize-space()='Get the speed as per your digital needs']        Get the speed as per your digital needs
    #3 cards displaying different data limit per day
    ${Ele}=  Get WebElements         xpath=//div[@class='j-card bg--primary-20 size--s card-vertical j-card__shadow']
    FOR  ${Ele}  IN  @{Ele}
        Wait For And Verify Element     ${Ele}
    END 

    #Infographics Section
    Scroll To                        xpath=//div[@class='PrepaidPlanDetails_grid__3zEps j-grid']
    Section Verification             xpath=//div[@class='PrepaidPlanDetails_grid__3zEps j-grid']    ${Infographics1}

    #Upgrade your digital benefits" section
    Scroll To                        xpath=//div[@class='PrepaidBenefits_grid__1WNur j-grid']
    Text Verification                xpath=//div[normalize-space()='Upgrade your digital benefits']    Upgrade your digital benefits
    ${Ele}=  Get WebElements         xpath=//div[@class='PrepaidBenefits_subtitle__zPkDU j-text j-text-body-s']
    FOR  ${Ele}  IN  @{Ele}
        Wait For And Verify Element     ${Ele}
    END

    #Discover more with Jio" section
    Scroll To                        xpath=//body[1]/div[1]/div[2]/section[1]/section[1]/section[5]/div[1]/div[1]/ul[1]/li[1]/section[1]/section[1]/div[1]/div[1]/div[1]/img[1]
    Text Verification                xpath=//div[normalize-space()='Discover more with Jio']    Discover more with Jio
    ${Ele}=  Get WebElements         xpath=//div[@class='promoCards_ctaTitle__xf6sN j-text j-text-body-m-bold']
    FOR  ${Ele}  IN  @{Ele}
        Wait For And Verify Element     ${Ele}
    END

    #FAQ
    Scroll To                        xpath=//section[contains(@class,'faqSection_faqContainer__3KZiU j-container')]
    Text Verification                xpath=//div[@class='j-text j-text-heading-s'][normalize-space()='FAQ']    FAQ
    ${Ele}=  Get WebElements         xpath=//div[@class='j-accordion-panel__header j-text-list-title j-listBlock align-middle']
    FOR  ${Ele}  IN  @{Ele}
        Wait For And Verify Element     ${Ele}
    END
    
    #Enjoy unlimited calls
    Scroll To                        xpath=//section[contains(@class,'j-container l-layout--centered')]//div[contains(@class,'j-contentBlock__content')]
    Text Verification                xpath=//div[contains(@class,'j-text j-text-heading-m')][normalize-space()='Enjoy unlimited calls, SMS, and high-speed internet with the best prepaid plans']    Enjoy unlimited calls, SMS, and high-speed internet with the best prepaid plans
    Wait For And Verify Element      xpath=//div[@class='j-contentBlock j-contentBlock__size-m']//div[@class='j-contentBlock__description']

View All Plans Button Redirection on Prepaid Page

    ${elements}=    Get WebElements     xpath=//div[@class="plans_buttonMobile__1bWl_"]
    ${length}=                          Get Length     ${elements}
    FOR     ${i}    IN RANGE   1  ${length}+1
        ${Pack_Name}=       Take Element Text        xpath=(//div[@class="plans_buttonMobile__1bWl_"])[${i}]
        Wait For And Click Element          xpath=//button[@aria-label="button ${Pack_Name}"]
        
        IF  "${Pack_Name}" == "ISD"
            Wait For And Verify Content         xpath=//div[@class="j-text j-text-heading-l"]         ${Pack_Name} mobile plans
        
        ELSE IF     "${Pack_Name}" == "International Roaming"
            Wait For And Verify Element         xpath=//div[contains(text(),'Get the best plans ever')]

        ELSE IF     "${Pack_Name}" == "JioPhone"
            Wait For And Verify Content         xpath=(//div[@class="Filter_header__EkHAT"]//h1)[1]         ${Pack_Name} Recharge Plans

        ELSE
            Wait For And Verify Content         xpath=(//div[@class="Filter_header__EkHAT"]//h1)[1]         ${Pack_Name}
        END
        Take Page Screenshot                     ${i}_${Pack_Name}_Redirection
        Log To Console                      ${Pack_Name}_Verified
        Go Back
        Sleep                               100ms
    END

Verify and Validate Get the speed Section of Prepaid Page

   # Checking Redirection Of Get The Speed As Per Your Digital Needs Verification Buttons
    Set Screenshot Directory                           ./Results/Mobile/Prepaid_Screenshots/
    # Taking Page Screenshot
    Take Page Screenshot                                Get_the_speed_as_per_your_digital_needs_section
   ${VB}  Set Variable   0
   WHILE  ${VB} < 3   
      Scroll To                     xpath=(//button[@aria-label='button'])[1${VB}]
      # Checking Gb/Day Heading
      Text Verification             xpath=(//h4[@class="j-contentBlock__title j-heading j-text-heading-s"])[${VB} + 1]     ${Plan_D}[${VB}]
      # Verifing Description      
      Wait For And Verify Element   xpath=(//ul[@class="planCard_plansCard__3BEi3"])[${VB} + 1] 
      # Checking Redirection Of Buttons
      Redirection On Clicking       xpath=(//button[@aria-label='button'])[1${VB}]     ${Plan_Url}[${VB}]     ${Plan_ButtonName}[${VB}]_RD  
      ${VB}=   Evaluate     ${VB} + 1
   END


Verify and Validate Discover More With Jio Section of Prepaid Page
     
    Scroll To                                          xpath=//section[@class='plans_carouselContainer__2OiMK j-container']
    Set Screenshot Directory                           ./Results/Mobile/Prepaid_Screenshots/
    # Taking Page Screenshot
    Take Page Screenshot                               Discover_More_With_Jio_Section
    # Discover More With Jio Main Heading Verification
    Text verification                                  xpath=//div[contains(@class,'j-text j-text-heading-m') and contains(text(),"Discover more with Jio")]                             Discover more with Jio
    # Banner Text Verification
    ${elements}=    Get WebElements                    xpath=//div[@class="j-promo-card__content"]//div[@class="j-text j-text-heading-s"]
    ${len}=         Get Length    ${elements}
    Log To Console  ${len}
    ${i}  Set Variable  0
    ${j}  Set Variable  1 
    FOR  ${element}  IN  @{elements}
        Banner Content Verification  ${element}   ${DJ_Title}[${i}]   xpath=(//section[@class="promoCards_promoCardStyle__1KLDk j-container"]//div[@class="j-promo-card__image ratio-landscape"]//img)[${j}]   xpath=//div[@class="j-button-group"]//div[normalize-space()="${DJ_Button}[${i}]"]     ${DJ_Button}[${i}]
        ${i}=   Evaluate     ${i} + 1
        ${j}=   Evaluate     ${j} + 1
    END
    
   # Discover more with Jio Redirection
   # Checking Redirection of buttons of what trending section to their respective web page
   ${VB}  Set Variable   0
   WHILE  ${VB} < 3
      Redirection On Clicking                        xpath=//div[@class="j-button-group"]//div[normalize-space()="${DJ_Button}[${VB}]"]    ${DJ_Url}[${VB}]      ${DJ_Button}[${VB}]_RD  
      ${VB}=   Evaluate     ${VB} + 1
   END
