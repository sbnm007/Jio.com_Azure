*** Settings ***
Library                             SeleniumLibrary
Resource                  ../../../../Resources/Local_Keywords.robot

***Keywords***
Recharge Here - JioLink Verification
   #Clicking Recharge Here
   Wait For And Click Element       xpath=//div[@style="display: flex; align-items: center; width: 100%;"]//a[@class="j-link j-text-body-s-bold is-text"]
   
   # Background gets blurred 
    CSS Verification                                   xpath: (//div[@aria-label="Modal "])[2]    backdrop-filter    blur(5px) contrast(0.8)

   # Checking Rupee Symbol 
   Wait For And Verify Element      xpath=//div[@layout="centered"]//span[@class="j-icon j-icon__bg"]
   
   #PopUp Heading Verification
   Text Verification                xpath=//div[@class="j-modal-content"]//div[@class="j-text j-text-heading-xs"]     Recharge your JioLink
   
   #Checking Invalid Mobile Number
   Check Continue Button Enabled    xpath=//div[@class="j-modal-container"]//input  xpath=//div[@class="j-modal-content"]//button[contains(class,Continue)]     ${Incorrect_No1}
   
   #Clicking Continue Button
   Wait For And Click Element       xpath=//div[@class="j-modal-content"]//button[contains(class,Continue)]
   
   #Checking Invalid Mobile Number Text
   Text Verification                xpath=//div[@class="field-error"]      Please enter a valid JioLink number.
   
   #Checking and Clicking Cross button Of PopUp
   Cross Button Functionality       xpath=(//button[@class="j-button j-button-size__medium tertiary icon-primary icon-only"])[2]