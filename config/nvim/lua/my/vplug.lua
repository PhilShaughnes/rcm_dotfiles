-- based on https://dev.to/vonheikemen/neovim-using-vim-plug-in-lua-3oom

local Plug = {
  begin = vim.fn['plug#begin'],

  -- "end" is a keyword, need something else
  done = vim.fn['plug#end']
}

-- "Meta-functions"
local meta = {

  -- Function call "operation"
  __call = function(self, repo, opts)
    opts = opts or vim.empty_dict()

    -- we declare some aliases for `do` and `for` since they are keywords
    opts['do'] = opts.run
    opts.run = nil

    opts['for'] = opts.ft
    opts.ft = nil

    vim.call('plug#', repo, opts)
    opts.config()
  end
}

-- Meta-tables are awesome
return setmetatable(Plug, meta)
