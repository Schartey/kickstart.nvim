local pickers = require 'telescope.pickers'
local finders = require 'telescope.finders'
local sorters = require 'telescope.sorters'

return {
  find_obsidian = function(active_workspace, workspaces, opts)
    opts = opts or {}
    for _, workspace in pairs(workspaces) do
      if workspace.name == active_workspace then
        print('Searching in ' .. workspace.path)
        pickers
          .new(opts, {
            finder = finders.new_oneshot_job({ 'rg', '-l', '#', workspace.path }, opts),
            sorter = sorters.get_generic_fuzzy_sorter(opts),
          })
          :find()
      end
    end
  end,
  find_obsidian_quick = function(opts)
    local filetype = vim.bo.filetype

    opts = opts or {}
    pickers
      .new(opts, {
        finder = finders.new_oneshot_job({ 'rg', '-l', '#' .. filetype, '/home/ronaldschartmuller/obsidian/vaults/' }, opts),
        sorter = sorters.get_generic_fuzzy_sorter(opts),
      })
      :find()
  end,
  find_obsidian_tag = function(active_workspace, workspaces, tag, opts)
    opts = opts or {}
    for _, workspace in pairs(workspaces) do
      if workspace.name == active_workspace then
        print('Searching in ' .. workspace.path .. ' with tag ' .. tag)
        pickers
          .new(opts, {
            finder = finders.new_oneshot_job({ 'rg', '-l', '#' .. tag, workspace.path }, opts),
            sorter = sorters.get_generic_fuzzy_sorter(opts),
          })
          :find()
      end
    end
  end,
}
