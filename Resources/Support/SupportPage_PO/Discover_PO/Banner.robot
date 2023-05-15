*** Settings ***
Resource                           ../../../Common.robot
Resource                           ../../../Excel_activity.robot
Variables                          ../../../../Tests/Support/Discover_Variables.yaml
Resource                           ../../../Local_Keywords.robot

*** Keywords ***
Click on Search box from Banner and Verify Contents of SearchBar Verification
    #92458
    #Verifying if Searchbar is present
    Wait For And Verify Element       xpath://input[@id='supportSearchtxt']
    #Clicking on SearchBar
    Wait For And Click Element        xpath://input[@id='supportSearchtxt']
    Execute Javascript                window.scrollTo(0,200)
    #Verifying if Whole Suggestion Box is present
    Wait For And Verify Element       xpath://div[@id='searchList-support']
    #Quicklinks
    Wait For And Verify Element       xpath://div[@id='quicklink-list-id-support']
    #Suggested Links
    Wait For And Verify Element       xpath://div[@id='suggested-list-id-support']
    Click on Any QuickLinks from Search Verification
    Enter Random Strings of Length Three Verification
    #Click on Chatbot 
    #92461
    Wait For And Click Element        xpath://img[@class='chatbotImg open_chatbox']
    Chat-bot verification
   
Click on Any QuickLinks from Search Verification
    #92459
    #Clicking on Recharge From the Quickilinks Suggestions 
    Redirection On Clicking           xpath://div[@id='quicklink-list-id-support']//li[1]//a[1]    ${SearchRechargeURL}    Sc_Recharge
   
Enter Random Strings of Length Three Verification
    #92460
    #Entering Random String of length three in the Search Bar
    Wait For And Click Element        xpath://*[@id="supportSearchtxt"]
    Wait For And Input Text           xpath://input[@id='supportSearchtxt']        ygf   
    #Verifying if Suggested List Appears
    Wait For And Verify Element       xpath://div[@id='suggested-list-id-support']
    #Verifying Suggested List Contents
    Wait For And Verify Content       xpath://a[@href='/en-in/support-search?searchkeyword=myjio']                 ${placeholder}[1]
    Wait For And Verify Content       xpath://a[contains(@href,'/en-in/support-search?searchkeyword=recharge')]    ${placeholder}[2]