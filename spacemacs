;; -*- mode: emacs-lisp -*-
;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.
;; Updated 2019-09-19.
;;
;; Spacemacs cheatsheet:
;; https://steinbaugh.com/posts/spacemacs.html
;;
;; |command          | action                      |
;; |-----------------|-----------------------------|
;; | SPC f e D       | Diff config against default |
;; | SPC f e R       | Reload config               |
;; | SPC f s         | Save/write                  |
;; | SPC q q         | Quit                        |
;; | SPC f f         | File browser                |
;; | SPC w           | Split window horizontally   |
;; | SPC w /         | Split window vertically     |
;; | SPC w p m       | Messages buffer             |
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
;;
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
;; Troubleshooting:
;;
;; Fix for org-projectile warning:
;; Error (use-package): org-projectile/:config: Symbol’s function definition is
;; void: org-projectile:per-repo
;; > rm -fv ~/.emacs.d/elpa/org-projectile-*/org-projectile.elc
;;
;; Leave JSON layer disabled by default.
;; Fails on clean install: 'Unknown layer json declared in dotfile.'
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
;; - https://gist.github.com/benmarwick/ee0f400b14af87a57e4a

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
     ;; completion:
     ;; Use either `ivy' or `helm'.
     ivy
     ;; > (auto-completion :variables
     ;; >                  auto-completion-enable-sort-by-usage t)

     ;; ui:
     ;; > emoji
     ;; > (unicode-fonts :variables
     ;; >                unicode-fonts-force-multi-color-on-mac t)

     ;; editor:
     ;; > copy-as-format
     ;; > multiple-cursors
     ;; > spell-checking

     ;; emacs:
     better-defaults
     evil-commentary
     syntax-checking
     version-control

     ;; tools:
     csv
     docker
     git
     ipython-notebook
     osx

     ;; lang:
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
     html
     markdown
     org
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
     vimscript
     yaml
     ;; > (c-c++ :variables
     ;; >        c-c++-backend 'lsp-ccls
     ;; >        c-c++-default-mode-for-headers 'c++-mode
     ;; >        c-c++-enable-clang-format-on-save t
     ;; >        c-c++-enable-clang-support t)
     ;; > clojure
     ;; > common-lisp
     ;; > (go :variables
     ;; >     go-backend 'lsp
     ;; >     go-format-before-save t
     ;; >     go-use-test-args "-race -timeout 10s"
     ;; >     godoc-at-point-function 'godoc-gogetdoc)
     ;; > (javascript :variables
     ;; >             javascript-backend 'lsp
     ;; >             javascript-fmt-tool 'web-beautify
     ;; >             js-indent-level 2
     ;; >             js2-basic-offset 2
     ;; >             node-add-modules-path t)
     ;; > js-mocha
     ;; > json
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
   ;; Dracula currently only works well in Emacs GUI, and has color problems
   ;; when running in no-window-system mode inside PuTTY.
   ;; https://github.com/dracula/emacs/issues/52
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
   dotspacemacs-themes
   '(
     sanityinc-tomorrow-eighties
     spacemacs-dark
     spacemacs-light
     )
   ;; If non nil the cursor color matches the state color in GUI Emacs.
   dotspacemacs-colorize-cursor-according-to-state t
   ;; Default font, or prioritized list of fonts. `powerline-scale' allows to
   ;; quickly tweak the mode-line size to make separators look not too crappy.
   ;; Fira Code, Source Code Pro, SF Mono are good defaults.
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

  ;; Bug fix for small font in Emacs GUI on retina macOS display.
  ;; Remove any default values in custom-set-faces, if necessary.
  ;; https://github.com/syl20bnr/spacemacs/issues/3477
  ;; > (if (eq system-type 'darwin)
  ;; >     (progn
  ;; >       (set-face-attribute 'default nil :family "SF Mono")
  ;; >       (set-face-attribute 'default nil :height 165)))

  (setq-default
   ;; Indentation.
   standard-indent 4
   tab-width 4
   ;; Fill column (margin guide).
   fci-rule-color "#FFB86C"
   fill-column 80
   ;; Matching pairs.
   show-paren-delay 0
   ;; Powerline doesn't render correctly on systems without custom font.
   ;; (default 'arrow)
   powerline-default-separator nil
   ;; SSH via TRAMP in terminal.
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

  ;; TRAMP X11 support.
  ;; > (add-to-list 'tramp-remote-process-environment
  ;; >              (format "DISPLAY=%s" (getenv "DISPLAY")))

  ;; ESS -----------------------------------------------------------------------
  (require 'ess-site)
  ;; Also using polymodes for R.
  ;; https://github.com/polymode/poly-R
  (require 'poly-R)
  (require 'poly-markdown)
  (defun ess-set-language ()
    (setq-default ess-language "R")
    (setq ess-language "R")
    )
  (add-hook 'ess-post-run-hook 'ess-set-language t)
  (add-to-list 'auto-mode-alist '("\\.Rmd$" . poly-markdown+R-mode))
  ;; > (add-to-list 'auto-mode-alist '("\\.R$" . R-mode))
  ;; > (autoload 'R-mode "ess-site.el" "ESS" t)

  ;; Render R Markdown file with M-n s.
  ;; See also:
  ;; - http://rmarkdown.rstudio.com/
  ;; - http://roughtheory.com/posts/ess-rmarkdown.html
  (defun ess-rmarkdown ()
    "Render R Markdown file (.Rmd)."
    (interactive)
    ;; Check if R session is attached.
    (condition-case nil
        (ess-get-process)
      (error
       (ess-switch-process)))
    (let* ((rmd-buf (current-buffer)))
      (save-excursion
        (let* ((sprocess (ess-get-process ess-current-process-name))
               (sbuffer (process-buffer sprocess))
               (buf-coding (symbol-name buffer-file-coding-system))
               (R-cmd
                (format "library(rmarkdown); rmarkdown::render(\"%s\")"
                        buffer-file-name)))
          (message "Rendering R Markdown on %s" buffer-file-name)
          (ess-execute R-cmd 'buffer nil nil)
          (switch-to-buffer rmd-buf)
          (ess-show-buffer (buffer-name sbuffer) nil)))))
  (define-key polymode-mode-map "\M-ns" 'ess-rmarkdown)

  (defun insert-r-chunk (header)
    "Insert a chunk in R Markdown mode."
    (interactive "sHeader: ")
    (insert (concat "```{r " header "}\n\n```"))
    (forward-line -1))

  ;; Get the magrittr pipe with Ctrl-Shift-m.
  (defun then-r-operator ()
    "R - %>% operator or 'then' pipe operator."
    (interactive)
    (just-one-space 1)
    (insert "%>%")
    (reindent-then-newline-and-indent))
  (define-key ess-mode-map (kbd "C-S-m") 'then-r-operator)
  (define-key inferior-ess-mode-map (kbd "C-S-m") 'then-r-operator)
  )

;; Do not write anything past this comment. This is where Emacs will
;; auto-generate custom variable definitions.
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector
   ["#0a0814" "#f2241f" "#67b11d" "#b1951d" "#4f97d7" "#a31db1" "#28def0" "#b2b2b2"])
 '(package-selected-packages
   (quote
    (doom-dracula-theme yapfify yaml-mode xterm-color ws-butler winum which-key wgrep web-mode volatile-highlights vimrc-mode vi-tilde-fringe uuidgen use-package unfill tramp-term toml-mode toc-org tagedit spaceline powerline smex smeargle slim-mode shell-pop scss-mode sass-mode rvm ruby-tools ruby-test-mode rubocop rspec-mode robe reveal-in-osx-finder restart-emacs rbenv rake rainbow-delimiters racer pyvenv pytest pyenv-mode py-isort pug-mode popwin poly-R poly-noweb poly-markdown pip-requirements persp-mode pcre2el pbcopy paradox spinner osx-trash osx-dictionary orgit org-projectile org-category-capture org-present org-pomodoro alert log4e gntp org-plus-contrib org-mime org-download org-bullets open-junk-file neotree mwim multi-term move-text mmm-mode minitest markdown-toc magit-gitflow macrostep lorem-ipsum live-py-mode linum-relative link-hint launchctl ivy-hydra indent-guide hydra lv hy-mode dash-functional hungry-delete htmlize hl-todo highlight-parentheses highlight-numbers parent-mode highlight-indentation helm-make haml-mode google-translate golden-ratio gnuplot gitignore-mode gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link git-gutter-fringe+ git-gutter-fringe fringe-helper git-gutter+ git-gutter gh-md flycheck-rust flycheck-pos-tip pos-tip flycheck flx-ido flx fill-column-indicator fancy-battery eyebrowse expand-region exec-path-from-shell evil-visualstar evil-visual-mark-mode evil-unimpaired evil-tutor evil-surround evil-search-highlight-persist highlight evil-numbers evil-mc evil-matchit evil-magit magit transient git-commit with-editor evil-lisp-state smartparens evil-indent-plus evil-iedit-state iedit evil-exchange evil-escape evil-ediff evil-commentary evil-args evil-anzu anzu evil goto-chg undo-tree eval-sexp-fu ess-smart-equals ess-R-data-view ctable ess julia-mode eshell-z eshell-prompt-extras esh-help emmet-mode elisp-slime-nav ein skewer-mode polymode deferred request auto-complete websocket js2-mode simple-httpd dumb-jump popup dockerfile-mode docker json-mode tablist magit-popup docker-tramp json-snatcher json-reformat diminish diff-hl dactyl-mode cython-mode csv-mode counsel-projectile projectile pkg-info epl counsel swiper ivy column-enforce-mode clean-aindent-mode chruby cargo markdown-mode rust-mode bundler inf-ruby bind-map bind-key auto-highlight-symbol auto-compile packed async anaconda-mode pythonic f dash s aggressive-indent adaptive-wrap ace-window ace-link avy))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
