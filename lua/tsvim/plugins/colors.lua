-- colorschemes chosen have light and dark colorschemes
-- they often have highlight groups for a variety of nvim plugins like dap, lualine, etc

local function setColorScheme(name)
  return function()
    vim.cmd('colorscheme ' .. name)
  end
end

local color = { 'catppuccin/nvim', name = 'catppuccin', config = setColorScheme 'catppuccin' }
color.lazy = false
color.priority = 1000

return {
  color,
}
