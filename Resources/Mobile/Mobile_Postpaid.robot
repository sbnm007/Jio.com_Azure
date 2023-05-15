*** Settings ***
Resource                            Mobile_PO/Postpaid_PO/RedirectionToPostpaid.robot
Resource                            Mobile_PO/Postpaid_PO/IR_Functionality.robot
Resource                            Mobile_PO/Postpaid_PO/MainPlan_Functionality.robot
Resource                            Mobile_PO/Postpaid_PO/ISD_Functionality.robot
Resource                            Mobile_PO/Postpaid_PO/JioSaavn_Pro.robot 
Resource                            Mobile_PO/Postpaid_PO/Postpaid_page.robot
Resource                            Mobile_PO/Postpaid_PO/In-Flight_Packs_plan_functionality.robot
Resource                            Mobile_PO/Postpaid_PO/Already_a_Jio_Postpaid_user.robot
Resource                            Mobile_PO/Postpaid_PO/Top-selling_postpaid_plans.robot


*** Keywords ***
Visit Postpaid page of Jio.com
    Landing on Postpaid Page

Verify and Validate Postpaid Page
    Landing on Postpaid Page
    Verify Redirection of Top Banner of Postpaid Page
    Verify of Top selling postpaid plans section of Postpaid Page
    Verify of Already a Jio Postpaid section of Postpaid Page
    Verify Infographics section of Postpaid Page
    Verify One plan ,many benefits section
    Verify and Validate Discover more possibilities Section of Postpaid Page
    Verify FAQ section is visible
    
Verifying the options selected on header on postpaid page
    Landing on Postpaid Page
    Verifying options selected on header on postpaid page

Verify View All Plans Button Redirection on Postpaid Page   
    Landing on Postpaid Page
    Verifying View All Plans Button Redirection on Postpaid Page  

Verify and Validate Main Plans Page
    Landing on Postpaid Page
    Redirection to Main Plan Page 
    Filter button functionality of Main Plans Page
    Validate UI and Content of Main Plans Page    
    #Redirection of View all JioPostPaidPlus plans button 
    Validate UI and content of all plan cards in Main plan section  
    Validate Redirection of Get Now button and View details of all plans card
    Validate redirection of links present in Notes section of View details
    Verify Redirection of More Information section Main Page 
    #View all Sub plans button Redirection on Main Plans Page
    #Verify and Validate Plan Cards and Recharge Redirection of Main Plans

Verify and Validate Postpaid-ISD Plans Page
    Landing on Postpaid Page
    Redirection to ISD Plan Page  
    Validate UI and Content of ISD Plans Page
    Change Country button functionality of ISD Plans Page
    Verify and Validate Plan Cards and Recharge Redirection of ISD Plans
    Verify Redirection of More Information section ISD Page


Verify and Validate Postpaid IR Plans Page
    Landing on Postpaid Page
    Redirection to International Roaming Plan Page
    Validate UI and Content and functionality of International Roaming Plans Page
    Change Country button functionality of International Roaming Plans Page
    Validate UI and Content of Search Results Page
    Verify and Validate Plan Cards and Recharge Redirection of International Roaming Plans
    Verify Redirection of FAQ section International Roaming Page
    Verify Redirection of More Information section International Roaming Page

Verify and Validate Postpaid In-Flight Packs Plans Page
    Landing on Postpaid Page
    Redirection to In-Flight Packs Plan Page    Postpaid
    Validate UI and Content and functionality of In-Flight Packs Plans Page
    Verify and Validate Plan Cards and Recharge Redirection of In-Flight Packs Plans
    Verify Redirection of FAQ section In-Flight Packs Page
    Verify Redirection of More Information section In-Flight Packs Page

Verify and Validate JioSaavn Pro Plans Page
    Landing on Postpaid Page
    Redirection to JioSaavn Pro Plans Page             
    Validate UI and Content of JioSaavn Pro Plans Page                         
    Verify and Validate Plan Cards of All JioSaavn Pro Plans          
    Verify Redirection of More Information section on JioSaavn Pro Plans Page 

Verify and Validate Top-selling postpaid plans
    Landing on Postpaid Page
    Scroll To "Top-selling postpaid plans" section
    Validate the UI elements and content of "Top-selling postpaid plans" section
    Verify the Redirection of Get Now button of 'Top-selling postpaid plans' cards
    

Verify and Validate 'Already a Jio Postpaid user?' section 
    Landing on Postpaid Page
    Scroll To 'Already a Jio Postpaid user?' section 
    Validate the UI elements and content of "Already a Jio Postpaid user" section

