@echo off
:next
if "%~1" == "" goto done
cd /D %~dp1

echo ===========================
echo ===== SET VIDEO SPEED =====
echo =========================== && echo.

set "scale=0.5"
echo Enter speed scale. Reference:
echo. && echo Slow down:
echo  4    = 0.25x Speed
echo  2    = 0.5x Speed
echo  1.33 = 0.75x Speed
echo. && echo Speed up:
echo  0.8  = 1.25x Speed
echo  0.66 = 1.5x Speed
echo  0.5  = 2x Speed
echo  0.33 = 3x Speed
echo  0.25 = 4x Speed
echo.
set /p scale="Enter a value or press return to use default (0.5 = 2x Speed): "
echo. && echo.

set "delSrc=n"
echo Delete input file after creating speed-changed version?
set /p delSrc="Enter a value (y/n) or press return to use default (n): "
echo. && echo.

color 0a
echo Encoding...

ffmpeg -itsscale %scale% -i "%~1" -c copy -loglevel quiet -stats "%~n1.speed%scale%.mp4"

If /I "%delSrc%"=="y" del "%~1"

shift
goto next
:done
rem pause
exit