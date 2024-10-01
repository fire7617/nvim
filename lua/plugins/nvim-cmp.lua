return {
  "hrsh7th/nvim-cmp", -- 自動補全插件
  event = { "InsertEnter", "CmdlineEnter" }, -- 當進入插入模式或命令行時加載
  dependencies = {
    "hrsh7th/cmp-nvim-lsp", -- LSP 支援
    "hrsh7th/cmp-buffer", -- 從當前 buffer 獲取補全
    "hrsh7th/cmp-path", -- 文件路徑補全
    "hrsh7th/cmp-cmdline", -- 命令行補全
    "saadparwaiz1/cmp_luasnip", -- Snippet 支援
    "L3MON4D3/LuaSnip", -- Snippet 插件
  },
  config = function()
    local cmp = require("cmp")
    cmp.setup({
      snippet = {
        expand = function(args)
          require("luasnip").lsp_expand(args.body) -- 使用 LuaSnip 展開補全片段
        end,
      },
      mapping = cmp.mapping.preset.insert({
        ["<C-b>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<C-e>"] = cmp.mapping.abort(),
        ["<CR>"] = cmp.mapping.confirm({ select = true }), -- 確認補全項
      }),
      sources = cmp.config.sources({
        { name = "nvim_lsp" },
        { name = "luasnip" }, -- Snippet 補全源
      }, {
        { name = "buffer" },
      }),
    })

    -- 設置命令行補全
    cmp.setup.cmdline("/", {
      mapping = cmp.mapping.preset.cmdline(),
      sources = {
        { name = "buffer" },
      },
    })

    cmp.setup.cmdline(":", {
      mapping = cmp.mapping.preset.cmdline(),
      sources = cmp.config.sources({
        { name = "path" },
      }, {
        { name = "cmdline" },
      }),
    })
  end,
}
