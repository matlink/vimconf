"Ma config à moi :)
" Annule la compatibilite avec l’ancetre Vi : totalement indispensable
set nocompatible

call pathogen#infect()
" -- Affichage
set title "Met a jour le titre de votre fenetre ou de votre terminal
set number "Affiche le numero des lignes
set ruler "Affiche la position actuelle du curseur
set wrap "Affiche les lignes trop longues sur plusieurs lignes

set scrolloff=3 "Affiche un minimum de 3 lignes autour du curseur (pour le scroll)

" -- Recherche
set ignorecase "Ignore la casse lors d’une recherche
set smartcase "Si une recherche contient une majuscule, re-active la sensibilite a la casse 

set incsearch "Surligne les resultats de recherche pendant la saisie
set hlsearch "Surligne les resultats de recherche

set visualbell "Empeche Vim de beeper
set noerrorbells "Empeche Vim de beeper

" Active le comportement ’habituel’ de la touche retour en arriere
set backspace=indent,eol,start

" Cache les fichiers lors de l’ouverture d’autres fichiers
set hidden

"set background=dark
"colorscheme solarized
" Active la coloration syntaxique
syntax enable
" Active les comportements specifiques aux types de fichiers comme
" la syntaxe et l’indentation
filetype on
"filetype plugin on
"filetype indent on

set guifont=Ubuntu\ Mono
set antialias
"
" Run nerdtree when nofile specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

autocmd FileType markdown set spell spelllang=fr

" type de listing pour netrw
let g:netrw_liststyle=3

" switch entre les tab
map <F7> :tabp<CR>
map <F8> :tabn<CR>

" map leader
let mapleader = ","

" combinaison pour ctrlp
let g:ctrlp_map = '<leader>c'

" alias pour save avec sudo --> :sudow
cnoreabbrev sudow w !sudo tee %
set autoindent
"set smartindent
set tabstop=4

au BufNewFile,BufRead *.sage set filetype=python
let s:comment_map = { 
    \   "c": '\/\/',
    \   "cpp": '\/\/',
    \   "go": '\/\/',
    \   "java": '\/\/',
    \   "javascript": '\/\/',
    \   "lua": '--',
    \   "scala": '\/\/',
    \   "php": '\/\/',
    \   "python": '#',
    \   "ruby": '#',
    \   "rust": '\/\/',
    \   "sh": '#',
    \   "desktop": '#',
    \   "fstab": '#',
    \   "conf": '#',
    \   "profile": '#',
    \   "bashrc": '#',
    \   "bash_profile": '#',
    \   "mail": '>',
    \   "eml": '>',
    \   "bat": 'REM',
    \   "ahk": ';',
    \   "vim": '"',
    \   "tex": '%',
    \ }

function! ToggleComment()
    if has_key(s:comment_map, &filetype)
        let comment_leader = s:comment_map[&filetype]
        if getline('.') =~ "^\\s*" . comment_leader . " " 
            " Uncomment the line
            execute "silent s/^\\(\\s*\\)" . comment_leader . " /\\1/"
        else 
            if getline('.') =~ "^\\s*" . comment_leader
                " Uncomment the line
                execute "silent s/^\\(\\s*\\)" . comment_leader . "/\\1/"
            else
                " Comment the line
                execute "silent s/^\\(\\s*\\)/\\1" . comment_leader . " /"
            end
        end
    else
        echo "No comment leader found for filetype"
    end
endfunction


nnoremap <leader><Space> :call ToggleComment()<cr>
vnoremap <leader><Space> :call ToggleComment()<cr>
