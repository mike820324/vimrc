# Introduction
I am a vim lover and I use vim for a very long time. This repo is my vimrc file which contains some useful plugins and convinient keymapping for me.

# Outline:
* [Installation](#InstallSection)
 * ![First Time](#FirstTimeSection) 
 * ![Update](#UpdateSection)
* [Feature](#FeatureSection)
 * [Help](#HelpSection)
 * [Project Layout](#ProjectLayoutSection)
 * [File Search](#FileSearchSection)
 * [Misc Search](#MiscSearchSection)
 * [Buffer/Window Navigation](#NavigationSection)
* [Q&A](#QandASection)

# <a name="InstallSection"></a> Installation
#### <a name="FirstTimeInstallSection"></a> First Time Installation
The following is the installation guide of how to setup the settings
```bash
cd ~
git clone https://github.com/mike820324/vimrc.git .vim
ln -s ~/.vim/vimrc ~/.vimrc

# install neobundle
curl https://raw.githubusercontent.com/Shougo/neobundle.vim/master/bin/install.sh | sh

# or manually
mkdir -p ~/.vim/bundle
git clone https://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim
```
OR

* download a compress file from [Release Page](https://github.com/mike820324/vimrc/releases)
* decompress the downloaded file
* rename to .vim
* put to your home folder
* soft link ~/.vimrc
```bash
wget https://github.com/mike820324/vimrc/archive/v1.0.tar.gz
tar xvf v1.0.tar.gz
mv vimrc-1.0 ~/.vim
ln -s ~/.vim/vimrc ~/.vimrc

# install neobundle
curl https://raw.githubusercontent.com/Shougo/neobundle.vim/master/bin/install.sh | sh

```
#### <a name="UpdateInstallSection"></a> Update
To the lastest version:
```bash
cd ~/.vim
git pull
```

# <a name="FeatureSection"></a> Features:
## <a name="HelpSection"></a> Help 
#### Description
Since this vimrc contains so many keymapping for different plugins. 
I have mapped two keys to quick navigate through the commands of this vimrc.

By typing ```<leader>h```, the unite mappings will show you the current keymapping of this editor.
And by typing ```<leader>,```, a unite menu will pop up to you with the avaliable commands.

#### KeyMappings:
```
key: ,h (Unite Keymappings view)
key: ,, (Fast Command Menu)
```
#### Screencast:
![Command Menu Screen](http://i.imgur.com/AIvpcXU.gif)

## <a name="ProjectLayoutSection"></a> Project Layout
#### Description:
A Project layout related commands use the following plugins:
* VimFiler : Project Directory Layout
* TagBar : Source Code Layout
* UndoTree : vim undo tree layout
* Syntastic : Syntastic Checker

#### KeyMappings: 
```
key: ,pco (TagBar toggle)
key: ,pdt (VimFiler toggle)
key: ,put (UndoTree toggle)
key: ,pce (Syntastic check)
```

#### Screen Cast:
- VimFiler
![Imgur](http://i.imgur.com/BGdTYkM.png)
- TarBar
![Imgur](http://i.imgur.com/gKsXEMc.png?1)
- UndoTree
![Imgur](http://i.imgur.com/TIhiOf1.png)
- Syntastic Error Checking
![Imgur](http://i.imgur.com/OjOB7lH.png)

## <a name="FileSearchSection"></a> File Search
#### Description:
All the file related search is using the Unite.vim plugin. The following is the keymappings.
>I strongly prefer compiling vim with lua and luajit enable.

#### KeyMappings:
```
key: ,ff (file search)
key: ,fm (most recent use file search)
key: ,fg (file grep search)
```

## <a name="MiscSearchSection"></a> Misc Search
#### Description:
Except the file search, I also mapped some useful functionalities in Unite.vim.
* mark search : search through the vim marks currently added
* buffer search : search through all the buffers
* tag search : search the tag, very similar to tagbar but much more faster when you know the function name.

#### KeyMappings:
```
key: ,ms (marks search)
key: ,bs (buffer search)
key: ,tcs (function search)
```

## <a name="NavigationSection"></a> Buffer and Window Navigations
#### Description:
Instead of using tabs, the airline.vim have present a great features called tabline, 
which will show the buffers that you are using on the very top of your vim window.
But the problem is that there is no keymapping for moving around the Buffer, so here is my keymappings.

#### KeyMappings:
Buffer Navigations
```
key: ,bt (create a new buffer)
key: ,bq (quit buffer)
key: ,bj (next buffer)
key: ,bk (prev buffer)
```

Window Navigations
```
key: ,wn (create new window)
key: ,wq (quit the current window)
key: ,wj (move to bottom window)
key: ,wk (move to upper window)
key: ,wh (move to left window)
key: ,wl (move to right window)
```

## <a name="QandASection"></a> Q&A
1. Error Message when using TarBar

>Please download Exuberant Ctags from ctags.sourceforge.net and install it in a directory in your $PATH o
r set g:tagbar_ctags_bin.

```
Since tagbar is using ctags to generate the tag files; therefore, if you want to use TagBar plugin, you should install ctags first.
```
