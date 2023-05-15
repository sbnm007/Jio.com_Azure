*** Settings ***
Resource                   ../../../Common.robot
Variables                  ../../../../Tests/Support/LocateUs_Variables.yaml
Resource                   ../../../Excel_activity.robot
Resource                   ../../../Local_Keywords.robot

*** Keywords ***
UI and content of 'service center' page verification
    Check Redirection And UI Content Of Service Center Page Of Each Tile Verification
    content Verification of service centers
    location suggestions

#92511
Check Redirection And UI Content Of Service Center Page Of Each Tile Verification
    #Verify Service center
    Wait For And Verify Content                            ${ServiceCenterHeading}           ${tabtext}[1]
    Wait For And Click Element                             ${ServiceCenterHeading}
    Take Page Screenshot                                   Sc_ServiceCenter
    UI Of Service Center Page Verification
    Clicking On The Store Tile Of Service Center Page Verification
    List View And Map View Are Autofetched Verification
    Check UI And Content Of 'Jio Service Center Details' Page Verification
    Redirection Of Buttons On Service Page Verification

    #92512, 92513
UI Of Service Center Page Verification        
    Tab Verification

    #Verify Search Bar
    Verify Search Bar

    #List of Service Center Tiles with basic Details are present
    ${Center_tile}=    Get WebElements                     ${Container}
    FOR    ${Storetile}     IN     @{Center_tile}
        ${Tile_Content}=    Get Text                       (${Container})['${Storetile}'] 
        Wait For And Verify Content                        (${Container})['${Storetile}']    ${Tile_Content}
    END

    #Map View
    Wait For And Verify Element                            ${mapview_container}

    #92515 
location suggestions 
    #clicking on service centers tab
    Wait For And Click Element                             ${Backbutton}
    Wait For And Click Element                             ${ServiceCenterHeading} 

    #clear text
    Wait For And Click Element                             ${CrossButton}

    #Input location in search bar
    Wait For And Input Text                                ${input_placeholder}    Nagpur 

    #location suggestions 
    ${searchbar_location}=    Wait Until Keyword Succeeds    1 min   1 sec            Get Text       ${suggestion_container}    
    Wait For And Verify Content                            ${suggestion_container}          ${searchbar_location}

    #Selected Location List View and Map View  
    #92516
    #selects the location
    Wait For And Click Element                             ${Suggestedoption}
    Wait For And Verify Element                            ${listview_container}

    #map view verification
    Wait For And Verify Element                            ${mapview_container}

    #service centers count list view 
    ${centers_count}=    Get WebElements                   ${listview_container}   
    ${length}=      Get Length                             ${centers_count}
    FOR     ${count}    IN     ${length}
        
        ${listview_count}=    Get Element Count            xpath://section[@class="listItem_Container__2oidW j-container sp--base pd--all l-layout--flex bg--primary-background l-radius--xl"][${count}]    
        #verifying list view elements
        Wait For And Verify Element                        (${listview_tile})[${count}] 
        Sleep    500ms  
        #Checking open/closed status of the service center
        ${store_status} =     Get Text                     (//div[@class="listItem_openBadgeContainer__GkEyq j-badge j-badge-size__small"])[${count}] 
        IF  "${store_status}" == "OPEN" 
                Text Verification                          xpath:(//span[@class="j-text j-text-body-xxs-bold"])[${count}]    OPEN
                Wait For And Verify Content                ${listview_container}    ${listview_locations1}
        ELSE     
                Text Verification                          xpath:(//span[@class="j-text j-text-body-xxs-bold"])[${count}]    CLOSED
                Wait For And Verify Content                ${listview_container}    ${listview_locations2} 
        END 
        Wait For And Verify Element                        xpath:(//div[@class="listItem_time__9PzyG j-text j-text-body-xs"])[${count}]         
    END
    
    #Locations Icon count mapview
    ${pins_count}=    Get WebElements                      xpath://div[@style="z-index: 3; position: absolute; height: 100%; width: 100%; padding: 0px; border-width: 0px; margin: 0px; left: 0px; top: 0px; touch-action: pan-x pan-y;"]
    FOR     ${element}    IN     @{pins_count}
        ${mapview_count}=    Get Element Count             (${mapview_pins})['${element}'] 
    END

    #comparing list view and map view
    IF  ${listview_count} == (${mapview_count}-1)    
        Log To Console    success
    END

content Verification of service centers
    #92517 (location autofetch)
    #Refresh page for enabling auto fetch location
    Reload Page
    Wait For And Click Element                             ${servicecenterstab}

    #list view verification
    #service centers list and content verification
    Sleep    200ms    #Required and Fixed
    ${centers_text}=    Get Text                           ${listview_container} 
    Text Verification                                      ${listview_container}           ${centers_text}     
    List View And Map View Are Autofetched Verification
    Clicking On The Store Tile Of Service Center Page Verification

#92533(part1)
Check List view and Map View are autofetched in Service Centers
    wait for and Click Element                              ${servicecenterstab} 
    
    #------------------------List View -------------------------
    Wait For And Verify Element                            ${listview_container}
    #verifying whether list view appears after autofetching location
    Wait For And Verify Element                            ${listview_tile}
    ${servicecenterslistviewtiles}=    Get WebElements     ${listview_tile}
    ${servicecenterslistviewtilescount}=    Get Length     ${servicecenterslistviewtiles}
    Set Variable    ${servicecenterslistviewtiles}
    
    #-------------------Map View -------------------------
    Wait For And Verify Element                            ${mapview_container}
    #verifying whether map view appears after autofetching location
    Wait For And Verify Element                            ${mapview_pins}
    ${pins_count}=    Get WebElements                      xpath://div[@style="z-index: 3; position: absolute; height: 100%; width: 100%; padding: 0px; border-width: 0px; margin: 0px; left: 0px; top: 0px; touch-action: pan-x pan-y;"]
    FOR     ${element}    IN     @{pins_count}
        ${mapview_count}=    Get Element Count             (${mapview_pins})['${element}'] 
    END

    #comparing list view and map view
    IF  ${servicecenterslistviewtilescount} == (${mapview_count}-1)    
        Log To Console    success
    END

#92518
List View And Map View Are Autofetched Verification
    #Verify Tile Container
    Wait For And Verify Element                            ${listview_container}

    #Verify All Store Tiles
    Wait For And Verify Element                            ${Tile}

    #Taking Web Elements of All Store Tiles
    ${servicecenterslistviewtiles}=       Get WebElements  ${Tile} 
    ${servicecenterslistviewtilescount}=  Get Length       ${servicecenterslistviewtiles}  
    Log To Console  ${servicecenterslistviewtiles}  
    Set Global Variable  ${servicecenterslistviewtiles} 

    #Map View   
    Wait For And Verify Element                            ${mapview_container}

    #Verifying the Map View appears after autofetching location   
    ${servicecentersmapviewpins}=        Get WebElements   ${mapview_pins} 
    ${servicecentersmapviewpinscount}=   Get Length        ${servicecentersmapviewpins} 
    ${servicecentersmapviewpinscount}=   Evaluate          (${servicecentersmapviewpinscount}-1)  
    Log To Console                                         ${servicecentersmapviewpinscount}  

    #listview and mapview comparison  
    IF     ${servicecenterslistviewtilescount} == ${servicecentersmapviewpinscount}
    Log To Console     success
    END

#92519        
Clicking On The Store Tile Of Service Center Page Verification
    Wait For And Click Element                             ${servicecenterstab}

    #Click on the first tile
    Wait For And Click Element                             (${listview_tile})[1]

    #Verify UI of Service Center Details
    Wait For And Verify Content                            ${JioServiceCentertitle}                              Jio Service Center
    Check UI And Content Of 'Jio Service Center Details' Page Verification
    Redirection Of Buttons On Service Page Verification
    
#92520
Check UI And Content Of 'Jio Service Center Details' Page Verification
    #Verify if Jio Service Centers title is Visible
    Wait For And Verify Content                            (${JioServiceCentertitle})                            Jio Service Center

    #Back Button
    Wait For And Verify Element                            ${Backbutton}

    #Store Icon 
    Wait For And Verify Element                            ${StoreIcon}

    #Store Image
    Wait For And Verify Element                            xpath:(//img[@alt='store'])

    #Address
    ${Address}=        Get Text                            ${TileAddress}    
    Wait For And Verify Content                            ${TileAddress}                    ${Address}

    #Locater Symbol near Store Address
    Wait For And Click Element                             xpath://img[@alt='marker']

    #Scrolling Down 
    Scroll To                                              ${GetDirectionsButton}

    #Verifying Time & Status of a store
    ${Time_Status}=    Get Text                            ${StoreTime}
    Wait For And Verify Content                            ${StoreTime}                      ${Time_Status}

    #Contact Number
    ${nostatus}    Run Keyword And Return Status     Wait For And Verify Element    xpath=//div[@class='storeDescription_numberContainer__3wMgM']
    IF    ${nostatus} == True     
        ${ContactNo}=        Get Text                      ${NumberOnTile}
        Wait For And Verify Content                        ${NumberOnTile}                   ${ContactNo}  
    ELSE
        Log To Console    No Contact Number
    END

    #Get Directions Button
    Wait For And Verify Element                            ${GetDirectionsButton}

    #Distance From User to Store
    ${Distance}=        Get Text                           ${Direction}
    Wait For And Verify Content                            ${Direction}                      ${Distance}
    Scroll To                                              ${GetJioSIMButton}

    #SubText below Distance
    Wait For And Verify Content                            ${Subtext}                        ${locateus_text}[2] 

    #Get Jio Sim Button
    Wait For And Verify Element                            ${GetJioSIMButton}

    #Get JioFiber
    Wait For And Verify Element                            ${GetJioFiberButton}

    #Map 
    Wait For And Verify Element                            ${mapview_container}
    
#92521
Redirection Of Buttons On Service Page Verification
    #Click on get direction button
    Wait For And Click Element                             ${GetDirectionsButton}

    #Click on get Jio SIM
    Wait For And Click Element                             ${GetJioSIMButton}
    Change Tab                                             Get New Jio Sim Card - Best Prepaid and Postpaid Sim Home Delivered
    URL Validation                                         ${LocateUs_GetJioSIM_URL}
    Change Tab                                             Locate Us For Nearest Jio Store, Service Center or Hotspot Online
    Take Page Screenshot                                   Sc_GetJioSIM

    #Click on Get Jio Fiber
    Wait For And Click Element                             ${GetJioFiberButton}
    Change Tab                                             Get Jio Fiber Connection - New WiFi Connection For Home
    URL Validation                                         ${LocateUs_GetJioFiber_URL}
    Change Tab                                             Locate Us For Nearest Jio Store, Service Center or Hotspot Online
    Take Page Screenshot                                   Sc_JioFiber
