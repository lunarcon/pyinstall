@echo off
echo Welcome to pyinstall by Aditya V
echo ================================
echo if it does not work, try placing this script in the same folder as your python installation
where python.exe > temp.txt
set /p dta=<temp.txt
set /a "LastNum+=1"
del %~dp0temp.txt
echo.
echo found python installation at '%dta%'
echo.
set dta=%dta:\python.exe=%
chdir %dta%
echo is pip installed? (y/n)
set /p ynq=
if %ynq%==y (
echo ok.
)
if %ynq%==n (
echo ok. downloading setup...
bitsadmin /transfer PIP /download /priority high https://bootstrap.pypa.io/get-pip.py %~dp0pipsetup.py
echo downloaded. trying to install...
echo if it does not work, try placing this script in the same folder as your python installation
%~dp0pipsetup.py
echo cleaning up...
del %~dp0pipsetup.py
)
:start
echo enter module or library name 
set /p fnm= 
python -m pip install %fnm%
echo install another module/library? (y/n)
set /p xnq=
if %xnq%==y (
goto start
)
pause
