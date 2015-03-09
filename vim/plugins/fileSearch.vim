" vimproc
NeoBundle 'Shougo/vimproc.vim', {
\ 'build' : {
\     'windows' : 'tools\\update-dll-mingw',
\     'cygwin' : 'make -f make_cygwin.mak',
\     'mac' : 'make -f make_mac.mak',
\     'unix' : 'make -f make_unix.mak',
\ },
\}

NeoBundle 'Shougo/unite.vim'        " buffer explorer
NeoBundle 'Shougo/neomru.vim'       " mru for unite
NeoBundle 'Shougo/vimfiler.vim'     " file explorer
NeoBundle 'rking/ag.vim'            " ag in vim

