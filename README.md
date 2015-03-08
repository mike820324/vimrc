# Introduction
I am a vim lover and I use vim for a very long time. This repo is my vimrc file which contains some useful plugins and convinient keymapping for me.

# Installation
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

# Features
## Help 
```
Keymapping Guide:
key: ,h
Fast Command Menu:
key: ,,
```

## Project Layout
```
key: ,pco
key: ,pdt
key: ,put
key: ,pce
```


## File Search
All the file related search is using the Unite.vim plugin. The following is the keymappings.
>I strongly prefer compiling vim with lua and luajit enable.

```
key: ,ff (file search)
key: ,fm (most recent use file search)
key: ,fg (file grep search)
```

## Buffer and Window Navigations
Instead of using tabs, the airline.vim have present a great features called tabline, 
which will show the buffers that you are using on the very top of your vim window.
But the problem is that there is no keymapping for moving around the Buffer, so here is my keymappings.

### Buffer Navigations
```
key: ,bt
key: ,bj
key: ,bk
key: ,bq
```

### Window Navigations
```
key: ,wj
key: ,wk
key: ,wh
key: ,wl
key: ,wq
```


