*** Settings ***
Library                                     SeleniumLibrary
Resource                                    ../../../Common.robot
Resource                                    ../../../Excel_Activity.robot
Resource                                    ../../../../Resources/Local_Keywords.robot

*** Keywords ***
Check 'Launched and its here!' Banner
    #Verify Launched And It’S Here! Section Visible Or Not
    Section Verification                    xpath=(//div[@class="l-layout--max-width"])[5]  Launched and it’s here!_Section
    
    #Verify Ui And Content Of "Launched And Its Hered!" Section
    Read Data of Launch and its here from Excel
    
    #Scroll Till The Section Is Visible
    Scroll To                xpath=//div[@class="j-card size--xxs card-vertical no-top-padding j-card__shadow shadow-vertical-mg width-100pc"][1]
    Scroll To                xpath=(//button[@class="j-button j-button-size__small primary flex-grow-0 w-auto"])[1]
    
    #Verify The Title Of The Section
    Element Text Should Be                  xpath=//h2[contains(.,'Launched and it’s here!')]    ${Launched}
    
    #Verify The Subtext Of The Section
    Element Text Should Be                  xpath=//div[normalize-space()='One-stop for all things latest.']    ${One_step}
    
    #Verify The Count Of The Images Present
    ${card_count}=    Get Element Count     xpath=//div[@class="j-card size--xxs card-vertical no-top-padding j-card__shadow shadow-vertical-mg width-100pc"]   
    IF  ${card_count} != 3
      Fail    msg=Images are more or less
    END
    
    #Verify The Images Present
     FOR  ${i}  IN RANGE    ${card_count}
        Wait For And Verify Element         xpath=//div[@class="j-card size--xxs card-vertical no-top-padding j-card__shadow shadow-vertical-mg width-100pc"][${i+1}]
    END

    #Verify The Content Of The Section 
    FOR  ${i}  IN RANGE   0    3
        #Verify The Name Of The Product
        Log To Console                      ${Product_Name[${i}]} 
        Element Text Should Be              xpath=(//h3[@class="j-contentBlock__title j-heading j-text-heading-xs "])[${i+1}]    ${Product_Name[${i}]}
        
        #Verify The Subtext Of The Product Present
        Log To Console                      ${Find_all_the_recently[${i}]} 
        Element Text Should Be              xpath=(//div[@class="j-contentBlock__description j-text-body-s j-color-primary-grey-80"])[${i+1}]    ${Find_all_the_recently[${i}]}

        # Checking Redirection After Clicking Each Button  Of 'Launched And Its Here!' Banner 
        # Verifying The Url Of Redirection Page & Taking Screenshot
        Redirection On Clicking       xpath=(//button[contains(@class,"j-button j-button-size__small primary flex")])[(${i}+1)]   ${Launched_URL[${i}]}    Launched_Section[${i}]  
        
    END
