vim.opt.completeopt = { "menu", "menuone", "noselect" }

-- Don't show the dumb matching stuff.
vim.opt.shortmess:append "c"
-- vim.opt.spell = true
-- vim.opt.spelllang = { 'en_us' }

local luasnip = require("luasnip")
local cmp = require("cmp")
local lspkind = require("lspkind")
luasnip.config.set_config({
	history = true,
	-- Update more often, :h events for more info.
	updateevents = "TextChanged,TextChangedI",
	-- ext_opts = {
	-- 	[types.choiceNode] = {
	-- 		active = {
	-- 			virt_text = { { "choiceNode", "Comment" } },
	-- 		},
	-- 	},
	-- },
	-- treesitter-hl has 100, use something higher (default is 200).
	ext_base_prio = 300,
	-- minimal increase in priority.
	ext_prio_increase = 1,
	enable_autosnippets = true,
})

 -- require("luasnip/loaders/from_vscode").load({ paths = { "/Users/lvstb/dotfiles/config/nvim/snippets/" } })
require("luasnip.loaders.from_vscode").lazy_load()

-- Load snippets from JSON files (VSCode syntax)
require("luasnip/loaders/from_vscode").lazy_load({
  paths = {
    vim.fn.stdpath('config') .. '/snippets',
  }
})
luasnip.filetype_extend("cloudformation", { "yaml" })

cmp.setup {
    snippet = {
        expand = function(args)
            require('luasnip').lsp_expand(args.body)
        end,
    },
    mapping = {
        ['<C-p>'] = cmp.mapping.select_prev_item(),
        ['<C-n>'] = cmp.mapping.select_next_item(),
        ['<C-d>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.close(),
        ['<CR>'] = cmp.mapping.confirm {
        behavior = cmp.ConfirmBehavior.Replace,
        select = true,
        },
        ['<Tab>'] = function(fallback)
        if cmp.visible() then
            cmp.select_next_item()
        elseif luasnip.expand_or_jumpable() then
            luasnip.expand_or_jump()
        else
            fallback()
        end
        end,
        ['<S-Tab>'] = function(fallback)
        if cmp.visible() then
            cmp.select_prev_item()
        elseif luasnip.jumpable(-1) then
            luasnip.jump(-1)
        else
            fallback()
        end
        end,
    },

  --    the order of your sources matter (by default). That gives them priority
  --    you can configure:
  --        keyword_length
  --        priority
  --        max_item_count
  --        (more?)
  sources = {
    -- { name = "gh_issues" },
    -- { name = "tn" },

    -- Youtube: Could enable this only for lua, but nvim_lua handles that already.
    { name = "nvim_lua" },
    { name = "zsh" },
    { name = "nvim_lsp" },
    { name = "path" },
    { name = "luasnip" },
    { name = "buffer", keyword_length = 5 },
  },

  sorting = {
    -- TODO: Would be cool to add stuff like "See variable names before method names" in rust, or something like that.
    comparators = {
      cmp.config.compare.offset,
      cmp.config.compare.exact,
      cmp.config.compare.score,

      -- copied from cmp-under, but I don't think I need the plugin for this.
      -- I might add some more of my own.
      function(entry1, entry2)
        local _, entry1_under = entry1.completion_item.label:find "^_+"
        local _, entry2_under = entry2.completion_item.label:find "^_+"
        entry1_under = entry1_under or 0
        entry2_under = entry2_under or 0
        if entry1_under > entry2_under then
          return false
        elseif entry1_under < entry2_under then
          return true
        end
      end,

      cmp.config.compare.kind,
      cmp.config.compare.sort_text,
      cmp.config.compare.length,
      cmp.config.compare.order,
    },
  },

  formatting = {
    -- Youtube: How to set up nice formatting for your sources.
    format = lspkind.cmp_format {
      with_text = true,
      menu = {
        buffer = "[buf]",
        nvim_lsp = "[LSP]",
        nvim_lua = "[api]",
        path = "[path]",
        luasnip = "[snip]",
      },
    },
  },

  experimental = {
    -- I like the new menu better! Nice work hrsh7th
    native_menu = false,

    -- Let's play with this for a day or two
    ghost_text = true,
  },
}

cmp.setup.cmdline("/", {
  completion = {
    -- Might allow this later, but I don't like it right now really.
    -- Although, perhaps if it just triggers w/ @ then we could.
    --
    -- I will have to come back to this.
    autocomplete = false,
  },
  sources = cmp.config.sources({
    { name = "nvim_lsp_document_symbol" },
  }, {
    { name = "buffer", keyword_length = 5 },
  }),
})

cmp.setup.cmdline(":", {
  completion = {
    autocomplete = false,
  },

  sources = cmp.config.sources({
    {
      name = "path",
    },
  }, {
    {
      name = "cmdline",
      max_item_count = 20,
      keyword_length = 4,
    },
  }),
})
	vim.cmd [[
	hi CmpItemAbbr guifg=#D8DEE9
	hi CmpItemAbbrMatch guifg=#5E81AC
	hi CmpItemAbbrMatchFuzzy guifg=#81A1C1
	hi CmpItemKind guifg=#B48EAD
	hi CmpItemMenu guifg=#a3be8c
	]]

--[[
" Setup buffer configuration (nvim-lua source only enables in Lua filetype).
"
" ON YOUTUBE I SAID: This only _adds_ sources for a filetype, not removes the global ones.
"
" BUT I WAS WRONG! This will override the global setup. Sorry for any confusion.
autocmd FileType lua lua require'cmp'.setup.buffer {
\   sources = {
\     { name = 'nvim_lua' },
\     { name = 'buffer' },
\   },
\ }
--]]

--[[
" Disable cmp for a buffer
autocmd FileType TelescopePrompt lua require('cmp').setup.buffer { enabled = false }
--]]
