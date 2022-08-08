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

local function hasValue (arr, val)
    for index, value in ipairs(arr) do
        if value == val then
            return true
        end
    end
    return false
end

nnoremap("<leader>.","<cmd>Ex<CR>")
nnoremap("H","^")
nnoremap("L","$")
nnoremap("K","{")
nnoremap("J","}")

inoremap("<C-h>","<BS>")
inoremap("<C-l>","<Del>")
inoremap("jj","<Esc>")

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
    return nextChar() == '' and '<><left>' or '<'
end, {expr = true})
--inoremap("(","()<Left>")
--inoremap("[","[]<Left>")
--inoremap("{","{}<Left>")
--inoremap("<","<><Left>")
-- close with return}
inoremap("<cr>",function()
    return hasValue({")","]","}",}, nextChar()) and '<cr><c-o><s-o>' or '<cr>'
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
nnoremap("'", "<right>mmbi'<esc>ea'<esc>`m")
nnoremap("\"", "<right>mmbi\"<esc>ea\"<esc>`m")
nnoremap("(", "<right>mmbi(<esc>ea)<esc>`m")
nnoremap("[", "<right>mmbi[<esc>ea]<esc>`m")
nnoremap("{", "<right>mmbi{<esc>ea}<esc>`m")
-- enclose gouping in visual mode
vnoremap("'", "<esc>`<i'<esc>`>a<right>'<esc>")
vnoremap("\"","<esc>`<i\"<esc>`>a<right>\"<esc>")
vnoremap("(", "<esc>`<i(<esc>`>a<right>)<esc>")
vnoremap("[", "<esc>`<i[<esc>`>a<right>]<esc>")
vnoremap("{", "<esc>`<i{<esc>`>a<right>}<esc>")

