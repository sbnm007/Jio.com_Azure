*** Settings ***
Library    SeleniumLibrary
Library    Dialogs
Resource    FiberPage_PO/Services_PO/RedirectionToSevices.robot
Resource    FiberPage_PO/Services_PO/Services_UI.robot
Resource    FiberPage_PO/Services_PO/JioTV+.robot
Resource    FiberPage_PO/Services_PO/JioGames.robot
Resource    FiberPage_PO/Services_PO/JioJoin.robot
Resource    FiberPage_PO/Services_PO/JioPhotos.robot
Resource    FiberPage_PO/Services_PO/Jio_Set_Top_Box.robot
Resource    FiberPage_PO/Services_PO/High_Speed_Internet.robot
Resource    FiberPage_PO/Services_PO/JioCentreX.robot
Resource    FiberPage_PO/Services_PO/Home_Networking_Smart_Security.robot

*** Keywords ***
Visit Fiber Services Page
    Landing on Services Page

Verify and Validate Services Page
    Services Page

Verify and Validate JioCentrex Page
    JioCentrex Page

Verify and Validate Home Networking & Smart Security page
    Home Networking & Smart Security page

Verify and Validate Jio set top box page
    Jio set top box page

Verify and Validate High Speed Internet and Free HD Voice page
    High speed internet & Free Voice page

Verify and Validate Giga-fast fun time-JioTV+ page
    Scroll Down to Giga-fast fun time-JioTV+

Verify and Validate Giga-fast fun time-JioGames page
    JioGames page

Verify and Validate Giga-fast fun time-JioJoin page
    JioJoin page

Verify and Validate Giga-fast fun time-JioPhotos page
    JioPhotos Page

    
