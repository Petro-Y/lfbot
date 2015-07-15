@echo off
set initpage=%*
set action=http://lingvoforum.net/index.php?action=post2
wget --load-cookies=cookies.txt --save-cookies=cookies.txt -O lf.html %initpage%

((sed -n "/<form.*post2/,/<\/form/p" lf.html|^^^
sed "/<script/,/<\/script/d"|grep name|grep input|^^^
sed -n "s/.*name=.\([^\"\"]*\).*value=.\([^\"\"]*\).*$/\1=\2/p"|grep -v "^preview"
echo message=|tr -d \n\r\040)|^^^
sed -e "s/%%/%%25/g" -e "s/\&/%%26/g"|tr \n "&"|tr -d \r
cat|sed -e "s/%%/%%25/g" -e "s/\&/%%26/g" -e "s/+/%%2B/g")|cat>pdata.txt
wget --load-cookies=cookies.txt --save-cookies=cookies.txt --post-file pdata.txt %action% -O lf.html
