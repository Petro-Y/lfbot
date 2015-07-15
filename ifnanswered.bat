@echo off
rem if there's any other user's answer in %1 topic do %2 %3 %4%5 %6 %7 %8 %9
rem topic reference must be quoted and must be like
rem "http://lingvoforum.net/index.php/topic,37360.new/topicseen.html"
set initpage=%1
wget --load-cookies=cookies.txt --save-cookies=cookies.txt -O lf.html %initpage%

for /f "usebackq tokens=*" %%i in (`"lfuser<lf.html"`) do set user=%%i
set lastuser=
for /f "usebackq tokens=*" %%i in (`"getlastuser <lf.html"`) do set lastuser=%%i
if  "%lastuser%"=="%user%" %2 %3 %4%5 %6 %7 %8 %9
