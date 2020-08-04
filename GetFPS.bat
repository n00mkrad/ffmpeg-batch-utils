@echo off


%~dp0ffprobe -v error -select_streams v:0 -show_entries stream=r_frame_rate -of default=noprint_wrappers=1:nokey=1 "%~1" > temp.txt
set /p framerate=<temp.txt
del temp.txt
set /a fpsnum=%framerate%

echo Framerate:
echo %framerate%

echo Numeric:
echo %fpsnum%

pause