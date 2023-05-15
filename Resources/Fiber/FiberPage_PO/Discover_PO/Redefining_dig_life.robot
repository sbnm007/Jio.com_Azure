*** Settings ***
Library     SeleniumLibrary
Resource    ../../../Common.robot

*** Keywords ***
#TC ID:91882-91885
Redefining digital life Validation
    #Scrolling to Redefining digital life section
    Scroll To                               xpath://h2[@class="j-contentBlock__title j-heading j-text-heading-l" and contains(text( ),"Redefining")]
    
    #Redefining digital life section verification
    Section Verification                    xpath://section[@class='j-container bg--primary-grey-20']//section[@class='j-container l-layout--max-width-narrow']     Redefining digital life          

    #Verifying heading
    Text Verification                       xpath://h2[@class="j-contentBlock__title j-heading j-text-heading-l" and contains(text( ),"Redefining")]    ${Redefining_mainHeading} 
    
    #Verifying text below heading  
    Text Verification                       xpath://div[@class="j-color-primary-grey-80 j-contentBlock__description j-text-body-m" and contains(text( ),"Explore")]    ${Redefining_mainSubheading}
    
    UI, Content and Redirection of tiles

UI, Content and Redirection of tiles 
    #Confirm visibility of three tiles
    ${elements}=    Get Element Count       xpath://img[@class="l-radius--large overflow-initial"]
    Log To Console    ${elements}
    FOR    ${i}   IN RANGE    1  ${elements}+1
        Scroll To                           xpath:(//div[contains(@class,'cursor-pointer')])[${i}]
        Wait For And Verify Element         xpath:(//div[contains(@class,'cursor-pointer')])[${i}]
    END
    
    #Verifying View all Services button
    Wait For And Verify Element             xpath://button[normalize-space()='View all services']
    
    #For checking Images, headings, texts and buttons of the tiles
    ${in}    Set Variable    0  
    FOR     ${i}    IN RANGE    1    4
        Image Verification                  xpath://img[@src='${Redefining_image}[${in}]']
        Text Verification                   xpath:(//h3[@class="j-contentBlock__title j-heading j-text-body-m-bold"])[${i}]    ${Redefining_heading}[${in}]
        Text Verification                   xpath:(//div[@class="j-contentBlock__description j-text-body-s j-color-primary-grey-80"])[${i}]   ${Redefining_subtext}[${in}]
        Wait For And Verify Element         xpath://button[normalize-space()='${Redefining_button}[${in}]']
        ${in}=    Evaluate    ${in} + 1
    END
    
    #Tiles button redirection
    FOR     ${j}    IN RANGE    0    3
        Redirection On Clicking             xpath=//div//button[contains(text(),'${Redefining_button}[${j}]')]     ${Redefining_tiles}[${j}]    ${ss_names}[${j}]           
        ${j}=   Evaluate     ${j} + 1
    END

    #Redirection from View all services button
    Redirection On Clicking                 xpath://button[normalize-space()='View all services']    ${Services_page}    JioFiberServices
