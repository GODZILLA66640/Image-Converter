@echo off
title Image Converter

:Color Text
for /F "tokens=1,2 delims=#" %%a in ('"prompt #$H#$E# & echo on & for %%b in (1) do     rem"') do (
  set "DEL=%%a"
)

color 4

:start
call :colorEcho 0f "==============================="
echo.
ECHO 1.JPEG-PNG
ECHO 2.PNG-JPEG
call :colorEcho 0f "==============================="
echo.
CHOICE /C 12 /M "Choose A Conversion:"
cls

:Choice
IF ERRORLEVEL 2 GOTO PNG-JPEG
IF ERRORLEVEL 1 GOTO JPEG-PNG

:JPEG-PNG
if exist *.jpeg goto JPEG-PNG-True
if exist *.png goto wrong input
if not exist *.jpeg goto kill

:JPEG-PNG-True
rename *.jpeg *.png
goto end

:PNG-JPEG
if exist *.png goto PNG-JPEG-True
if exist *.jpeg goto wrong input
if not exist *.png goto kill

:PNG-JPEG-True
rename *.png *.jpeg
goto end

:end 
call :colorEcho 0f "========================================"
echo.
call :colorEcho 04 "ConvertList.txt Displays All Conversions"
echo.
call :colorEcho 0f "========================================"
echo.

dir /S > ConvertList.txt
timeout 15 >nul
exit

:kill 
echo No File Input
timeout 15 >nul
exit

:wrong input
echo Wrong File Input
timeout 3 >nul
cls
echo Please Select The Correct Input
echo.
goto start

:colorEcho
<nul set /p ".=%DEL%" > "%~2"
findstr /v /a:%1 /R "^$" "%~2" nul
del "%~2" > nul 2>&1i




