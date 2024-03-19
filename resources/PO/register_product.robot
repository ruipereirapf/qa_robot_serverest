*** Settings ***
Library    SeleniumLibrary
Library    FakerLibrary

*** Variables ***
${ADD_PRODUCTS}                          xpath=//a[contains(.,'Cadastrar Produtos')]
${INPUT_NEW_PRODUCT_NAME}                xpath=//input[contains(@name,'nome')]
${INPUT_NEW_PRODUCT_PRICE}               xpath=//input[contains(@name,'price')]
${INPUT_NEW_PRODUCT_DESCRIPTION}         xpath=//textarea[contains(@name,'description')]
${INPUT_NEW_PRODUCT_QUANTITY}            xpath=//input[contains(@name,'quantity')]
${ADD_NEW_PROCUT}                        xpath=//button[@data-testid='cadastarProdutos']

*** Keywords ***

Enter Product Details
    ${NEW_PRODUCT_NAME}                Name
    ${NEW_PRODUCT_PRICE}               Random Int
    ${NEW_PRODUCT_DESCRIPTION}         Sentence
    ${NEW_PRODUCT_QUANTITY}            Random Digit Not Null

    Set Suite Variable    ${NEW_PRODUCT_NAME}
    Set Suite Variable    ${NEW_PRODUCT_PRICE}
    Set Suite Variable    ${NEW_PRODUCT_DESCRIPTION}
    Set Suite Variable    ${NEW_PRODUCT_QUANTITY}

    Wait Until Element Is Visible    ${ADD_PRODUCTS}
    Click Element    ${ADD_PRODUCTS}
    Wait Until Element Is Visible    ${INPUT_NEW_PRODUCT_NAME}
    Input Text      ${INPUT_NEW_PRODUCT_NAME}           ${NEW_PRODUCT_NAME}
    Input Text      ${INPUT_NEW_PRODUCT_PRICE}          ${NEW_PRODUCT_PRICE}
    Input Text      ${INPUT_NEW_PRODUCT_DESCRIPTION}    ${NEW_PRODUCT_DESCRIPTION}
    Input Text      ${INPUT_NEW_PRODUCT_QUANTITY}       ${NEW_PRODUCT_QUANTITY}
    Click Button    ${ADD_NEW_PROCUT}