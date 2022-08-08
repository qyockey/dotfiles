local nnoremap = require("quinn.keymap").nnoremap
local vnoremap = require("quinn.keymap").vnoremap
local xnoremap = require("quinn.keymap").xnoremap
local inoremap = require("quinn.keymap").inoremap

-- The function is called `t` for `termcodes`.
-- You don't have to call it that, but I find the terseness convenient
local function t(str)
    -- Adjust boolean arguments as needed
    return vim.api.nvim_replace_termcodes(str, true, true, true)
end

local function nextChar()
    return vim.fn.strpart(vim.fn.getline('.'), vim.fn.col('.')-1, 1)
end

local function prevChar()
    return vim.fn.strpart(vim.fn.getline('.'), vim.fn.col('.')-2, 1)
end

local function hasValue (array, val)
    for index, value in ipairs(array) do
        if value == val then
            return true
        end
    end
    return false
end

local function isOpenGrouping(char)
    return hasValue({"(","[","{","<"}, char)
end

local function isCloseGrouping(char)
    return hasValue({")","]","}",">"}, char)
end

local function isGrouping(char)
    return hasValue({"(",")","[","]","{","}","<",">"}, char)
end

nnoremap("<leader>.","<cmd>Ex<CR>")
nnoremap("H","^")
nnoremap("L","$")
nnoremap("K","{")
nnoremap("J","}")
nnoremap("Y","y$")

inoremap("jj","<esc>")
inoremap("<bs>","<nop>")
inoremap("<del>","<nop>")
-- delete both with delete functions
inoremap("<c-l>",function()
    return isGrouping(nextChar()) and '<right><esc>mm%x`ms' or '<del>'
end, {expr = true})
inoremap("<c-h>",function()
    return isGrouping(prevChar()) and '<esc>mm%x`ms' or '<bs>'
end, {expr = true})

-- tabbing
nnoremap("<Tab>",">>")
nnoremap("<S-Tab>","<<")
vnoremap("<Tab>",">><Esc>gv")
vnoremap("<S-Tab>","<<<Esc>gv")

-- add closing bracket unless in middle of line
inoremap('(',function()
    return nextChar() == '' and '()<left>' or '('
end, {expr = true})
inoremap('[',function()
    return nextChar() == '' and '[]<left>' or '['
end, {expr = true})
inoremap('{',function()
    return nextChar() == '' and '{}<left>' or '{'
end, {expr = true})
inoremap('<',function()
    return nextChar() == '' and '><left><' or '<'
end, {expr = true})
-- close with return
inoremap("<cr>",function()
    return isCloseGrouping(nextChar()) and '<cr><c-o><s-o>' or '<cr>'
end, {expr = true})
-- close brackets
inoremap(')',function()
    return nextChar() == ')' and '<Right>' or ')'
end, {expr = true})
inoremap(']',function()
    return nextChar() == ']' and '<Right>' or ']'
end, {expr = true})
inoremap('}',function()
    return nextChar() == '}' and '<Right>' or '}'
end, {expr = true})
inoremap('>',function()
    return nextChar() == '>' and '<Right>' or '>'
end, {expr = true})
-- enclose word in normal mode
nnoremap("'", "<right>mmBi'<esc>Ea'<esc>`m")
nnoremap("\"", "<right>mmBi\"<esc>Ea\"<esc>`m")
nnoremap("(", "<right>mmBi(<esc>Ea)<esc>`m")
nnoremap("[", "<right>mmBi[<esc>Ea]<esc>`m")
nnoremap("{", "<right>mmBi{<esc>Ea}<esc>`m")
-- enclose gouping in visual mode
vnoremap("'", "<esc>`<i'<esc>`>a<right>'<esc>")
vnoremap("\"","<esc>`<i\"<esc>`>a<right>\"<esc>")
vnoremap("(", "<esc>`<i(<esc>`>a<right>)<esc>")
vnoremap("[", "<esc>`<i[<esc>`>a<right>]<esc>")
vnoremap("{", "<esc>`<i{<esc>`>a<right>}<esc>")
