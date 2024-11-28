title CurrentTODO
:: Instruções
:: Abra o Bloco de Notas (WIN + R > notepad)
:: Copie este conteúdo inteiro e cole no Bloco de Notas
:: Salve com a extensão .bat

@echo off
:: ! IMPORTANTE MUDAR AQUI O CAMINHO PARA O ARQUIVO A SER ABERTO !
set "file=C:\Dev\BRcurrentTODO.txt"
title CurrentTODO [%file%]

:menu
cls
if exist "%file%" (
    powershell -command "Get-Content '%file%' -Encoding UTF8 | Out-Host"
) else (
    powershell -command "Write-Output 'Arquivo inexistente.'"
    powershell -command "Write-Output 'Edite este arquivo e aponte o caminho corretamente.'"
    pause
)

echo.
powershell -command "Write-Output '[1] Editar | [2] Copiar | [3] Sair'"

:input
choice /c 123 /n >nul

if errorlevel 3 goto sair
if errorlevel 2 goto copiar
if errorlevel 1 goto editar

:sair
echo.
powershell -command "Write-Output 'Amigo estou aqui...'"
timeout /t 1 /nobreak >nul
exit

:editar
notepad "%file%"
goto menu

:copiar
if exist "%file%" (
    powershell -command "Get-Content '%file%' -Encoding UTF8 | Set-Clipboard"
    powershell -command "Write-Output 'Copiado!'"
) else (
    powershell -command "Write-Output 'Arquivo inexistente.'"
    pause
)
timeout /t 1 /nobreak >nul
exit
