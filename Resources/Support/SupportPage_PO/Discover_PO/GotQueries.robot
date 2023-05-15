*** Settings ***
Resource                           ../../../Common.robot
Resource                           ../../../Excel_activity.robot
Resource                           ../../../Local_Keywords.robot
Variables                          ../../../../Tests/Support/Discover_Variables.yaml



*** Keywords ***
'Got queries? Check FAQs for answers'section verification
    #section verification of Got queries? Check FAQs for answers
    #92440
    Scroll To                                          ${gotqueries_section}
    Section Verification                               ${gotqueries_section}    ${Gotqueries_text[0]}
    #92441
    #Heading Text verification
    Text Verification                                  xpath://div[normalize-space()='Got queries? Check FAQs for answers']    ${Gotqueries_text[0]}
    #Subtext verification
    Text Verification                                  xpath://div[normalize-space()='Select a service for related frequently asked questions.']    ${Gotqueries_text[1]}
    #92442
    #Modules redirection 
    Scroll To                                          xpath:(//span[@class="l-breakpoint--desktop sp--huge pd--top j-Space__vertical j-Space"])[1]
    FOR    ${i}    IN RANGE   1    6
        #Module element verification
        Wait For And Verify Element                    (${gotqueries_modules_xpath})[${i}]
        #Module Text verification
        Text Verification                              (${gotqueries_modules_xpath})[${i}]    ${gotqueries_modules_text}[${i-1}]
        #click on every module under the section
        Redirect and continue                          (${gotqueries_modules_xpath})[${i}]    ${Gotqueries_modules_urls}[${i-1}]    ${gotqueries_modules_text}[${i-1}]
        #92443
        #Devices Module UI and content verification
        IF  ${i} == 4
            #Module Header
            wait for and verify Element                ${gotqueries_modules_header_xpath}
            Wait For And Verify Content                ${gotqueries_modules_header_xpath}    ${devicemodule_header}
            #Popping Menu Element verification
            Wait For And Verify Element                xpath://button[@class='j-button j-button-state__default j-button-size__medium secondary icon-primary icon-only']
            #Search Panel element verification
            Wait For And Verify Element                xpath://input[@id='supportSearchtxt']
            #select topic Element and Content verification
            Wait For And Verify Element                ${gotqueries_modules_select_xpath}
            Sleep    500ms
            Wait For And Verify Content                ${gotqueries_modules_select_xpath}   ${Gotqueries_text[2]}
            #Tabs count
            ${Tabs}=    Get Element Count              ${gotqueries_modules_tabs_xpath}
            #Loop for iterating in tabs                                 
            FOR    ${a}    IN RANGE    1   (${Tabs}+1)                
                IF   ${a}!=1
                    #Clicking on Tabs present below select topic text
                    Scroll To                        (${gotqueries_modules_tabs_xpath})[${a}]
                    Wait For And Click Element         (${gotqueries_modules_tabs_xpath})[${a}]
                    #Tabs Element and content verification
                    Wait For And Verify Element        xpath://div[@id='SecondList']
                    Wait For And Verify Content        xpath://div[@id='SecondList']   ${devicemodule_tabs}
                    #FAQ with Accordian content and UI verification                  
                    Wait For And Verify Element        ${gotqueries_modules_faqs_xpath}
                    Wait For And Verify Content        ${gotqueries_modules_faqs_xpath}   ${devicemodule_faqs}[${a+3}]                
                ELSE    
                    #relevant options under "select topic" content verification
                    Wait For And Click Element          xpath://button[@class='j-accordion-panel__header-trigger active']//span[@aria-label='button']
                    Wait For And Verify Content         xpath://div[@class="sidebar_filter l-breakpoint--desktop"]//ul[@class="tab-order-list"]        ${devicemodule_relevantoptions}    
                    #Count of relevant options under each tab
                    ${relevantoptions}=    Get Element Count  (${gotqueries_modules_relevantoptions_xpath})
                    #Loop for iterating relevant options 
                    FOR    ${b}    IN RANGE    1    (${relevantoptions}+1)
                        Scroll To   (${gotqueries_modules_relevantoptions_xpath})[${b}]
                        Wait For And Click Element     (${gotqueries_modules_relevantoptions_xpath}) [${b}]
                        Wait For And Verify Element    ${gotqueries_modules_faqs_xpath}
                        Wait For And Verify Content    ${gotqueries_modules_faqs_xpath}   ${devicemodule_faqs}[${b-1}]    
                    END       
                END
            END  
        END   
        Go Back
    END  

Popping Menu And Navigation Bar Is Redirecting Properly Verification
    #Scrolling down to Got Queries section on Support Discover Page
    Scroll To                                 xpath://div[normalize-space()='Watch, learn, and resolve your issues']
    #Verifying if Got Queries section is Visible
    Wait For And Verify Content               xpath://div[normalize-space()='Got queries? Check FAQs for answers']      ${GotQueries}
    #Verify if Mobile Tab is present and Click on it
    Wait For And Verify Element               xpath://div[@title='Mobile']
    Wait For And Click Element                xpath://div[@title='Mobile']
    #Verify is Mobile FAQ is Visible
    Wait For And Verify Content               xpath://h1[@class='j-heading j-text-heading-l mb-0 sp--m pd--right']      ${GotQueriesM}
    #Click on the Popping menu
    Wait For And Click Element                xpath://button[@data-popup-open='modal-other-plans']
    Wait For And Verify Element               xpath://div[@class='j-modal j-modal-closable j-modal-size-s j-modal-kind-dialog j-modal-dialog-scrollable j-modal-visible']//div[@class='j-modal-container']
    #Close icon
    Wait For And Verify Element               xpath://button[@data-popup-close='modal-other-plans']//i[@class='j-button-icon']//*[name()='svg']
    Wait For And Click Element                xpath://button[@data-popup-close='modal-other-plans']//i[@class='j-button-icon']//*[name()='svg']
    #NavBar
    Wait For And Click Element                xpath:(//div[@id="SecondList"]//i[@class="j-button-icon"])[1]
    FOR    ${i}    IN RANGE    1    11   
        Scroll To                             xpath:(//div[@id="SecondList"]//i[@class="j-button-icon"])[${i}]  
        Wait For And Click Element            xpath:(//div[@id="SecondList"]//i[@class="j-button-icon"])[${i}]
    END
    Confirm UI And Content For Options On Clicking '+' Sign Accordian Verification


Confirm UI And Content For Options On Clicking '+' Sign Accordian Verification
    #Scrolling down to Accordions of Mobile Tab "What is 5G ?"
    Execute Javascript                        window.scrollTo(0,190)
    Wait For And Verify Content               xpath://div[contains(text(),'What is 5G ?')]                            ${Accdata1}  #Accordian data
    #Verifying is '+' icon is visible and clicking on it
    Wait For And Click Element                xpath:(//i[contains(@class,'j-button-icon accordion-icons')])[5]
    #Verifying is '-' icon is visible
    Wait For And Verify Element               xpath:(//i[contains(@class,'j-button-icon accordion-icons')])[5]
    #verifying content of Accordion
    Wait For And Verify Content               xpath://div[@aria-hidden='false']//div[@class='sp--base']               ${Accdata2}    #Accordian data
    #Verifying if all three like,dislike and share icons are present
    FOR    ${i}    IN RANGE    5    8    
        Wait For And Verify Element           xpath:(//button[@aria-label='button'])[${i}]
    END