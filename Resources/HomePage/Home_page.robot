*** Settings ***
Resource                            Home_PO/RedirectionToHome.robot
Resource                            Home_PO/UI_verification.robot 
Resource                            Home_PO/Carousel_Banners.robot
Resource                            Home_PO/Quick_Recharge.robot
Resource                            Home_PO/Pay_Bills.robot
Resource                            Home_PO/Get_JioSIM.robot
Resource                            Home_PO/Get_JioFiber.robot
Resource                            Home_PO/Spotlight.robot
Resource                            Home_PO/Enrich_Your.robot
Resource                            Home_PO/Discover_New.robot
Resource                            Home_PO/Business_Banner.robot
Resource                            Home_PO/Latest_Devices.robot
Resource                            Home_PO/Career_Banner.robot
Resource                            Home_PO/Making_Difference.robot
Resource                            Home_PO/Header_Footer.robot
Resource                            Home_PO/QRcode.robot
Resource                            Home_PO/Three_App_Banners.robot
Resource                            ../Local_Keywords.robot


*** Keywords ***
Visit Home Page on Jio.com
    Landing on Home Page

Header Content Verification
    Visit Home Page on Jio.com
    Header Content Validation

Home Page UI Elements Verification
    Visit Home Page on Jio.com
    Home Page UI Elements Validation

Home Carousel Banners Validation
    Visit Home Page on Jio.com
    Home Carousel Banners Verification

Quick actions UI Elements Verification
    Visit Home Page on Jio.com
    Quick Action Section Verification

Quick Recharge Popup Verification
    Visit Home Page on Jio.com
    Quick Recharge Popup Validation

Pay bills Popup Verification    
    Visit Home Page on Jio.com
    Pay Bills Popup Validation
    
Get Jio SIM Popup Verification
    Visit Home Page on Jio.com
    Get Jio SIM Popup Validation

Get Jio Fiber Popup Verification
    Visit Home Page on Jio.com
    Get Jio Fiber Popup Validation

Visit Port to Jio Page
    Visit Home Page on Jio.com
    Port to Jio Page Redirection

Visit Support Page 
    Visit Home Page on Jio.com
    Support Page Redirection

Three Promo Cards  
    Visit Home Page on Jio.com
    Three Promo Cards Verification

In the Spotlight Section Verification
    Visit Home Page on Jio.com
    In the Spotlight Section Validation

Enrich Your Section Verification
    Visit Home Page on Jio.com
    Enrich Your Section Validation

Discover New Section Verification
    Visit Home Page on Jio.com
    Discover New Section Validation

Latest and Trending Devices Section Verification
    Visit Home Page on Jio.com
    Latest and Trending Devices Section Validation

Career Banner Verification
    Visit Home Page on Jio.com
    Career Banner Validation

Making a Difference Verification
    Visit Home Page on Jio.com
    Making a Difference Validation

Business Banner Verification
    Visit Home Page on Jio.com
    Business Banner Validation

QR code Section Verification
    Visit Home Page on Jio.com
    QR Code Validation

Home Need Guidance Section Verification  
    Visit Home Page on Jio.com
    Need Guidance Section Validation

Footer Section Verification
    Visit Home Page on Jio.com
    Footer Content Validation

