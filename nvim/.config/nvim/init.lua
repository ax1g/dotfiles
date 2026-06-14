-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

-- Forward Ctrl+L to clear the screen inside Neovim's terminal
vim.keymap.set("t", "<C-l>", function()
  local chan = vim.bo.channel
  if chan > 0 then
    vim.api.nvim_chan_send(chan, "\x0c")
  end
end, { desc = "Clear terminal screen", silent = true })

vim.opt.clipboard = "unnamedplus"
