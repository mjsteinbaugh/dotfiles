local=~/."$1"
cloud=~/iCloud/."$1"
if [[ -f "$cloud" ]] && [[ -f "$local" ]]; then
    echo "File exists in both places."
    echo "Deleting local copy..."
    rm "$local"
    echo "Adding symlink..."
    ln -s "$cloud" "$local"
elif [[ -f "$cloud" ]]; then
    echo "File is only saved on cloud."
    echo "Adding local symlink..."
    ln -s "$cloud" "$local"
elif [[ -f "$local" ]]; then
    echo "File only exists locally."
    echo "Moving to cloud..."
    mv "$local" "$cloud"
    echo "Adding symlink..."
    ln -s "$cloud" "$local"
else
    echo "File doesn't exist."
fi
