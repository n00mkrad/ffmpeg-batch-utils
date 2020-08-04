@echo off
:next
if "%~1" == "" goto done
cd /D %~dp1

echo ================================
echo ===== EXTRACT SINGLE FRAME =====
echo ================================
echo.

set "frNum=n"
echo Set frame number (starts at 0)
set /p frNum="Enter a value (integer) or press return to use default (0 - first frame): "

echo. && echo.

color 0a
echo Extracting frame...

rem mkdir %~n1

rem   Extract frame
rem ffmpeg -i "%~1" -loglevel quiet -stats %~n1/%%04d.png
rem ffmpeg -i "%~1" -vf "select=eq(n\,%frNum%)" -vframes 1 "%~n1"-frame%frNum%.png
ffmpeg -i "%~1" -vf select=gte(n\,%frNum%),zscale=t=linear:npl=100,format=gbrpf32le,zscale=p=bt709,tonemap=tonemap=hable:desat=0,zscale=t=bt709:m=bt709:r=tv,format=yuv420p -vframes 1 "%~n1"-frame%frNum%.png

rem If /I "%delSrc%"=="y" del "%~1"

shift
goto next
:done

pause

exit