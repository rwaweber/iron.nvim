local extend = require("iron.util.tables").extend
local lf = require("iron.fts.common").lf
local python = {}

local format = function(open, close, endline)
  return function(lines)
    if #lines == 1 then
      return { lines[1] .. endline }
    else
      local new = { open .. lines[1] }
      for line=2, #lines do
        table.insert(new, lines[line])
      end
      return extend(new, close .. endline)
    end
  end
end

local def = function(cmd)
  return {
    command = cmd,
    format = format("\27[200~", "\27[201~", "\27" .. lf)
  }
end

python.ptipython = def({"ptipython"})
python.ipython = def({"ipython", "--no-autoindent"})
python.ptpython = def({"ptpython"})
python.python = {
  command = {"python"},
  close = {""}
}

return python
