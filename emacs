;; -*- mode: emacs-lisp -*-
;; This file is loaded by Emacs at startup.
;; It must be stored in your home directory.
;; Updated 2019-09-19.
;;
;; This configuration is intended for a minimal ESS installation.
;; Consider using spacemacs instead when managing multiple plugins.
;;
;; Packages ====================================================================
;; Install packages (e.g. from MELPA):
;; > M-x list-packages
;;
;; Press `i' to mark for installation, `u' to unmark, and `x' to perform the
;; installation. Press `RET' to read more about installing and using each
;; package.
;;
;; Refresh and list:
;; > M-x package-refresh-contents
;; > M-x package-list-packages
;;
;; See also: https://melpa.org/
;;                                       ;
;; Get a list of activated packages.
;; https://stackoverflow.com/questions/13866848
;; > M-x list-packages C-s installed
;; > C-h v package-activated-list
;;
;; ESS / R =====================================================================
;; Manual: https://ess.r-project.org/Manual/ess.html
;; See also: https://github.com/acidgenomics/dotfiles/blob/master/spacemacs
;; Launch R: M-x R
;; Check ESS version: M-x ess-version

;; Enable MELPA.
;; https://melpa.org/#/getting-started
(require 'package)
(let* ((no-ssl (and (memq system-type '(windows-nt ms-dos))
                    (not (gnutls-available-p))))
       (proto (if no-ssl "http" "https")))
  (when no-ssl
    (warn "\
Your version of Emacs does not support SSL connections,
which is unsafe because it allows man-in-the-middle attacks.
There are two things you can do about this warning:
1. Install an Emacs version that does support SSL and be safe.
2. Remove this warning from your init file so you won't see it again."))
  ;; Comment/uncomment these two lines to enable/disable MELPA and MELPA Stable as desired
  (add-to-list 'package-archives (cons "melpa" (concat proto "://melpa.org/packages/")) t)
  ;;(add-to-list 'package-archives (cons "melpa-stable" (concat proto "://stable.melpa.org/packages/")) t)
  (when (< emacs-major-version 24)
    ;; For important compatibility libraries like cl-lib
    (add-to-list 'package-archives (cons "gnu" (concat proto "://elpa.gnu.org/packages/")))))
(package-initialize)

;; Custom
(custom-set-variables
 '(diff-switches "-u")
 '(require-final-newline t)
 '(package-selected-packages (quote (ess))))
(custom-set-faces
 )

;; Dracula theme.
;; https://draculatheme.com/emacs/
;; Install: M-x package-install <RET> dracula-theme
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes")
(load-theme 'dracula t)

;; See matching pairs of parentheses and other characters.
(setq-default show-paren-delay 0)
(show-paren-mode 1)

;; ESS configuration.
;; https://ess.r-project.org/
;; Install: M-x package-install <RET> ess
(require 'ess-eldoc)
(require 'ess-site)
(defun ess-set-language ()
  (setq-default ess-language "R")
  (setq ess-language "R")
  )
(autoload 'R-mode "ess-site.el" "ESS" t)
(add-to-list 'auto-mode-alist '("\\.R$" . R-mode))
(add-hook 'ess-post-run-hook 'ess-set-language t)
(setq-default
 ;; inferior-R-program-name "/usr/local/bin/R"
 ess-ask-for-ess-directory nil
 ess-eval-visibly-p nil
 ess-indent-with-fancy-comments nil
 ess-language "R"
 ess-style 'RStudio
 inferior-R-args "--no-restore --no-save"
 )
