*** Settings ***
Library                                              SeleniumLibrary
Resource                                             ../../Local_Keywords.robot

*** Keywords ***
Three Promo Cards Verification
    #Three banners section
    Scroll To                                         xpath=//div[@class="j-promo-card bg--primary size--xs img--filled orientation--vertical j-promo-card__has-CTA no-children h-100 theme--jiomart"]

    # Returns a list of cards present with the same locator
    ${elements}=    Get WebElements                   xpath=//div[@class="j-promo-card bg--primary size--xs img--filled orientation--vertical j-promo-card__has-CTA no-children h-100 theme--jiomart"]
    
    # Gets the count of the card present
    ${len}=     Get Length  ${elements}
    
    FOR  ${element}  IN  @{elements}
        # Verifies the card present 
        Wait For And Verify Element                   ${element}
    END
    
    #Three Banner Buttons Redirection
    ${VB}  Set Variable   0
    WHILE  ${VB} != ${len}

        #Redirection of all 3 cards present 

        Wait For And Click Element                    xpath=//button//div[contains(text(),'${ThreeAppsBanner_button}[${VB}]')]   
        Sleep        1s
        Check Window count and Validation             ${ThreeAppsBanner_URL}[${VB}]                ${ThreeAppsBanner_button}[${VB}]
        ${VB}=   Evaluate    ${VB} + 1
    END
