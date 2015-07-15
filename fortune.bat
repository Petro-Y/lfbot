@echo off
set cnt=0
for /F %%i in (%1) do set/a cnt=cnt + 1
set/a cnt=%random% %% %cnt% + 1
sed -n %cnt%p %1