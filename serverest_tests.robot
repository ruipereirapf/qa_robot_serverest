*** Settings ***
Documentation    This suite serves as a learning processes testing the website 'https://front.serverest.dev/login'

Resource         resources/resource.robot
Resource         resources/PO/home.robot
Resource         resources/PO/register_user.robot
Resource         resources/PO/register_product.robot
Resource         resources/PO/lista_compras.robot

Test Setup       Start Web Test
Test Teardown    End Web Test
Library    XML

*** Test Cases ***

Test Case 01 - Register new user
    [Documentation]    This test registers a new user in the website
    [Tags]             register_user

    Access Home Page
    Select Register
    Register Normal User


Test Case 02 - Register new admin
    [Documentation]    This test registers a new admin in the website
    [Tags]             register_admin
    
    Access Home Page
    Select Register
    Register Admin User


Test Case 03 - Register New Product
    Login with admin user
    Enter Product Details


Test Case 04 - Add to Cart
    Login With Normal User
    Add Product To Cart


Test Case 05 - Clear Cart
    Login With Normal User
    Add product to cart
    Go To Shopping List

    ${CART_TEXT}    Run Keyword And Return Status  Element Should Be Visible     ${CART_LIST_TEXT_EMPTY}

    IF  ${CART_TEXT} == 'True'  #ou $True
        Log    Cart is already Empty
    ELSE
        Clear Shopping List 
    END
    ## Its the same as the IF Line
    # Run Keyword If    ${CART_TEXT}    Log    Cart is already empty


Test Case 06 - Create User As Admin
    Login With Admin User
    Click Register Users
    Register Normal User