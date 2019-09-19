;;; init.el -*- lexical-binding: t; -*-

;; Copy this file to ~/.doom.d/init.el or ~/.config/doom/init.el ('doom
;; quickstart' will do this for you). The `doom!' block below controls what
;; modules are enabled and in what order they will be loaded. Remember to run
;; 'doom refresh' after modifying it.
;;
;; More information about these modules (and what flags they support) can be
;; found in modules/README.org.

(doom! :input

       :completion
       company               ; https://company-mode.github.io/
       ivy                   ; https://oremacs.com/swiper/

       :ui
       doom                  ; what makes DOOM look the way it does
       doom-dashboard        ; a nifty splash screen for Emacs
       doom-quit             ; DOOM quit-message prompts when you quit Emacs
       fill-column           ; a `fill-column' indicator
       hl-todo               ; highlight TODO/FIXME/NOTE tags
       indent-guides         ; highlighted indent columns
       modeline              ; snazzy, Atom-inspired modeline, plus API
       nav-flash             ; blink the current line after jumping
       ophints               ; highlight the region an operation acts on
       (popup                ; tame sudden yet inevitable temporary windows
        +all                 ; catch all popups that start with an asterix
        +defaults)           ; default popup rules
       treemacs              ; a project drawer, like neotree but cooler
       vc-gutter             ; vcs diff in the fringe
       vi-tilde-fringe       ; fringe tildes to mark beyond EOB
       window-select         ; visually switch windows
       workspaces            ; tab emulation, persistence & separate workspaces

       :editor
       (evil +everywhere)    ; come to the dark side, we have cookies
       file-templates        ; auto-snippets for empty files
       fold                  ; (nigh) universal code folding
       multiple-cursors      ; editing in many places at once
       rotate-text           ; cycle region at point between text candidates
       snippets              ; my elves. They type so I don't have to

       :emacs
       (dired                ; making dired pretty [functional]
       ;;+ranger             ; bringing the goodness of ranger to dired
       ;;+icons              ; colorful icons for dired-mode
        )
       electric              ; smarter, keyword-based electric-indent
       vc                    ; version-control

       :term
       term                  ; terminals in Emacs

       :tools
       docker
       ein                   ; tame Jupyter notebooks with emacs
       eval                  ; run code, run (also, repls)
       flycheck              ; tasing you for every semicolon you forget
       (lookup               ; helps you navigate your code and documentation
        +docsets)            ; ...or in Dash docsets locally
       macos                 ; MacOS-specific commands
       magit                 ; a git porcelain for Emacs
       rgb                   ; creating color strings
       tmux                  ; an API for interacting with tmux
       upload                ; map local to remote projects via ssh/ftp
       ;;editorconfig        ; let someone else argue about tabs vs spaces

       :lang
       data                  ; config/data formats
       emacs-lisp            ; drown in parentheses
       ess                   ; emacs speaks statistics
       markdown              ; writing docs for people to ignore
       (org                  ; organize your plain life in plain text
        +attach              ; custom attachment system
        +babel               ; running code in org
        +capture             ; org-capture in and outside of Emacs
        +export              ; Exporting org to whatever you want
        +habit               ; Keep track of your habits
        +present             ; Emacs for presentations
        +protocol)           ; Support for org-protocol:// links
       python                ; beautiful is better than ugly
       ruby                  ; 1.step {|i| p "Ruby is #{i.even? ? 'love' : 'life'}"}
       rust                  ; Fe2O3.unwrap().unwrap().unwrap().unwrap()
       sh                    ; shell
       web                   ; html, css
       ;;cc                  ; C/C++/Obj-C madness
       ;;clojure             ; java with a lisp
       ;;common-lisp         ; if you've seen one lisp, you've seen them all
       ;;go                  ; the hipster dialect
       ;;(haskell +intero)   ; a language that's lazier than I am
       ;;(java +meghanada)   ; the poster child for carpal tunnel syndrome
       ;;javascript          ; all(hope(abandon(ye(who(enter(here))))))
       ;;julia               ; a better, faster MATLAB
       ;;latex               ; writing papers in Emacs has never been so fun
       ;;lua                 ; one-based indices? one-based indices
       ;;perl                ; write code no one else can comprehend
       ;;php                 ; perl's insecure younger brother
       ;;rest                ; Emacs as a REST client
       ;;solidity            ; do you need a blockchain? No.
       ;;swift               ; who asked for emoji variables?

       :config
       ;; The default module sets reasonable defaults for Emacs. It also
       ;; provides a Spacemacs-inspired keybinding scheme and a smartparens
       ;; config. Use it as a reference for your own modules.
       (default +bindings +smartparens))
