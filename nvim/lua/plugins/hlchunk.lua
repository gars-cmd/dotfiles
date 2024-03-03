return {
    "shellRaining/hlchunk.nvim",
      event = { "UIEnter" },
  config = function()
        require("hlchunk").setup({
            chunk = {
                chars = {
                    horizontal_line = "─",
                    vertical_line = "│",
                    left_top = "┌",
                    left_bottom = "└",
                    right_arrow = "─",
                },
                style = "#ffffff"
            },
            line_num = {
                style = "#ffffff"
            },
            blank = {
                chars = {
                    " ",
                }
            }
        })
  end
}
