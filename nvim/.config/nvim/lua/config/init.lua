-- Setup <leader> and <localleader>
-- This is required by Lazy.nvim
require("config.leader")

-- Load lazy.nvim
require("config.lazy")

-- Other configurations
require("config.options")
-- require("config.colorscheme")
require("config.keymaps").init()
-- require("config.commands")
