@echo off
echo Welcome to pyinstall by at-adityavikram
echo =======================================
echo.
echo if it does not work, try placing this script in the same directory as your python installation.
echo also make sure that mentioned directory is not read^-only and that this user has ownership of it.
where python.exe > temp.txt
set /p dta=<temp.txt
set /a "LastNum+=1"
del %~dp0temp.txt
echo.
echo found python installation at '%dta%'
echo.
set dta=%dta:\python.exe=%
chdir %dta%
set /p ynq= is pip installed^?^ ^(y^\n^)^> 
echo.
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
echo.  
set /p fnm= enter module or library name^> 
python -m pip install %fnm%
echo install another module/library? (y/n)
set /p xnq=
if %xnq%==y (
goto start
)
pause
