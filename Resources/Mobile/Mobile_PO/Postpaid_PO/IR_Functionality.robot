*** Settings ***
Library                              SeleniumLibrary
Library                              Collections
Library                              Dialogs
Resource                            ../../../../Resources/Local_Keywords.robot
Resource                            ../../../../Resources/Excel_activity.robot

*** Variables ***
@{IR_Urls}           https://jep-asset.akamaized.net/jio/plan/IR-Standard-PayGo-Rates.pdf             https://www.jio.com/en-in/wifi-calling-terms-conditions          https://www.jio.com/en-in/terms-conditions-international-roaming
${IR}                https://www.jio.com/selfcare/plans/mobility/jio-international-roaming-plans/
@{IR_Titles}         Travelling abroad    International Wi-Fi Calling     In-flight connectivity

*** Keywords ***

Redirection to International Roaming Plan Page
    
    #Clicking on IR Button
    Wait For And Click Element           xpath=//button[@aria-label="button International Roaming"]
    
    #Setting and Taking Screenshot
    Set Screenshot Directory            ./Results/Mobile/Postpaid_Screenshots/IR_Plans/
    Take Page Screenshot                IR-PageLoaded
    URL Validation                      ${IR}
    Reading Data of IR Page from Excel

Validate UI and Content and functionality of International Roaming Plans Page
    #Verifing Travelling abroad? and International Wi-Fi Calling and In-flight connectivity Section
    Reading Data of IR Page from Excel
    FOR  ${i}  IN RANGE  1  4
        Banner Content Verification                               xpath=(//div[@class='j-contentBlock__title']//*[contains(@class,'j-text j-text-heading-m')])[${i}]     ${IR_Titles}[${i-1}]                              xpath=(//section[contains(@class,'--desktop')]//div[contains(@class,'image')]//img)[${i}]                               xpath=(//div[@class='j-button-group']//button)[${i}]    ${IR_Titles}[${i-1}]
    END

    #Verifing Titles From IR Page
    ${elements_titles}=    Get WebElements                        xpath=//*[contains(@class,'j-text j-text-heading-m')]
    ${Len_titles}=     Get Length   ${elements_titles}
    Log To Console    ${Len_titles}
    FOR  ${i}  IN RANGE  0  ${Len_titles}
        Wait For And Verify Element         ${elements_titles}[${i}]
        Text Verification                   ${elements_titles}[${i}]    ${Titles}[${i}]
    END
    
    #Verifing Images From IR Page
    ${elements_img}=    Get WebElements                           xpath=//section[contains(@class,'--desktop')]//div[contains(@class,'image')]//img
    ${count_img}=       Get Length           ${elements_img}
    FOR  ${element}  IN  @{elements_img}
        Wait For And Verify Element         ${element}
        Image Verification                  ${element}
    END
        Log To Console    ${element}
        Log To Console    ${count_img} 

    #Four Tiles from Perfected for foreign trips
    ${elements_tiles}=    Get WebElements                         xpath=//section[@class='international-roaming_content__2tg44 j-container']
    ${count_tiles}=       Get Length    ${elements_tiles}  
    FOR  ${element}  IN  @{elements_tiles}
        Wait For And Verify Element  ${element}
    END
        Log To Console                 ${element} 
        Log To Console                 ${count_tiles}   
        
    
    #----------------------------In-flight connectivity Section---------------------------------------------------#

    FOR  ${i}  IN RANGE  3  5
        # Clicking 'Get the best plan ever' button 
        Wait For And Click Element              xpath=(//div[@class='j-button-group']//button)[${i}]
        # Checking Redirection & URL Validation
        Check Window count and Validation       https://www.jio.com/selfcare/plans/mobility/prepaid-plans-list/?category=In-Flight%20Packs&categoryId=SW4tRmxpZ2h0IFBhY2tz      In-flight_${i-2}
    END

    #----------------------------Get set, roam Section---------------------------------------------------#

    #toggle Verification
    Scroll To                                                    xpath=//div[contains(@class,'descrip')]//div[@class='j-text j-text-body-s']
    Wait For And Verify Element                                  xpath=//div[@class='activate-ir_view__SvxbF j-selectors stretch']
    Element Attribute Verification                               xpath=//span[@class="switcher"]    style    --left:4px; --width:264px;
    
    #Subtitle Verification
    Wait For And Verify Content                                  xpath=//section[contains(@class,'activate-ir_mobilePad')]//div[@class='j-text j-text-body-m']   Steps to activate on the MyJio app.
    
    #Images Verification
    ${elements_get_img}=    Get WebElements                      xpath=//div[@class='activate-ir_flex__2lRzz']//img
    ${len_getset}=    Get Length    ${elements_get_img}
    FOR  ${element}  IN  @{elements_get_img}
        Wait For And Verify Element     ${element}
        Image Verification              ${element}
    END
    Log To Console                  ${element}
    Log To Console                  ${len_getset}

    #Image heading verification
    ${elements_get_imgheading}=    Get WebElements               xpath=//div[contains(@class,'descrip')]//div[@class='j-text j-text-body-s']
    ${count_getset_imgheading}=    Get Length    ${elements_get_imgheading}
    FOR  ${element}  IN  @{elements_get_imgheading}
        Wait For And Verify Element     ${element}
    END 
    # Scrolling to Steps below Images
    Scroll To                                                    xpath=//div[contains(@class,'descrip')]//div[@class='j-text j-text-body-s']
    Take Page Screenshot                         MyJio_Settings
    Sleep       200ms
    # Changing Tab From MyJio to Jio.com
    Wait For And Click Element                                   xpath=//div[normalize-space()='Jio.com']
    Element Attribute Verification                               xpath=//span[@class="switcher"]    style    --left:272px; --width:264px;
    
    #Subtitle Verification
    Wait For And Verify Content                                  xpath=//section[contains(@class,'activate-ir_mobilePad')]//div[@class='j-text j-text-body-m']   Steps to activate on the Jio.com website
    
    #Images Verification
    ${elements_subimg}=    Get WebElements                       xpath=//div[@class='activate-ir_flex__2lRzz']//img
    ${len_subimg}=         Get Length   ${elements_subimg}
    FOR  ${element}  IN  @{elements_subimg}
        Wait For And Verify Element     ${element}
        Image Verification              ${element}
    END  
    Log To Console    ${element}
    Log To Console    ${len_subimg}

    #Image heading verification
    ${elements_heading}=    Get WebElements                      xpath=//div[contains(@class,'descrip')]//div[@class='j-text j-text-body-s']
    ${len_heading}=         Get Length    ${elements_heading}
    FOR  ${element}  IN  @{elements_heading}
        Wait For And Verify Element       ${element}
    END          
    Scroll To                                                     xpath=//div[contains(@class,'descrip')]//div[@class='j-text j-text-body-s']
    Take Page Screenshot                                          Jio.com_Settings 
    Log To Console                                                ${len_heading}

    #----------------------------Monitor usage from anywhere Section---------------------------------------------------#
    
    #Steps verification
    ${elements_steps}=    Get WebElements                         xpath=//div[@class='j-grid']//div[contains(@class,'details_planCardContent')]
    ${len_steps}=         Get Length       ${elements_steps}
    FOR  ${element}  IN  @{elements_steps}
        Wait For And Verify Element     ${element}
    END 
    Log To Console                                                ${len_steps}

    #----------------------------Always here to help you Section---------------------------------------------------#

    Wait For And Verify Element                                   xpath=//div[@class='ir-details_alignCenter__2xjQj j-text j-text-body-m']
    
    #Button Verification (WhatsApp Chat & Call Us)
    ${elements}=    Get WebElements         xpath=//section[@class='ir-details_buttonFlex__1KvVt j-container l-layout--flex']//button
    ${Length}=     Get Length   ${elements} 
    FOR  ${i}  IN RANGE  1  ${Length+1}
        # Verifying Button
        Wait For And Verify Element     xpath=(//section[@class='ir-details_buttonFlex__1KvVt j-container l-layout--flex']//button)[${i}]
        # Clicking Button WhatsApp Chat & Call Us
        Wait For And Click Element      xpath=(//section[@class='ir-details_buttonFlex__1KvVt j-container l-layout--flex']//button)[${i}]
        IF  ${i} == 1
            # Redirection & URL Validation
            Check Window count and Validation            https://api.whatsapp.com/send?phone=917018899999&text=Hi&lang=en&utm_source=jio.com&utm_medium=IRDiscovery   IR_WhatsApp
        ELSE 
            Sleep  100ms
            Take Page Screenshot            IR_CallUs
            Run Keyword    Press Button     escape
        END
    END 
    Log To Console    ${Length}
    #----------------------------Key points to remember Section---------------------------------------------------#
    
    #Points Verification 
    ${elements}=    Get WebElements                              xpath=//div[@class='ir-details_wrappingList__3tRiC j-listBlock align-middle'] 
    ${Length}=     Get Length   ${elements} 
    Log To Console    ${Length}
    FOR  ${i}  IN RANGE  1  ${Length+1}  
        Wait For And Verify Element                              xpath=(//div[@class='ir-details_wrappingList__3tRiC j-listBlock align-middle'])[${i}]
        ${presense}=    Run Keyword And Return Status   Wait Until Element Is Visible   xpath=(//div[@class='ir-details_wrappingList__3tRiC j-listBlock align-middle'])[${i}]//a   3s
        IF  ${presense} == True
            Wait For And Click Element                           xpath=(//div[@class='ir-details_wrappingList__3tRiC j-listBlock align-middle'])[${i}]//a   
            Check Window count and Validation                    https://www.jio.com/jcms/jio-wifi-calling/       Key_Points
        END 
    END

    #--------------------------------------- More Information Section ---------------------------------------------------#
    
    #heading
    Text Verification                                            xpath=//div[contains(@class,'MoreInformation_more')]  More information

    #Buttons
    ${elements}=      Get WebElements                            xpath=//div[contains(@class,'MoreInformation')]//button[contains(@class,'j-button-size__medium secondary')]
    FOR  ${element}  IN  @{elements}
        Wait For And Verify Element  ${element}
    END
    Log To Console    ${element}
    
Change Country button functionality of International Roaming Plans Page
    #Get the best plans ever or plans to go for button Functionality
    Select Country Popup Verification                            xpath=//button[normalize-space()='Get the best plans ever']
    
Validate UI and Content of Search Results Page
    # UI & Content of Search Results page
    ${No}=  Country Selection                                    xpath=//button[normalize-space()='Get the best plans ever']
    Selected Country Page Verification          ${No}
    
Verify and Validate Plan Cards and Recharge Redirection of International Roaming Plans
    #  Checking Plan Cards and Recharge Redirection of International Roaming Plans
    Plan Card Verification-2                                     //*[contains(@class,"desktop")]//div[contains(@class,"planDetailsCard")]    sheet_name=Mobile_Postpaid  row_num=20
    ${card_count}=    Get Element Count                          xpath=//section[@class='j-container l-breakpoint--desktop']//section[@class='j-container bg--primary-20 l-radius--xl']     
    Log To Console    ${card_count}
    ${RURL}=        Get Location
    FOR  ${j}  IN RANGE  1  ${card_count}+1
        # View Details Popup 
        View Details Popup Verification     Mobile_Postpaid      xpath=(//button//div[contains(text(),'View details')])[${j}]    xpath=(//div[contains(@class,' j-modal-visible')]//div[contains(@class,'PlanName_planText')])    xpath=//div[contains(@class,'j-modal-visible j-modal-closable')]//div[@class="customScroll_scroll__1lZUu"]      xpath=//div[contains(@class, 'visible')]//div[@class="Subscriptions_subscription__2l1MD"]     xpath=//div[contains(@class,'j-modal j-modal-visible j-modal-closable')]//i  International Roaming    
        Open Popup                                               xpath=(//section[contains(@class,'desktop')]//button[normalize-space()='View details'])[${j}]
        common.Recharge Popup Verification                       xpath=//div[contains(@class,'j-modal-visible')]//button[normalize-space()='Recharge']  xpath=//div[contains(@class,'j-modal-visible')]//div[contains(@class,'PlanName')]   xpath=(//section[contains(@class,'desktop')]//button[normalize-space()='View details'])[${j}]  ${RURL}  ${Prepaid_Number}            
    END
    
Select Country Popup Verification
    [Arguments]     ${Btn_locator}
    Scroll To                             ${Btn_locator}
    Wait For And Click Element            ${Btn_locator}
    #------------UI and Content---------------------------------------#

    #Title
    Text Verification                                           xpath=//h4[@class='FilterPopup_heading__2z8Gs j-heading j-text-heading-xs']     Select countries (max 10)
    #Search Bar
    Wait For And Verify Element                                 xpath=//div[@class='j-search-box has-prefix']
    #Country List
    Wait For And Verify Element                                 xpath=(//div[@class='customScroll_scroll__1lZUu'])[1]
    ${elements_country}=    Get WebElements                     xpath=//div[@class="switch-checkbox-root"]
    ${len_country}=     Get Length         ${elements_country}
    Log To Console      ${len_country}
    FOR  ${i}  IN RANGE  0  ${len_country}
        Wait For And Verify Element         ${elements_country}[${i}]
        Checkbox Should Not Be Selected     ${elements_country}[${i}]
        ${temp}=    Take Element Text       ${elements_country}[${i}]
        Text Verification  ${elements_country}[${i}]  ${Country-list}[${i}]
    END
    #Buttons
    ${elements_cb}=    Get WebElements                          xpath=(//div[contains(@class,'j-modal-closable')])[1]//button
    ${count_cb}        Get Length           ${elements_cb}               
    FOR  ${element}  IN  @{elements_cb}
        Wait For And Verify Element         ${element}
    END 
    Text Verification                                           xpath=//div[contains(@class,'j-modal-visible')]//button[contains(normalize-space(),'Show')]     Show plans 
    Element Should Be Disabled                                  xpath=//div[contains(@class,'j-modal-visible')]//button[contains(normalize-space(),'Show')]
    Text Verification                                           xpath=//div[contains(@class,'j-modal-visible')]//button[contains(normalize-space(),'Clear')]    Clear filter

    #-----------------------Functionality--------------------------------#

    #--------SearchBar------------------# 
    
    #Entering Invalid Text
    Wait For And Click Element                                  xpath=//div[contains(@class,'j-modal-visible')]//input                                      
    Wait For And Input Text                                     xpath=//div[contains(@class,'j-modal-visible')]//input          ${Name}
       
    #Error Msg
    Text Verification                                           xpath=//div[contains(@class,'noResults')]                       No results found
    
    #Clear Invalid text
    Press Keys                                                  xpath=//div[contains(@class,'j-modal-visible')]//input          CTRL+a+BACKSPACE

    #---------------------------Seacrh and Select Country-------------------------------------------#

    #Searching Country
    Wait For And Input Text                                     xpath=//div[contains(@class,'j-modal-visible')]//input      China
    Text Verification                                           xpath=//div[@class="switch-checkbox-root"]  CHINA
    Press Keys                                                  xpath=//div[contains(@class,'j-modal-visible')]//input          CTRL+a+BACKSPACE
    
    #Closing Popup
    Close Popup                                                 xpath=//div[contains(@class,'j-modal-visible j-modal-closable')]//header[@class='j-modal-header']//button
   
Selected Country Page Verification
    [Arguments]     ${Cno}
    
    #Title
    Text Verification                                           xpath=(//section[@class='j-container l-breakpoint--desktop']//div[@class='j-text j-text-heading-l'])[1]  International
    Text Verification                                           xpath=(//section[@class='j-container l-breakpoint--desktop']//div[@class='j-text j-text-heading-l'])[2]  Roaming plans

    #----Will Check no of countries are selected from which will validate the Country name 
    IF  ${Cno} == 1
        #Filter Button
        Text Verification                                       xpath=//section[contains(@class,'l-breakpoint--desktop')]//button[contains(@class,'Filter_selectBtn__2hoSx ')]  ${Cno} filter applied
    ELSE
        #Filter Button
        Text Verification                                       xpath=//section[contains(@class,'l-breakpoint--desktop')]//button[contains(@class,'Filter_selectBtn__2hoSx ')]  ${Cno} filters applied
        #Country Tag
        ${elements}=    Get WebElements                         xpath=//section[contains(@class,'desktop')]//button[@class='j-tag active clickable']
        FOR  ${i}  IN RANGE  0  ${Cno}
            ${temp}=    Convert To Upper Case   ${22+Country-list}[${i}]
            Text Verification        ${elements}[${i}]   ${temp}
        END
    END

    #-----------------------------------------------------Standard Pay Rates Section------------------------------------------------------#
    #Sleep   2s
    #Title
    Text Verification                                           xpath=//section[contains(@class,'desktop')]//div[contains(@class,'heading') and contains( normalize-space(),'Standard Pay')]  Standard PayGo Rates
    PayRates Table Validation   ${Cno}

Country Selection
    [Arguments]     ${Btn_locator}
    Scroll To                               ${Btn_locator}
    Wait For And Click Element              ${Btn_locator}
    ${Cno}    Generate random string    1    123456789
    ${Cno} =     Convert To Integer  ${Cno}
    FOR  ${i}  IN RANGE  0  ${Cno}  
        Wait For And Click Element                               xpath=//div[@class="switch-checkbox-root"]//div[contains(text(),"${22+Country-list}[${i}]")]     
        Checkbox Should Be Selected                              xpath=//div[@class="switch-checkbox-root"]//div[contains(text(),"${22+Country-list}[${i}]")]//preceding::input[1]  
    END
    Element Should Be Enabled                                    xpath=//div[contains(@class,'j-modal-visible')]//button[contains(normalize-space(),'Show')]
    IF  ${Cno} == 11
        Take Page Screenshot                                     Max_Countries-Error
    END
    Wait For And Click Element                                   xpath=//div[contains(@class,'j-modal-visible')]//button[contains(normalize-space(),'Show')]
    [Return]    ${Cno}

PayRates Table Validation
    # Checking Payrates Table of Standard Payrates Section
    [Arguments]     ${Cno}
    ${k}    Set Variable    1 
    ${i}    Set Variable    2
    ${Cno}=     Convert To Integer     ${Cno}
    FOR  ${j}  IN RANGE      1         ${Cno+1}
        WHILE  ${k} != 8
            ${E_Data}=  Take Element Text                        xpath=(//table[contains(@class,'j-table')]//tbody//tr)[${j}]//td[${k}]
            ${Data}=    Read Excel Cell                       row_num=${i}    col_num=${k}   sheet_name=IR_PayRates
            IF  ${k} == 1
                ${Data}=  Convert To Upper Case       ${Data}
            END
            IF  ${k} == 7
                ${E_Data}=  Catenate  SEPARATOR=  0   ${E_Data}
            END
            IF  "${E_Data}" == "${Data}"
                Log To Console  Data Matched for ${k}
                ${k}=   Evaluate     ${k} + 1
                IF  ${k} == 8   BREAK
            ELSE
                ${i}=   Evaluate     ${i} + 1
            END  
        END 
    END


 #--------------------------------------- FAQ Section ---------------------------------------------------#

Verify Redirection of FAQ section International Roaming Page   
    Go To  ${IR}
    #Checking if there are multiple tabs or not
    ${visiblity}=   Run Keyword And Return Status   Wait Until Element Is Visible       xpath=(//div[@class='j-tabs-list j-tabs-list--overflow-scroll'])[1]
    IF  ${visiblity} == True
        #if multiple  tabs are visible taking there length for loop
        ${Tabs}=      Get WebElements                      xpath=(//div[@class='j-tabs-list j-tabs-list--overflow-scroll'])[1]//button
        ${count}=     Get Length   ${Tabs}  
        Log To Console             ${count}
        
        #For Loop for multiple tabs
        FOR  ${i}  IN RANGE  0  ${count}
            Scroll To                                       xpath=//button[@aria-controls="panel-${i}"]//div
            Wait For And Click Element                      xpath=//button[@aria-controls="panel-${i}"]//div
            Sleep  200ms
            ${questions}=  Get WebElements                  xpath=(//div[@id='panel-${i}'])[1]//div[@class='j-listBlock__block-root']
            ${Length_of_questions}=     Get Length          ${questions}
            Log To Console              ${Length_of_questions}

            #Checking if any tab contain user guide 
            ${Guide_visiblity}=   Run Keyword And Return Status   Wait Until Element Is Visible       xpath=//a[@class='j-link Faq_linkRow__3POio']   
            IF  ${Guide_visiblity} == True
                ${elements_guide}=      Get WebElements           xpath=(//a[@class='j-link Faq_linkRow__3POio'])
                ${count_guide}          Get Length                    ${elements_guide}
                Log To Console          ${count_guide}
                ${a}    Set Variable    0
                FOR  ${element}  IN  @{elements_guide}
                    Scroll To                               ${element}
                    Wait For And Click Element              ${element}
                    Check Window count and Validation       ${FAQ_URL-${i}}[${a}]   IR_FAQ_Hyperlink_${a}
                    ${a}=   Evaluate     ${a} + 1
                END  
            # Else part that which run when user guide not visible
            ELSE
                ${a}    Set Variable    0 
                FOR  ${j}  IN RANGE    1  ${Length_of_questions+1}
                    Sleep  100ms
                    Wait Until Element Is Visible               xpath=((//div[@id='panel-${i}'])[1]//div[@class='j-listBlock__suffix'])[${j}]//span[contains(@class,'j-accordion-panel-icn')] 
                    Wait For And Click Element                  xpath=((//div[@id='panel-${i}'])[1]//div[@class='j-listBlock__block-root'])[${j}]
                    Sleep   100ms
                    Wait Until Element Is Visible               xpath=((//div[@id='panel-${i}'])[1]//div[@class='j-listBlock__suffix'])[${j}]//span[contains(@class,'j-accordion-panel-icn active')]
                    Scroll To                                   xpath=//div[@aria-hidden='false']
                    Sleep   50ms
                    Run Keyword And Continue On Failure     CSS Verification        xpath=//div[@aria-hidden='false']//div[@class="Faq_accContent__7yDk6"]      text-align   left
                    ${presense}=    Run Keyword And Return Status   Wait Until Element Is Visible   //div[@aria-hidden='false']//a   3s
                    IF  ${presense} == True 
                        ${elements}=    Get WebElements         xpath=//div[@aria-hidden='false']//a
                        ${Length_of_hyperlink}=      Get Length      ${elements}
                        Log To Console               ${Length_of_hyperlink}
                        FOR  ${k}  IN RANGE    1  ${Length_of_hyperlink+1}
                            Sleep   200ms
                            Scroll To                           xpath=(//div[@aria-hidden='false']//a)[${k}]
                            Wait For And Click Element          xpath=(//div[@aria-hidden='false']//a)[${k}]
                            Check Window count and Validation        ${FAQ_URL-${i}}[${a}]      IR_FAQ_Hyperlink_${j}_${k}
                            ${a}=   Evaluate     ${a} + 1
                        END
                    END
                END
                Sleep   300ms
                IF   ${i} == 3  BREAK  
            END  
        END
        
        #-View All Button Redirection
        # Pack & Plan Pricing
        Scroll To                                               xpath=//button[@aria-controls="panel-0"]//div
        Wait For And Click Element                              xpath=//button[@aria-controls="panel-0"]//div
        # Click on view all button 
        Redirection On Clicking                                xpath=//button[normalize-space()='View all']        https://www.jio.com/help/faq?sparentId=1400187165400&tparentId=1407507407260&source=back&parentId=1400186885450#/           IR_FAQ_ViewAll     
    END


Verify Redirection of More Information section International Roaming Page
    # Checking redirection of More Information section International Roaming Page
    More Information Section Redirection                        xpath=//div[contains(@class,'MoreInformation')]//button[contains(@class,'j-button-size__medium secondary')]   ${IR_Urls}  IR  
    
