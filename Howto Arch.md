
# =============================================================================
                             # Install Packages #
# =============================================================================

$ sudo vim /etc/pacman.conf
# -----------------------------------------------------------------------------
Color

[multilib]
Include = /etc/pacman.d/mirrorlist
# -----------------------------------------------------------------------------

$ sudo pacman -Syu

# Packages
$ sudo pacman -S alacritty neofetch exa htop lm_sensors latte-dock virtualbox gimp inkscape kdenlive audacity youtube-dl ffmpeg vlc elisa obs-studio mono transmission-qt
$ sudo pacman -S ark conky extra-cmake-modules gparted icoutils kate kcalc kdialog okular spectacle unrar zip wget

# Antivirus
$ sudo pacman -S clamav
$ sudo freshclam
$ sudo systemctl enable clamav-freshclam.service
$ sudo systemctl enable clamav-demon.service
$ sudo pacman -S clamtk

# Firewall
$ sudo pacman -S firewalld
$ systemctl enable firewalld
$ firewall-config

# Kodi
$ sudo pacman -S kodi kodi-x11
$ $ yay -S kodi-addon-pvr-iptvsimple

# AUR packages
$ git clone https://aur.archlinux.org/yay.git
$ cd yay
$ makepkg -si PKGBUILD
$ yay -S ttf-ms-fonts
$ yay -S discord
$ yay -S dropbox
$ yay -S picard
$ yay -S skype
$ yay -S spotify
$ yay -S timeshift
$ yay -S tiny-media-manager
$ yay -S vivaldi

# Flatpaks
$ sudo pacman -S flatpak

# Clean Packages
$ sudo pacman -Rns $(pacman -Qtdq)


# Games +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

# Drivers & Packages
$ sudo pacman -S pulseaudio pulseaudio-alsa lib32-mesa vulkan-radeon lib32-vulkan-radeon vulkan-icd-loader lib32-vulkan-icd-loader vulkan-tools
$ sudo pacman -S giflib lib32-giflib libpng lib32-libpng libldap lib32-libldap gnutls lib32-gnutls mpg123 lib32-mpg123 openal lib32-openal v4l-utils lib32-v4l-utils libpulse lib32-libpulse libgpg-error lib32-libgpg-error alsa-plugins lib32-alsa-plugins alsa-lib lib32-alsa-lib libjpeg-turbo lib32-libjpeg-turbo sqlite lib32-sqlite libxcomposite lib32-libxcomposite libxinerama lib32-libgcrypt libgcrypt lib32-libxinerama ncurses lib32-ncurses opencl-icd-loader lib32-opencl-icd-loader libxslt lib32-libxslt libva lib32-libva gtk3 lib32-gtk3 gst-plugins-base-libs lib32-gst-plugins-base-libs

# Enable Vulkan for R9 200/300 Series
$ echo "blacklist radeon" | sudo tee --append /etc/modprobe.d/blacklist.conf
$ echo "options amdgpu si_support=1 cik_support=1" | sudo tee --append /etc/modprobe.d/amdgpu.conf
$ sudo update-initramfs -u

# ACO "AMD Compiler"
$ vim ~/.profile
# -----------------------------------------------------------------------------
export RADV_PERFTEST=aco
# -----------------------------------------------------------------------------

# Gamemode
$ git clone https://github.com/FeralInteractive/gamemode.git
$ cd gamemode
$ git checkout 1.5.1 # omit to build the master branch
$ sudo pacman -S meson systemd git dbus
$ ./bootstrap.sh

# Mangohud
$ yay -S mangohud
$ yay lib32-mangohud
or
$ yay -S mangohud-git
$ yay -S lib32-mangohud-git
$ vim ~/.config/MangoHud/MangoHud.conf

# Lutris
$ sudo pacman -S lutris

# Steam
$ sudo pacman -S steam
$ sudo pacman -S ttf-liberation

# Retro Games
$ sudo pacman -S retroarch
$ yay -S emulationstation


# Wine ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

$ sudo pacman -S wine-staging wine-nine
$ winecfg

# Fonts
$ cd ${WINEPREFIX:-$HOME/Wine/wine-pfx_name}/drive_c/windows/Fonts && for i in /usr/share/fonts/**/*.{ttf,otf}; do ln -s "$i"; done

# Winetricks
$ wget  -P ~/Escritorio https://raw.githubusercontent.com/Winetricks/winetricks/master/src/winetricks
$ chmod +x ~/Escritorio/winetricks
$ cd ~/Escritorio/winetricks
$ sh winetricks corefonts vcrun6

# DXVK
$ wget -P ~/Escritorio https://github.com/doitsujin/dxvk/releases/download/v1.7/dxvk-1.7.tar.gz
$ tar xvzf ~/Escritorio/dxvk-1.7.tar.gz -C ~/Escritorio
$ mkdir ~/Escritorio/wine-pfx_dxvk
$ ~/Escritorio/dxvk-1.7/./setup_dxvk.sh install
$ mv ~/.wine/ ~/Escritorio/wine-pfx_dxvk
$ winecfg

# Wine TKG
$ git clone https://github.com/Frogging-Family/wine-tkg-git.git ~/Escritorio/wine-tkg
$ cd ~/Escritorio/wine-tkg/wine-tkg-git/
$ makepkg -si

# Create WINEPREFIX
$ WINEPREFIX=~/Wine/.newprefix winecfg
$ WINEPREFIX=~/Wine/.new32prefix WINEARCH="win32" winecfg

# Launch Custom Wine
$ WINEPREFIX=~/Games/Wine/wine-pfx ~/Games/Wine/wine-build/bin/wine64 "/Media/Games/PC/Game/game.exe"

# Cemuhook
$ winecfg 
>> Library >> Add
dbghelp.dll

# Theme
$ wine regedit wine-breeze-dark.reg

# Build from source
$ git clone git://source.winehq.org/git/wine.git ~/Escritorio/wine-src
$ cd ~/Escritorio/wine-src
$ ./configure --prefix=$HOME/Escritorio/wine-build --enable-win64 && make
$ sudo make install


# =============================================================================
                            # Automount Drives #
# =============================================================================

$ lsblk
$ sudo blkid
$ sudo vim /etc/fstab
# -----------------------------------------------------------------------------
# /dev/sdb1 (Datos)
UUID=01D1D88E4B400EE0   /Datos       ntfs    defaults        0       0

# /dev/sdc1 (Media)
UUID=94F0F35BF0F34252   /Media       ntfs    defaults        0       0

# /dev/sda4 (Windows)
UUID=2AE63D01E63CCF37   /Windows    ntfs    defaults        0       0
# -----------------------------------------------------------------------------

$ sudo mkdir /Datos
$ sudo mkdir /Media
$ sudo mkdir /Windows
$ sudo chown govi:govi /Datos/
$ sudo chown govi:govi /Media/
$ sudo chown govi:govi /Windows/
$ ls -l /


# =============================================================================
                            # Crontab Jobs #
# =============================================================================

$ pacman -S cronie
$ systemctl enable --now cronie.service
$ crontab -e
# -----------------------------------------------------------------------------
MAILTO=""
00 00 * * * ~/Scripts/Bash/Webgrab_Update_to_GIT.sh > ~/Scripts/Logs/Cron/crontab.log 2>&1
05 00 * * * export DISPLAY=:0 && kate ~/Scripts/Logs/Cron/crontab.log
00 12 * * * ~/Scripts/Bash/Webgrab_Update_to_GIT.sh > ~/Scripts/Logs/Cron/crontab.log 2>&1
05 12 * * * export DISPLAY=:0 && kate ~/Scripts/Logs/Cron/crontab.log
# ----------------------------------------------------
$ crontab -l


# =============================================================================
                              # Mouse #
# =============================================================================

$ sudo pacmab -S imwheel
$ xprop WM_CLASS | grep -o ""[^"]*"" | head -n 1 ## click on window for output ##
$ sudo vim ~/.imwheelrc
# -----------------------------------------------------------------------------
"^brave-browser$"
    None, Up, Button4, 2
    None, Down, Button5, 2imwheel -b 45
    Shift_L,   Up,   Shift_L|Button4, 4
    Shift_L,   Down, Shift_L|Button5, 4
    Control_L, Up,   Control_L|Button4
    Control_L, Down, Control_L|Button5
# -----------------------------------------------------------------------------

$ killall imwheel
$ imwheel -b 45
$ sudo vim ~/.config/autostart/imwheel.desktop
# -----------------------------------------------------------------------------
[Desktop Entry]
Name=imwheel
Exec=~/Scripts/Bash/imwheel.sh
InitialPreference=1
StartupNotify=true
Terminal=false
Type=Application
X-DBUS-StartupType=unique
X-KDE-StartupNotify=false
X-KDE-SubstituteUID=false
# -----------------------------------------------------------------------------

# Gestures
qdbus org.kde.kglobalaccel /component/kwin org.kde.kglobalaccel.Component.shortcutNames
qdbus org.kde.kglobalaccel /component/kwin org.kde.kglobalaccel.Component.invokeShortcut "Cube"


# =============================================================================
                               # Extra #
# =============================================================================

# Sudoers
$ sudo vim /etc/sudoers
# -----------------------------------------------------------------------------
%wheel ALL=(ALL) ALL
Defaults env_reset,pwfeedback
# -----------------------------------------------------------------------------

# Tuning PulseAudio
$ sudo vim /etc/pulse/daemon.conf
# -----------------------------------------------------------------------------
high-priority = yes
nice-level = -11

realtime-scheduling = yes
realtime-priority = 5
# -----------------------------------------------------------------------------

