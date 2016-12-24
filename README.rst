-------------
 Introduction
-------------

This repo contains my neovim settings.
It contains some useful setting, plugins and convinient keymappings for me.

If you have encounter some issues, feel free to report an issue.

-------------
 Requirement:
-------------

The following are list of packages that some of the plugins are dependon.

- python2
- python3
- the silver searcher

-------------
 Setup Guide:
-------------

Main Config Setup:
^^^^^^^^^^^^^^^^^^

.. code-block:: bash

    cd ~
    git clone https://github.com/mike820324/vimrc.git ~/.config/nvim


Python Config Setup:
^^^^^^^^^^^^^^^^^^^^

Since most of the nvim plugins that I use require python2 and python3, 
as a result, before starting neovim, we need to setup the path of **python2** and **python3** for neovim.

You can follow this `link <https://github.com/zchee/deoplete-jedi/wiki/Setting-up-Python-for-Neovim/>`_ 
for more detail about how to setup python for different platform.

You can add the following config right before the init.vim ,

.. code-block:: vim

	let g:python_host_prog = '/path/to/python2'
	let g:python3_host_prog = '/path/to/python3'

or you can create a **conf.d** folder in your nvim config path and add **python_path.vim** with the above settings.

Base16 ColorScheme Setup:
^^^^^^^^^^^^^^^^^^^^^^^^^

I'm using `base16 <https://github.com/chriskempson/base16/>`_ to manage my colorscheme.
In order to let your neovim color scheme work properly, you must setup base16 properly.

Please refer to `base16-shell <https://github.com/chriskempson/base16-shell/>`_ for installation guide.

Package Manager Setup:
^^^^^^^^^^^^^^^^^^^^^^

I'm using `dein <https://github.com/Shougo/dein.vim/>`_ as my package manager.
To setup dein package manager, simply following the above commands.

.. code-block:: bash

	cd ~/.config/nvim
	mkdir bundle
	curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > installer.sh
	bash ./installer.sh ~/.config/nvim/bundle

Install Plugins:
^^^^^^^^^^^^^^^^

Now it comes to the final steps, open up neovim and type the following command.

.. code-block:: vim

	call dein#install()
	UpdateRemotePlugins
