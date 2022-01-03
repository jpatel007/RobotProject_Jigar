*** Settings ***
Library    SeleniumLibrary

Suite Setup    Log    I am inside Test Suite Set up
Suite Teardown    Log    I am inside set suite teardown
Test Setup    Log    I am inside Test Case Set Up
Test Teardown    Log    I am inside Test Case teardown

Default Tags    Smoke

*** Variables ***

${URL}    https://opensource-demo.orangehrmlive.com/
@{CRED}    Admin        admin123
&{LOGINDATA}    username=Admin    password=admin123  

*** Test Cases ***
SmokeTest1
    Log    Hello World...    
    
SeleniumSmokeTest
    Open Browser    https://google.com    chrome
    Set Browser Implicit Wait    5
    Capture Page Screenshot
    Input Text    name=q        Jigar Patel Optum
    Press Keys    name=q    ESCAPE
    Capture Page Screenshot
    Press Keys    name=q    ENTER
   ## Click Button    name=btnK
    Sleep    3
    Capture Page Screenshot
    Close Browser
    Log    Test Completed 
    
# LoginSmokeTest
    # [Documentation]    This is a login Test
    # Open Browser        https://opensource-demo.orangehrmlive.com/    Chrome
    # Set Browser Implicit Wait    5
    # Input Text        id=txtUsername    Admin
    # Input Password    id=txtPassword    admin123
    # Click Button    id=btnLogin
    # Click Element    id=welcome
    # Click Element    link=Logout
    # Close Browser
    # Log    Test Completed
    

# LoginVariableSmokeTest1
    # [Documentation]    This is a login Test
    # ...    ## This is an example of scalar varibale
    # Open Browser        ${URL}    Chrome
    # Set Browser Implicit Wait    5
    # ## This is an example of list varibale
    # Input Text        id=txtUsername    ${CRED}[0]
    # Input Password    id=txtPassword    ${CRED}[1]
    # Click Button    id=btnLogin
    # Click Element    id=welcome
    # Click Element    link=Logout
    # Close Browser
    # Log    Test Completed
    # ## This is an example of environment varibale
    # Log    This test was executed by %{username} on %{os} 



# LoginVariableSmokeTest2
    # [Documentation]    This is a login Test
    # Open Browser        ${URL}    Chrome
    # Set Browser Implicit Wait    5
    # ## This is an example of Dictionary varibale
    # Input Text        id=txtUsername    ${LOGINDATA}[username]
    # Input Password    id=txtPassword    ${LOGINDATA}[password]
    # Click Button    id=btnLogin
    # Click Element    id=welcome
    # Click Element    link=Logout
    # Close Browser
    # Log    Test Completed
     # ## This is an example of environment varibale
    # Log    This test was executed by %{username} on %{os}
    # ## This is an example of built-in varibale 
    # # https://robotframework.org/robotframework/latest/RobotFrameworkUserGuide.html#scalar-variable-syntax
    # Log    We just ran ${TEST NAME}


LoginSmokeTestkw
    [Documentation]    This is a login Test
    Open Browser        ${URL}    Chrome
    Set Browser Implicit Wait    5
    ## This is an example of Dictionary varibale
    LoginKW
    Click Element    id=welcome
    Click Element    link=Logout
    Close Browser
    Log    Test Completed
     ## This is an example of environment varibale
    Log    This test was executed by %{username} on %{os}
    ## This is an example of built-in varibale 
    # https://robotframework.org/robotframework/latest/RobotFrameworkUserGuide.html#scalar-variable-syntax
    Log    We just ran ${TEST NAME}


SmokeTest2
    [Tags]    Sanity    
    Log    Sanity Test 2...    
    
SmokeTest3
    Log    Smoke Test 3...
    Set Tags    Regression 1
    Remove Tags    Regression 1       
    
SmokeTest4
    Log    Smoke Test 4...     

*** Keywords ***

LoginKW
    Input Text        id=txtUsername    ${LOGINDATA}[username]
    Input Password    id=txtPassword    ${LOGINDATA}[password]
    Click Button    id=btnLogin    