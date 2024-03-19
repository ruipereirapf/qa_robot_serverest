*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${BROWSER}    headlesschrome
${URL}        https://front.serverest.dev/login

*** Keywords ***

Start Web Test
    Open Browser    browser=chrome
    Maximize Browser Window
    
End Web Test
    Capture Page Screenshot
    Close Browser

Access home page
    Go To    ${URL}