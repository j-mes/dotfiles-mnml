# dotfiles-mnml
A minimal dotfiles setup primarily orientated for a JavaScript/Node.js developer/engineer. Use at your own risk!

```
source install.sh
```

This will guide you through the installation/setup process in the terminal. I usually have the dotfiles living in a folder called `Projects` on the root directory. If the installation is to be elsewhere on the machine, then please do edit the `install.sh` file to reflect on where it should live.

## Table of Contents
* [dotfiles-mnml](#dotfiles-mnml)
	* [Table of Contents](#table-of-contents)
	* [Requirements](#requirements)
	* [Process](#process)
	* [Setup](#setup)

## Requirements

To be able to utilise the dotfiles to do what it is designed/developed for, it will need the following:

* Git to be installed (MacOS has a version of git which will allow for installation first time).
* Mac OS (This is not supported on Windows or Linux (for the time being))
* XCode Command Line Tools to be installed (Run `xcode-select --install` in the terminal to find out whether it is installed or not)

## Process

It will install the following:

* [Homebrew](http://brew.sh)
* Latest version of Bash (via Homebrew)
* Bash / Git config files

## Setup

There are a few steps to do which can be seen below.

1. Open Terminal (`⌘ + space` type `Terminal` then press `Enter`)
2. Navigate to where you want to keep the dotfiles
3. Type the command below:
```sh
git clone https://github.com/j-mes/dotfiles-mnml.git
```

4. The machine now has the dotfiles.
5. Open a text editor and make a new file called `extra` (no file extension). Put it inside the git folder and add in the code below in the file (see **Note**):
```sh
# Git credentials
GIT_AUTHOR_NAME="Your name"
GIT_COMMITTER_NAME="$GIT_AUTHOR_NAME"
git config --global user.name "$GIT_AUTHOR_NAME"
GIT_AUTHOR_EMAIL="Your email"
GIT_COMMITTER_EMAIL="$GIT_AUTHOR_EMAIL"
git config --global user.email "$GIT_AUTHOR_EMAIL"
```

6. Navigate inside the folder in Terminal (`cd dotfiles`)
7. Type the command below:
```sh
source install.sh
```

8. Voila, all done.

**Note:** Do not forget to change `Your name`, `Your email` for your name, email address inside the `extra` file before doing step 7.
