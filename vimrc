"Ma config à moi :)
" Annule la compatibilite avec l’ancetre Vi : totalement indispensable
set nocompatible

call pathogen#infect()
autocmd vimenter * NERDTree
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
filetype plugin on
filetype indent on

set guifont=Ubuntu\ Mono
set antialias
autocmd vimenter * highlight LineNr ctermfg=0

" type de listing pour netrw
let g:netrw_liststyle=3

" switch entre les tab
map <F7> :tabp<CR>
map <F8> :tabn<CR>

" map leader
let mapleader = ","

" combinaison pour ctrlp
let g:ctrlp_map = '<leader>c'
