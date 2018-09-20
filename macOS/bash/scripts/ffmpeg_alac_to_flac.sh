mkdir -p ~/ffmpeg
for file in *.m4a; do
    ffmpeg -i "$file" -acodec flac ~/ffmpeg/"${file%.*}".flac
done
