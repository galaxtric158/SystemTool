@echo off
title SystemTool =-= By: galaxtric158
chcp 65001 >nul
cd files
color 3
cls

:: Banner Display with Green to Dark Green Gradient
echo.
echo.
echo    [38;2;144;238;144m███████╗██╗   ██╗███████╗████████╗███████╗███╗   ███╗████████╗ ██████╗  ██████╗ ██╗      [0m     
echo    [38;2;124;204;124m██╔════╝╚██╗ ██╔╝██╔════╝╚══██╔══╝██╔════╝████╗ ████║╚══██╔══╝██╔═══██╗██╔═══██╗██║     [0m
echo    [38;2;104;170;104m███████╗ ╚████╔╝ ███████╗   ██║   █████╗  ██╔████╔██║   ██║   ██║   ██║██║   ██║██║       [0m 
echo    [38;2;84;136;84m╚════██║  ╚██╔╝  ╚════██║   ██║   ██╔══╝  ██║╚██╔╝██║   ██║   ██║   ██║██║   ██║██║     [0m
echo    [38;2;64;102;64m███████║   ██║   ███████║   ██║   ███████╗██║ ╚═╝ ██║   ██║   ╚██████╔╝╚██████╔╝███████╗[0m
echo    [38;2;44;68;44m╚══════╝   ╚═╝   ╚══════╝   ╚═╝   ╚══════╝╚═╝     ╚═╝   ╚═╝    ╚═════╝  ╚═════╝ ╚══════╝ v1.1[0m
echo    [38;2;44;68;44mmade with love by galaxtric158[0m
echo.
echo [38;2;200;200;200mSystemtool is a tool made by galaxtric158 to easily debug hardware, or look at hardware specifications.[0m
echo =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
echo.

:: Menu Loop
:MENU
echo 1. Display System Information
echo 2. Display Network Information
echo 3. Disk Cleanup
echo 4. Backup Files
echo 5. Exit
echo.
set /p option="Choose an option (1-5): "

:: Menu Actions
if "%option%"=="1" goto SYSTEMINFO
if "%option%"=="2" goto NETWORKINFO
if "%option%"=="3" goto DISKCLEANUP
if "%option%"=="4" goto BACKUPFILES
if "%option%"=="5" exit
goto MENU

:: Display System Information (including GPU and hardware parts)
:SYSTEMINFO
cls
echo ============================
echo   System Information
echo ============================
echo.

:: Display System Information
systeminfo

:: Display GPU Information (for Windows)
echo.
echo ============================
echo   GPU Information
echo ============================
wmic path win32_VideoController get caption, deviceid, driverversion

:: Display CPU Information
echo.
echo ============================
echo   CPU Information
echo ============================
wmic cpu get caption, deviceid, numberofcores, maxclockspeed

:: Display RAM Information
echo.
echo ============================
echo   RAM Information
echo ============================
wmic memorychip get capacity, speed, devicelocator

pause
goto MENU

:: Display Network Information
:NETWORKINFO
cls
echo ============================
echo   Network Information
echo ============================
ipconfig /all

:: Display Active Ports (using netstat)
echo.
echo ============================
echo   Active Network Ports
echo ============================
netstat -an

pause
goto MENU

:: Disk Cleanup
:DISKCLEANUP
cls
echo ============================
echo   Disk Cleanup
echo ============================
cleanmgr /sagerun:1
pause
goto MENU

:: Backup Files
:BACKUPFILES
cls
echo ============================
echo   Backup Files
echo ============================
set /p source="Enter the source directory (e.g., C:\Users\YourUsername\Documents): "
set /p destination="Enter the destination directory (e.g., D:\Backup): "
xcopy /s /e /h /y "%source%" "%destination%"
echo Backup completed. Refresh your destination file.
pause
goto MENU
