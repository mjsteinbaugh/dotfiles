;; -*- mode: emacs-lisp -*-
;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.
;; Updated 2019-09-18.
;;
;; Spacemacs cheatsheet:
;; https://steinbaugh.com/posts/spacemacs.html
;;
;; |command          | action                      |
;; |-----------------|-----------------------------|
;; | SPC f e D       | Diff config against default |
;; | SPC f e R       | Reload config               |
;; | SPC q q         | Quit                        |
;; | :w              | Save (vim style)            |
;; | SPC f f         | File browser                |
;; | SPC w           | Split window horizontally   |
;; | SPC w /         | Split window vertically     |
;; | SPC 1           | Switch to window 1          |
;; | SPC 2           | Switch to window 2          |
;; | SPC t n         | Toggle line numbers         |
;; | SPC t f         | Toggle fill (margin) column |
;; | SPC t w         | Toggle whitespace           |
;; | M-x R           | Launch ESS / R              |
;; | M-x ess-version | Check ESS version           |
;;
;; Using evil code folding mode:
;;
;; | cmd | action            |
;; |-----|-------------------|
;; | za  | toggle visibility |
;; | zc  | close             |
;; | zo  | open              |
;; | zm  | close all         |
;; | zr  | open all          |

;; Manually update spacemacs (in shell):
;; > ( cd ~/.emacs.d; git pull --rebase )
;;
;; TRAMP (Transparent Remove Access, Multiple Protocols) is a package for
;; editing remote files from within emacs.
;; https://www.gnu.org/software/tramp/
;; https://medium.com/@Drowzy/tramp-in-spacemacs-ef82b9e703ee
;;
;; Right margin indicator.
;; Use `M-q' to automatically fill paragraphs to fill-column value.
;; Refer to `turn-on-fci-mode', `fill-column' for details.
;;
;; See also:
;; - Beginner's tutorial
;;   https://github.com/syl20bnr/spacemacs/blob/master/doc/BEGINNERS_TUTORIAL.org
;; - An introduction to Spacemacs
;;   https://spin.atomicobject.com/2016/08/30/introduction-to-spacemacs/
;; - Actually getting spacemacs to do stuff
;;   http://paul-gowder.com/emacs.html
;; - Default template
;;   https://github.com/syl20bnr/spacemacs/blob/master/core/templates/.spacemacs.template
;; - shell layer
;;   https://github.com/syl20bnr/spacemacs/tree/master/layers/%2Btools/shell
;; - ess layer
;;   https://github.com/syl20bnr/spacemacs/tree/master/layers/%2Blang/ess
;; - Right margin indicator
;;   https://github.com/syl20bnr/spacemacs/issues/4856#issuecomment-176650964
;;
;; Reference dotfiles:
;; - https://github.com/roryk/dotfiles/blob/master/spacemacs
;; - https://github.com/mattnedrich/spacemacs-configuration/blob/master/.spacemacs
;; - https://github.com/practicalli/spacemacs-config/blob/master/.spacemacs
;; - https://github.com/jsmestad/dfiles/blob/master/.spacemacs.d/init.el
;;
(defun dotspacemacs/layers ()
  "Configuration Layers declaration.
You should not put any user code in this function besides modifying the variable
values."
  (setq-default
   ;; Base distribution to use. This is a layer contained in the directory
   ;; `+distribution'. For now available distributions are `spacemacs-base'
   ;; or `spacemacs'. (default 'spacemacs)
   dotspacemacs-distribution 'spacemacs
   ;; Lazy installation of layers (i.e. layers are installed only when a file
   ;; with a supported type is opened). Possible values are `all', `unused'
   ;; and `nil'. `unused' will lazy install only unused layers (i.e. layers
   ;; not listed in variable `dotspacemacs-configuration-layers'), `all' will
   ;; lazy install any layer that support lazy installation even the layers
   ;; listed in `dotspacemacs-configuration-layers'. `nil' disable the lazy
   ;; installation feature and you have to explicitly list a layer in the
   ;; variable `dotspacemacs-configuration-layers' to install it.
   ;; (default 'unused)
   dotspacemacs-enable-lazy-installation 'unused
   ;; If non-nil then Spacemacs will ask for confirmation before installing
   ;; a layer lazily. (default t)
   dotspacemacs-ask-for-lazy-installation t
   ;; If non-nil layers with lazy install support are lazy installed.
   ;; List of additional paths where to look for configuration layers.
   ;; Paths must have a trailing slash (i.e. `~/.mycontribs/')
   dotspacemacs-configuration-layer-path '()
   ;; List of configuration layers to load.
   dotspacemacs-configuration-layers
   '(
     ;; Pick either `helm' or `ivy'.
     ;;
     ;; Themes:
     ;; > base16-themes
     ;; > doom-themes
     ;; > themes-megapack
     ;;
     ;; Productivity:
     ;; > (auto-completion :variables
     ;; >                  auto-completion-enable-sort-by-usage t)
     ;; > copy-as-format
     ;; > multiple-cursors
     ;; > spell-checking
     ;; > (unicode-fonts :variables
     ;; >                unicode-fonts-force-multi-color-on-mac t)
     ;;
     ;; Languages:
     ;; > (c-c++ :variables
     ;; >        c-c++-backend 'lsp-ccls
     ;; >        c-c++-default-mode-for-headers 'c++-mode
     ;; >        c-c++-enable-clang-format-on-save t
     ;; >        c-c++-enable-clang-support t)
     ;; > common-lisp
     ;; > clojure
     ;; > (go :variables
     ;; >     go-backend 'lsp
     ;; >     go-format-before-save t
     ;; >     go-use-test-args "-race -timeout 10s"
     ;; >     godoc-at-point-function 'godoc-gogetdoc)
     ;; > emoji
     ;; > (javascript :variables
     ;; >             javascript-backend 'lsp
     ;; >             javascript-fmt-tool 'web-beautify
     ;; >             js-indent-level 2
     ;; >             js2-basic-offset 2
     ;; >             node-add-modules-path t)
     ;; > js-mocha
     ;; > julia
     ;; > pandoc
     ;; > php
     ;; > racket
     ;; > react
     ;; > ruby-on-rails
     ;; > swift
     ;; > (typescript :variables
     ;; >             typescript-backend 'lsp
     ;; >             typescript-fmt-on-save t)
     ;;
     better-defaults
     csv
     docker
     evil-commentary
     emacs-lisp
     (ess :variables
          ;; Manual: https://ess.r-project.org/Manual/ess.html
          ;; Customize pop out settings in shell section.
          ess-ask-for-ess-directory nil
          ess-eval-visibly-p nil
          ess-fancy-comments nil
          ess-indent-with-fancy-comments nil
          ess-language "R"
          ess-style 'RStudio
          ess-use-flymake t
          inferior-R-args "--no-restore --no-save")
     git
     html
     ipython-notebook
     ivy
     json
     markdown
     org
     osx
     (python :variables
             python-test-runner 'pytest)
     (ruby :variables
           ruby-backend 'lsp
           ruby-test-runner 'rspec
           ruby-version-manager 'rbenv)
     rust
     (shell :variables
            ;; > shell-default-position 'right
            ;; > shell-default-width 80
            shell-default-position 'bottom
            shell-default-height 30)
     syntax-checking
     version-control
     vimscript
     yaml
     )
   ;; List of additional packages that will be installed without being
   ;; wrapped in a layer. If you need some configuration for these
   ;; packages, then consider creating a layer. You can also put the
   ;; configuration in `dotspacemacs/user-config'.
   dotspacemacs-additional-packages
   '(
     poly-R
     poly-markdown
     poly-noweb
     polymode
     tramp-term
     )
   ;; A list of packages that cannot be updated.
   dotspacemacs-frozen-packages '()
   ;; A list of packages that will not be installed and loaded.
   dotspacemacs-excluded-packages '()
   ;; Defines the behaviour of Spacemacs when installing packages.
   ;; Possible values are `used-only', `used-but-keep-unused' and `all'.
   ;; `used-only' installs only explicitly used packages and uninstall any
   ;; unused packages as well as their unused dependencies.
   ;; `used-but-keep-unused' installs only the used packages but won't uninstall
   ;; them if they become unused. `all' installs *all* packages supported by
   ;; Spacemacs and never uninstall them. (default is `used-only')
   dotspacemacs-install-packages 'used-only))

(defun dotspacemacs/init ()
  "Initialization function.
This function is called at the very startup of Spacemacs initialization
before layers configuration.
You should not put any user code in there besides modifying the variable
values."
  ;; This setq-default sexp is an exhaustive list of all the supported
  ;; spacemacs settings.
  (setq-default
   ;; If non nil ELPA repositories are contacted via HTTPS whenever it's
   ;; possible. Set it to nil if you have no way to use HTTPS in your
   ;; environment, otherwise it is strongly recommended to let it set to t.
   ;; This variable has no effect if Emacs is launched with the parameter
   ;; `--insecure' which forces the value of this variable to nil.
   ;; (default t)
   dotspacemacs-elpa-https t
   ;; Maximum allowed time in seconds to contact an ELPA repository.
   dotspacemacs-elpa-timeout 5
   ;; If non nil then spacemacs will check for updates at startup
   ;; when the current branch is not `develop'. Note that checking for
   ;; new versions works via git commands, thus it calls GitHub services
   ;; whenever you start Emacs. (default nil)
   dotspacemacs-check-for-update nil
   ;; If non-nil, a form that evaluates to a package directory. For example, to
   ;; use different package directories for different Emacs versions, set this
   ;; to `emacs-version'.
   dotspacemacs-elpa-subdirectory nil
   ;; One of `vim', `emacs' or `hybrid'.
   ;; `hybrid' is like `vim' except that `insert state' is replaced by the
   ;; `hybrid state' with `emacs' key bindings. The value can also be a list
   ;; with `:variables' keyword (similar to layers). Check the editing styles
   ;; section of the documentation for details on available variables.
   ;; (default 'vim)
   dotspacemacs-editing-style 'vim
   ;; If non nil output loading progress in `*Messages*' buffer. (default nil)
   dotspacemacs-verbose-loading nil
   ;; Specify the startup banner. Default value is `official', it displays
   ;; the official spacemacs logo. An integer value is the index of text
   ;; banner, `random' chooses a random text banner in `core/banners'
   ;; directory. A string value must be a path to an image format supported
   ;; by your Emacs build.
   ;; If the value is nil then no banner is displayed. (default 'official)
   dotspacemacs-startup-banner 'official
   ;; List of items to show in startup buffer or an association list of
   ;; the form `(list-type . list-size)`. If nil then it is disabled.
   ;; Possible values for list-type are:
   ;; `recents' `bookmarks' `projects' `agenda' `todos'."
   ;; List sizes may be nil, in which case
   ;; `spacemacs-buffer-startup-lists-length' takes effect.
   dotspacemacs-startup-lists '((recents . 5)
                                (projects . 7))
   ;; True if the home buffer should respond to resize events.
   dotspacemacs-startup-buffer-responsive t
   ;; Default major mode of the scratch buffer (default `text-mode')
   dotspacemacs-scratch-mode 'text-mode
   ;; List of themes, the first of the list is loaded when spacemacs starts.
   ;; Press <SPC> T n to cycle to the next theme in the list (works great
   ;; with 2 themes variants, one dark and one light)
   ;;
   ;; Core themes should work without layers.
   ;; https://github.com/syl20bnr/spacemacs/blob/master/core/core-themes-support.el
   ;;
   ;; Dracula colors are currently too bright and wonky with PuTTY.
   ;;
   ;; default:
   ;; - spacemacs-dark
   ;; - spacemacs-light
   ;;
   ;; themes-megapack:
   ;; - afternoon
   ;; - ample
   ;; - ample-zen
   ;; - colorsarenice-dark
   ;; - cyberpunk
   ;; - dracula
   ;; - farmhouse-dark
   ;; - flatland
   ;; - gruber-darker
   ;; - gruvbox
   ;; - hickey
   ;; - inkpot
   ;; - material
   ;; - monokai
   ;; - sanityinc-tomorrow-bright
   ;; - sanityinc-tomorrow-eighties
   ;; - sanityinc-tomorrow-night
   ;; - seti
   ;; - solarized-dark
   ;; - spacegray
   ;;
   ;; base16-themes:
   ;; - base16-oceanicnext
   ;; - base16-dracula
   ;; - base16-onedark
   ;; - base16-nord
   ;;
   ;; doom-themes:
   ;; - doom-dracula
   ;; - doom-nord
   ;;
   dotspacemacs-themes
   '(
     sanityinc-tomorrow-eighties
     dracula
     spacemacs-dark
     spacemacs-light
     )
   ;; If non nil the cursor color matches the state color in GUI Emacs.
   dotspacemacs-colorize-cursor-according-to-state t
   ;; Default font, or prioritized list of fonts. `powerline-scale' allows to
   ;; quickly tweak the mode-line size to make separators look not too crappy.
   ;; Fira Code or Source Code Pro are also good defaults.
   dotspacemacs-default-font '("SF Mono"
                               :size 16
                               :weight normal
                               :width normal
                               :powerline-scale 1.1)
   ;; The leader key
   dotspacemacs-leader-key "SPC"
   ;; The key used for Emacs commands (M-x) (after pressing on the leader key).
   ;; (default "SPC")
   dotspacemacs-emacs-command-key "SPC"
   ;; The key used for Vim Ex commands (default ":")
   dotspacemacs-ex-command-key ":"
   ;; The leader key accessible in `emacs state' and `insert state'
   ;; (default "M-m")
   dotspacemacs-emacs-leader-key "M-m"
   ;; Major mode leader key is a shortcut key which is the equivalent of
   ;; pressing `<leader> m`. Set it to `nil` to disable it. (default ",")
   dotspacemacs-major-mode-leader-key ","
   ;; Major mode leader key accessible in `emacs state' and `insert state'.
   ;; (default "C-M-m")
   dotspacemacs-major-mode-emacs-leader-key "C-M-m"
   ;; These variables control whether separate commands are bound in the GUI to
   ;; the key pairs C-i, TAB and C-m, RET.
   ;; Setting it to a non-nil value, allows for separate commands under <C-i>
   ;; and TAB or <C-m> and RET.
   ;; In the terminal, these pairs are generally indistinguishable, so this only
   ;; works in the GUI. (default nil)
   dotspacemacs-distinguish-gui-tab nil
   ;; If non nil `Y' is remapped to `y$' in Evil states. (default nil)
   dotspacemacs-remap-Y-to-y$ nil
   ;; If non-nil, the shift mappings `<' and `>' retain visual state if used
   ;; there. (default t)
   dotspacemacs-retain-visual-state-on-shift t
   ;; If non-nil, J and K move lines up and down when in visual mode.
   ;; (default nil)
   dotspacemacs-visual-line-move-text nil
   ;; If non nil, inverse the meaning of `g' in `:substitute' Evil ex-command.
   ;; (default nil)
   dotspacemacs-ex-substitute-global nil
   ;; Name of the default layout (default "Default")
   dotspacemacs-default-layout-name "Default"
   ;; If non nil the default layout name is displayed in the mode-line.
   ;; (default nil)
   dotspacemacs-display-default-layout nil
   ;; If non nil then the last auto saved layouts are resume automatically upon
   ;; start. (default nil)
   dotspacemacs-auto-resume-layouts nil
   ;; Size (in MB) above which spacemacs will prompt to open the large file
   ;; literally to avoid performance issues. Opening a file literally means that
   ;; no major mode or minor modes are active. (default is 1)
   dotspacemacs-large-file-size 1
   ;; Location where to auto-save files. Possible values are `original' to
   ;; auto-save the file in-place, `cache' to auto-save the file to another
   ;; file stored in the cache directory and `nil' to disable auto-saving.
   ;; (default 'cache)
   dotspacemacs-auto-save-file-location 'cache
   ;; Maximum number of rollback slots to keep in the cache. (default 5)
   dotspacemacs-max-rollback-slots 5
   ;; If non nil, `helm' will try to minimize the space it uses. (default nil)
   dotspacemacs-helm-resize nil
   ;; if non nil, the helm header is hidden when there is only one source.
   ;; (default nil)
   dotspacemacs-helm-no-header nil
   ;; define the position to display `helm', options are `bottom', `top',
   ;; `left', or `right'. (default 'bottom)
   dotspacemacs-helm-position 'bottom
   ;; Controls fuzzy matching in helm. If set to `always', force fuzzy matching
   ;; in all non-asynchronous sources. If set to `source', preserve individual
   ;; source settings. Else, disable fuzzy matching in all sources.
   ;; (default 'always)
   dotspacemacs-helm-use-fuzzy 'always
   ;; If non nil the paste micro-state is enabled. When enabled pressing `p`
   ;; several times cycle between the kill ring content. (default nil)
   dotspacemacs-enable-paste-transient-state nil
   ;; Which-key delay in seconds. The which-key buffer is the popup listing
   ;; the commands bound to the current keystroke sequence. (default 0.4)
   dotspacemacs-which-key-delay 0.4
   ;; Which-key frame position. Possible values are `right', `bottom' and
   ;; `right-then-bottom'. right-then-bottom tries to display the frame to the
   ;; right; if there is insufficient space it displays it at the bottom.
   ;; (default 'bottom)
   dotspacemacs-which-key-position 'bottom
   ;; If non nil a progress bar is displayed when spacemacs is loading. This
   ;; may increase the boot time on some systems and emacs builds, set it to
   ;; nil to boost the loading time. (default t)
   dotspacemacs-loading-progress-bar t
   ;; If non nil the frame is fullscreen when Emacs starts up. (default nil)
   ;; (Emacs 24.4+ only)
   dotspacemacs-fullscreen-at-startup nil
   ;; If non nil `spacemacs/toggle-fullscreen' will not use native fullscreen.
   ;; Use to disable fullscreen animations in OSX. (default nil)
   dotspacemacs-fullscreen-use-non-native nil
   ;; If non nil the frame is maximized when Emacs starts up.
   ;; Takes effect only if `dotspacemacs-fullscreen-at-startup' is nil.
   ;; (default nil) (Emacs 24.4+ only)
   dotspacemacs-maximized-at-startup nil
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's active or selected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-active-transparency 90
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's inactive or deselected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-inactive-transparency 90
   ;; If non nil show the titles of transient states. (default t)
   dotspacemacs-show-transient-state-title t
   ;; If non nil show the color guide hint for transient state keys. (default t)
   dotspacemacs-show-transient-state-color-guide t
   ;; If non nil unicode symbols are displayed in the mode line. (default t)
   dotspacemacs-mode-line-unicode-symbols nil
   ;; If non nil smooth scrolling (native-scrolling) is enabled. Smooth
   ;; scrolling overrides the default behavior of Emacs which recenters point
   ;; when it reaches the top or bottom of the screen. (default t)
   dotspacemacs-smooth-scrolling t
   ;; Control line numbers activation.
   ;; If set to `t' or `relative' line numbers are turned on in all `prog-mode' and
   ;; `text-mode' derivatives. If set to `relative', line numbers are relative.
   ;; This variable can also be set to a property list for finer control:
   ;; '(:relative nil
   ;;   :disabled-for-modes dired-mode
   ;;                       doc-view-mode
   ;;                       markdown-mode
   ;;                       org-mode
   ;;                       pdf-view-mode
   ;;                       text-mode
   ;;   :size-limit-kb 1000)
   ;; (default nil)
   dotspacemacs-line-numbers t
   ;; Code folding method. Possible values are `evil' and `origami'.
   ;; (default 'evil)
   dotspacemacs-folding-method 'evil
   ;; If non-nil smartparens-strict-mode will be enabled in programming modes.
   ;; (default nil)
   dotspacemacs-smartparens-strict-mode nil
   ;; If non-nil pressing the closing parenthesis `)' key in insert mode passes
   ;; over any automatically added closing parenthesis, bracket, quote, etc…
   ;; This can be temporary disabled by pressing `C-q' before `)'. (default nil)
   dotspacemacs-smart-closing-parenthesis 'all
   ;; Select a scope to highlight delimiters. Possible values are `any',
   ;; `current', `all' or `nil'. Default is `all' (highlight any scope and
   ;; emphasis the current one). (default 'all)
   dotspacemacs-highlight-delimiters 'all
   ;; If non nil, advise quit functions to keep server open when quitting.
   ;; (default nil)
   dotspacemacs-persistent-server nil
   ;; List of search tool executable names. Spacemacs uses the first installed
   ;; tool of the list. Supported tools are `ag', `pt', `ack' and `grep'.
   ;; (default '("ag" "pt" "ack" "grep"))
   dotspacemacs-search-tools '("ag" "pt" "ack" "grep")
   ;; The default package repository used if no explicit repository has been
   ;; specified with an installed package.
   ;; Not used for now. (default nil)
   dotspacemacs-default-package-repository nil
   ;; Delete whitespace while saving buffer. Possible values are `all'
   ;; to aggressively delete empty line and long sequences of whitespace,
   ;; `trailing' to delete only the whitespace at end of lines, `changed' to
   ;; delete only whitespace for changed lines or `nil' to disable cleanup.
   ;; (default nil)
   dotspacemacs-whitespace-cleanup 'trailing
   ))

(defun dotspacemacs/user-init ()
  "Initialization function for user code.
It is called immediately after `dotspacemacs/init', before layer configuration
executes.
 This function is mostly useful for variables that need to be set
before packages are loaded. If you are unsure, you should try in setting them in
`dotspacemacs/user-config' first."
  ;; Don't warn about PATH in bashrc.
  (setq-default exec-path-from-shell-arguments '("-l"))
  ;; Tramp terminal.
  (setq-default tramp-ssh-controlmaster-options
      "-o ControlMaster=auto -o ControlPath='tramp.%%C' -o ControlPersist=no")
  )

(defun dotspacemacs/user-config ()
  "Configuration function for user code.
This function is called at the very end of Spacemacs initialization after
layers configuration.
This is the place where most of your configurations should be done. Unless it is
explicitly specified that a variable should be set before a package is loaded,
you should place your code here."
  (setq-default
   ;; Indentation
   standard-indent 4
   tab-width 4
   ;; Fill column (margin guide)
   fci-rule-color "#FFB86C"
   fill-column 80
   ;; Matching pairs
   show-paren-delay 0
   ;; Powerline doesn't render correctly on systems without custom font.
   ;; (default 'arrow)
   powerline-default-separator nil
   ;; Tramp terminal
   tramp-default-method "ssh"
   )
  ;; See matching pairs of parentheses and other characters.
  (show-paren-mode 1)
  ;; Use magit for git commits.
  (global-git-commit-mode t)
  ;; Fix for mouse mode with Magic Trackpad on macOS.
  ;; https://github.com/syl20bnr/spacemacs/issues/4591
  (xterm-mouse-mode -1)
  ;; Customize autofill and column fill (margin) indicator.
  ;; > (add-hook 'markdown-mode-hook '(auto-fill-mode turn-on-fci-mode))
  ;; > (add-hook 'prog-mode-hook 'turn-on-fci-mode)
  ;; > (add-hook 'text-mode-hook 'turn-on-fci-mode)
  (spacemacs/add-to-hooks 'turn-on-fci-mode '(prog-mode-hook text-mode-hook))
  ;; ESS -----------------------------------------------------------------------
  ;; via @roryk
  ;; https://gist.github.com/benmarwick/ee0f400b14af87a57e4a
  (defun ess-set-language ()
    (setq-default ess-language "R")
    (setq ess-language "R")
    )
  (add-hook 'ess-post-run-hook 'ess-set-language t)
  ;; Allow connection over SSH via tramp.
  (require 'ess-site)
  ;; X11 support.
  ;; > (add-to-list 'tramp-remote-process-environment
  ;; >              (format "DISPLAY=%s" (getenv "DISPLAY")))
  (defun insert-r-chunk (header)
    "Insert a chunk in R Markdown mode."
    (interactive "sHeader: ")
    (insert (concat "```{r " header "}\n\n```"))
    (forward-line -1))
  (defun then_R_operator ()
    "R - %>% operator or 'then' pipe operator."
    (interactive)
    (just-one-space 1)
    (insert "%>%")
    (reindent-then-newline-and-indent))
  (define-key ess-mode-map (kbd "C-S-m") 'then_R_operator)
  (define-key inferior-ess-mode-map (kbd "C-S-m") 'then_R_operator)
  )
;; Do not write anything past this comment. This is where Emacs will
;; auto-generate custom variable definitions.
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (tramp-term poly-R poly-noweb poly-markdown base16-oceannext-theme helm-pydoc helm-gitignore helm-css-scss toml-mode rvm ruby-tools ruby-test-mode rubocop rspec-mode robe rbenv rake racer phpunit phpcbf php-extras php-auto-yasnippets minitest flycheck-rust drupal-mode php-mode dockerfile-mode docker json-mode tablist docker-tramp json-snatcher json-reformat chruby cargo rust-mode bundler inf-ruby \(if\ \(eq\ system-type\ \(quote\ darwin\)\)\ dracula\ spacemacs-dark\)-theme zenburn-theme zen-and-art-theme white-sand-theme underwater-theme ujelly-theme twilight-theme twilight-bright-theme twilight-anti-bright-theme toxi-theme tao-theme tangotango-theme tango-plus-theme tango-2-theme sunny-day-theme sublime-themes subatomic256-theme subatomic-theme spacegray-theme soothe-theme soft-stone-theme soft-morning-theme soft-charcoal-theme smyx-theme seti-theme reverse-theme rebecca-theme railscasts-theme purple-haze-theme professional-theme planet-theme phoenix-dark-pink-theme phoenix-dark-mono-theme organic-green-theme omtose-phellack-theme oldlace-theme occidental-theme obsidian-theme noctilux-theme naquadah-theme mustang-theme monokai-theme monochrome-theme molokai-theme moe-theme minimal-theme material-theme majapahit-theme madhat2r-theme lush-theme light-soap-theme jbeans-theme jazz-theme ir-black-theme inkpot-theme heroku-theme hemisu-theme hc-zenburn-theme gruvbox-theme gruber-darker-theme grandshell-theme gotham-theme gandalf-theme flatui-theme flatland-theme farmhouse-theme exotica-theme espresso-theme dracula-theme django-theme darktooth-theme autothemer darkokai-theme darkmine-theme darkburn-theme dakrone-theme cyberpunk-theme color-theme-sanityinc-tomorrow color-theme-sanityinc-solarized clues-theme cherry-blossom-theme busybee-theme bubbleberry-theme birds-of-paradise-plus-theme badwolf-theme apropospriate-theme anti-zenburn-theme ample-zen-theme ample-theme alect-themes afternoon-theme doom-dracula-theme pandoc-mode ox-pandoc ht evil-commentary all-the-icons memoize polymode ein skewer-mode deferred websocket js2-mode simple-httpd xterm-color shell-pop multi-term eshell-z eshell-prompt-extras esh-help transient lv vimrc-mode dactyl-mode powerline spinner hydra parent-mode helm helm-core flx highlight smartparens iedit anzu evil goto-chg undo-tree projectile pkg-info epl bind-map bind-key packed async f dash s avy popup yapfify yaml-mode wgrep web-mode unfill tagedit smex smeargle slim-mode scss-mode sass-mode reveal-in-osx-finder pyvenv pytest pyenv-mode py-isort pug-mode pip-requirements pbcopy osx-trash osx-dictionary orgit org-projectile org-category-capture org-present org-pomodoro alert log4e gntp org-mime org-download mwim mmm-mode markdown-toc markdown-mode magit-gitflow live-py-mode launchctl ivy-hydra hy-mode dash-functional htmlize haml-mode gnuplot gitignore-mode gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link git-gutter-fringe+ git-gutter-fringe fringe-helper git-gutter+ git-gutter gh-md fuzzy flyspell-correct-ivy flyspell-correct flycheck-pos-tip pos-tip flycheck evil-magit magit magit-popup git-commit with-editor ess-smart-equals ess-R-data-view ctable ess julia-mode emmet-mode diff-hl cython-mode csv-mode counsel-projectile counsel swiper ivy company-web web-completion-data company-statistics company-anaconda company auto-yasnippet yasnippet auto-dictionary anaconda-mode pythonic ac-ispell auto-complete neotree ws-butler winum which-key volatile-highlights vi-tilde-fringe uuidgen use-package toc-org spaceline solarized-theme restart-emacs request rainbow-delimiters popwin persp-mode pcre2el paradox org-plus-contrib org-bullets open-junk-file move-text macrostep lorem-ipsum linum-relative link-hint indent-guide hungry-delete hl-todo highlight-parentheses highlight-numbers highlight-indentation helm-themes helm-swoop helm-projectile helm-mode-manager helm-make helm-flx helm-descbinds helm-ag google-translate golden-ratio flx-ido fill-column-indicator fancy-battery eyebrowse expand-region exec-path-from-shell evil-visualstar evil-visual-mark-mode evil-unimpaired evil-tutor evil-surround evil-search-highlight-persist evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-lisp-state evil-indent-plus evil-iedit-state evil-exchange evil-escape evil-ediff evil-args evil-anzu eval-sexp-fu elisp-slime-nav dumb-jump diminish define-word column-enforce-mode clean-aindent-mode auto-highlight-symbol auto-compile aggressive-indent adaptive-wrap ace-window ace-link ace-jump-helm-line))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:background nil)))))
