*** Settings ***
Resource                            Mobile_PO/Prepaid_PO/RedirectionToPrepaid.robot
Resource                            Mobile_PO/Prepaid_PO/ISD_Functionality.robot
Resource                            Mobile_PO/Prepaid_PO/In-Flight_Packs_plan_functionality.robot
Resource                            Mobile_PO/Postpaid_PO/IR_Functionality.robot
Resource                            Mobile_PO/Prepaid_PO/Annual_plan_functionality.robot
Resource                            Mobile_PO/Prepaid_PO/JioPhone_plan_functionality.robot
Resource                            Mobile_PO/Prepaid_PO/JioPhone_AddOn.robot
Resource                            Mobile_PO/Prepaid_PO/TopUp_plan_functionality.robot
Resource                            Mobile_PO/Prepaid_PO/ValuePlans_Functioanlity.robot
Resource                            Mobile_PO/Prepaid_PO/PopularPlans_Functionality.robot
Resource                            Mobile_PO/Prepaid_PO/Prepaid_Page.robot
Resource                            Mobile_PO/Prepaid_PO/Data Add-On.robot
Resource                            Mobile_PO/Prepaid_PO/JioLink.robot
Resource                            Mobile_PO/Prepaid_PO/JioSaavn Pro.robot   
Resource                            Mobile_PO/Prepaid_PO/NoDailylimit_Functionality.robot
Resource                            Mobile_PO/Prepaid_PO/Find_India's_most_loved_plans_here.robot



*** Keywords ***
Verify and Validate Prepaid Page
    Landing on Prepaid Page
    #Verify Mobile Prepaid Page UI 
    Verify Redirection of Top Banner of Prepaid Page
    View All Plans Button Redirection on Prepaid Page

Verify and Validate Popular Plans Page
    Landing on Prepaid Page
    Redirection to Popular Plan Page 
    Validate UI and Content of Popular Plans Page
    Filter button functionality of Popular Plans Page
    View all Sub plans button Redirection on Popular Plans Page
    Verify and Validate Plan Cards and Recharge Redirection of All Popular Plans
    Verify Redirection of More Information section Popular Plans Page

    
Verify and Validate Annual Plans Page
    Landing on Prepaid Page
    Redirection to Annual Plan Page
    Validate UI and Content of Annual Plans Page
    Verify and Validate Plan Cards and Recharge Redirection of All Annual Plans
    Verify Redirection of More Information section Annual Plans Page


Verify and Validate JioPhone Plans Page
    Landing on Prepaid Page
    Redirection to JioPhone Plan Page
    Validate UI and Content of JioPhone Plans Page
    Verify and Validate Plan Cards and Recharge Redirection of All JioPhone Plans
    Verify Redirection of More Information section JioPhone Plans Page

Verify and Validate No Daily Limit Plans Page
    Landing on Prepaid Page
    Redirection to No Daily Limit Plan Page
    Validate UI and Content of No Daily Limit Plans Page
    Verify and Validate Plan Cards and Recharge Redirection of All No Daily Limit Plans
    Verify Redirection of More Information section No Daily Limit Plans Page

Verify and Validate JioPhone AddOn Plans Page
    Landing on Prepaid Page
    Redirection to JioPhone AddOn Plan Page
    Validate UI and Content of JioPhone AddOn Plans Page
    Verify and Validate Plan Cards and Recharge Redirection of All JioPhone AddOn Plans
    Verify Redirection of More Information section JioPhone AddOn Plans Page

Verify and Validate Prepaid-ISD Plans Page
    Landing on Prepaid Page
    Redirection to ISD Plan Page    Prepaid
    Validate UI and Content of ISD Plans Page
    Change Country button functionality of ISD Plans Page
    Verify and Validate Plan Cards and Recharge Redirection of ISD Plans
    Verify Redirection of More Information section ISD Page           

Verify and Validate Prepaid IR Plans Page
    Landing on Prepaid Page
    Redirection to International Roaming Plan Page
    Validate UI and Content and functionality of International Roaming Plans Page
    Change Country button functionality of International Roaming Plans Page
    Validate UI and Content of Search Results Page
    Verify and Validate Plan Cards and Recharge Redirection of International Roaming Plans
    Verify Redirection of FAQ section International Roaming Page
    Verify Redirection of More Information section International Roaming Page

Verify and Validate Prepaid In-Flight Packs Plans Page
    Landing on Prepaid Page
    Redirection to In-Flight Packs Plan Page    Prepaid
    Validate UI and Content and functionality of In-Flight Packs Plans Page
    Verify and Validate Plan Cards and Recharge Redirection of In-Flight Packs Plans
    Reading Data of Prepaid Mobile Page from Excel
    Verify Redirection of FAQ section In-Flight Packs Page
    Verify Redirection of More Information section In-Flight Packs Page


Verify and Validate Top-up Plans Page
    Landing on Prepaid Page
    Redirection to Top-up Plan Page
    Validate UI and Content and functionality of Top-up Plans Page
    Verify and Validate Plan Cards and Recharge Redirection of Top-up Plans
    Verify Redirection of More Information section Top-up Plans Page


Verify and Validate Value Plans Page
    Landing on Prepaid Page
    Redirection to Value Plan Page
    Validate UI and Content and functionality of Value Plans Page
    Verify and Validate Plan Cards and Recharge Redirection of Value Plans
    Verify Redirection of More Information section Value Plans Page



Verify and Validate Data Add-On Page
    Landing on Prepaid Page
    Redirection to Data Add-On Plans Page                                               
    Validate UI and Content of Data Add-On Plans Page                                   
    Filter button functionality of Data Add-On Plans Page                               
    View all Sub plans button Redirection on Data Add-On Page                           
    Verify and Validate Plan Cards and Recharge Redirection of All Data Add-On Plans    
    Verify Redirection of More Information section Data Add-On Page                     


Verify and Validate JioLink Plans Page
    Redirection to JioLink Plans Page                                                   
    Validate UI and Content of JioLink Plans Page                                       
    Filter button functionality of JioLink Plans Page                                   
    Verify and Validate Plan Cards of JioLink Page                                      
    Verify Redirection of More Information section on JioLink Plans Page                


Verify and Validate JioSaavn Pro Plans Page
    Redirection to JioSaavn Pro Plans Page                                                                  
    Validate UI and Content of JioSaavn Pro Plans Page                                                      
    Verify and Validate Plan Cards of All JioSaavn Pro Plans                                                
    Verify Redirection of More Information section on JioSaavn Pro Plans Page 

Confirm The UI Of Get The Speed As Per Your Digital Needs Section
    Landing on Prepaid Page
    Verify and Validate Get the speed Section of Prepaid Page

Confirm The UI Of Discover More With Jio Section
    Landing on Prepaid Page
    Verify and Validate Discover More With Jio Section of Prepaid Page

Confirm The UI And Its Elements' Functionality Of Find India's most-loved plans here section
    Landing on Prepaid Page
    Confirm UI And Elements' functionality Of Find India's most-loved plans here
