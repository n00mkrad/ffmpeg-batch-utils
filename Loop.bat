@echo off
:next
if "%~1" == "" goto done
cd /D %~dp1

echo ======================
echo ===== LOOP VIDEO =====
echo ====================== && echo.

set "loops=4"
echo Loop how many times?
set /p loops="Enter a value or press return to use default (4): "
echo. && echo.

set "crf=0"
echo Enter h264 quality factor if you want to recode the output video.
echo H264 CRF value reference: 16 = Very High, 20 = High, 24 = Medium, 28 = Low
set /p crf="Enter a quality value or press return to copy video without recoding: "
echo. && echo.

set "delSrc=n"
echo Delete input file after creating looped version?
set /p delSrc="Enter a value (y/n) or press return to use default (n): "
echo. && echo.

color 0a

If "%crf%"=="0" (
echo Copying video stream...
ffmpeg -stream_loop %loops% -i "%~1" -c copy -loglevel quiet -stats "%~n1.%loops%xLoop.mp4"
)
If NOT "%crf%"=="0" (
echo Encoding...
echo This can take a while depending of the size of the video.
ffmpeg -stream_loop %loops% -i "%~1" -c:v libx264 -crf %crf% -c:a copy -loglevel quiet -stats "%~n1.%loops%xLoop.mp4"
)

If /I "%delSrc%"=="y" del "%~1"

shift
goto next
:done
exit