;; -*- mode: emacs-lisp -*-
;; This file is loaded by Emacs at startup.
;; It must be stored in your home directory.
;; Updated 2019-10-03.
;;
;; This configuration is intended for a minimal ESS installation.
;; Consider using spacemacs instead when managing multiple plugins.
;; Assuming use of Emacs 26.3+ here.
;;
;; | emacs | meaning | keystroke  |
;; |-------|---------|------------|
;; |   C   | Control | Ctrl       |
;; |   M   | Meta    | Option/Alt |
;;
;; | command | action |
;; |---------|--------|
;; | C-x C-s | save   |
;; | C-x C-c | quit   |
;;
;; See also:
;; - https://steinbaugh.com/posts/spacemacs.html
;; - https://gist.github.com/mikelove/b0f4eb15a21387ddb534



;; MELPA                                                                     {{{1
;; ==============================================================================

;; Enable package installs from MELPA.
;; https://melpa.org/
;;
;; > M-x list-packages
;; > M-x package-refresh-contents
;; > M-x package-list-packages
;;
;; Press `i' to mark for installation, `u' to unmark, and `x' to perform the
;; installation. Press `RET' to read more about installing and using each
;; package.
;;
;; Get a list of activated packages.
;; https://stackoverflow.com/questions/13866848
;; > C-h v package-activated-list

(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(package-initialize)



;; General                                                                   {{{1
;; ==============================================================================

;; > (global-linum-mode t)
(delete-selection-mode 1)
(display-time-mode 1)
(show-paren-mode 1)

(menu-bar-mode -1)
(tool-bar-mode -1)

;; > (global-set-key "\C-x\C-b" 'electric-buffer-list)
;; > (global-unset-key (kbd "\C-t"))
;; > (global-unset-key (kbd "\C-x DEL"))

(setq
 inhibit-startup-screen t
 org-startup-folded nil
 ring-bell-function 'ignore
 scroll-conservatively 1000
 show-paren-delay 0)

(require 'uniquify)
(setq uniquify-buffer-name-style 'reverse)



;; Theme                                                                     {{{1
;; ==============================================================================

;; Default dark themes:
;; https://www.gnu.org/software/emacs/manual/html_node/emacs/Custom-Themes.html
;; - manoj-dark
;; - tango-dark
;; - tsdh-dark
;; > (load-theme 'tsdh-dark t)

;; Dracula theme:
;; https://draculatheme.com/emacs/
;; Install: M-x package-install <RET> dracula-theme
;; > (add-to-list 'custom-theme-load-path "~/.emacs.d/themes")
;; > (load-theme 'dracula t)
;; > (customize-set-variable 'frame-background-mode 'dark)



;; Version control                                                           {{{1
;; ==============================================================================

(setq
 ;; Use version numbers for backups.
 version-control t
 vc-make-backup-files t
 ;; Copy all files, don't rename them.
 backup-by-copying t
 ;; Set the backup directory path.
 backup-directory-alist '(("" . "~/emacs-backup"))
 ;; Don't ask to delete excess backup versions.
 delete-old-versions t
 ;; Number of newest versions to keep.
 kept-new-versions 10
 ;; Number of oldest versions to keep.
 kept-old-versions 0)



;; ESS / R                                                                   {{{1
;; ==============================================================================

;; Install: M-x package-install <RET> ess
;; Launch R: M-x R
;; Check ESS version: M-x ess-version
;;
;; See also:
;; - https://ess.r-project.org/
;; - https://ess.r-project.org/Manual/ess.html
;; - https://github.com/acidgenomics/dotfiles/blob/master/spacemacs
;;
;; Enable local user install:
;; > (load "~/emacs/ess-XX.XX/lisp/ess-site")

(require 'ess-site)
;; Configure ESS to use R by default.
(defun ess-set-language ()
  (setq-default ess-language "R")
  (setq ess-language "R")
  )
(add-hook 'ess-post-run-hook 'ess-set-language t)

;; Disable use of underscore for assignment operator.
(ess-toggle-underscore nil)

(setq
 ;; > ess-style 'RStudio
 ;; > inferior-R-program-name "/usr/local/bin/R"
 ess-ask-for-ess-directory nil
 ess-default-style 'DEFAULT
 ess-eval-visibly-p nil
 ess-history-file nil
 ess-indent-level 4
 ess-indent-with-fancy-comments nil
 ess-language "R"
 ess-nuke-trailing-whitespace-p t
 ess-roxy-str "#'"
 inferior-R-args "--no-restore --no-save")

;; R coding standards for ESS
;; https://cran.r-project.org/doc/manuals/R-ints.html#R-coding-standards
(add-hook 'ess-mode-hook
          (lambda ()
            (ess-set-style 'C++ 'quiet)
            ;; Because
            ;;                                 DEF GNU BSD K&R C++
            ;; ess-indent-level                  2   2   8   5   4
            ;; ess-continued-statement-offset    2   2   8   5   4
            ;; ess-brace-offset                  0   0  -8  -5  -4
            ;; ess-arg-function-offset           2   4   0   0   0
            ;; ess-expression-offset             4   2   8   5   4
            ;; ess-else-offset                   0   0   0   0   0
            ;; ess-close-brace-offset            0   0   0   0   0
            (add-hook 'local-write-file-hooks
                      (lambda ()
                        (ess-nuke-trailing-whitespace)))))
(setq
 c-basic-offset 4
 c-default-style 'bsd)

;; Disable `C-c C-c' ess-eval-buffer.
;; > (add-hook 'ess-mode-hook
;; >           '(lambda () (define-key ess-mode-map "\C-c\C-c" nil)))

;; Enforce 4 spaces instead of 2.
;; > (defun myindent-ess-hook ()
;; >   (setq ess-indent-level 4))
;; > (add-hook 'ess-mode-hook 'myindent-ess-hook)



;; Custom                                                                    {{{1
;; ==============================================================================

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(diff-switches "-u")
 '(package-selected-packages (quote (yaml-mode ess)))
 '(require-final-newline t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
