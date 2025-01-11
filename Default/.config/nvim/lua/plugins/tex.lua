return {
  {

    "lervag/vimtex",
    lazy = false, -- we don't want to lazy load VimTeX
    -- tag = "v2.15", -- uncomment to pin to a specific release
    init = function()
      -- VimTeX configuration goes here, e.g.
      vim.g.vimtex_view_method = "zathura"
    end,
  },
  {
    "frabjous/knap",
    keys = {
      {
        "<leader>po",
        function()
          require("knap").process_once()
        end,
        desc = "Refresh preview",
      },
      {
        "<leader>pq",
        function()
          require("knap").close_viewer()
        end,
        desc = "Close preview",
      },
      {
        "<leader>pp",
        function()
          require("knap").toggle_autopreviewing()
        end,
        desc = "Toggle autopreview",
      },
      {
        "<leader>ps",
        function()
          require("knap").forward_jump()
        end,
        desc = "Sync preview",
      },
    },
  },
}
