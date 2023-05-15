*** Settings ***
Library                                                   SeleniumLibrary
Resource                                                  ../../../Common.robot
Variables                                                 ../../../Common_Variables.yaml
Resource                                                  ../../../Local_Keywords.robot
Resource                                                  ../../../Excel_Activity.robot



*** Keywords ***
Landing on Discover Page
    Visit Jio.com And Goto                                 ${Shops}   
    #Validating Shop page is opened   
    URL Validation                                         ${NavBar_URL[${0}]}
    Set Screenshot Directory                               ./Results/Shop/AddToCart_Screenshots/
    Take Page Screenshot                                   ShopPage_Loaded

Checking Add to Cart Button Functionality 
    Reading Data of Add to Cart Pop Up from Excel
    Pop-up button Verification
    Log To Console                                         About to end

Checkout section
    # Reading Data of Add to Cart Pop Up from Excel
    Reading Data of Add to Cart Personal Details
    Product Checkout Functionality

    
