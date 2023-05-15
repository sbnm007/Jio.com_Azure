*** Settings ***
Library    SeleniumLibrary
Resource    ../../../Common.robot
Variables    ../../../../Tests/Fiber/FPostpaid_Variables.yaml
Resource     ../Postpaid_PO/RedirectionToPostpaid.robot
Resource         ../../../Excel_Activity.robot
Resource        ../../../Local_Keywords.robot

*** Keywords ***
Verifying the Redirection of all plan buttons under 'Speeds as per your digital needs'

  #It Will Scroll To To Specified Section
   Scroll To                      xpath://div[contains(@class,"planCardCont")]
   Sleep  2s
    
   # It Will Get The Cards
   ${card_cb} =  Get Element Count  xpath://div[contains(@class,"planCard")]//div[@class="j-contentBlock__content"]

   # Loop To Iterate For The Cards
   FOR  ${i}  IN RANGE  ${card_cb}

        # It Will Get The Text Of Element Provided As Xpath
        ${actual_txt} =             SeleniumLibrary.Get Text  xpath:(//div[contains(@class,"planCard")][${i+1}]//div[@class="j-contentBlock__content"])       

        # New Line Characters Will Be Removed From String
        ${actual_txt} =             Replace String  ${actual_txt}  \n  ${EMPTY}

        # It Will Read The Data From The Excel Cell Secified
        ${expected_txt} =           Read Excel Cell  ${i+37}  1  sheet_name=Fiber_Postpaid

        # New Line Characters Will Be Removed From String
        ${expected_txt} =           Replace String  ${expected_txt}  \n  ${EMPTY}
        
        # It Will Compare That Both Strings Are Equal Or Not.
        Should Be Equal As Strings  ${actual_txt}  ${expected_txt}  strip_spaces=True

        # It Will Ensure Page Will Contain Button Matching The Xpath.
        Wait For And Verify Element                       xpath:((//button//*[contains(text(),"97")])[${i+1}])
        
        # It Will Fetch The Heading Text
        ${Range}  SeleniumLibrary.Get Text               xpath:((//*[contains(text(),"Mbps")]//parent::*[contains(@class,"contentBlock__title")])[${i+1}])

        # It Will Filter Out The Range In Heading Fetched Earlier
        @{Range}  String.Split String  ${Range}  separator=${SPACE}

        # It Will Separate Both The Numbers I Heading
        @{Range}  String.Split String  ${Range}[0]  separator=-

        # It Will Click The Button
        Wait For And Click Element          xpath:((//button//*[contains(text(),"97")])[${i+1}])

     # It Will Verify The Filter Buttons Present Below Sub Navbar
     FOR  ${r}  IN  @{Range}
        # It Will Verify Filter Button Present
        Wait For And Verify Element         xpath:(//*[normalize-space()="${r} Mbps"]//ancestor::button) | (//*[normalize-space()="1 Gbps"]//ancestor::button)
      END
        Go Back
        Sleep        2s
    
    END
