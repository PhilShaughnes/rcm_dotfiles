setlocal spell
set wrap linebreak

" autocmd VimResized * | set columns=120

" setlocal colorcolumn=72
setlocal textwidth=72

" autoformat (a), and recognize numbers (n)
setlocal formatoptions+=n

" markdown plugin options
let g:vim_markdown_follow_anchor = 1
let g:vim_markdown_frontmatter = 1  " for YAML format
let g:vim_markdown_toml_frontmatter = 1  " for TOML format
let g:vim_markdown_json_frontmatter = 1  " for JSON format

