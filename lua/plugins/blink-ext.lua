return {
  "saghen/blink.cmp",
  opts = function(_, opts)
    -- make sure per_filetype exists
    opts.sources = opts.sources or {}
    opts.sources.per_filetype = vim.tbl_extend("force", opts.sources.per_filetype or {}, {
      markdown = {},
      ["copilot-chat"] = {},
    })

    opts.sources.transform_items = function(ctx, items)
      -- Remove the "Text" kind from LSP autocomplete
      return vim.tbl_filter(function(item)
        return item.kind ~= vim.lsp.protocol.CompletionItemKind.Text
      end, items)
    end
  end,
}
