--------------------------------------------------------------
--					 lua/core/opts.lua
--------------------------------------------------------------
local cmd = vim.api.nvim_command
local opt = vim.opt 

--> Context 
opt.colorcolumn = '80'		            -- str:  Show col. for max line length
opt.number = true			            -- bool: Show line numbers
opt.relativenumber = false	            -- bool: Show relative line numbers (relative to your current line)
opt.scrolloff = 4			            -- int:  Min num. lines of context
opt.signcolumn = "yes"		            -- str:  Show the sign column
opt.mouse = "a"				            -- str:  Enable mouse support (All modes)

--> General
opt.updatetime = 300		            -- int:	The length of time vim waits after we stop typing 
opt.backup = false          
opt.writebackup = false

--> Filetypes
opt.encoding = "utf8"		            -- str: String encoding to use (ASCII, UTF-16...)
opt.fileencoding = "utf8"       	    -- str: File endcoding to use
opt.ff = "unix"				            -- prefre LF instead of CLRF

--> Theme
opt.syntax = "ON"			            -- str:  Allow syntax highlighting
opt.termguicolors = true	            -- bool: If terminal supports UI colors
vim.o.background = "dark"               -- str: "dark" or "light"
vim.cmd([[colorscheme gruvbox]])        -- Apply theme

--> Search
opt.ignorecase = true 	                -- bool: Ingnore case-sensitive search
opt.smartcase = true 		            -- boo:	 Override ignorecase if search contains capitals
opt.incsearch = true		            -- bool: Use incremental search
opt.hlsearch = true			            -- bool: Highlight search matches

--> Whitespaces
opt.expandtab = false		            -- bool: Use spaces instead of tabs
opt.shiftwidth = 4			            -- int:  Size of an indent
opt.softtabstop = 4			            -- int:  Number of spaces tabs count for in insert mode
opt.tabstop = 4				            -- int:  Number of spaces tabs count

--> Splits
opt.splitright = true 		            -- bool: Place a new window to right to the current one
opt.splitbelow = true		            -- bool: Place a new window bellow the current one
