*** Settings ***
Resource                        ../../../../Local_Keywords.robot

*** Keywords ***
Checking PriceRange Filter UI
    Click Show Filter Option
    Applying Slider Filter      xpath=(//div[@class="filters-container"])[1]    Price range
    Confirm product list is modified as per "Price filter"
    Remove Filter

Checking Filter Brand UI
    Click Show Filter Option
    ${brand}    Set Variable    Apple
    Applying CheckBox Filter    xpath=(//div[@class="filters-container"])[3]    Brand    ${brand}
    Verify Checkbox Filter      ${brand}
    Confirm product list is modified as per "Brand filter"               ${brand}
    Remove Filter

Checking Various Filter options
    Checking Filter UI
    Checking PriceRange Filter UI
    Checking Filter Brand UI
