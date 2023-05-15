*** Settings ***
Library             SeleniumLibrary
Resource            ../../Common.robot
Resource            ../../Local_Keywords.robot
Resource            ../Apps_PO/Apps_FAQ.robot

*** Keywords ***

#------APPS VERIFICATION-----

#This is one test case for Shopping Section
JioMart App Tile UI/Content/Functional Verification and Redirection
    ${ROW}=        Decide Start and End                    2    18    JioMart    Apps_Page
    Reading Data of Apps Page from Excel    ${ROW}
    Tile Verification
    Click Get Now Button
    Jio App Information Page Redirection
    Banner Verification
    Content Validation
    Log To Console                          content verified
    Infographics Verificationn
    All Get Now Verification of App Information Page
    App Validate FAQ
    Go Back

#This is one test case for Partner Section
JioPos Lite App Tile UI/Content/Functional Verification and Redirection
    ${ROW}=        Decide Start and End                    2    18    JioPOS Lite    Apps_Page
    Reading Data of Apps Page from Excel    ${ROW}
    Tile Verification
    Click Get Now Button
    Jio App Information Page Redirection
    Banner Verification
    Content Validation
    Infographics Verificationn
    All Get Now Verification of App Information Page
    Checking Video Section
    App Validate FAQ
    Go Back

#This is one test case for Health Section
JioHealth Hub App Tile UI/Content/Functional Verification and Redirection
    ${ROW}=        Decide Start and End                    2    18    JioHealthHub    Apps_Page
    Reading Data of Apps Page from Excel    ${ROW}
    Tile Verification
    Click Get Now Button
    Jio App Information Page Redirection
    Banner Verification
    Content Validation
    Infographics Verificationn
    All Get Now Verification of App Information Page
    App Validate FAQ
    Go Back

#This is one test case for Smart Home Section
JioHome App Tile UI/Content/Functional Verification and Redirection
    ${ROW}=        Decide Start and End                    2    18    JioHome    Apps_Page
    Reading Data of Apps Page from Excel    ${ROW}
    Tile Verification
    Click Get Now Button
    Jio App Information Page Redirection
    Banner Verification
    Content Validation
    Infographics Verificationn
    FAQ Section                             0        1
    Go Back

