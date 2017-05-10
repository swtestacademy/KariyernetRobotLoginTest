*** Settings ***
Resource  ../Resource/setup.robot
Suite Teardown    Close Browser
 
*** Test Cases ***
Login Should Failed With Wrong Username and Password
	[TAGS]  Failed_Kariyernet_Login_Test
	Open Chrome With Options
    Open Kariyernet 
	Check Title
	Go to User Login Page
    Enter User Name
    Enter Wrong Password
    Click Login
    sleep    ${Delay}
    Assert Warning Message