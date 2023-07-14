require('text-to-colorscheme').setup {
  ai = {
    openai_api_key = "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",
    gpt_model = "gpt-3.5-turbo-0613",
  },
}

vim.cmd([[colorscheme text-to-colorscheme]])
