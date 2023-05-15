***Settings***
Resource                            Mobile_PO/Recharge_PO/RedirectionToRecharge.robot
Resource                            Mobile_PO/Recharge_PO/Recharge_Page_UI.robot
Resource                            Mobile_PO/Recharge_PO/ISD_Recharge_Plan_Page.robot
Resource                            Mobile_PO/Recharge_PO/Payment_Gateway.robot
Resource                            Mobile_PO/Recharge_PO/ViewDetailsPage_UI.robot
Resource                            Mobile_PO/Recharge_PO/International_Roaming.robot
Resource                            Mobile_PO/Recharge_PO/RechargeHere_JioLink.robot
Resource                            Mobile_PO/Recharge_PO/ViewDetailsPageFiber_UI.robot
Library                             Collections


#Rearrange according TC order on devops
*** Keywords ***
Recharge Page UI Validation
    MRecharge Page UI Verification

Mobile View Details Section UI Verification
    Mobile View Details Section Validation

Fiber View Details Section UI Verification
    Fiber View Details Section Validation

MR-ISD Section Validation
    MR-ISD Section Verification

MR-International Roaming Section Validation
    MR-International Roaming Section Verification

MR-Payment Gateway Page Validation
    MR-Payment Gateway Page Verification 

Recharge Here - JioLink Validation
    Recharge Here - JioLink Verification