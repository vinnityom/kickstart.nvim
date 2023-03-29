return {
  "nvim-neo-tree/neo-tree.nvim",
  version = "*",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
  },
  config = function ()
    -- Unless you are still migrating, remove the deprecated commands from v1.x
    vim.cmd([[ let g:neo_tree_remove_legacy_commands = 1 ]])

    vim.fn.sign_define("DiagnosticSignError",
        {text = " ", texthl = "DiagnosticSignError"})
      vim.fn.sign_define("DiagnosticSignWarn",
        {text = " ", texthl = "DiagnosticSignWarn"})
      vim.fn.sign_define("DiagnosticSignInfo",
        {text = " ", texthl = "DiagnosticSignInfo"})
      vim.fn.sign_define("DiagnosticSignHint",
        {text = "", texthl = "DiagnosticSignHint"})

    require('neo-tree').setup {
      -- close_if_last_window = true,
      default_component_configs = {
        git_status = {
          symbols = {
            -- Change type
            added     = "", -- or "✚", but this is redundant info if you use git_status_colors on the name
            modified  = "", -- or "", but this is redundant info if you use git_status_colors on the name
            deleted   = "✖",-- this can only be used in the git_status source
            renamed   = "",-- this can only be used in the git_status source
            -- Status type
            untracked = "",
            ignored   = "",
            unstaged  = "",
            staged    = "",
            conflict  = "",
          }
        },
      },
      filesystem = {
        filtered_items = {
          visible = true,
        }
      },
      window = {
        width = 50,
        mappings = {
          ["o"] = "open",
          ["gw"] = "prev_git_modified",
          ["gs"] = "next_git_modified",
          ["z"] = false,
          ["Z"] = "close_all_nodes",
        },
      },
    }

  vim.keymap.set('n', '<c-n>', require('neo-tree').reveal_current_file, { desc = 'reveal current file in neotree' })
  vim.keymap.set('n', '<leader><leader>', require('neo-tree').reveal_current_file, { desc = 'reveal current file in neotree' })

 end,
}
