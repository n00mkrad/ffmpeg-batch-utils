# ffmpeg-batch-utils
Useful batch scripts for videos. Originally made as a toolbox for use with upscaling neural networks.

Most (if not all) scripts are made to be used with drag-n-drop (or by adding them to the "Send To" menu).

**Important:** These scripts do not come with FFMPEG. For them to work, you need to have ffmpeg in your PATH.  
Either copy ffmpeg.exe to a folder that's already in PATH (like system32) or manually add your ffmpeg installation to PATH - if it isn't already.

# Scripts
ExtractSingleFrameFromVideo: Extracts a single frame (identified by number) from a video.  
ExtractSingleFrameFromVideoHDR: Same as above, but attempts to color-correct frames from HDR movies.  
FramesToAPNG: Create animated PNG (APNG) from a folder of frames. Use a browser to view APNGs.  
FramesToVideo: Encode folder of frames to a h264 video.  
GetFPS: Read FPS from video. Experimental.  
Loop: Losslessly loop a video as many times as you like, in case your video player won't correctly do so.   
Speed: Change video speed losslessly (without re-encoding).  
SplitIntoFrames: Split a video into numbered frames.  
VideoToFrames: Same as above, but also reads framerate and stores it in a text file.  
