bits="$1"
rate="${2}k"

# -b, --bits
# -G, --guard
# -L, --endian little
# -r, --rate
# -S, --show-progress
# -v, --volume

# sox input.flac -G -b 16 output.flac rate -v -L 44100 dither
# dither only needed when downsampling to 16/44

for input in *.flac
do
    output="sox_${input}"
    sox "$input" -G -S -b "$bits" "$output" rate -v -L "$rate"
    # rm "$input"
done
