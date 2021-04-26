<h1 align="center">
  nvim-commaround
</h1>

<h2 align="center">
  <img alt="PR" src="https://img.shields.io/badge/PRs-welcome-brightgreen.svg?style=flat"/>
  <img alt="Lua" src="https://img.shields.io/badge/lua-%232C2D72.svg?&style=flat&logo=lua&logoColor=white"/>
</h2>

<h4 align="center">toggle comments on and off</h4>

<h3 align="center">
  <a href="#Installation">Installation</a> •
  <a href="#Usage">Usage</a> •
  <a href="#Customisation">Customisation</a> •
  <a href="#Feedback">Feedback</a>
</h3>

`nvim-commaround` comes and goes around, comments up and down! It toggles comments for visual blocks or inline code according to the buffer filetype: it works out of the box, it is awesome!

## Installation
Install it using your favourite plugin manager; for instance if you are using vim-plug
```
Plug 'gennaro-tedesco/nvim-commaround'
```
We recommend to use the latest neovim [nightly build](https://github.com/neovim/neovim/releases/tag/nightly), as some lua options may not work otherwise.

## Usage
Visually select the lines you want to act on and toggle commaround: the default mapping is
```
vmap <leader>c <Plug>ToggleCommaround
```
The plugin detects the buffer filetype and inserts block or line comments according to the selection.

![demo](https://user-images.githubusercontent.com/15387611/116161815-c73fa480-a6f4-11eb-940f-a9a012cd8676.gif)

## Customisation
The list of filetypes configuration characters can be found [here](https://github.com/gennaro-tedesco/nvim-commaround/blob/master/lua/nvim-commaround/config.lua). To add comment characters for a new filetype (or to modify the existing ones) specify the below in your nvim configurations (`init.vim` or any other option file being sourced at start-up), say
```
lua require('nvim-commaround.config').config["todo"] = {single = "--!", block = {left = "/*!", right = "!*/"}}
```
replacing "todo" with any specific filetype; leave `{single = "--!", block = nil}` in case no block comments are available.

To change the default mapping to toggle comments define any right hand side of the option below, for example
```
let g:toggle_commaround = 'gcc'
```

## Unit tests
We make use of the [busted framework](https://olivinelabs.com/busted/) for unit tests; run them with
```
busted -C lua
```

## Feedback
If you find this plugin useful consider awarding it a ⭐, it is a great way to give feedback! Otherwise, any additional suggestions or merge request is warmly welcome!
