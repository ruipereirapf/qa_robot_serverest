*** Settings ***
Library    SeleniumLibrary

Resource   ../resource.robot

*** Variables ***

${ADMIN_EMAIL}                      ruiadmin@gmail.com
${ADMIN_PASSWORD}                   ruiadmin
${NORMAL_USER_EMAIL}                rui123@gmail.com
${NORMAL_USER_PASSWORD}             rui123
${HOME_BTN_REGISTER}                xpath=//a[@data-testid='cadastrar']
${HOME_USER_EMAIL}                  xpath=//input[contains(@name,'email')]
${HOME_USER_PASSWORD}               xpath=//input[contains(@name,'password')]
${HOME_BTN_LOGIN}                   xpath=//button[@data-testid='entrar']
${HOME_TEXT_PRODUCTS}               xpath=//h4[contains(.,'Produtos')]
${HOME_SECOND_PRODUCT}              xpath=(//div[@class='card-body'])[2]//button
${HOME_SHOPPING_LIST}               xpath=//a[contains(.,'Lista de Compras')]
${HOME_ADMIN_REGISTER_NEW_USER}     xpath=//a[@data-testid='cadastrarUsuarios']


*** Keywords ***

Select Register
    Wait Until Page Contains Element    ${HOME_BTN_REGISTER}
    Click Element    ${HOME_BTN_REGISTER}

Admin Login
    Wait Until Element Is Visible    ${HOME_USER_EMAIL}
    Input Text       ${HOME_USER_EMAIL}       ${ADMIN_EMAIL}
    Input Text       ${HOME_USER_PASSWORD}    ${ADMIN_PASSWORD}
    Click Element    ${HOME_BTN_LOGIN}
    
Normal User Login
    Wait Until Element Is Visible    ${HOME_USER_EMAIL}
    Input Text       ${HOME_USER_EMAIL}       ${NORMAL_USER_EMAIL}
    Input Text       ${HOME_USER_PASSWORD}    ${NORMAL_USER_PASSWORD}
    Click Element    ${HOME_BTN_LOGIN}

Login With Admin User
    Access home page
    Admin Login

Login With Normal User
    Access home page
    Normal User Login

Add Product To Cart
    Wait Until Page Contains Element    ${HOME_SECOND_PRODUCT} 
    Click Element    ${HOME_SECOND_PRODUCT}

Go To Shopping List
    Wait Until Page Contains Element    ${HOME_SHOPPING_LIST}
    Click Element    ${HOME_SHOPPING_LIST}

Click Register Users
    Wait Until Element Is Visible    ${HOME_ADMIN_REGISTER_NEW_USER}
    Click Element    ${HOME_ADMIN_REGISTER_NEW_USER}