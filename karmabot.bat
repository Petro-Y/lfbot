@echo off
set initpage=http://lingvoforum.net/index.php/topic,36979.150.html
wget --load-cookies=cookies.txt --save-cookies=cookies.txt -O lf.html %initpage%
grep modifykarma<lf.html|head -n1|sed -e s/.*m=[0-9]*;/"set session="/1 -e s/"[^^a-z0-9= ].*"// >setsession.bat
call setsession.bat
sed -e s/^^/http:\/\/lingvoforum.net\/index.php\?action=modifykarma;sa=applaud;uid=/g -e s/$/;%session%/g <applaud.txt >url.tmp
sed -e s/^^/http:\/\/lingvoforum.net\/index.php\?action=modifykarma;sa=smite;uid=/g -e s/$/;%session%/g <smite.txt >>url.tmp
wget --spider --load-cookies=cookies.txt --save-cookies=cookies.txt -i url.tmp
