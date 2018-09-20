# Create disk image from folder
# -ov = overwrite
hdiutil create -volname "$1" -srcfolder "$1" -ov "$1".dmg
