*** Settings ***
Resource                   ../../../Common.robot
Variables                  ../../../../Tests/Support/LocateUs_Variables.yaml
Resource                   ../../../Excel_activity.robot
Resource                   ../../../Local_Keywords.robot

*** Keywords ***
UI and Content of 'Store Details' Page Verification
    #92499/ 92500
    #Verify Stores from the top Nav bar
    Wait For And Verify Content                        xpath://button[@class="j-tab j-tab-size__small active"]    ${StoresTitle}
    URL Validation                                     ${locateus_urls}[0]
    Take Page Screenshot                               Sc_Redirection_to_Stores
    Confirm UI Elements of Store Page Verification
    Locate Us Search bar and Suggestions Verification
    Stores appearing according to search location
    MapView Count and ListView Count Verification 
    Confirm On Clicking Any Tile user is Redirected to Jio Store Page Verification
    UI and Content of Jio Store Page
    Confirm Redirections of Button on the Jio Store Page Verification 

Confirm UI Elements of Store Page Verification
    #92501
    Tab Verification
    #Verifying the Stores Container
    ${StoreTiles}=    Get WebElements                  ${listview_tile}
    FOR     ${tiles}    IN                             ${StoreTiles}
        Scroll To                                      ${StoreTiles}
        Wait For And Verify Element                    ${StoreTiles} 
    END

    #Verify Map
    Wait For And Verify Element                        ${mapview_container}

    #Footer Verification
    Wait For And Verify Element                        xpath:(//section[@class="j-container l-layout--max-width"])[2]

    #92502
    Verify Search Bar

    #92503
    #Click on Cross button
    Wait For And Click Element                         ${CrossButton}

    #Add code to Verify Placeholder 
    Wait For And Verify Element                        ${input_placeholder} 
    
#92504 TestCase
Locate Us Search bar and Suggestions Verification
    #Enter Location
    Wait For And Input Text                            ${input_placeholder}    Ujjain
    Sleep    200ms    #Required and Fixed  

    #Clicks on 1st suggested location
    Wait For And Click Element                         xpath:(//div[@class="googleSuggest_suggestion__2-vQO j-text j-text-body-s-bold"])[1] 
    Sleep    200ms    #Required and Fixed
    Wait For And Verify Element                        ${Tile}

#92505, 92506 TestCase
Stores appearing according to search location 
    #Map view
    ${elements}=    Get WebElements                    xpath://img[@src="https://maps.gstatic.com/mapfiles/transparent.png"]
    ${length}=      Get Length                         ${elements}

    #List view
    ${element}=     Get WebElements                    ${Container}
    ${len}=         Get Length                         ${element}

    #Check list view and verify each tiles
    FOR  ${x}  IN RANGE    1    4        
        
        ${store_status}=     Get Text                  xpath:(//span[@class="j-text j-text-body-xxs-bold"])[${x}] 

        IF  "${store_status}" == "OPEN" 
                Text Verification                      xpath:(//span[@class="j-text j-text-body-xxs-bold"])[${x}]    OPEN
                Text Verification                      (${Container})[${x}]    ${locate_text}[${x}] 
        ELSE     
                Text Verification                      xpath:(//span[@class="j-text j-text-body-xxs-bold"])[${x}]    CLOSED 
                Text Verification                      (${Container})[${x}]    ${locate_text2}[${x}] 
        END 
        Wait For And Verify Element                    xpath:(//div[@class="listItem_time__9PzyG j-text j-text-body-xs"])[${x}]   
    END

    #Check whether Map view elements and List view elements are same
    IF    ${length} == ${len}
        Log To Console    pass
    END
    
#92507
MapView Count and ListView Count Verification 
    #Refresh page for enabling auto fetch location
    Reload Page

    #Verifying whether list view appears after autofetching location  
    Wait For And Verify Element                        ${Tile}
    ${Storeslistviewtiles}=       Get WebElements      ${Tile}
    ${Storeslistviewtilescount}=  Get Length           ${Storeslistviewtiles}  
    Set Global Variable                                ${Storeslistviewtiles}  

    #Map View  
    Wait For And Verify Element                        ${mapview_container}

    #Verifying whether map view appears after autofetching location  
    Wait For And Verify Element                        ${MapImage} 
    ${Storesmapviewpins}=         Get WebElements      ${MapImage}  
    ${Storesmapviewpinscount}=    Get Length           ${Storesmapviewpins} 
    ${Storesmapviewpinscount}=    Evaluate             (${Storesmapviewpinscount}-1)  
    Set Global Variable                                ${Storesmapviewpinscount}

    #Listview and mapview comparison
    IF     ${Storeslistviewtilescount} == ${Storesmapviewpinscount}
    Log To Console     success
    END

Confirm On Clicking Any Tile user is Redirected to Jio Store Page Verification
    #92508
    #Check for Container
    Wait For And Verify Element                        ${listview_container}

    #Check for tile
    Wait For And Verify Element                        ${Container}

    #Map view 
    Wait For And Verify Element                        ${mapview_pins}

    #Click on 1st Tile
    Wait For And Click Element                         (${Tile})[1]
    URL Validation                                     ${locateus_urls}[0]

    #JioStore Title verification 
    Wait For And Verify Content                        ${Heading}    Jio Store
    Take Page Screenshot                               SC_Store Tile

# Testcase : 92509
UI and Content of Jio Store Page
    # Verifying if Back button is present 
    Wait For And Verify Element                        ${Backbutton}

    # Verifying if Title is present
    Text Verification                                  ${Heading}                 Jio Store

    #Title CSS verification
    CSS Verification                                   ${Heading}                 font-weight    700 

    # Verifying if Store icon is present
    Wait For And Verify Element                        ${StoreIcon}
    Log To Console                                     icon

    # Verifying if Store image is present
    Wait For And Verify Element                        xpath://img[@src="https://jep-asset.akamaized.net/jiocom/static/images/jioStore.png"]

    # Verifying if Store address is present
    Scroll To                                          ${GetDirectionsButton}
    ${fullAddress} =    Get Text                       ${StoreAddress}    
    Text Verification                                  ${StoreAddress}            ${fullAddress}

    # Verifying if Store location icon is present
    Wait For And Verify Element                        xpath://button[@data-testid="pinnedLocation"]
    # Verifying if Store timing is present
    ${Timing} =         Get Text                       ${StoreTimings}
    Text Verification                                  ${StoreTimings}            ${Timing}

    #Verifying if the Store is open
    Run Keyword And Return Status    CSS Verification  ${openStatus}    background-color    25ab21 
    IF    True
        #If it is green , then the store is open
        Log To Console    Open
    ELSE
        #If it is grey , then the store is closed
        Log To Console    Close
    END  

    # Verifying if Get Directions button is present
    Wait For And Verify Element                        ${GetDirectionsButton}
    Text Verification                                  ${GetDirectionsButton}     ${locateus_text}[3]

    # Verifying if accurate distance from current location to store location is present
    ${distance} =       Get Text                       ${StoreDistance}
    Text Verification                                  ${StoreDistance}           ${distance}

    # Verifying if 'Join our best mobile and fiber services from the comfort of your home' is present
    Text Verification                                  ${TilesPO_Text}            ${locateus_text}[2]

    # Verifying if Get Jio SIM button is present
    Wait For And Verify Element                        ${GetJioSIMButton}
    Text Verification                                  ${GetJioSIMButton}         ${locateus_text}[4]
    
    # Verifying if Get Jio Fiber button is present
    Wait For And Verify Element                        ${GetJioFiberButton}
    Text Verification                                  ${GetJioFiberButton}       ${locateus_text}[5]

    # Verifying if Map view is present
    Wait For And Verify Element                        ${mapview_container}
      
    #92510
Confirm Redirections of Button on the Jio Store Page Verification
    Scroll To                                          xpath://div[@class="simplebar-content"]

    #Redirection to Google maps    
    Page Should Contain Button                         ${GetDirectionsButton}
    Text Verification                                  ${GetDirectionsButton}     ${locateus_text}[3]
    Wait For And Click Element                         ${GetDirectionsButton}

    #Click and Get JioSIM link     
    Wait For And Verify Element                        ${locateus_getjiosim}
    Wait For And Click Element                         ${locateus_getjiosim}
    Change Tab                                         Get New Jio Sim Card - Best Prepaid and Postpaid Sim Home Delivered 
    Take Page Screenshot                               SC_GetJioSim
    URL Validation                                     ${LocateUs_GetJioSIM_URL}
    Change Tab                                         Locate Us For Nearest Jio Store, Service Center or Hotspot Online

    #Click and Get JioFiber link    
    Wait For And Verify Element                        ${GetJioFiberButton}
    Wait For And Click Element                         ${GetJioFiberButton}
    Change Tab                                         Get Jio Fiber Connection - New WiFi Connection For Home
    Take Page Screenshot                               SC_GetJioFiber
    URL Validation                                     ${LocateUs_GetJioFiber_URL}
    Change Tab                                         Locate Us For Nearest Jio Store, Service Center or Hotspot Online

    #Back button
    Wait For And Verify Element                        ${Backbutton}
    Wait For And Click Element                         ${Backbutton}
     
#92533(part2)
Check List view and Map View are autofetched in Stores
    wait for and Click Element                         ${storestab}
    
    #------------------------List View -------------------------
    Wait For And Verify Element                        ${listview_container}
    #verifying whether list view appears after autofetching location
    Wait For And Verify Element                        ${listview_tile}
    ${storeslistviewtiles}=         Get WebElements    ${listview_tile}
    ${storeslistviewtilescount}=    Get Length         ${storeslistviewtiles}
    Set Variable                                       ${storeslistviewtiles}
    
    #-------------------Map View -------------------------
    Wait For And Verify Element                        ${mapview_container}
    #verifying whether map view appears after autofetching location
    Wait For And Verify Element                        ${mapview_pins}
    ${storesmapviewpins}=           Get WebElements    ${mapview_pins}
    ${storesmapviewpinscount}=      Get Length         ${storesmapviewpins}
    ${storesmapviewpinscount}=      Evaluate           (${storesmapviewpinscount}-1)
    Set Variable                                       ${storesmapviewpinscount}

    #----------listview and mapview comparison---------------
    IF     ${storeslistviewtilescount} == ${storesmapviewpinscount}
        Log To Console    success
    END





    
 
  



   
