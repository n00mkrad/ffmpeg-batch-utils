@echo off
:next
if "%~1" == "" goto done
cd /D %~dp1

echo ===========================
echo ===== FRAMES TO VIDEO =====
echo ===========================
echo.

set "crf=16"
echo Set h264 Video Quality (16 = Very High, 20 = High, 24 = Medium, 28 = Low)
set /p crf="Enter a value or press return to use default (16): "
echo. && echo.

set "fps=25"
echo Set target framerate. Will be ignored if "framerate.txt" exists in the input folder!
set /p fps="Enter a value or press return to use default (25): "
echo. && echo.

set "pfx="
echo Set image filename prefix ("img" for "img0001", ...).
set /p pfx="Enter a value or press return to use no prefix: "
echo. && echo.

set "nums=4"
echo Set image filename number length (2 for "img01"-"img99", 4 for "img0001" - "img9999", 15 for DAIN frames).
set /p nums="Enter a value or press return to use default (4): "
echo. && echo.

set "ext=png"
echo Set file extension of frames.
set /p ext="Enter a value or press return to use default (png): "
echo. && echo.

echo %cd%

cd "%~1"

if exist framerate.txt (
	GOTO FILEFPS
) else (
	GOTO ENCODE
)

:FILEFPS
set /p fps=<framerate.txt
echo Target FPS has been overwritten to %fps% by framerate.txt.

:ENCODE

color 0a
echo Encoding...

cd ..

ffmpeg -framerate %fps% -i "%~1\%pfx%%%0%nums%d.%ext%" -c:v libx264 -crf %crf% -c:a copy -stats "%~1.mp4"

pause

shift
goto next
:done
exit