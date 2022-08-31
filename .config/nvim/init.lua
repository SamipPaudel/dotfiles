require('user.settings')
require('user.keybindings')
require('user.autocmd')
require('user.plugins')


-- vim.cmd "colorscheme catppuccin"



---Pretty print lua table
function _G.dump(...)
    local objects = vim.tbl_map(vim.inspect, { ... })
    print(unpack(objects))
end





