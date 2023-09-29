return {
  {
    "sindrets/diffview.nvim",
    cmd = {
      "DiffviewClose",
      "DiffviewFileHistory",
      "DiffviewFocusFiles",
      "DiffviewLog",
      "DiffviewOpen",
      "DiffviewRefresh",
      "DiffviewToggleFiles",
    },
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    config = function()
      vim.opt.fillchars = vim.opt.fillchars + 'diff:╱'
      require("diffview").setup({
        view = {
          merge_tool = {
            layout = "diff3_mixed",
          }
        }
      })
    end
  }
}
