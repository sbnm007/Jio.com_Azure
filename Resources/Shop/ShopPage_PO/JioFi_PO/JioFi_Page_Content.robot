*** Settings ***
Library                               SeleniumLibrary
Resource                              ../../../Common.robot
Resource                              ../../../Local_Keywords.robot
Variables                             ../../../Common_Variables.yaml
Variables                             ../../../../Tests/Shop/JioFi_Variables.yaml



*** Keywords ***
JioFi Page Content Verification
    
    # Verifying Heading JioFI
    Wait For And Verify Content       xpath=//span[@class="page-title"]    JioFi
    
    # Verifying Filter
    Wait For And Verify Element       xpath=//div[@class="filter-container"]
    CSS Verification                  xpath=//div[@class="filter-container"]    float     right

    # All Products Tile
    Scroll to All Products
    
    # Verifying  Jiofi M2S Tile
    Section Verification              xpath=//div[contains(@class,"prod-image")]    JioFi M2S
    
    # Verifying  JioFi M2S Image
    Image Verification                xpath=//img[@id="492337991"]
    
    # Verifying  JioFi M2S Text
    Text Verification                 xpath=//div[@class="pop-prod-title"]//span    JioFi M2S
    
    # Verifying  JioFi M2S Colour
    Text Verification                 xpath=//div[@class="pop-prod-desc mg-bt-8"]//span    Black
    CSS Verification                  xpath=//div[@class="pop-prod-desc mg-bt-8"]//span    text-decoration    none solid rgba(0, 0, 0, 0.65)
    
    # Verifying  JioFi Price
    Wait For And Verify Content       xpath=//div[@class="pop-prod-desc mg-bt-0"]//span    ₹2,800
    
    #Redirection And Pincode Validation
    All Products Add to Cart Button Validation with PinCode
    
    # Footer Section Verification
    Section Verification              xpath=//div[@id="sites-footer-container"]   Footer_Section   
    

JioFi Page Filter Verification
    [Arguments]    ${Price_Range_Filter}=${False}        ${Battery capacity_Filter}=${False}    ${Press_X_Button}=${False}
        # Verifying By Clicking Filter 
        Wait For And Click Element    xpath=//div[@class="filter-container"]
        Take Page Screenshot          JioFi Filter Option

        # Verifying Cross Icon At Right Side
        Wait For And Verify Element   xpath=//button[@class="close"]
        CSS Verification              xpath=//button[@class="close"]    Float    right   
        
        # Verifying Sub-Text Of Filter
        Wait For And Verify Content   xpath=//span[@class="modal-title"]    Filters
        
        # Verifying Different Filter Options & Its Content
        Run Keyword If                not ${Press_X_Button}      Verifying Filters Option

        # Verifying Cancel Button
        Wait For And Verify Element   xpath=//button[@class="btn btn-default"]
        Text Verification             xpath=//button[@class="btn btn-default"]    Cancel

        # Verifying Apply Button
        Wait For And Verify Element   xpath=//button[@class="btn btn-primary"]
        Text Verification             xpath=//button[@class="btn btn-primary"]    Apply

        #Filter Based On Price
        Run Keyword If                ${Price_Range_Filter}    Drag And Drop By Offset    id:priceRange    200    0
        Sleep    200ms

        #Filter Based On Battery Capcity
        Run Keyword If                ${Battery capacity_Filter}    Drag And Drop By Offset    id:batteryRange    -200    0
        Sleep    200ms
        
        #Cross Button Functionality
        Run Keyword If                ${Press_X_Button}    Wait For And Click Element    //button[@class="close"]
        
        #Clicking Apply Only When X Button Is Not Pressed
        Run Keyword If                not ${Press_X_Button}     Wait For And Click Element    //button[contains(text(),'Apply')]
        
        # Verifying Applied Filter Value
        Wait For And Verify Element   xpath=//li[@class="applied-filtervalue"]    



# ------------------------------------------------currently not being used-----------------
Verifying Filters Option
    #vb = verifying battery
    #vc= verifying checkbox
    ${vb}=    Set Variable                1
    ${vc}=    Set Variable                1
    FOR  ${i}  IN RANGE    0    5
    
        # Verifying Section Element Is Present Or Not
        Wait For And Verify Element            xpath=(//div[@class="filter-section"])[${i+1}]
        # Verifying the title
        Wait For And Verify Content            xpath=(//div[@class="filter-title"])[${i+1}]    ${Filter_Title[${i}]}
            # Checking For Price & Battery Capacity
            IF  ${i}==0 or ${i}==2
                Wait For And Verify Content    xpath=(//div[@class="slider-title"])[${vb}]    ${Filter_Container[${i}]}
                Wait For And Verify Element    xpath=(//div[@class="slider-value"])[${vb}]   
                Wait For And Verify Element    xpath=(//div[@class="slider-container"])[${vb}]   
                ${vb}=    Evaluate             ${vb}+1
            
            ELSE
                # Check For Brand, Colour & Processor
                # Verifying Content 
                Wait For And Verify Content    xpath=(//label[@class="checkbox-container"])[${vc}]    ${Filter_Container[${i}]}
                # Verifying Checkbox & Its Functionality
                Wait For And Verify Element    xpath=(//span[@class="checkmark"])[${vc}]   
                Wait For And Click Element     xpath=(//span[@class="checkmark"])[${vc}] 
                ${vc}=    Evaluate             ${vc}+1
            END
            
        
    END
# -----------------------------------------------------