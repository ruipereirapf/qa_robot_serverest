*** Settings ***
Library    SeleniumLibrary
Library    FakerLibrary

*** Variables ***
${INPUTBOX_NAME}                    xpath=//input[contains(@placeholder,'Digite seu nome')]
${INPUTBOX_EMAIL}                   xpath=//input[contains(@name,'email')]
${INPUTBOX_PASSWORD}                xpath=//input[contains(@name,'password')]
${REGISTER_BTN_USER}                xpath=//button[@data-testid='cadastrar']
${REGISTER_ADMIN_CHECKBOX}          xpath=//input[contains(@name,'administrador')]
${ADMIN_RESGISTER_NEW_USER_BTN}     xpath=//button[@type='submit']

*** Keywords ***

Register Normal User
    ${USERNAME}    Name
    ${EMAIL}       Email
    ${PASSWORD}    Password

    Set Global Variable    ${USERNAME}
    Set Global Variable    ${EMAIL}
    Set Global Variable    ${PASSWORD}

    Wait Until Element Is Visible    ${INPUTBOX_NAME}
    Input Text    ${INPUTBOX_NAME}        ${USERNAME}
    Input Text    ${INPUTBOX_EMAIL}       ${EMAIL}
    Input Text    ${INPUTBOX_PASSWORD}    ${PASSWORD}

    ${BTN_REGISTER}  Run Keyword And Return Status    Element Should Be Visible    ${REGISTER_BTN_USER}

    IF    ${BTN_REGISTER} == 'True'
        Click Button    ${REGISTER_BTN_USER}
    ELSE
        Click Button    ${ADMIN_RESGISTER_NEW_USER_BTN}
    END

Register Admin User
    ${ADMIN_USERNAME}    Name
    ${ADMIN_EMAIL}       Email
    ${ADMIN_PASSWORD}    Password

    Set Global Variable    ${ADMIN_USERNAME}
    Set Global Variable    ${ADMIN_EMAIL}
    Set Global Variable    ${ADMIN_PASSWORD}

    Wait Until Element Is Visible    ${INPUTBOX_NAME}
    Input Text    ${INPUTBOX_NAME}        ${ADMIN_USERNAME}
    Input Text    ${INPUTBOX_EMAIL}       ${ADMIN_EMAIL}
    Input Text    ${INPUTBOX_PASSWORD}    ${ADMIN_PASSWORD}
    Click Element    ${REGISTER_ADMIN_CHECKBOX}

    Click Button    ${REGISTER_BTN_USER}