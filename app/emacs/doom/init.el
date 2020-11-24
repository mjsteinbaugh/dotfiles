;;; init.el -*- lexical-binding: t; -*-

;; This file controls what Doom modules are enabled and what order they load
;; in. Remember to run 'doom sync' after modifying it!

;; NOTE Press 'SPC h d h' (or 'C-h d h' for non-vim users) to access Doom's
;;      documentation. There you'll find a "Module Index" link where you'll find
;;      a comprehensive list of Doom's modules and what flags they support.

;; NOTE Move your cursor over a module's name (or its flags) and press 'K' (or
;;      'C-c c k' for non-vim users) to view its documentation. This works on
;;      flags as well (those symbols that start with a plus).
;;
;;      Alternatively, press 'gd' (or 'C-c c d') on a module to browse its
;;      directory (for easy access to its source code).

;; Example: https://github.com/hlissner/doom-emacs/blob/develop/init.example.el

(doom! :input

       :completion
       company
       ivy

       :ui
       doom
       doom-dashboard
       doom-quit
       fill-column
       hl-todo
       indent-guides
       modeline
       ophints
       (popup +defaults)
       treemacs
       (unicode +emoji)
       vc-gutter
       vi-tilde-fringe
       window-select
       workspaces

       :editor
       (evil +everywhere)
       file-templates
       fold
       ;;(format +onsave)
       snippets
       word-wrap

       :emacs
       dired
       electric
       undo
       vc

       :term
       ;;eshell            ; the elisp shell that works everywhere
       ;;shell             ; simple shell REPL for Emacs
       ;;term              ; basic terminal emulator for Emacs
       vterm               ; the best terminal emulation in Emacs

       :checkers
       syntax

       :tools
       docker
       editorconfig
       ein
       (eval +overlay)
       lookup
       magit
       pass
       rgb
       tmux
       upload

       :os
       (:if IS-MAC macos)

       :lang
       ;;clojure
       data
       emacs-lisp
       ess
       ;;(go +lsp)
       ;;(haskell +dante)
       json
       ;;(java +meghanada)
       ;;javascript
       ;;julia
       latex
       markdown
       org
       ;;php
       python
       (ruby +rails)
       ;;rust
       sh
       ;;swift
       yaml

       :config
       (default +bindings +smartparens))
