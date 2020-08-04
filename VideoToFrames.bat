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

rem  Get FPS and store in text file
%~dp0ffprobe -v error -select_streams v:0 -show_entries stream=r_frame_rate -of default=noprint_wrappers=1:nokey=1 "%~1" > temp.txt
set /p framerate=<temp.txt
del temp.txt
echo frame rate: %framerate%
set /a fpsnum=%framerate%
echo fpsnum: %fpsnum%
(echo %fpsnum%)>%~n1/framerate.txt
echo Video framerate is %fpsnum%. Saved to file "framerate.txt" in output folder.
echo.

rem  Extract frames
ffmpeg -i "%~1" -loglevel quiet -stats %~n1/%%04d.png

If /I "%delSrc%"=="y" del "%~1"

shift
goto next
:done

pause

exit