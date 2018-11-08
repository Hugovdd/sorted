#!/bin/bash

#Directory to look in
Directory="$HOME/Desktop/+/test" 

# File extensions
videoEXT="(.mov|.3gp|.mp4)"
imageEXT="(.jpg|.png|.tiff|.gif)" 
audioEXT="(.mp3|.wav)"

vectorEXT="(.svg|.ai|.eps)"
psdEXT="(.psd|.psb)"

#regEx
RegExFilter="([a-zA-Z0-9!-?\u0020-\uE007F\#\s_\\.\-\(\):])"

cd $Directory

# Make directories
mkdir 01_PremierePro
mkdir 02_Video
mkdir 03_Audio
mkdir 04_Images
cd 04_Images
mkdir 01_Vector
mkdir 02_PSD
cd ..


# Look for file and move to appropriate folder
for file in *
do
    # echo ""$file""
    # VIDEO
    if [[ "$file" =~ $RegExFilter+$videoEXT$ ]]; then
    mv "$file" 02_Video
    #IMAGES
    elif [[ "$file" =~ $RegExFilter+$imageEXT$ ]]; then
    mv "$file" 04_Images
    #VECTORS
    elif [[ "$file" =~ $RegExFilter+$vectorEXT$ ]]; then
    mv "$file" 04_Images/01_Vector
    #PSDs
    elif [[ "$file" =~ $RegExFilter+$psdEXT$ ]]; then
    mv "$file" 04_Images/02_PSD
    #AUDIO
    elif [[ "$file" =~ $RegExFilter+$audioEXT$ ]]; then
    mv "$file" 03_Audio
    #PremierePro
    elif [[ "$file" =~ $RegExFilter+(.prproj)$ ]]; then
    mv "$file" 01_PremierePro
    elif [[ "$file" == "Adobe Premiere Pro Audio Previews" ]]; then
    mv "$file" 01_PremierePro
    elif [[ "$file" == "Adobe Premiere Pro Video Previews" ]]; then
    mv "$file" 01_PremierePro
    fi
done