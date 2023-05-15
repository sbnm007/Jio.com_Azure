*** Settings ***
Resource                   ../../../Excel_activity.robot
Resource                   ../../../Common.robot
Variables                  ../../../../Tests/Support/LocateUs_Variables.yaml
Resource                   ../../../Local_Keywords.robot
 
*** Keywords ***
UI and content of 'Hotspot' Page verification
    Verification of UI and content by fetching autolocations
    Verification of UI and content without fetching of autolocations

Verification of UI and content by fetching autolocations
    Verify UI of Hotspot Page
    Confirm clicking on the hotspot tile user is redirected to 'Hotspot details' page
    Confirm the UI and content of 'Hotspot details' page 

Verification of UI and content without fetching of autolocations
    Verify UI elements of search bar of Hotspot Tab
    User gets autosuggestions of locations
    Hotspots according to searched location appears in the list view and map view 

#92529
Check List view and Map View are autofetched in Hotspots
    wait for and Click Element                              ${hotspotstab}

#92533(part3)
    #------------------------List View -------------------------

    #list view container
    Wait For And Verify Element                             ${listview_container}

    #List view tile
    Wait For And Verify Element                             ${listview_tile}
    ${hotspotlistviewtiles}=    Get WebElements             ${listview_tile}
    ${hotspotlistviewtilescount}=    Get Length             ${hotspotlistviewtiles}
    Set Global Variable                                     ${hotspotlistviewtilescount}
    
    #-------------------Map View -------------------------

    #map view layout
    Wait For And Verify Element                             ${mapview_container}

    #map view pins
    Wait For And Verify Element                             ${mapview_pins}
    ${hotspotmapviewpins}=     Get WebElements              ${mapview_pins}
    ${hotspotmapviewpinscount}=     Get Length              ${hotspotmapviewpins}
    ${hotspotmapviewpinscount}=     Evaluate                (${hotspotmapviewpinscount}-1)
    Set Global Variable                                     ${hotspotmapviewpinscount}

    # ----------listview and mapview comparison---------------
    IF     ${hotspotlistviewtilescount} == ${hotspotmapviewpinscount}
        Log To Console    success
    END

#92523
Verify UI of Hotspot Page
    Tab Verification
    Wait For And Click Element                              ${hotspotstab}

    #92522
    URL Validation                                          ${locateus_urls}[0]
    Take Page Screenshot                                    Sc_Hotspot
    Hotspot Tiles and Icon verification

#93530
Confirm clicking on the hotspot tile user is redirected to 'Hotspot details' page 
    #Scroll to the first tile
    Scroll To                                               xpath://span[@class="listItem_icon__202nI j-icon"]

    #click on first tile of list view
    Wait For And Click Element                              (${Tile})[1]
    URL Validation                                          ${locateus_urls}[0]   
    Take Page Screenshot                                    Hotspotdetailspage

#92531
Confirm the UI and content of 'Hotspot details' page
    #Heading of the hotspot page
    Text Verification                                       xpath://div[@class='hotspotType']                ${locateus_text}[1]

    #back button
    Wait For And Verify Element                             ${Backbutton}

    #hotspot icon
    Wait For And Verify Element                             xpath://img[@class='storeDescription_headingImage__oAC_N']

    #Store Image
    Wait For And Verify Element                             xpath://img[@alt='store']

    #Address
    Wait For And Verify Element                             ${StoreAddress}

    #locator symbol
    Wait For And Verify Element                             xpath://img[@src="https://jep-asset.akamaized.net/jiocom/static/images/ic_marker_darkBlue.svg"]

    #get Directions button
    Wait For And Verify Element                             ${GetDirectionsButton}
    Text Verification                                       ${GetDirectionsButton}    ${locateus_text}[3]
    Scroll To                                               ${locateus_getjiosim}

    #distance in km
    Wait For And Verify Element                             ${StoreDistance}
    ${g}=    Get Text                                       ${StoreDistance}
    Wait For And Verify Content                             ${StoreDistance}          ${g}

    #relevant text
    Text Verification                                       xpath://div[@class='storeDescription_offerText__1VvhP j-text j-text-body-s']    ${locateus_text[2]}

    #get jiosim link
    Wait For And Verify Element                             ${locateus_getjiosim}
    Text Verification                                       ${locateus_getjiosim}    ${locateus_text}[4]

    #get jiofiber link
    Wait For And Verify Element                             ${locateus_getjiofiber}
    Text Verification                                       ${locateus_getjiofiber}  ${locateus_text}[5]

    #back button
    Wait For And Click Element                              ${Backbutton}
    
Verify UI elements of search bar of Hotspot Tab
    #search bar
    Wait For And Verify Element                             ${input_placeholder}

    #Search icon
    Wait For And Verify Element                             ${LocateUs_Searchbar_xpath}

    #Cross button
    Wait For And Click Element                              ${CrossButton}

    #placeholder of the search bar
    Element Attribute Value Should Be                       ${input_placeholder}    placeholder     Enter your location here

#92526
User gets autosuggestions of locations
    #search for a  location in search bar
    Wait For And Input Text                                 ${input_placeholder}    reliance corporate park

    #Autosuggestions container 
    Wait For And Verify Element                             ${ClickonSugestion}   
    Take Page Screenshot                                    hotspotautosugg.png 

#92527
Hotspots according to searched location appears in the list view and map view
    #click on the first suggestion
    Wait For And Click Element                              (//div[@class='googleSuggest_suggestion__2-vQO j-text j-text-body-s-bold'])[normalize-space()='Reliance Corporate Park, MIDC Industrial Area, Ghansoli, Navi Mumbai, Maharashtra, India']
    Sleep    200ms    #Required and Fixed
    ${v}=    Get Element Count                              ${listview_tile}
    
    #verification of locations suggested in list view and map view
    FOR    ${z}    IN RANGE    1     (${v}+1)  
        Scroll To                                           (${listview_tile})[${z}]
        # Basic text verification of each tile on list view
        ${f}=    Get Text                                   (${listview_tile})[${z}]
        ${f}=    Replace String    ${f}    \n    ${f}    
        Write Excel Cell	    ${z+1}	    2	    value=${f}  sheet_name=Support_LocateUs
        Save Excel Document    filename=Resources/JioWeb.xlsx
        ${y}=    Read Excel Cell          row_num=${z+1}      col_num=2  sheet_name=Support_LocateUs
        Text Verification                                   (${listview_tile})[${z}]    ${y}
        #map view pin verification
        Wait For And Verify Element                         (${mapview_pins})[${z}]   
    END

#92528
Hotspot Tiles and Icon verification
    #Refresh page for enabling auto fetch location
    Reload Page
    Wait For And Click Element                              ${hotspotstab}
    ${hotspotlistviewtiles}=    Get WebElements             ${listview_tile}
    ${hotspotlistviewtilescount}=    Get Length             ${hotspotlistviewtiles}
    Set Global Variable                                     ${hotspotlistviewtilescount}
    FOR    ${i}    IN RANGE    1    ${hotspotlistviewtilescount-1}
        Scroll To                                           (${listview_tile})[${i}]
        #Basic details on each tile
        ${g}=    Get Text                                   (${listview_tile})[${i}]
        ${g}=    Replace String    ${g}    \n    ${g}
        Write Excel Cell	    ${i}	    2	    ${g}    sheet_name=Support_LocateUs
        Save Excel Document	    filename=Resources/JioWeb.xlsx
        ${x}=   Read Excel Cell          row_num=${i}      col_num=2  sheet_name=Support_LocateUs
        Text Verification                                   (${listview_tile})[${i}]      ${x}
        #Hotspot icon verification
        Wait For And Verify Element                         xpath:(//*[name()='path' and contains(@d,'M4 11a8 8 ')])[${i}]
    END
