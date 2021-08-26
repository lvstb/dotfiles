require 'colorizer'.setup()
require'nvim-web-devicons'.setup {
 -- your personnal icons can go here (to override)
 -- DevIcon will be appended to `name`
 override = {
  zsh = {
    icon = "",
    color = "#428850",
    name = "Zsh"
  }
 };
 -- globally enable default icons (default to false)
 -- will get overriden by `get_icons` option
 default = true;
}

require("trouble").setup {
    auto_open = false, -- automatically open the list when you have diagnostics
    auto_close = false, -- automatically close the list when you have no diagnostics
}

require('lspkind').init({
    -- enables text annotations
    --
    -- default: true
    with_text = true,

    -- default symbol map
    -- can be either 'default' (requires nerd-fonts font) or
    -- 'codicons' for codicon preset (requires vscode-codicons font)
    --
    -- default: 'default'
    preset = 'codicons',

    -- override preset symbols
    --
    -- default: {}
    symbol_map = {
      Text = "",
      Method = "",
      Function = "",
      Constructor = "",
      Field = "ﰠ",
      Variable = "",
      Class = "ﴯ",
      Interface = "",
      Module = "",
      Property = "ﰠ",
      Unit = "塞",
      Value = "",
      Enum = "",
      Keyword = "",
      Snippet = "",
      Color = "",
      File = "",
      Reference = "",
      Folder = "",
      EnumMember = "",
      Constant = "",
      Struct = "פּ",
      Event = "",
      Operator = "",
      TypeParameter = ""
    },
})

require("indent_blankline").setup {
    char = "│",
    show_first_indent_level = true,
    filetype_exclude = {
        "startify", "dashboard", "dotooagenda", "log", "fugitive",
        "gitcommit", "packer", "vimwiki", "markdown", "json", "txt",
        "vista", "help", "todoist", "NvimTree", "peekaboo", "git",
        "TelescopePrompt", "undotree", "flutterToolsOutline", "" -- for all buffers without a file type
    },
    buftype_exclude = {"terminal", "nofile"},
    show_trailing_blankline_indent = false,
    show_current_context = true,
    context_patterns = {
        "class", "function", "method", "block", "list_literal", "selector",
        "^if", "^table", "if_statement", "while", "for", "type", "var",
        "import"
    }
}
-- because lazy load indent-blankline so need readd this autocmd
vim.cmd('autocmd CursorMoved * IndentBlanklineRefresh')

--Here starts the Lualine config
local function lsp()
    local icon = [[  LSP: ]]
    local msg = 'No Active LSP'
    local buf_ft = vim.api.nvim_buf_get_option(0, 'filetype')
    local clients = vim.lsp.get_active_clients()
    if next(clients) == nil then return icon .. msg end
    for _, client in ipairs(clients) do
        local filetypes = client.config.filetypes
        if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
            return icon .. client.name
        end
    end
    return icon .. msg
end

local gps = require("nvim-gps")

require('lualine').setup {
    options = {
        icons_enabled = true,
        theme = 'nord',
        disabled_filetypes = {}
    },

    sections = {
        lualine_a = {'mode'},
        lualine_b = {{'branch'}, {'diff'}},
        lualine_c = {
            {'filename'}, {gps.get_location, condition = gps.is_available}
        },
        lualine_x = {
            {
               'diagnostics',
                sources = {'nvim_lsp'},
                color_error = "#BF616A",
                color_warn = "#EBCB8B",
                color_info = "#81A1AC",
                color_hint = "#88C0D0",
                symbols = {error = ' ', warn = ' ', info = ' '}
            }, {lsp}, {'encoding'}, {'fileformat'}
        },
        lualine_y = {'progress'},
        lualine_z = {'location'}
    },
    inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {'filename'},
        lualine_x = {'location'},
        lualine_y = {},
        lualine_z = {}
    },
    tabline = {},
    extensions = {}
}
