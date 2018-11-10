# https://stackoverflow.com/questions/19860345/how-to-check-if-a-symlink-target-matches-a-specific-path

parent_dir="${HOME}/Documents/Bucket"
today=$(date +%Y-%m-%d)
today_dir="$HOME/Today"

if [[ -z `readlink $today_dir | grep $today` ]]; then
    echo $TODAY
    bucket_today=$(date +%Y)/$(date +%m)/$(date +%Y-%m-%d)
    mkdir -p "$parent_dir"/"$bucket_today/"
    ln -sfn "$parent_dir"/"$bucket_today" "$today_dir"
fi

unset -v parent_dir today today_dir
