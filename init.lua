------------------------------
-- Config: init
------------------------------

-- Set Leader Keys
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Init Files
require ("config.options")
require ("config.lazy")
require ("config.remaps")
require ("config.auto")
