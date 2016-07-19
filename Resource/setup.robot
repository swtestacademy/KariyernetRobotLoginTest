*** Settings ***
Library  Selenium2Library
 
*** Variables ***
${Username}  swtestacademy@gmail.com
${Password}  wrongpass
${Browser}  Firefox
${SiteUrl}  http://www.kariyer.net/
${DashboardTitle}  İş arayanlar için iş ilanları, eleman arayanlar için eleman - Kariyer.net
${ExpectedWarningMessage}  Kullanıcı adı, E-posta ve şifrenizi kontrol ederek tekrar deneyin.
${WarningMessage}  Login Failed!
${Delay}  5s
 
*** Keywords ***
Open Kariyernet
    Open Browser   url=${SiteUrl}   browser=${Browser} 
	
Check Title
    Title Should Be   ${DashboardTitle}  
 
Maximize Browser
    Maximize Browser Window
	
Go to User Login Page	
	#Execute Javascript  document.getElementsByClassName('login-control')[0].style.display='block'
	Click Link    xpath=//a[@href="http://www.kariyer.net/website/kariyerim/login.aspx"]
 
Enter User Name
    Input Text   id=lgnUserName    ${Username}
 
Enter Wrong Password
    Input Text   id=lgnPassword   ${Password}
 
Click Login
    Click Link    xpath=//a[@href="javascript:__doPostBack('ctl00$MasterPageBody$LinkButton1','')"]
 
Assert Warning Message
    Element Text Should Be   css=.error   ${ExpectedWarningMessage}   ${WarningMessage}