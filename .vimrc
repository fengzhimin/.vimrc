" 设置NerdTree
map <F3> :NERDTreeMirror<CR>
map <F3> :NERDTreeToggle<CR>

"
" taglist
"
"不同时显示多个文件的tag，仅显示一个
let Tlist_Show_One_File = 1
let Tlist_WinWidth=40        "设置taglist宽度
let Tlist_Exit_OnlyWindow=1  "tagList窗口是最后一个窗口，则退出Vim
let Tlist_Use_Right_Window=1 "在Vim窗口右侧显示taglist窗口
"设置taglist打开关闭的快捷键F4
map <F4> :TlistToggle<CR>

"语法高亮
syntax on

"显示行号
set number

"自动缩进与C语言风格缩进
set autoindent
set cindent

"缩进宽度
set tabstop=4
set softtabstop=4
set shiftwidth=4
"建议开启expandtab选项，会自动将tab扩展很空格，代码缩进会更美观
"set expandtab
set noexpandtab

"switch case 对齐风格
set cino=g0,:0

inoremap " ""<ESC>i
inoremap ' ''<ESC>i
inoremap ( ()<ESC>i
inoremap [ []<ESC>i
inoremap { {}<ESC>i
inoremap < <><ESC>i

"开启光亮光标行
set cursorline
"hi CursorLine   cterm=NONE ctermbg=darkred ctermfg=white guibg=green guifg=blue

"开启高亮光标列
set cursorcolumn
"hi CursorColumn cterm=NONE ctermbg=darkred ctermfg=white guibg=green guifg=blue

"colorscheme evening

"自动写入作者信息
map <F5> :call TitleDet()<cr>
function AddTitle()
    call append(0,"/******************************************************")
    call append(1,"* Author       : fengzhimin")
    call append(2,"* Create       : ".strftime("%Y-%m-%d %H:%M"))
    call append(3,"* Last modified: ".strftime("%Y-%m-%d %H:%M"))
    call append(4,"* Email        : 374648064@qq.com")
    call append(5,"* Filename     : ".expand("%:t"))
    call append(6,"* Description  : ")
    call append(7,"******************************************************/")
    echohl WarningMsg | echo "Successful in adding copyright." | echohl None
endf
 
function UpdateTitle()
     normal m'
     execute '/* Last modified/s@:.*$@\=strftime(": %Y-%m-%d %H:%M")@'
     normal ''
     normal mk
     execute '/* Filename/s@:.*$@\=": ".expand("%:t")@'
     execute "noh"
     normal 'k
     echohl WarningMsg | echo "Successful in updating the copyright." | echohl None
endfunction

function TitleDet()
    let n=1
    while n < 10
        let line = getline(n)
        if line =~ '^\*\s*\S*Last\smodified\S*.*$'
            call UpdateTitle()
            return
        endif
        let n = n + 1
    endwhile
    call AddTitle()
endfunction
