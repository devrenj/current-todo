title CurrentTODO
:: Instructions
:: Open Notepad (win + r > notepad)
:: Copy this entire content and paste it into Notepad
:: Save with the .bat extension

@echo off
:: ! IMPORTANT TO SET YOUR FILE PATH RIGHT HERE !
set "file=C:\Dev\ENcurrentTODO.txt"
title CurrentTODO [%file%]

:menu
cls
if exist "%file%" (
    powershell -command "Get-Content '%file%' -Encoding UTF8 | Out-Host"
) else (
    powershell -command "Write-Output 'File not found.'"
    powershell -command "Write-Output 'Edit this file and correctly set the source path.'"
    pause
)

echo.
powershell -command "Write-Output '[1] Edit | [2] Copy | [3] Exit'"

:input
choice /c 123 /n >nul

if errorlevel 3 goto exit
if errorlevel 2 goto copy
if errorlevel 1 goto edit

:exit
echo.
powershell -command "Write-Output 'You got a friend on me...'"
timeout /t 1 /nobreak >nul
exit

:edit
notepad "%file%"
goto menu

:copy
if exist "%file%" (
    powershell -command "Get-Content '%file%' -Encoding UTF8 | Set-Clipboard"
    powershell -command "Write-Output 'Copied!'"
) else (
    powershell -command "Write-Output 'File not found.'"
    pause
)
timeout /t 1 /nobreak >nul
exit
