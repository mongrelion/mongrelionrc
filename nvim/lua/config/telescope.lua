require("telescope").load_extension("ui-select")
require("telescope").setup {
  pickers = {
    colorscheme = {
      enable_preview = true,
      theme = "dropdown",
      prompt_title = "Colorschemes",
      results_title = false,
      previewer = false,
      layout_config = {
        width = 0.2,
        height = 0.5,
      },
    },
  }
}
