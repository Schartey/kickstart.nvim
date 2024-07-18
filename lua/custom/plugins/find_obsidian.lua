local pickers = require 'telescope.pickers'
local finders = require 'telescope.finders'
local sorters = require 'telescope.sorters'

return {
  find_obsidian = function(opts)
    local filetype = vim.bo.filetype

    opts = opts or {}
    pickers
      .new(opts, {
        finder = finders.new_oneshot_job({ 'rg', '-l', '#' .. filetype, '/home/ronaldschartmuller/obsidian/vaults/' }, opts),
        sorter = sorters.get_generic_fuzzy_sorter(opts),
      })
      :find()
  end,
}
