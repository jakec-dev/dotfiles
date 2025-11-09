local opt = vim.opt

opt.breakindent = true -- maintain indent on line breaks
vim.schedule(function()
  vim.o.clipboard = 'unnamedplus'
end)
opt.completeopt = "menu,menuone,noselect"
opt.conceallevel = 2 -- hide * markup for bold and italic, but not markers with substitutions
opt.confirm = true -- confirm to save changes before exiting modified buffer
opt.cursorline = true -- enable highlighting of the current line
opt.expandtab = true -- use spaces instead of tabs
opt.fillchars = {
  foldopen = "",
  foldclose = "",
  fold = " ",
  foldsep = " ",
  diff = "╱",
  eob = " ",
}
opt.foldlevel = 99 -- close fewer folds
opt.foldmethod = "indent" -- lines with equal indent form a fold
opt.foldtext = ""
opt.ignorecase = true -- ignore case
opt.jumpoptions = "view" -- restore mark-view in which action occurred
opt.laststatus = 3 -- global statusline
opt.linebreak = true -- wrap lines at convenient points
opt.list = true -- show some invisible characters
opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }
opt.mouse = "a" -- enable mouse mode
opt.number = true -- print line number
opt.pumblend = 10 -- add transparency blend to popups
opt.pumheight = 10 -- max number of items in popup menus
opt.relativenumber = true -- relative line numbers
opt.ruler = false -- disable the default ruler
opt.scrolloff = 4 -- lines of context
opt.sessionoptions = { "buffers", "curdir", "tabpages", "winsize", "help", "globals", "skiprtp", "folds" }
opt.shiftround = true -- round indent
opt.shiftwidth = 2 -- size of an indent
opt.shortmess:append({ W = true, I = true, c = true, C = true })
-- opt.showmatch = true -- show matching brackets on insert
opt.showmode = false -- don't show mode since we have a statusline
opt.sidescrolloff = 8 -- columns of context
opt.signcolumn = "yes" -- always show the sign column
opt.smartcase = true -- don't ignore case with capitals
opt.smartindent = true -- insert indents automatically
opt.smoothscroll = true
opt.splitbelow = true -- put new windows below current
opt.splitkeep = "screen" -- keep text on the same screen line
opt.splitright = true -- put new windows right of current
opt.tabstop = 2 -- number of spaces tabs count for
opt.termguicolors = true -- true color support
opt.timeoutlen = 300 -- quickly trigger which-key
opt.undofile = true -- save undo history to file
opt.undolevels = 10000 -- increase undo history length
opt.updatetime = 200 -- save swap file and trigger CursorHold
opt.virtualedit = "block" -- allow cursor to move where there is no visual block in visual block mode
opt.wildmode = "longest:full,full"  -- command line completion mode
opt.winminwidth = 5 -- minimum window width
opt.wrap = false -- disable line wrap
