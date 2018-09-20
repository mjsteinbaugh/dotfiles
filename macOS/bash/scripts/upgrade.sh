# Require admin account.
if [[ "$(whoami)" != "admin" ]]; then
    echo "This script must be run as admin"
    return 1
fi

# Homebrew
brew update
brew upgrade
brew cask outdated | xargs brew cask reinstall

# Mac App Store
mas upgrade
