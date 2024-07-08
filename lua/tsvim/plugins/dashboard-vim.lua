logo = [[
   /\\\                                  /\\\                           
 /\\\\\\\\\\\  /\\\\\\\\\\  /\\\    /\\\ \///     /\\\\\  /\\\\\        
 \////\\\////  \/\\\//////  \//\\\  /\\\   /\\\  /\\\///\\\\\///\\\     
     \/\\\      \/\\\\\\\\\\  \//\\\/\\\   \/\\\ \/\\\ \//\\\  \/\\\    
      \/\\\ /\\  \////////\\\   \//\\\\\    \/\\\ \/\\\  \/\\\  \/\\\   
       \//\\\\\    /\\\\\\\\\\    \//\\\     \/\\\ \/\\\  \/\\\  \/\\\  
         \/////    \//////////      \///      \///  \///   \///   \///  
  ]]
local version = ' node ' .. vim.fn.system 'node --version'
version = version.gsub(version, '\n', ' ')
local padding = string.rep(' ', 12 - (#version / 2))
logo = logo .. '\n' .. padding .. '[ ' .. version .. ' ]'

local exploreCwd = function()
  require('neo-tree.command').execute { toggle = true, dir = vim.uv.cwd() }
end

local function getFortune()
  return require('fortune').get_fortune()
end

return {
  'nvimdev/dashboard-nvim',
  opts = function()
    logo = string.rep('\n', 8) .. logo .. '\n\n'

    local opts = {
      theme = 'doom',
      hide = {
        -- this is taken care of by lualine
        -- enabling this messes up the actual laststatus setting after loading a file
        statusline = false,
      },
      config = {
        header = vim.split(logo, '\n'),
        -- stylua: ignore
        center = {
          { action = "Telescope find_files", desc = " Find File", icon = " ", key = "f" },
          { action = "ene | startinsert", desc = " New File", icon = " ", key = "n" },
          { action = "Telescope oldfiles", desc = " Recent Files", icon = " ", key = "r" },
          { action = "Telescope live_grep", desc = " Search", icon = " ", key = "s" },
          { action = exploreCwd, desc = " Explore", icon = "󰙅 ", key = "e" },
          { action = [[print('not ready')]], desc = " Config", icon = " ", key = "c" },
          { action = "qa", desc = " Quit", icon = " ", key = "q" },
        },
        footer = function()
          local stats = require('lazy').stats()
          local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
          local info = { '⚡ Neovim loaded ' .. stats.loaded .. '/' .. stats.count .. ' plugins in ' .. ms .. 'ms' }
          local fortune = getFortune()
          local footer = vim.list_extend(info, fortune)
          return footer
        end,
      },
    }

    for _, button in ipairs(opts.config.center) do
      button.desc = button.desc .. string.rep(' ', 43 - #button.desc)
      button.key_format = '  %s'
    end

    -- close Lazy and re-open when the dashboard is ready
    if vim.o.filetype == 'lazy' then
      vim.cmd.close()
      vim.api.nvim_create_autocmd('User', {
        pattern = 'DashboardLoaded',
        callback = function()
          require('lazy').show()
        end,
      })
    end

    return opts
  end,
}
