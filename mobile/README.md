# GnoSocial Mobile APP

## Requirements

The GnoSocial mobile app uses Expo. You can review the general expo requirements:

- Expo Requiments: https://docs.expo.dev/get-started/installation/

Here are specific steps to install the requirements on your platform.

### Install requirements for macOS 13 and macOS 14

(If you are on Ubuntu, see the next section to install requirements.)

Install Xcode. To install the Command Line Developer Tools, in a terminal enter:

```sh
xcode-select --install
```

After the Developer Tools are installed, we need to make sure it is updated. In
System Preferences, click Software Update and update it if needed.

To install asdf using brew, follow instructions at https://asdf-vm.com . In short,
first install brew following the instructions at https://brew.sh . Then, in
a terminal enter:

```sh
brew install asdf gnu-tar gpg
```

If your terminal is zsh, enter:

```sh
echo -e "\n. $(brew --prefix asdf)/libexec/asdf.sh" >> ${ZDOTDIR:-~}/.zshrc
```

If your terminal is bash, enter:

```sh
echo -e "\n. \"$(brew --prefix asdf)/libexec/asdf.sh\"" >> ~/.bash_profile
```

Start a new terminal to get the changes to the environment .

(optional) To install Android Studio, download and install the latest
android-studio-{version}-mac.dmg from https://developer.android.com/studio .
(Tested with Iguana 2023.2.1 .)

### Install requirements for Ubuntu 20.04 and 22.04

To install asdf, follow instructions at https://asdf-vm.com . In short, in
a terminal enter:

```sh
sudo apt install curl git
git clone https://github.com/asdf-vm/asdf.git ~/.asdf
echo '. "$HOME/.asdf/asdf.sh"' >> ~/.bashrc
echo 'export ANDROID_HOME="$HOME/Android/Sdk"' >> ~/.bashrc
echo 'export ANDROID_NDK_HOME="$ANDROID_HOME/ndk/23.1.7779620"' >> ~/.bashrc
```

Start a new terminal to get the changes to the environment .

To install Android Studio, download the latest
android-studio-{version}-linux.tar.gz from
https://developer.android.com/studio . (Tested with Iguana 2023.2.1 .)
In a terminal, enter the following with the correct {version}:

```sh
sudo tar -C /usr/local -xzf android-studio-{version}-linux.tar.gz
```

To launch Android Studio, in a terminal enter:

```sh
/usr/local/android-studio/bin/studio.sh &
```

## 🚀 How to use

### Build for iOS

#### Install the tools with asdf (only need to do once)

```sh
make asdf.install_tools
```

If you get an error like "https://github.com/CocoaPods/CLAide.git (at master@97b765e) is not yet checked out" then reinstall cocoapods like this: 

```sh
asdf uninstall cocoapods
make asdf.install_tools
```

```sh
# to build and run on ios:
make ios 
```

### Build for Android

#### Install the tools with asdf (only need to do once)

(If not building for iOS, edit the file `.tool-versions` and remove the unneeded lines for `ruby` and `cocoapods`.)

```sh
make asdf.install_tools
```

#### Set up the Android NDK

* Launch Android Studio and accept the default startup options. Create a new
  default project (so that we get the main screen).
* On the Tools menu, open the SDK Manager.
* In the "SDK Tools" tab, click "Show Package Details". Expand
  "NDK (Side by side)" and check "23.1.7779620".
* Click OK to install and close the SDK Manager.

```sh
# to build and run on android:
make android 

# to start Metro Bundler:
make start
```


