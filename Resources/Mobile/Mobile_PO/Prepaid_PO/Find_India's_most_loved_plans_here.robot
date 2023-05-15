*** Settings ***
Library  SeleniumLibrary
Variables  ../../../Common_Variables.yaml
Resource  ../../../Local_Keywords.robot



*** Keywords ***

Confirm UI And Elements' functionality Of Find India's most-loved plans here 
    # Scrolling to Find India's most-loved plans here
    Scroll To                           xpath=//*[contains(text(),"Find India's most-loved plans here")]//following-sibling::div[contains(@class,"j-grid")][1]
    Set Screenshot Directory            /Results/Mobile/Prepaid_Screenshots/MostLovedPlans
    Take Page Screenshot                Find_India's_most-loved_plans_here_section

    # Clicking View All Plans Button
    Wait For And Click Element          xpath=//*[contains(text(),"Find India's most-loved plans here")]//following-sibling::div[contains(@class,"j-grid")][1]//following-sibling::button[@aria-label="button View all plans"]

    # Selecting all the filters
    Select All Filters

    # Get The Count Of Plans Which Are Active
    ${active_plans}  Get Element Count  xpath=//*[contains(@class,"desktop")]//*[contains(@class,"filter")]//*[contains(@class,"active clickable")]
    log to console  ${active_plans}
    
    # Remove The Plans Which Are Active
    FOR  ${i}  IN RANGE  ${active_plans}
        Wait For And Click Element      xpath=(//*[contains(@class,"desktop")]//*[contains(@class,"filter")]//*[contains(@class,"active clickable")])
    END
