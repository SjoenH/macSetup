# Set dark mode
osascript -e 'tell application "Terminal" to set current settings of window 1 to settings set "pro"'
osascript -e 'tell app "System Events" to tell appearance preferences to set dark mode to true'
clear
echo ""
echo "\033[0;32m ██╗  ██╗ ██████╗ ██████╗ ███████╗██╗  ██╗ █████╗ ███╗   ███╗███████╗██████╗  █████╗ ████████╗███████╗███╗   ██╗   ███╗   ██╗ ██████╗  \033[0m"
echo "\033[0;32m ██║ ██╔╝██╔═══██╗██╔══██╗██╔════╝██║ ██╔╝██╔══██╗████╗ ████║██╔════╝██╔══██╗██╔══██╗╚══██╔══╝██╔════╝████╗  ██║   ████╗  ██║██╔═══██╗ \033[0m"
echo "\033[0;32m █████╔╝ ██║   ██║██║  ██║█████╗  █████╔╝ ███████║██╔████╔██║█████╗  ██████╔╝███████║   ██║   █████╗  ██╔██╗ ██║   ██╔██╗ ██║██║   ██║ \033[0m"
echo "\033[0;32m ██╔═██╗ ██║   ██║██║  ██║██╔══╝  ██╔═██╗ ██╔══██║██║╚██╔╝██║██╔══╝  ██╔══██╗██╔══██║   ██║   ██╔══╝  ██║╚██╗██║   ██║╚██╗██║██║   ██║ \033[0m"
echo "\033[0;32m ██║  ██╗╚██████╔╝██████╔╝███████╗██║  ██╗██║  ██║██║ ╚═╝ ██║███████╗██║  ██║██║  ██║   ██║   ███████╗██║ ╚████║██╗██║ ╚████║╚██████╔╝ \033[0m"
echo "\033[0;32m ╚═╝  ╚═╝ ╚═════╝ ╚═════╝ ╚══════╝╚═╝  ╚═╝╚═╝  ╚═╝╚═╝     ╚═╝╚══════╝╚═╝  ╚═╝╚═╝  ╚═╝   ╚═╝   ╚══════╝╚═╝  ╚═══╝╚═╝╚═╝  ╚═══╝ ╚═════╝  \033[0m"
echo ""
echo "\033[0;32m Welcome to my Mac-Setup-Script \033[0m"
echo "\033[0;32m Starting setup... \033[0m"
echo ""

if [ -e  ~/.ssh/id_rsa.pub ]
then
  echo "\033[0;32m Public key was found! \033[0m"
else
  echo "\033[0;32m Public key was not found. \033[0m"
  echo "\033[0;32m Creating an SSH key for you...\033[0m"
  ssh-keygen -t rsa
fi

pbcopy < ~/.ssh/id_rsa.pub
echo "\033[0;32m Your ssh-key has been copied to your clipboard.\033[0m"
echo "\033[0;32m Please add this public key to GitHub/GitLab \033[0m"
echo "\t\033[0;32m - https://github.com/account/ssh \033[0m"
echo "\t\033[0;32m - https://gitlab.com/profile/keys \033[0m"
# read -p "Press [Enter] key after this..."

echo "\n\033[0;32m Installing xcode-stuff \033[0m"
xcode-select --install

# Check for Homebrew,
# Install if we don't have it
if test ! $(which brew); then
  echo "\n\033[0;32m Installing homebrew...\033[0m"
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Update homebrew recipes
echo "\n\033[0;32m Updating homebrew...\033[0m"
brew update

echo "\n\033[0;32m Installing Git... \033[0m"
brew install git

echo "\n\033[0;32m Git config \033[0m"

git config --global user.name "Henry Sjøen"
git config --global user.email henry@kodekameraten.no

echo "\n\033[0;32m Installing brew git utilities...\033[0m"
brew install git-flow-avh

echo "\n\033[0;32m Installing other brew stuff...\033[0m"
brew install tree
brew install wget
brew install mackup
brew install node
brew install watchman
brew install cowsay
brew install lolcat

cowsay -f stegosaurus Prepare for awesomeness! | lolcat;

# echo "\n\033[0;32m Installing Maid\033[0m"
# brew install rbenv
# rbenv install 2.6.2
# rbenv init
# rbenv shell 2.6.2
# gem install maid

npm install -g react-native-cli

echo "\n\033[0;32m Installing Fira-Code font...\033[0m"
brew tap caskroom/fonts
brew cask install font-fira-code

echo "\n\033[0;32m Cleaning up brew\033[0m"
brew cleanup

echo "\n\033[0;32m Installing homebrew cask\033[0m"
brew install caskroom/cask/brew-cask

# TODO: Make some dotfile-config
# echo "\n\033[0;32m Copying dotfiles from Github"
# cd ~
# git clone git@github.com:sjoenH/dotfiles.git .dotfiles
# cd .dotfiles
# rake
# cd ~

# echo "\n\033[0;32m Grunting it up"
# npm install -g grunt-cli

#Install Zsh & Oh My Zsh
echo "\n\033[0;32m Installing Oh My ZSH...\033[0m"
curl -L http://install.ohmyz.sh | sh

# echo "\n\033[0;32m Setting up Oh My Zsh theme..."
# cd  /Users/bradparbs/.oh-my-zsh/themes
# curl https://gist.githubusercontent.com/bradp/a52fffd9cad1cd51edb7/raw/cb46de8e4c77beb7fad38c81dbddf531d9875c78/brad-muse.zsh-theme > brad-muse.zsh-theme

echo "\n\033[0;32m Setting up Zsh plugins...\033[0m"
cd ~/.oh-my-zsh/custom/plugins
git clone git://github.com/zsh-users/zsh-syntax-highlighting.git

echo "\n\033[0;32m Setting ZSH as shell...\033[0m"
chsh -s /bin/zsh

# Apps
apps=(
  alfred
  amethyst
  android-studio
  appcleaner
  brave-browser
  docker
  firefox
  google-chrome
  iina
  istat-menus
  iterm2
  licecap
  qlmarkdown
  qlstephen
  spectacle
  spotify
  sublime-text
  suspicious-package
  transmission
  visual-studio-code
  webstorm
)

cowsay -f dragon-and-cow We are now installing a lot of apps... Hang tight! | lolcat;

# Install apps to /Applications
# Default is: /Users/$user/Applications
echo "\n\033[0;32m installing apps with Cask... \033[0m"
brew cask install --appdir="/Applications" ${apps[@]}

brew cask alfred link

brew cask cleanup
brew cleanup

cowsay -f bud-frogs Finished installing apps! | lolcat;

# echo "\n\033[0;32m Please setup and sync Dropbox, and then run this script again."
# read -p "Press [Enter] key after this..."

echo "\n\033[0;32m Restoring setup from Mackup... \033[0m"
if  [ -e ~/.mackup.cfg ]
then
  cowsay You already have an config-for mackup on this computer. | lolcat;
else
  echo "[storage]\n\tengine = icloud" > ~/.mackup.cfg;
fi
echo "\n\033[0;32m You can find your mackup config here ~/.mackup.cfg \033[0m";

cat ~/.mackup.cfg |lolcat
mackup restore

echo "\n\033[0;32m Setting some Mac settings... \033[0m"

#"Disabling system-wide resume"
# defaults write NSGlobalDomain NSQuitAlwaysKeepsWindows -bool false

#"Disabling automatic termination of inactive apps"
# defaults write NSGlobalDomain NSDisableAutomaticTermination -bool true

#"Allow text selection in Quick Look"
defaults write com.apple.finder QLEnableTextSelection -bool TRUE

#"Disabling OS X Gate Keeper"
#"(You'll be able to install any app you want from here on, not just Mac App Store apps)"
sudo spctl --master-disable
sudo defaults write /var/db/SystemPolicy-prefs.plist enabled -string no
defaults write com.apple.LaunchServices LSQuarantine -bool false

#"Expanding the save panel by default"
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint -bool true
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint2 -bool true

#"Automatically quit printer app once the print jobs complete"
defaults write com.apple.print.PrintingPrefs "Quit When Finished" -bool true

#"Saving to disk (not to iCloud) by default"
defaults write NSGlobalDomain NSDocumentSaveNewDocumentsToCloud -bool false

#"Check for software updates daily, not just once per week"
defaults write com.apple.SoftwareUpdate ScheduleFrequency -int 1

#"Disable smart quotes and smart dashes as they are annoying when typing code"
defaults write NSGlobalDomain NSAutomaticQuoteSubstitutionEnabled -bool false
defaults write NSGlobalDomain NSAutomaticDashSubstitutionEnabled -bool false

#"Enabling full keyboard access for all controls (e.g. enable Tab in modal dialogs)"
defaults write NSGlobalDomain AppleKeyboardUIMode -int 3

#"Disabling press-and-hold for keys in favor of a key repeat"
defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false

#"Setting trackpad & mouse speed to a reasonable number"
# defaults write -g com.apple.trackpad.scaling 2
# defaults write -g com.apple.mouse.scaling 2.5

#"Enabling subpixel font rendering on non-Apple LCDs"
defaults write NSGlobalDomain AppleFontSmoothing -int 2

#"Showing icons for hard drives, servers, and removable media on the desktop"
defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool true

#"Showing all filename extensions in Finder by default"
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

#"Disabling the warning when changing a file extension"
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false

#"Use column view in all Finder windows by default"
defaults write com.apple.finder FXPreferredViewStyle Clmv

#"Avoiding the creation of .DS_Store files on network volumes"
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true

#"Enabling snap-to-grid for icons on the desktop and in other icon views"
/usr/libexec/PlistBuddy -c "Set :DesktopViewSettings:IconViewSettings:arrangeBy grid" ~/Library/Preferences/com.apple.finder.plist
/usr/libexec/PlistBuddy -c "Set :FK_StandardViewSettings:IconViewSettings:arrangeBy grid" ~/Library/Preferences/com.apple.finder.plist
/usr/libexec/PlistBuddy -c "Set :StandardViewSettings:IconViewSettings:arrangeBy grid" ~/Library/Preferences/com.apple.finder.plist

#"Setting the icon size of Dock items to 36 pixels for optimal size/screen-realestate"
# defaults write com.apple.dock tilesize -int 36

# putting the dock up on the left side of the screen
defaults write com.apple.Dock orientation -string left

#"Speeding up Mission Control animations and grouping windows by application"
defaults write com.apple.dock expose-animation-duration -float 0.1
defaults write com.apple.dock "expose-group-by-app" -bool true

#"Setting Dock to auto-hide and removing the auto-hiding delay"
defaults write com.apple.dock autohide -bool true
defaults write com.apple.dock autohide-delay -float 0
defaults write com.apple.dock autohide-time-modifier -float 0

#"Setting email addresses to copy as 'foo@example.com' instead of 'Foo Bar <foo@example.com>' in Mail.app"
defaults write com.apple.mail AddressesIncludeNameOnPasteboard -bool false

#"Enabling UTF-8 ONLY in Terminal.app and setting the Pro theme by default"
defaults write com.apple.terminal StringEncodings -array 4
defaults write com.apple.Terminal "Default Window Settings" -string "Pro"
defaults write com.apple.Terminal "Startup Window Settings" -string "Pro"

#"Preventing Time Machine from prompting to use new hard drives as backup volume"
defaults write com.apple.TimeMachine DoNotOfferNewDisksForBackup -bool true

#"Disable the sudden motion sensor as its not useful for SSDs"
# sudo pmset -a sms 0

#"Speeding up wake from sleep to 24 hours from an hour"
# http://www.cultofmac.com/221392/quick-hack-speeds-up-retina-macbooks-wake-from-sleep-os-x-tips/
sudo pmset -a standbydelay 86400

#"Disable annoying backswipe in Chrome"
# defaults write com.google.Chrome AppleEnableSwipeNavigateWithScrolls -bool false

#"Setting screenshots location to ~/Desktop"
defaults write com.apple.screencapture location -string "$HOME/Desktop"

#"Setting screenshot format to PNG"
defaults write com.apple.screencapture type -string "png"

#"Hiding Safari's bookmarks bar by default"
defaults write com.apple.Safari ShowFavoritesBar -bool false

#"Hiding Safari's sidebar in Top Sites"
defaults write com.apple.Safari ShowSidebarInTopSites -bool false

#"Disabling Safari's thumbnail cache for History and Top Sites"
defaults write com.apple.Safari DebugSnapshotsUpdatePolicy -int 2

#"Enabling Safari's debug menu"
defaults write com.apple.Safari IncludeInternalDebugMenu -bool true

#"Making Safari's search banners default to Contains instead of Starts With"
defaults write com.apple.Safari FindOnPageMatchesWordStartsOnly -bool false

#"Removing useless icons from Safari's bookmarks bar"
defaults write com.apple.Safari ProxiesInBookmarksBar "()"

#"Allow hitting the Backspace key to go to the previous page in history"
defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2BackspaceKeyNavigationEnabled -bool true

#"Enabling the Develop menu and the Web Inspector in Safari"
defaults write com.apple.Safari IncludeDevelopMenu -bool true
defaults write com.apple.Safari WebKitDeveloperExtrasEnabledPreferenceKey -bool true
defaults write com.apple.Safari "com.apple.Safari.ContentPageGroupIdentifier.WebKit2DeveloperExtrasEnabled" -bool true

#"Adding a context menu item for showing the Web Inspector in web views"
defaults write NSGlobalDomain WebKitDeveloperExtras -bool true

#"Use `~/Downloads/Incomplete` to store incomplete downloads"
defaults write org.m0k.transmission UseIncompleteDownloadFolder -bool true
defaults write org.m0k.transmission IncompleteDownloadFolder -string "${HOME}/Downloads/Incomplete"

#"Don't prompt for confirmation before downloading"
defaults write org.m0k.transmission DownloadAsk -bool false

#"Trash original torrent files"
defaults write org.m0k.transmission DeleteOriginalTorrent -bool true

#"Hide the donate message"
defaults write org.m0k.transmission WarningDonate -bool false

#"Hide the legal disclaimer"
defaults write org.m0k.transmission WarningLegal -bool false

#"Disable 'natural' (Lion-style) scrolling"
# defaults write NSGlobalDomain com.apple.swipescrolldirection -bool false

# Don’t automatically rearrange Spaces based on most recent use
defaults write com.apple.dock mru-spaces -bool false

#Setting Dvorak as the keyboard layout
cd ~/Downloads
git clone https://github.com/myshov/xkbswitch-macosx.git xkbswitch-macosx
cp xkbswitch-macosx/bin/xkbswitch /usr/local/bin
#Todo: Might need to add it to zsh-path as well...?
./xkbswitch-macosx/bin/xkbswitch -se Dvorak
#Cleonup
rm -rf ~/Downloads/xkbswitch-macosx

killall Finder

echo "\n\033[0;32m All done! \033[0m"

echo "\033[0;32m         ▄▄▄███                     \033[0m"
echo "\033[0;32m    ▄▄██████████                    \033[0m"
echo "\033[0;32m  ███████████████                   \033[0m"
echo "\033[0;32m  ▀███████████████     ▄▄▄          \033[0m"
echo "\033[0;32m    ███████████████▄███▀▀▀          \033[0m"
echo "\033[0;32m     ███████████████▄▄              \033[0m"
echo "\033[0;32m     ▄████████▀▀▄▄▄▄▄ ▀             \033[0m"
echo "\033[0;32m ▄███████▀█▄▀█▄  █ ▀▀▀ █  ▄▄        \033[0m"
echo "\033[0;32m ▀▀   ██▄█▄  ▀█  ▄███████▄█▀   ▄    \033[0m"
echo "\033[0;32m      █ █▀▄▄▀▄▀ █▀▀▀█▀▄▄▀      ▄ ▄█ \033[0m"
echo "\033[0;32m      █ █  ▀▀▄▄█▀ █▀▀  █       ▀██  \033[0m"
echo "\033[0;32m      ▀█▄             ▄▀      ▄██   \033[0m"
echo "\033[0;32m       ▀█▄▄        ▄▄█      ▄▀  █   \033[0m"
echo "\033[0;32m          ▀███▀▀████▄██▄▄  ▄▀       \033[0m"
echo "\033[0;32m            █▄▀██▀██▀▄█▄ ▀▀         \033[0m"
echo "\033[0;32m            ██ ▀█▄█ █▀ ▀▄           \033[0m"
echo "\033[0;32m           █ █▄  ▀█▄▄▄  █           \033[0m"
echo "\033[0;32m           █▀██▀▀▀▀ █▄              \033[0m"
echo "\033[0;32m           ▀           ▀            \033[0m"