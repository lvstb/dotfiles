---------------------------------------------------------------
-- => General Settings
---------------------------------------------------------------
local global = require("core.global")

local function bind_option(options)
    for k, v in pairs(options) do
        if v == true then
            vim.cmd("set " .. k)
        elseif v == false then
            vim.cmd("set no" .. k)
        else
            vim.cmd("set " .. k .. "=" .. v)
        end
    end
end

local function load_options()
    local global_local = {
        termguicolors = true,
        mouse = "a",
        errorbells = false,
        visualbell = false,
        hidden = true,
        fileformats = "unix,mac,dos",
        magic = true,
        virtualedit = "onemore",		-- Allow for cursor beyond the last character
        encoding = "utf-8",
        --viewoptions = "folds,cursor,curdir,slash,unix",
        sessionoptions = "curdir,help,tabpages,winsize",
        clipboard = "unnamedplus",
        wildignorecase = true,
        wildmode = "longest,list,full",
        wildmenu = true,
        wildignore = ".git,.hg,.svn,*.pyc,*.o,*.out,*.jpg,*.jpeg,*.png,*.gif,*.zip,**/tmp/**,*.DS_Store,**/node_modules/**,**/bower_modules/**",
        backup = false,
        writebackup = false,
        swapfile = false,
        undodir = global.cache_dir .. "undo/",
        history = 2000,			-- Remember ALL the commands
        undolevels = 1000,		-- Do ALL the undos
        shada = "!,'300,<50,@100,s10,h",
        backupskip = "/tmp/*,$TMPDIR/*,$TMP/*,$TEMP/*,*/shm/*,/private/var/*,.vault.vim",
        smarttab = true,
        tabstop=4,             -- Number of spaces for a tab
        softtabstop=4,         -- Number of spaces for a tab while editing
        shiftwidth=4,          -- Shift width value
        shiftround = true,
        timeout = true,
        ttimeout = true,
        timeoutlen = 500,		-- By default timeoutlen is 1000
        ttimeoutlen = 0,
        updatetime = 100,
        redrawtime = 1500,
        ignorecase = true,		-- Case insensitive search
        smartcase = true,		-- Case sensitive when uppercase present
        infercase = true,
        incsearch = true,		-- Incremental searches
        hlsearch = true,		-- Highlight searches
        wrapscan = true,		-- When searches reach end of file it goes back to the top
        -- complete = ".,w,b,k",
        inccommand = "nosplit",		-- live substitions in place
        grepformat = "%f:%l:%c:%m",
        grepprg = "rg --hidden --vimgrep --smart-case --",
        -- breakat = [[\ \	;:,!?]],
        -- whichwrap = "h,l,<,>,[,],~",
        splitbelow = true,			-- Split current window below
        splitright = true,			-- Split current window to the right
        switchbuf = "useopen",
        --backspace = "indent,eol,start",
        diffopt = "filler,iwhite,internal,algorithm:patience",
        completeopt = "menuone,noselect",
        jumpoptions = "stack",
        showmode = false,
        shortmess = "aoOTIcF",
        scrolloff = 2,
        sidescrolloff = 5,
        foldlevelstart = 99,		-- Default all folds open
        --ruler = true,
        cursorline = true,			-- Highlight cursorline
        --cursorcolumn = true,
        list = true,				-- Show special characters like tabs (^I),...
        -- showtabline = 2,
        -- winwidth = 30,
        -- winminwidth = 10,
        -- pumheight = 15,
--        helpheight = 12,
        previewheight = 12,
        showcmd = true,
--        cmdheight = 2,
--        cmdwinheight = 5,
        -- equalalways = false,
        laststatus = 2,
        display = "lastline",
        showbreak = "↳  ",
        listchars = "tab:»·,nbsp:+,trail:·,extends:→,precedes:←",
        pumblend = 10,
        winblend = 10,
        autowrite = true		-- Automatically :write before running commands
    }

    local bw_local = {
        undofile = true,
        synmaxcol = 2500,
        formatoptions = "1jcroql",
        textwidth = 80,
        expandtab = true,
        autoindent = true,
        tabstop = 4,
        shiftwidth = 4,
        softtabstop = -1,
        breakindentopt = "shift:2,min:20",
        wrap = false,
        linebreak = true,
        number = true,
        relativenumber = true,
        foldenable = true,
        signcolumn = "yes",
        conceallevel = 0,
        concealcursor = "niv"
    }

    if global.is_mac then
        vim.g.clipboard = {
            name = "macOS-clipboard",
            copy = {["+"] = "pbcopy", ["*"] = "pbcopy"},
            paste = {["+"] = "pbpaste", ["*"] = "pbpaste"},
            cache_enabled = 0
        }
        vim.g.python_host_prog = "/usr/bin/python"
        vim.g.python3_host_prog = "/usr/local/bin/python3"
    end
    for name, value in pairs(global_local) do vim.o[name] = value end
    bind_option(bw_local)
end

-- LSP Prevents inline buffer annotations
vim.diagnostic.open_float()
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
  virtual_text = false,
  signs = true,
  underline = true,
  update_on_insert = false,
})

local signs = {
  Error = "ﰸ",
  Warn = "",
  Hint = "",
  Info = "",
}
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = nil })
end

vim.cmd([[autocmd CursorHold,CursorHoldI * lua vim.diagnostic.open_float()]])

load_options()
