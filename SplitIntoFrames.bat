@echo off
:next
if "%~1" == "" goto done
cd /D %~dp1

echo =============================
echo ===== SPLIT INTO FRAMES =====
echo =============================
echo.

set "delSrc=n"
echo Delete input file after extracting frames?
set /p delSrc="Enter a value (y/n) or press return to use default (n): "

echo. && echo.

color 0a
echo Extracting frames...

mkdir %~n1
ffmpeg -i "%~1" -loglevel quiet -stats %~n1/%%04d.png

If /I "%delSrc%"=="y" del "%~1"

shift
goto next
:done
exit