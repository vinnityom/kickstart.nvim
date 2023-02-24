return {
  "nvim-zh/auto-save.nvim",
  config = function()
    local autosave = require("auto-save")
    autosave.setup()
  end,
}
