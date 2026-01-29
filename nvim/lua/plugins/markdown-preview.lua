return {
  "iamcco/markdown-preview.nvim",
  cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
  ft = { "markdown" },
  build = "cd app && npm install",
  keys = {
    {
      "<leader>mp",
      "<cmd>MarkdownPreviewToggle<cr>",
      desc = "Toggle Markdown Preview",
      ft = "markdown",
    },
  },
  config = function()
    vim.g.mkdp_auto_close = 0
    vim.g.mkdp_theme = "dark"
  end,
}
