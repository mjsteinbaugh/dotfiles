;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

(setq doom-font (font-spec :family "JetBrainsMono Nerd Font" :size 16))
(setq doom-theme 'doom-dracula)

(setq display-line-numbers-type t)
(setq make-backup-files nil)
(setq org-directory "~/org/")

;; Start Doom maximized.
;; https://github.com/hlissner/doom-emacs/issues/397
(add-to-list 'initial-frame-alist '(fullscreen . maximized))
