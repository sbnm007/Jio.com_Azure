*** Settings ***
Library                                    SeleniumLibrary
Resource                                   ../Local_Keywords.robot
Resource                                   ShopPage_PO/JioFi_PO/RedirectionToJioFi.robot
Resource                                   ShopPage_PO/JioFi_PO/JioFi_Page_Content.robot
Resource                                   ShopPage_PO/JioFi_PO/JioFI_ProductPage.robot
Resource                                   ShopPage_PO/JioFi_PO/FilterButton.robot

*** Keywords ***
Check the UI and content of 'JioFi' page
    Landing on JioFi Page
    JioFi Page Content Verification

UI Validation of Filter options on JioFi page
    Landing on JioFi Page
    Checking Filter UI
    #Site Issue 
    #Run Keyword And Continue On Failure    Checking PriceRange Filter UI
    Checking Battery capacity Filter UI

Check UI and content of 'JioFi' product page
    Landing on JioFi Page
    UI and Content of 'JioFi' Tile



