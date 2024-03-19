*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${CART_LIST_TEXT_EMPTY}    xpath=//p[contains(.,'Seu carrinho está vazio')]
${CART_LIST_CLEAR_LIST}    xpath=//button[contains(.,'Limpar Lista')]

*** Keywords ***

Clear Shopping List
    Wait Until Element Is Visible    ${CART_LIST_CLEAR_LIST}
    Click Element    ${CART_LIST_CLEAR_LIST}

