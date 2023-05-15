*** Settings ***
Resource                            Apps_PO/Redirection_to_Apps.robot
Resource                            Apps_PO/Apps_Entertainment.robot
Resource                            Apps_PO/Apps_UnCategorized.robot
Resource                            Apps_PO/Apps_MyJio.robot
Resource                            Apps_PO/Apps_Communication.robot
Resource                            Apps_PO/Apps_Utility.robot
Resource                            ../Local_Keywords.robot

*** Keywords ***
Visit Apps Page on Jio.com 
    Landing on Apps Page
    #Tab Verification 

Apps Page Validation
    Apps Homepage UI verification

# --------------------- Restructure -------------------



#Sibin
Verify and Validate MyJio app
    MyJio App Tile UI/Content/Functional Verification and Redirection


Verify and Validate JioMart app
    JioMart App Tile UI/Content/Functional Verification and Redirection

Verify and Validate JioPos Lite app
    JioPos Lite App Tile UI/Content/Functional Verification and Redirection


Verify and Validate JioHealth Hub app
    JioHealth Hub App Tile UI/Content/Functional Verification and Redirection


Verify and Validate JioHome app
    JioHome App Tile UI/Content/Functional Verification and Redirection

# Jay
#-----
Verify and Validate JioMeet app
    JioMeet App Tile UI/Content/Functional Verification and Redirection
Verify and Validate JioChat app
    JioChat App Tile UI/Content/Functional Verification and Redirection

Verify and Validate JioCall app
    JioCall App Tile UI/Content/Functional Verification and Redirection
    
Verify and Validate JioPages app
    JioPages App Tile UI/Content/Functional Verification and Redirection
Verify and Validate JioCloud app
    JioCloud App Tile UI/Content/Functional Verification and Redirection

Verify and Validate JioSecurity app
    JioSecurity App Tile UI/Content/Functional Verification and Redirection


# Manoj
Verify and Validate JioTV app
    JioTV App Tile UI/Content/Functional Verification and Redirection

Verify and Validate JioCinema app
    JioCinema App Tile UI/Content/Functional Verification and Redirection

Verify and Validate JioGames app
    JioGames App Tile UI/Content/Functional Verification and Redirection

Verify and Validate JioSaavn app
    JioSaavn App Tile UI/Content/Functional Verification and Redirection

Verify and Validate JioNews app
    JioNews App Tile UI/Content/Functional Verification and Redirection


*** Comments ***
Will be included after getting test cases
Verify Carousel Functionality
    Check carousel functionality
