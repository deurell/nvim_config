return {
  {
    "projekt0n/github-nvim-theme",
    priority = 1000,
    lazy = false,
    config = function()
      require("github-theme").setup({
        options = {
          transparent = false,
          terminal_colors = true,
          styles = {
            comments = "italic",
            functions = "bold",
            keywords = "italic",
            types = "italic,bold",
          },
        },
      })

      -- Available options:
      -- github_dark_default
      -- github_dark_dimmed
      -- github_dark_colorblind
      -- github_light_default
      -- github_light_colorblind
      vim.cmd.colorscheme("github_light_default")
    end,
  },
}
