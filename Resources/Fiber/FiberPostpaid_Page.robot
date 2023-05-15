*** Settings ***
Library    SeleniumLibrary
Resource    FiberPage_PO/Postpaid_PO/RedirectionToPostpaid.robot
Resource    FiberPage_PO/Postpaid_PO/Our_plans_for_existing_users.robot
Resource    FiberPage_PO/Postpaid_PO/Packed_with_incredible_experience.robot
Resource    FiberPage_PO/Postpaid_PO/Discover_More_With_Jio.robot
Resource    FiberPage_PO/Postpaid_PO/Speed_as_per_your_digital_needs.robot
#Resource    Excel_Activity.robot

*** Keywords ***

#Semi Annual
Verify Page Redirection of Postpaid Section
    Landing on Postpaid Page

Redirection to Our plans for existing users-Semi Annual
    Landing on Postpaid Page
    Click on Semi-Annual Section-Redirection

Verify and Validate UI of Postpaid Page
    Landing on Postpaid Page
    Verify UI and Content of Postpaid Page
    Verifying the options selected on header on postpaid page

Verify and Validate banner are visible, it's carousal functionality and banner redirection   
    Landing on Postpaid Page
    Verifying the banner visibility, it's redirection and carousal functionality

Verify Postpaid Fiber plans section is visible and validate the UI elements and content
    Landing on Postpaid Page
    Verifying 'Our plans for existing user' section, confirming it's visiblity, UI and content, Button redirection

#Monthly
Redirection to Our plans for existing users-Monthly 
    Landing on Postpaid Page
    Click on Monthly Section-Redirection

Verify and Validate the UI and Content of Monthy Plans Page
    Landing on Postpaid Page
    Verifying the content and UI of page and plan cards of Monthly page
    Verify UI elements and content of Filter pop-up-Monthly
    Verify the Redirection of Book Now and View Details button of all plans card-Monthly
    Verify the Redirection of all button present under More Information Section-Monthly

#Quarterly

Redirection to Our plans for existing users-Quarterly
    Landing on Postpaid Page
    Click on Quarterly Section-Redirection

 Verify and Validate the UI and Content of Quarterly Plans Page
    Landing on Postpaid Page
    Verifying content and UI of page and plan cards of Quarterly
    Verify UI elements and content of Filter pop-up-Quarterly
    Verify the Redirection of Book Now and View Details button of all plans card-Quarterly
    Verify the Redirection of all the button present under More Information Section-Quarterly

#SemiAnnual

Verify and Validate the UI and Content of Semi-Annual Plans Page 
    Landing on Postpaid Page
    Verify the Content and UI of plan page and plan cards
    Verify UI elements and content of Filter pop-up-SemiAnnual
    Verify the Redirection of Book Now and View Details button of all plans card-SemiAnnual
    Verify the redirection of button present under More Information Section-Semi-Annual

#Annual

Redirection to Our plans for existing users-Annual
    Landing on Postpaid Page
    Click on Annual Section-Redirection

Verify and Validate the UI and content of Annual Plans page
    Landing on Postpaid Page
    Verify the UI and content of Annual Plans page
    Verify UI elements and content of Filter pop-up-Annual
    Verify the UI and content of all plan cards in Annual plan section
    Verify the Redirection of Book Now and View Details button of all plans card-Annual
    Verify the redirection of all the button present under More Information Section-Annual


#ISD
Redirection to Our plans for existing users-ISD
    Landing on Postpaid Page
    Click on ISD Section Redirection

Verify and Validate the UI and content of ISD Plans page
    Landing on Postpaid Page
    Verify the UI and content of ISD Plans page and plan cards
    Verify the redirection of Recharge button of ISD plans
    Verify UI of Recharge of and View details and check functionality of View details ISD plans
    Verify Error message when an Invalid Jio number/not registered number is entered
    Verify UI and content of View details pop-up card and check functionality of buttons on pop-up-ISD
    Verify the Redirection of all button present under More Information Section
    
# Data Sachet

Verify and Validate UI and content of all plan cards in Data Sachet section
    Landing on Postpaid Page
    Verify UI and content of all plan cards in Data Sachet section
    Verify the UI and content of View details pop-up card
    Verify redirection of Recharge button of all plans card
    Verify Redirection of button present under More Information Section-Data Sachet

Verify and Validate Entertainment on demand section is visible and verify the UI elements and content
     Landing on Postpaid Page
     
     Verify Confirm Entertainment on demand section is visible and verify the UI elements and content
    
# Packed with incredible plans
Verify and Validate Incredible Fiber plans section is visible and verify the UI elements and content
    Landing on Postpaid Page
    Verify Incredible Fiber plans section is visible and verify the UI elements and content
    Verify UI And redirection of Book Now button present in 'View Details' popup

# Speed as per your digital needs   
Verify and Validate Redirection of all plan buttons under 'Speeds as per your digital needs'
    Landing on Postpaid Page
    Reading Data of Postpaid Page from Excel
    Verifying the Redirection of all plan buttons under 'Speeds as per your digital needs'

#  Discover More wth Jio

 Verify and Validate UI elements & content of banners under 'Switch to Jio' & confirm user redirected to respective lead pages on clicking the banner(s)
    Landing on Postpaid Page
    Verify UI elements & content of banners under 'Switch to Jio' & confirm user redirected to respective lead pages on clicking the banner(s)
