*** Settings ***
Resource                    Mobile_PO/Header_PO/Redirection_to_MobilePage.robot
Resource                    Mobile_PO/Header_PO/Header_SubHeader.robot
Resource                    Mobile_PO/Header_PO/SearchBar_Functionality.robot
Resource                    Mobile_PO/Header_PO/Login_Cart_Funtionality.robot
Resource                    ../../Resources/Excel_activity.robot


*** Keywords ***

Verify Mobile Page UI & Sub-Header Menu Redirection of Mobile Page
    Redirection to Mobile Page
    Mobile Page Verification 
    Check Sub-Header menu Redirections                          

Verify Header menu Redirections
    Redirection to Mobile Page
    Check Header menu Redirections                              
    
Verify Search bar Functionality
    Redirection to Mobile Page
    Search Menu UI and Functionality                                         
    Search Menu Input Functionality and Redirection             

Verify Log-in Icon Functionality
    Redirection to Mobile Page
    Verify Log-in Button                                        


Verify MyCart icon redirection with product in Cart
    MyCart icon redirection with product                        
