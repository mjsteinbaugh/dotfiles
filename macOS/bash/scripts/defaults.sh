# Unhide the user library
chflags nohidden ~/Library

# Speed up user interface animations
# http://robservatory.com/speed-up-your-mac-via-hidden-prefs/
defaults write com.apple.dock autohide-delay -float 0
defaults write com.apple.dock autohide-time-modifier -int 0
defaults write com.apple.finder DisableAllAnimations -bool true
defaults write NSGlobalDomain NSWindowResizeTime .001
killall Dock
killall Finder

# Don't write `.DS_Store` files to network storage
defaults write com.apple.desktopservices DSDontWriteNetworkStores true

# Save screenshots into Documents, instead of Desktop
screenshots_dir="${HOME}/Documents/Screenshots"
mkdir -p "$screenshots_dir"
defaults write com.apple.screencapture disable-shadow -bool true
defaults write com.apple.screencapture location "$screenshots_dir"
defaults write com.apple.screencapture name Screenshot
killall SystemUIServer

# Disable podcasts in iTunes
defaults write com.apple.itunes disablePodcasts -bool YES