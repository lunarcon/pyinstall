@echo off
where python.pdb > temp.txt
set /p dta=<temp.txt
set dta=%dta:\python.pdb=%
cd %dta%
echo Welcome to Aditya Vikram's Python Module Installer
echo ==================================================
echo is pip installed? (y/n)
set /p ynq=
if %ynq%==y (
echo ok.
)
if %ynq%==n (
echo ok. downloading setup...
bitsadmin /transfer PIP /download /priority normal https://bootstrap.pypa.io/get-pip.py %~dp0pipsetup.py
echo downloaded. trying to install...
%~dp0pipsetup.py
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