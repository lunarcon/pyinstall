@echo off
cd C:\Program Files (x86)\Microsoft Visual Studio\Shared\Python37_64
echo Welcome to Aditya Vikram's Python Module Installer
echo ==================================================
echo is pip installed? (y/n)
set /p ynq=
if %ynq%==y (
echo alright.
)
if %ynq%==n (
echo ok. downloading setup...
bitsadmin /transfer PIP /download /priority normal https://bootstrap.pypa.io/get-pip.py %~dp0pipsetup.py
echo downloaded. trying to install...
%~dp0pipsetup.py
)
echo enter module or library name 
set /p fnm= 
python -m pip install %fnm%
pause