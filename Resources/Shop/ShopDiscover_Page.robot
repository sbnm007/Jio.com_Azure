*** Settings ***
Library                             SeleniumLibrary
Resource                            ShopPage_PO/Discover_PO/RedirectionToDiscover.robot
Resource                            ShopPage_PO/Discover_PO/Banner_Functionality.robot
Resource                            ShopPage_PO/Discover_PO/Launched_and_its_here.robot
Resource                            ShopPage_PO/Discover_PO/Quick_Action.robot
Resource                            ShopPage_PO/Discover_PO/Trending_Right_Now.robot
Resource                            ShopPage_PO/Discover_PO/Bringing_People_Together.robot
Resource                            ShopPage_PO/Discover_PO/Always_find_new_offers.robot


*** Keywords ***

Check banner carousel is visible to user
    Landing on Discover Page
    Top Banner Carousel Section Verification

Check Quick Action Buttons are visible to user
    Landing on Discover Page
    Quick Action Button Section

Check 'Launched and its here!' section is visible to user
    Landing on Discover Page
    Check 'Launched and its here!' Banner

#vivek

Bringing people together section visibility along with UI and redirection to GetJioFiber
    Landing on Discover Page
    Bringing people together section visibility along with UI and redirected to GetJioFiber page
    
Trending right now section is visible to user along with UI and is redirected to respective product page when clicking on product tile
    Landing on Discover Page
    Trending right now section visibility, UI verification and redirection

Always find new offers section is visible to user along with UI and is redirected to relevant product page on clicking on Buy Now button
    Landing on Discover Page
    Always find new offers section visibility, UI verification and is redirected to relevant product page on clicking on Buy Now button

More reasons to shop here section is visible to user along with UI
    Landing on Discover Page
    More reasons to shop here section visibility along with UI

Need guidance? section is visible to user along with UI and is redirected to Online Shopping FAQ page and contact centre
    Landing on Discover Page
    Need guidance? section visibility, UI Verfification and is redirected to Online Shopping FAQ page on clicking on Support button also redirected to contact centre when clicked on call us

    
    

