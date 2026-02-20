# Makefile for setting up environment
#################### Read Environment
RUNTIME_FILE := ./config/runtime/python.env
include $(RUNTIME_FILE)

#################### Makefile Configuration
GIT_ROOT ?= $(shell git rev-parse --show-toplevel)
# e.g., Darwin for MacOS
PLATFORM_TYPE = $(shell uname)
# dynamically detect shell type as bash or zsh
ifeq ($(shell basename $(SHELL)), zsh)
        SHELL := zsh
		SHELL_CONFIG := $(HOME)/.zshrc
else
        SHELL := bash
		SHELL_CONFIG := $(HOME)/.bashrc
endif

#################### Makefile Context
.DEFAULT_GOAL := info

.PHONY: help info reader
help:
	@echo "Commands  : "
	@echo "download  : downloads a new anaconda distribution"
	@echo "system    : Installs System Libraries on AMI per $(PLATFORM_TYPE)"
	@echo "install   : create virtual environment based on project $(PACKAGE_INSTALL_NAME)"
	@echo "format    : formatting and linting of project $(PACKAGE_NAME)"
	@echo "clean     : cleans all files or project $(PACKAGE_INSTALL_NAME)"
	@echo "test      : execute unit testing"

info:
	@echo "Info      : platform=$(PLATFORM_TYPE), shell=$(SHELL)"
	@echo "Kernels:  : $$(jupyter kernelspec list)"

reader:
	@echo "Package:        $(PACKAGE_INSTALL_NAME) - $(PACKAGE_NAME)"
	@echo "Platform:       ${PLATFORM_TYPE}"
	@echo "Architecture:   $$(uname -m)"
	@echo "Python Version: ${PYTHON_VERSION}"
	@echo "Shell:          $(SHELL)"
	@echo "Env Dep Path:   ${ENV_DEP_PATH}"


#################### Python Setup


#################### AI Coding Assistant Integrations
.PHONY: setup_install github_copilot_install anthropic_claude_install google_gemini_install

setup_install:
	@echo "Creating Scaffolding..."
	mkdir -p .claude .cursor .gemini .github

github_copilot_install:
# install in ~/.local/bin/copilot
	@echo "Installing GitHub Copilot CLI..."
	wget -qO- https://gh.io/copilot-install | zsh
	mkdir -p .github

openai_codex_install:
	@echo "Installing OpenAI CLI..."
	mkdir -p .codex
	touch AGENTS.md

anthropic_claude_install:
	@echo "Installing Claude CLI..."
	mkdir -p .claude/{agents,skills,commands,rules}
	touch ./CLAUDE.md
	npm install -g @anthropic/claude-cli@latest

google_gemini_install:
	@echo "Installing Gemini CLI..."
	touch GEMINI.md
	mkdir -p .gemini
	npm install -g npm@11.8.0
	npm install -g @google/gemini-cli@latest

#################### General
.PHONY: clean
clean:
	echo "Cleaning project files for installed package ..."
	rm -rf ./__pycache__
	find . -name "*.pyc" -delete
	find . -name "*.pyo" -delete
	find . -name "__pycache__" -delete
	find . -type d -name ".pytest_cache" -exec rm -rf {} +
	find . -type d -name "outputs" -exec rm -rf {} +
	find . -name "*.out" -delete
	find . -name ".DS_Store" -delete




# # You can set these variables from the command line.
# BUILDDIR      = ~/
# DOTFILES      = git clone https://akamlani@github.com/akamlani/dotfiles.git

# .PHONY: help vim zsh oh-my-zsh dotfile

# help:
# 	@echo "Please use \`make <target>' where <target> is one of"
# 	@echo "  vim       Grabs .vimrc, plugins and colors"
# 	@echo "  zsh       Grabs oh-my-zsh and plugins"
# 	@echo "  dotfiles  Grabs and links all the fotfiles."
# 	@echo "  oh-my-zsh to make a single large HTML file"

# cleanvim:
# 	-rm -rf $(BUILDDIR).vimrc
# 	-rm -rf $(BUILDDIR).vim

# cleanzsh:
# 	-rm -rf $(BUILDDIR).zsh

# cleandotfiles:
# 	-rm -rf $(BUILDDIR)dotfiles

# dotfiles:
# 	ln -sf $(BUILDDIR)dotfiles/.vimrc    $(BUILDDIR).vimrc
# 	ln -sf $(BUILDDIR)dotfiles/.zshrc    $(BUILDDIR).zshrc
# 	ln -sf $(BUILDDIR)dotfiles/.inputrc  $(BUILDDIR).inputrc
# 	mkdir -p $(BUILDDIR).zsh

# zsh:
# 	@echo "Installing ZSH plugins"
# 	mkdir -p $(BUILDDIR).zsh
# 	@echo
# 	@echo "Build finished for zsh."

# vim:
# 	-mkdir -p ~/.vim
# 	ln -sf $(BUILDDIR)dotfiles/.vim/bundle  $(BUILDDIR).vim/
# 	ln -sf $(BUILDDIR)dotfiles/.vim/colors  $(BUILDDIR).vim/
# 	-cd /tmp
# 	@echo "grabbing pathogen"
# 	-cd /tmp
# 	git clone https://github.com/tpope/vim-pathogen.git /tmp/pathogen
# 	-mv /tmp/pathogen/autoload $(BUILDDIR).vim/
