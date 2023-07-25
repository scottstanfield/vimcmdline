function! DuckDBSourceLines(lines)
    call writefile(a:lines, g:cmdline_tmp_dir . "/duckdb.sql")
    call cmdline#SendCmd(". " . g:cmdline_tmp_dir . "/duckdb.sql")
endfunction

let b:cmdline_nl = "\n"
let b:cmdline_app = "duckdb"
let b:cmdline_quit_cmd = ".quit"
let b:cmdline_source_fun = function("DuckDBSourceLines")
let b:cmdline_send_empty = 0
let b:cmdline_filetype = "sql"

if !exists("g:cmdline_map_start")
    let g:cmdline_map_start = "<LocalLeader>s"
endif
exe 'nmap <buffer><silent> ' . g:cmdline_map_start . ' :call cmdline#StartApp()<CR>'
