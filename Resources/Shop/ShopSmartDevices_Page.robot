*** Settings ***
Library                                SeleniumLibrary
Resource                               ShopPage_PO/Smart_Devices_PO/RedirectionToSmartDevices.robot
Resource                               ../Local_Keywords.robot
Resource                               ShopPage_PO/Smart_Devices_PO/SmartDevicesPagePO/MostPop_MostVal.robot
Resource                               ../../Resources/Shop/ShopPage_PO/Smart_Devices_PO/SmartDevicesPagePO/AllProducts.robot
Resource                               ../../Resources/Shop/ShopPage_PO/Smart_Devices_PO/SmartDevicesPagePO/FilterButton.robot
Resource                               ../../Resources/Shop/ShopPage_PO/Smart_Devices_PO/SmartDevicesProductPagePO/ProductDetails.robot

*** Keywords ***
Check 'Most Popular' and 'Most Value' sections UI and Functionality
    Landing on Smart Devices Page
    Check UI of Most Popular and Most Value section

Check Each Smart Devices Product UI and Functionality
    Landing on Smart Devices Page
    Full UI Smart Devices

Check Show Filter UI and Functionality
    Landing on Smart Devices Page
    Checking Various Filter options
    
    