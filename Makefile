# Makefile for setting up a shell environment

# You can set these variables from the command line.
BUILDDIR      = ~/
DOTFILES      = git clone https://akamlani@github.com/akamlani/dotfiles.git

.PHONY: help vim zsh oh-my-zsh dotfile

help:
	@echo "Please use \`make <target>' where <target> is one of"
	@echo "  vim       Grabs .vimrc, plugins and colors"
	@echo "  zsh       Grabs oh-my-zsh and plugins"
	@echo "  dotfiles  Grabs and links all the fotfiles."
	@echo "  oh-my-zsh to make a single large HTML file"

cleanvim:
  -rm -rf $(BUILDDIR).vimrc
  -rm -rf $(BUILDDIR).vim

cleanzsh:
  -rm -rf $(BUILDDIR).zsh

cleandotfiles:
  -rm -rf $(BUILDDIR)dotfiles

dotfiles:
  ln -sf $(BUILDDIR)dotfiles/.vimrc    $(BUILDDIR).vimrc
  ln -sf $(BUILDDIR)dotfiles/.zshrc    $(BUILDDIR).zshrc
  ln -sf $(BUILDDIR)dotfiles/.inputrc  $(BUILDDIR).inputrc
  mkdir -p $(BUILDDIR).zsh

zsh:
	@echo "Installing ZSH plugins"
	mkdir -p $(BUILDDIR).zsh
	@echo
	@echo "Build finished for zsh."

vim:
	-mkdir -p ~/.vim
	ln -sf $(BUILDDIR)dotfiles/.vim/bundle  $(BUILDDIR).vim/
	ln -sf $(BUILDDIR)dotfiles/.vim/colors  $(BUILDDIR).vim/
	-cd /tmp
	@echo "grabbing pathogen"
	-cd /tmp
	git clone https://github.com/tpope/vim-pathogen.git /tmp/pathogen
	-mv /tmp/pathogen/autoload $(BUILDDIR).vim/
