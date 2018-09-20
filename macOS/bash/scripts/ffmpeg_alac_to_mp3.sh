# https://ffmpeg.org/ffmpeg.html
# ffmpeg '-y' flag overwrites output without asking

for input in "$@"; do
    IFS="/" read -r -a array <<< "$input"
    album_artist="${array[@]: -3: 1}"
    album="${array[@]: -2: 1}"
    base=$(basename "$input")
    dir="${HOME}/Music/Transcodes/${album_artist}/${album}"
    mkdir -p "$dir"
    output="$dir"/"${base%.*}".mp3
    if [[ ! -f "$output" ]]; then
        echo "$input"
        echo "$output"
        /usr/local/bin/ffmpeg -y -i "$input" -codec:a libmp3lame -qscale:a 2 "$output"
    fi
done
