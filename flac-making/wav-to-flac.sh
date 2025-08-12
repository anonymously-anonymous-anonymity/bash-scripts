input_folder
output_folder
ffmpeg_upgrade
clear


echo "This program requires FFmpeg to function and thus may require sudo permissions" 
echo "Press enter to continue or abort terminal now"
echo ""

if command -v ffmpeg &> /dev/null; then
    echo "ffmpeg is installed, press enter to continue"
    read
else
    echo "ffmpeg is not installed, press enter to install or feel free to abort"
    read
    sudo apt update
    sudo apt install ffmpeg
fi


read -p "Input folder? >" input_folder
read -p "Output folder? >" output_folder

for file in "$input_folder/"*.wav; do ffmpeg -i "$file" "$output_folder/$(basename "${file%.*}.flac")"; done
